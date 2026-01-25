import sys
import time
import json
import base64
import os
import socket
import struct
import threading
from cryptography import x509
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

current_dir = os.path.dirname(os.path.abspath(__file__))
parent_dir = os.path.dirname(current_dir)
sys.path.append(parent_dir)

from dtls import do_patch
do_patch()
from dtls.sslconnection import SSLConnection, PROTOCOL_DTLS, CERT_REQUIRED

from common.ble_driver import BluetoothDriver
from common.ble_server import BLEServer
from common.protocol import *
from common.cert_utils import load_cert_from_file, load_private_key, get_nid_from_cert, validate_certificate
from common.crypto_utils import sign_data, verify_signature, derive_session_key
from node.dtls_transport import DTLSBridge

KEYS_DIR = os.path.join(parent_dir, "keys")
CA_PATH = os.path.join(KEYS_DIR, "ca_cert.pem")
SINK_CERT_PATH = os.path.join(KEYS_DIR, "sink_cert.pem")

class NodePeerContext:
    def __init__(self, nid, cert, session_key):
        self.nid = nid
        self.cert = cert
        self.session_key = session_key

class SICNode:
    def __init__(self, device_id, interface):
        self.cert_path = os.path.join(KEYS_DIR, f"device_{device_id}_cert.pem")
        self.key_path = os.path.join(KEYS_DIR, f"device_{device_id}_key.pem")
        self.cert = load_cert_from_file(self.cert_path)
        self.key = load_private_key(self.key_path)
        self.nid = get_nid_from_cert(self.cert)
        self.ca_cert = load_cert_from_file(CA_PATH)
        self.sink_cert = load_cert_from_file(SINK_CERT_PATH)
        
        print(f"--- NÓ {self.nid.hex()[:6]} EM {interface} ---")
        self.driver = BluetoothDriver(interface)
        self.ble_server = BLEServer(adapter_interface=interface, rx_callback=self._on_downlink_data)
        
        # Estado
        self.router_mode = False 
        self.uplink = None          
        self.uplink_key = None      
        self.uplink_nonce = os.urandom(16)
        
        self.downlinks = {}         
        self.forwarding_table = {}  
        
        self.hops_to_sink = -1      
        self.last_heartbeat = time.time()
        self.missed_heartbeats = 0
        self.routed_msgs_count = 0  
        
        self.bridge = None
        self.dtls_conn = None
        self.dtls_ready = False
        self.app_counter = 0
        self.running = True
        self.simulate_failure = False 

    def start(self):
        threading.Thread(target=self._uplink_manager, daemon=True).start()
        threading.Thread(target=self._user_menu, daemon=True).start()
        
        while self.running:
            time.sleep(1)
            
            # Verificação de Liveness (Chain Reaction)
            if self.uplink and not self.simulate_failure:
                timeout = 15 if not self.uplink_key else 6
                if time.time() - self.last_heartbeat > timeout: 
                    self.missed_heartbeats += 1
                    if self.missed_heartbeats >= 3: 
                        print("UPLINK PERDIDO (Timeout). Chain Reaction...")
                        self._disconnect_uplink()
            
            # Envio de Dados DTLS (Inbox Service)
            if self.dtls_ready and self.uplink:
                time.sleep(4) 
                self.app_counter += 1
                msg = f"Nó {self.nid.hex()[:4]} - Leitura #{self.app_counter}"
                print(f"📤 [DTLS] A enviar: {msg}")
                try: self.dtls_conn.write(msg.encode())
                except: pass
            
            elif self.bridge and not self.dtls_ready:
                print("A tentar Handshake DTLS...")
                try: 
                    self.dtls_conn.do_handshake()
                    print("DTLS SUCESSO!")
                    self.dtls_ready = True
                except: pass

    def _user_menu(self):
        while self.running:
            try:
                r_status = "ATIVO" if self.router_mode else "INATIVO"
                print(f"\n--- MENU SIC ({self.nid.hex()[:6]}) ---")
                print("1. Status Geral")
                print("2. Tabela de Forwarding")
                print("3. Simular Falha (Stop HB)")
                print("4. Restaurar Falha")
                print("5. Sair")
                print(f"6. Router Mode: [{r_status}]")
                
                cmd = input("> ")
                if cmd == "1":
                    upid = "Nenhum"
                    if self.uplink: upid = "Conectado"
                    print(f"Hops: {self.hops_to_sink} | Pai: {upid} | Filhos: {len(self.downlinks)}")
                    print(f"Msgs Roteadas: {self.routed_msgs_count}")
                elif cmd == "2":
                    print("--- FORWARDING TABLE ---")
                    for dest, hop in self.forwarding_table.items():
                        hop_str = "UPLINK" if hop == "UPLINK" else hop.hex()[:6]
                        print(f"Dest: {dest.hex()[:6]} -> Via: {hop_str}")
                elif cmd == "3":
                    self.simulate_failure = True
                    print("Falha simulada.")
                elif cmd == "4":
                    self.simulate_failure = False
                    self.last_heartbeat = time.time()
                    self.missed_heartbeats = 0
                    print("Falha restaurada.")
                elif cmd == "5":
                    self.running = False
                    os._exit(0)
                elif cmd == "6":
                    if not self.router_mode:
                        print("A iniciar Router Mode...")
                        self.router_mode = True
                        self.ble_server.start()
                        print("Router Mode ATIVO.")
                    else:
                        print("A parar Router Mode...")
                        self.router_mode = False
                        self.ble_server.stop()
                        print("Router Mode INATIVO.")
            except: pass

    def _uplink_manager(self):
        # Versão com FILTRO POR NOME (Mais segura para a apresentação)
        while self.running:
            if not self.uplink:
                try:
                    devices = self.driver.scan()
                    print(f"[Scan] Encontrados {len(devices)} dispositivos.")
                    
                    found_candidate = False
                    
                    for dev in devices:
                        name = dev.identifier() # Obtém o nome anunciado
                        addr = dev.address()
                        
                        # --- AQUI ESTÁ A ALTERAÇÃO ---
                        # Só tenta conectar se o nome for "SIC-Sink" ou "SIC-Node"
                        if name in ["SIC-Sink", "SIC-Node"]:
                            print(f"[Scan] Candidato Válido: {name} ({addr})")
                            
                            try:
                                if self.driver.connect(dev, self._on_uplink_data):
                                    print(f"🔗 Conectado a: {name} [{addr}]")
                                    self.uplink = dev
                                    self.last_heartbeat = time.time()
                                    self.missed_heartbeats = 0
                                    self._send_hello_uplink()
                                    found_candidate = True
                                    break # Pára de procurar se já conectou
                            except: 
                                print(f"[Scan] Falha ao conectar a {name}")
                        # -----------------------------
                    
                    if not found_candidate:
                        print("[Scan] Nenhum dispositivo SIC encontrado. A tentar de novo...")
                
                except Exception as e:
                    print(f"[Scan] Erro: {e}")
                
                if not self.uplink: time.sleep(3)
            else:
                time.sleep(1)

    def _disconnect_uplink(self):
        # Chain Reaction
        self.uplink = None
        self.uplink_key = None
        self.hops_to_sink = -1
        self.forwarding_table.clear()
        self.dtls_ready = False
        print("A matar downlinks (Chain Reaction)...")
        self.downlinks.clear() 

    def _send_hello_uplink(self):
        # Autenticação e Acordo de chaves
        try:
            cert = self.cert.public_bytes(serialization.Encoding.PEM).decode()
            data = {"cert": cert, "nonce": base64.b64encode(self.uplink_nonce).decode()}
            pkt = SICPacket(self.nid, b'\xFF'*16, MSG_HELLO, json.dumps(data).encode())
            self.driver.send(self.uplink, pkt.serialize(None))
        except: pass

    def _on_uplink_data(self, addr, data):
        pkt = SICPacket.deserialize(data, self.uplink_key, suppress_mac_error=True)
        if not pkt: pkt = SICPacket.deserialize(data, None) 
        if not pkt: return

        if pkt.src_nid != b'\xFF'*16:
            self.forwarding_table[pkt.src_nid] = "UPLINK"

        if pkt.dst_nid == self.nid:
            if pkt.msg_type == MSG_HELLO_REPLY: self._handle_reply_uplink(pkt)
            elif pkt.msg_type == MSG_HEARTBEAT: self._handle_heartbeat(pkt)
            elif pkt.msg_type == MSG_DATA and self.bridge:
                self.bridge.feed_from_ble(pkt.payload)
                try: self.dtls_conn.read(4096)
                except: pass
        else:
            self._route_packet(pkt, from_uplink=True)

    def _handle_reply_uplink(self, pkt):
        try:
            d = json.loads(pkt.payload.decode())
            pcert = x509.load_pem_x509_certificate(d["cert"].encode(), default_backend())
            pnonce = base64.b64decode(d["nonce"])
            sig = base64.b64decode(d["sig"])
            
            if not validate_certificate(pcert, self.ca_cert): return
            if not verify_signature(pcert.public_key(), sig, self.uplink_nonce + pnonce): return

            self.uplink_key = derive_session_key(self.key, pcert.public_key(), self.uplink_nonce, pnonce)
            print("Sessão SIC estabelecida!")
            self.last_heartbeat = time.time()
            
            if get_nid_from_cert(pcert) == get_nid_from_cert(self.sink_cert):
                self.hops_to_sink = 1
            else:
                self.hops_to_sink = 2 

            mysig = sign_data(self.key, pnonce + self.uplink_nonce)
            fin = {"sig": base64.b64encode(mysig).decode()}
            pkt = SICPacket(self.nid, pkt.src_nid, MSG_FINISHED, json.dumps(fin).encode())
            self.driver.send(self.uplink, pkt.serialize(self.uplink_key))

            # Configura proteção DTLS End-to-End
            self._setup_dtls(get_nid_from_cert(self.sink_cert))

        except Exception as e: print(f"Erro Reply: {e}")

    def _handle_heartbeat(self, pkt):
        if len(pkt.payload) < 4: return
        self.last_heartbeat = time.time()
        self.missed_heartbeats = 0
        if self.router_mode:
            self.ble_server.send(pkt.serialize(None))

    def _on_downlink_data(self, data):
        pkt = None
        origin_child = None
        pkt = SICPacket.deserialize(data, None, suppress_mac_error=True)
        if not pkt or pkt.msg_type != MSG_HELLO:
            for child_nid, ctx in self.downlinks.items():
                pkt = SICPacket.deserialize(data, ctx.session_key, suppress_mac_error=True)
                if pkt:
                    origin_child = child_nid
                    break
        if not pkt: return

        if origin_child:
            self.forwarding_table[pkt.src_nid] = origin_child

        if pkt.dst_nid == self.nid:
            if pkt.msg_type == MSG_HELLO: self._handle_hello_down(pkt)
            elif pkt.msg_type == MSG_FINISHED: print(f"Filho {pkt.src_nid.hex()[:6]} autenticado.")
        else:
            self._route_packet(pkt, from_uplink=False)

    def _handle_hello_down(self, pkt):
        try:
            d = json.loads(pkt.payload.decode())
            ccert = x509.load_pem_x509_certificate(d["cert"].encode(), default_backend())
            cnonce = base64.b64decode(d["nonce"])
            
            if not validate_certificate(ccert, self.ca_cert): return
            
            mynonce = os.urandom(16)
            skey = derive_session_key(self.key, ccert.public_key(), mynonce, cnonce)
            
            ctx = NodePeerContext(pkt.src_nid, ccert, skey)
            self.downlinks[pkt.src_nid] = ctx
            self.forwarding_table[pkt.src_nid] = pkt.src_nid

            sig = sign_data(self.key, cnonce + mynonce)
            mcert = self.cert.public_bytes(serialization.Encoding.PEM).decode()
            rep = {"cert": mcert, "nonce": base64.b64encode(mynonce).decode(), "sig": base64.b64encode(sig).decode()}
            
            rpkt = SICPacket(self.nid, pkt.src_nid, MSG_HELLO_REPLY, json.dumps(rep).encode())
            self.ble_server.send(rpkt.serialize(skey))
            print(f"Filho {pkt.src_nid.hex()[:6]} conectado.")
        except: pass

    def _route_packet(self, pkt, from_uplink):
        self.routed_msgs_count += 1
        next_hop = self.forwarding_table.get(pkt.dst_nid)
        
        if not next_hop:
            if not from_uplink and self.uplink:
                self.driver.send(self.uplink, pkt.serialize(self.uplink_key))
            return

        if next_hop == "UPLINK":
            if self.uplink:
                self.driver.send(self.uplink, pkt.serialize(self.uplink_key))
        else:
            if next_hop in self.downlinks:
                ctx = self.downlinks[next_hop]
                self.ble_server.send(pkt.serialize(ctx.session_key))

    def _setup_dtls(self, sink_nid):
        if self.bridge: return
        self.bridge = DTLSBridge(self, 2024, 2025, sink_nid)
        self.bridge.start()
        time.sleep(1)
        
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind(("127.0.0.1", 2025))
        sock.setblocking(False)
        sock.connect(("127.0.0.1", 2024))
        
        self.dtls_conn = SSLConnection(
            sock, keyfile=self.key_path, certfile=self.cert_path,
            ca_certs=CA_PATH, cert_reqs=CERT_REQUIRED, do_handshake_on_connect=False
        )
        self.dtls_conn.connect(("127.0.0.1", 2024))

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Uso: sudo python3 node/main_node.py <ID> <HCI_INTERFACE>")
        sys.exit(1)
    SICNode(sys.argv[1], sys.argv[2]).start()