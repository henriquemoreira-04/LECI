import sys
import time
import struct
import threading
import os
import json
import base64
import socket
from cryptography import x509
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

current_dir = os.path.dirname(os.path.abspath(__file__))
parent_dir = os.path.dirname(current_dir)
sys.path.append(parent_dir)

from dtls import do_patch
do_patch()
from dtls.sslconnection import SSLConnection, PROTOCOL_DTLS, CERT_REQUIRED

from common.ble_server import BLEServer
from common.protocol import *
from common.cert_utils import load_cert_from_file, load_private_key, get_nid_from_cert, validate_certificate
from common.crypto_utils import sign_data, verify_signature, derive_session_key
from node.dtls_transport import DTLSBridge

KEYS_DIR = os.path.join(parent_dir, "keys")
CERT_PATH = os.path.join(KEYS_DIR, "sink_cert.pem")
KEY_PATH = os.path.join(KEYS_DIR, "sink_key.pem")
CA_PATH = os.path.join(KEYS_DIR, "ca_cert.pem")

class PeerContext:
    def __init__(self, nid):
        self.nid = nid
        self.session_key = None
        self.sink_nonce = os.urandom(16)
        self.peer_nonce = None
        self.bridge = None
        self.dtls_conn = None
        self.last_seq = 0

class SICSink:
    def __init__(self, interface):
        print(f"--- SINK MASTER EM {interface} ---")
        self.cert = load_cert_from_file(CERT_PATH)
        self.key = load_private_key(KEY_PATH)
        self.nid = get_nid_from_cert(self.cert)
        self.ca_cert = load_cert_from_file(CA_PATH)
        
        self.ble = BLEServer(adapter_interface=interface, rx_callback=self._on_data)
        self.peers = {} 
        self.base_port = 3000 
        self.msgs_received = 0

    def start(self):
        self.ble.start()
        threading.Thread(target=self._hb_loop, daemon=True).start()
        
        while True:
            time.sleep(5)
            print(f"\n[STATUS SINK] Peers: {len(self.peers)} | Msgs Inbox: {self.msgs_received}")
            for nid in self.peers:
                print(f" - {nid.hex()[:6]}")

    def _hb_loop(self):
        c = 0
        while True:
            c += 1
            payload = struct.pack("!I", c)
            sig = sign_data(self.key, payload)
            pkt = SICPacket(self.nid, b'\xFF'*16, MSG_HEARTBEAT, payload + sig)
            self.ble.send(pkt.serialize(None))
            time.sleep(5)

    def _on_data(self, data):
        pkt = SICPacket.deserialize(data, None, suppress_mac_error=True)
        if not pkt:
            try:
                src = data[:16]
                if src in self.peers:
                    pkt = SICPacket.deserialize(data, self.peers[src].session_key)
            except: pass
        if not pkt: return

        ctx = self.peers.get(pkt.src_nid)
        if ctx and ctx.session_key and pkt.seq_num > 0:
            if pkt.seq_num <= ctx.last_seq: return
            ctx.last_seq = pkt.seq_num

        if pkt.msg_type == MSG_HELLO:
            self._handle_hello(pkt)
        elif pkt.msg_type == MSG_FINISHED:
            self._handle_finished(pkt)
        elif pkt.msg_type == MSG_INBOX_DATA:
            if ctx and ctx.bridge:
                ctx.bridge.feed_from_ble(pkt.payload)
                self._poll_dtls(ctx)

    def _handle_hello(self, pkt):
        print(f"HELLO de {pkt.src_nid.hex()[:6]}")
        try:
            d = json.loads(pkt.payload.decode())
            cert = x509.load_pem_x509_certificate(d["cert"].encode(), default_backend())
            p_nonce = base64.b64decode(d["nonce"])
            
            if not validate_certificate(cert, self.ca_cert): return
            
            ctx = PeerContext(pkt.src_nid)
            ctx.peer_nonce = p_nonce
            ctx.session_key = derive_session_key(self.key, cert.public_key(), p_nonce, ctx.sink_nonce)
            self.peers[pkt.src_nid] = ctx

            sig = sign_data(self.key, p_nonce + ctx.sink_nonce)
            mc = self.cert.public_bytes(serialization.Encoding.PEM).decode()
            rep = {"cert": mc, "nonce": base64.b64encode(ctx.sink_nonce).decode(), "sig": base64.b64encode(sig).decode()}
            
            rpkt = SICPacket(self.nid, pkt.src_nid, MSG_HELLO_REPLY, json.dumps(rep).encode())
            self.ble.send(rpkt.serialize(ctx.session_key))
        except: pass

    def _handle_finished(self, pkt):
        print(f"FINISHED de {pkt.src_nid.hex()[:6]}")
        ctx = self.peers.get(pkt.src_nid)
        if not ctx: return
        
        self.base_port += 2
        p_in = self.base_port
        p_out = self.base_port + 1
        
        ctx.bridge = DTLSBridge(self, p_in, p_out, pkt.src_nid)
        ctx.bridge.start()

        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind(("127.0.0.1", p_out))
        sock.connect(("127.0.0.1", p_in))
        sock.setblocking(False)

        ctx.dtls_conn = SSLConnection(
            sock, keyfile=KEY_PATH, certfile=CERT_PATH, server_side=True,
            ca_certs=CA_PATH, cert_reqs=CERT_REQUIRED, do_handshake_on_connect=False
        )
        print(f"Peer {pkt.src_nid.hex()[:6]} conectado.")

    def _poll_dtls(self, ctx):
        try:
            try: ctx.dtls_conn.do_handshake()
            except: pass
            
            d = ctx.dtls_conn.read(4096)
            if d:
                self.msgs_received += 1
                print(f"[Inbox] {ctx.nid.hex()[:6]}: {d.decode()}")
        except: pass

if __name__ == "__main__":
    SICSink(sys.argv[2]).start()