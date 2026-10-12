import simplepyble
import time
import struct
import threading
from .protocol import SERVICE_UUID, CHAR_WRITE_UUID, CHAR_NOTIFY_UUID

class BluetoothDriver:
    def __init__(self, interface_name='hci0'):
        self.interface = interface_name
        self.adapters = simplepyble.Adapter.get_adapters()
        self.adapter = None
        self.peripheral = None
        self.rx_callback = None
        
        for a in self.adapters:
            if a.identifier() == interface_name:
                self.adapter = a
                break
        
        if not self.adapter and len(self.adapters) > 0:
            self.adapter = self.adapters[0]

    def scan(self, timeout=3000):
        if not self.adapter: return []
        self.adapter.scan_for(timeout)
        return self.adapter.scan_get_results()

    def connect(self, peripheral, rx_callback):
        self.rx_callback = rx_callback
        try:
            print(f"[BLE] A conectar a {peripheral.address()}...")
            peripheral.connect()
            if not peripheral.is_connected(): return False
            
            self.peripheral = peripheral
            
            # Subscrever notificações
            for i in range(3):
                try:
                    peripheral.notify(SERVICE_UUID, CHAR_NOTIFY_UUID, self._on_notification)
                    print(f"[BLE] Subscrição OK (Tentativa {i+1}).")
                    return True
                except Exception as e:
                    print(f"[BLE] Aviso: Notify falhou ({e}). A tentar de novo em 1s...")
                    time.sleep(1)
            
            print("[BLE] Erro: Falha persistente ao subscrever. A desconectar.")
            peripheral.disconnect()
            return False
        except Exception as e:
            print(f"[BLE] Erro Connect: {e}")
            return False

    def disconnect(self):
        if self.peripheral:
            try: self.peripheral.disconnect()
            except: pass
            self.peripheral = None

    def send(self, peripheral, data):
        if not peripheral or not peripheral.is_connected(): return False
        
        # Fragmentação (Chunking) para MTU
        CHUNK_SIZE = 240 
        total_len = len(data)
        
        try:
            print(f"[BLE] A enviar {total_len} bytes em chunks...")
            for i in range(0, total_len, CHUNK_SIZE):
                chunk = data[i : i + CHUNK_SIZE]
                peripheral.write_request(SERVICE_UUID, CHAR_WRITE_UUID, chunk)
                time.sleep(0.005) 
            return True
        except Exception as e:
            print(f"[BLE] Erro Send: {e}")
            return False

    def _on_notification(self, data):
        if self.rx_callback:
            threading.Thread(target=self.rx_callback, args=(self.peripheral.address(), data)).start()