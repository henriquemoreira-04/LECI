import struct
from .crypto_utils import generate_mac, verify_mac

# --- CONSTANTES BLUETOOTH ---
SERVICE_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
CHAR_WRITE_UUID = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
CHAR_NOTIFY_UUID = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"

# --- TIPOS DE MENSAGEM ---
MSG_HELLO = 1
MSG_HELLO_REPLY = 2
MSG_FINISHED = 3
MSG_DATA = 4
MSG_HEARTBEAT = 5
MSG_INBOX_DATA = 6

class SICPacket:
    # Header: Source(16), Dest(16), Type(1), Seq(4), Len(2)
    HEADER_FORMAT = "!16s16sBIH"
    HEADER_SIZE = struct.calcsize(HEADER_FORMAT)

    def __init__(self, src_nid, dst_nid, msg_type, payload=b"", seq_num=0):
        if isinstance(src_nid, int): src_nid = src_nid.to_bytes(16, 'big')
        else: src_nid = bytes(src_nid)
            
        if isinstance(dst_nid, int): dst_nid = dst_nid.to_bytes(16, 'big')
        else: dst_nid = bytes(dst_nid)

        self.src_nid = src_nid.rjust(16, b'\x00')[-16:]
        self.dst_nid = dst_nid.rjust(16, b'\x00')[-16:]
        self.msg_type = msg_type
        self.payload = payload if isinstance(payload, bytes) else payload.encode('utf-8')
        self.seq_num = seq_num

    def serialize(self, session_key=None):
        payload_bytes = self.payload
        header = struct.pack(self.HEADER_FORMAT, self.src_nid, self.dst_nid, 
                             self.msg_type, self.seq_num, len(payload_bytes))
        packet = header + payload_bytes
        
        if session_key:
            mac = generate_mac(session_key, packet)
            return packet + mac
        return packet

    @staticmethod
    def deserialize(data, session_key=None, suppress_mac_error=False):
        try:
            if session_key:
                if len(data) < 32: return None
                mac = data[-32:]
                content = data[:-32]
                if not verify_mac(session_key, content, mac):
                    if not suppress_mac_error:
                        print("ALERTA DE SEGURANÇA: MAC Inválido.")
                    return None
            else:
                content = data

            if len(content) < SICPacket.HEADER_SIZE: return None
            
            hdr = content[:SICPacket.HEADER_SIZE]
            src, dst, mtype, seq, length = struct.unpack(SICPacket.HEADER_FORMAT, hdr)
            
            if len(content) < SICPacket.HEADER_SIZE + length: return None
            
            payload = content[SICPacket.HEADER_SIZE : SICPacket.HEADER_SIZE + length]
            return SICPacket(src, dst, mtype, payload, seq)
        except Exception:
            return None