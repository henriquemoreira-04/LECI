import socket
import threading
import select
from common.protocol import SICPacket, MSG_INBOX_DATA, MSG_DATA

class DTLSBridge:
    def __init__(self, node, local_port, peer_port, peer_nid):
        self.node = node
        self.local_port = local_port
        self.peer_port = peer_port
        self.peer_nid = peer_nid
        self.running = False
        
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        
        try:
            self.sock.bind(("127.0.0.1", self.local_port))
            self.sock.setblocking(False)
            print(f"[Bridge] Bind OK em 127.0.0.1:{self.local_port}")
        except Exception as e:
            print(f"[Bridge] ERRO BIND: {e}")
        
        self.thread = threading.Thread(target=self._worker, daemon=True)

    def start(self):
        self.running = True
        self.thread.start()

    def stop(self):
        self.running = False
        self.sock.close()

    def feed_from_ble(self, payload):
        """Recebe do BLE, manda para o DTLS (UDP Local)"""
        try:
            print(f"[Bridge] Injetando {len(payload)} bytes no UDP :{self.peer_port}")
            self.sock.sendto(payload, ("127.0.0.1", self.peer_port))
        except Exception as e:
            print(f"[Bridge] Erro Inject: {e}")

    def _worker(self):
        """Recebe do DTLS (UDP Local), manda para o BLE"""
        print(f"[Bridge] Thread iniciada. A escutar em :{self.local_port}")
        while self.running:
            try:
                ready = select.select([self.sock], [], [], 1.0)
                if ready[0]:
                    data, _ = self.sock.recvfrom(4096)
                    if data:
                        print(f"[Bridge] Recebidos {len(data)} bytes do UDP (DTLS). A enviar via BLE...")
                        
                        msg_type = MSG_INBOX_DATA if hasattr(self.node, 'driver') else MSG_DATA
                        pkt = SICPacket(self.node.nid, self.peer_nid, msg_type, data)
                        
                        if hasattr(self.node, 'driver'): 
                            self.node.driver.send(self.node.uplink, pkt.serialize(self.node.session_key))
                        else:
                            self.node.ble_server.send(pkt.serialize(self.node.session_key))
            except Exception as e:
                print(f"[Bridge] Erro Worker: {e}")