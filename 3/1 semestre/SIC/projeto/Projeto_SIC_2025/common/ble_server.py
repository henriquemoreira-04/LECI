import sys
import dbus
import dbus.exceptions
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib
import threading
import time
import struct
from .protocol import SERVICE_UUID, CHAR_WRITE_UUID, CHAR_NOTIFY_UUID

BLUEZ_SERVICE_NAME = 'org.bluez'
LE_ADVERTISING_MANAGER_IFACE = 'org.bluez.LEAdvertisingManager1'
LE_ADVERTISEMENT_IFACE = 'org.bluez.LEAdvertisement1'
GATT_MANAGER_IFACE = 'org.bluez.GattManager1'
GATT_SERVICE_IFACE = 'org.bluez.GattService1'
GATT_CHRC_IFACE = 'org.bluez.GattCharacteristic1'
DBUS_OM_IFACE = 'org.freedesktop.DBus.ObjectManager'
DBUS_PROP_IFACE = 'org.freedesktop.DBus.Properties'

class InvalidArgsException(dbus.exceptions.DBusException):
    _dbus_error_name = 'org.freedesktop.DBus.Error.InvalidArgs'

class Application(dbus.service.Object):
    def __init__(self, bus):
        self.path = '/'
        self.services = []
        dbus.service.Object.__init__(self, bus, self.path)
    def get_path(self): return dbus.ObjectPath(self.path)
    def add_service(self, service): self.services.append(service)
    @dbus.service.method(DBUS_OM_IFACE, out_signature='a{oa{sa{sv}}}')
    def GetManagedObjects(self):
        response = {}
        for service in self.services:
            response[service.get_path()] = service.get_properties()
            chrcs = service.get_characteristics()
            for chrc in chrcs:
                response[chrc.get_path()] = chrc.get_properties()
        return response

class Service(dbus.service.Object):
    def __init__(self, bus, path, index, uuid, primary):
        self.path = path + str(index)
        self.bus = bus
        self.uuid = uuid
        self.primary = primary
        self.characteristics = []
        dbus.service.Object.__init__(self, bus, self.path)
    def get_properties(self):
        return { GATT_SERVICE_IFACE: { 'UUID': self.uuid, 'Primary': self.primary, 'Characteristics': dbus.Array(self.get_characteristic_paths(), signature='o') } }
    def get_path(self): return dbus.ObjectPath(self.path)
    def add_characteristic(self, characteristic): self.characteristics.append(characteristic)
    def get_characteristic_paths(self): return [c.get_path() for c in self.characteristics]
    def get_characteristics(self): return self.characteristics
    @dbus.service.method(DBUS_PROP_IFACE, in_signature='s', out_signature='a{sv}')
    def GetAll(self, interface): return self.get_properties()[GATT_SERVICE_IFACE]

class Characteristic(dbus.service.Object):
    def __init__(self, bus, index, uuid, flags, service):
        self.path = service.path + '/char' + str(index)
        self.bus = bus
        self.uuid = uuid
        self.service = service
        self.flags = flags
        dbus.service.Object.__init__(self, bus, self.path)
    def get_properties(self):
        return { GATT_CHRC_IFACE: { 'Service': self.service.get_path(), 'UUID': self.uuid, 'Flags': self.flags, } }
    def get_path(self): return dbus.ObjectPath(self.path)
    @dbus.service.method(DBUS_PROP_IFACE, in_signature='s', out_signature='a{sv}')
    def GetAll(self, interface): return self.get_properties()[GATT_CHRC_IFACE]
    @dbus.service.method(GATT_CHRC_IFACE, in_signature='a{sv}', out_signature='ay')
    def ReadValue(self, options): return b''
    @dbus.service.method(GATT_CHRC_IFACE, in_signature='aya{sv}')
    def WriteValue(self, value, options): pass
    @dbus.service.method(GATT_CHRC_IFACE)
    def StartNotify(self): pass
    @dbus.service.method(GATT_CHRC_IFACE)
    def StopNotify(self): pass
    @dbus.service.signal(DBUS_PROP_IFACE, signature='sa{sv}as')
    def PropertiesChanged(self, interface, changed, invalidated): pass

class SICWriteCharacteristic(Characteristic):
    def __init__(self, bus, index, service, rx_callback):
        Characteristic.__init__(self, bus, index, CHAR_WRITE_UUID, ['write', 'write-without-response'], service)
        self.rx_callback = rx_callback
        self.buffer = b""
        self.HEADER_SIZE = 39 

    def WriteValue(self, value, options):
        """
        Recebe chunks de dados via Bluetooth.
        Acumula no buffer e tenta extrair pacotes completos.
        """
        try:
            chunk = bytes(value)
            self.buffer += chunk
            
            # Loop para processar múltiplos pacotes se vierem colados
            while len(self.buffer) >= self.HEADER_SIZE:
                header_bytes = self.buffer[:self.HEADER_SIZE]
                try:
                    parts = struct.unpack("!16s16sBIH", header_bytes)
                    payload_len = parts[4]
                except:
                    print("[BLE-Server] Header inválido. Limpando buffer.")
                    self.buffer = b""
                    break

                total_packet_len = self.HEADER_SIZE + payload_len

                # Verifica se já temos o pacote todo no buffer
                if len(self.buffer) >= total_packet_len:
                    full_packet = self.buffer[:total_packet_len]
                    self.buffer = self.buffer[total_packet_len:]
                    print(f"[BLE-Server] Pacote recebido: {total_packet_len} bytes. Resto no buffer: {len(self.buffer)}")

                    # Enviar para a aplicação (numa thread para não bloquear o DBus)
                    if self.rx_callback:
                        t = threading.Thread(target=self.rx_callback, args=(full_packet,))
                        t.daemon = True
                        t.start()
                else:
                    print(f"[BLE-Server] A acumular... Temos {len(self.buffer)}/{total_packet_len}")
                    break
                    
        except Exception as e:
            print(f"[BLE-Server] Erro crítico na remontagem: {e}")
            self.buffer = b""

class SICNotifyCharacteristic(Characteristic):
    def __init__(self, bus, index, service):
        Characteristic.__init__(self, bus, index, CHAR_NOTIFY_UUID, ['notify'], service)
        self.notifying = False

    def StartNotify(self): self.notifying = True
    def StopNotify(self): self.notifying = False

    def send_data(self, data):
        if not self.notifying: return False
        
        # Envio fragmentado seguro
        CHUNK_SIZE = 100 
        total_len = len(data)
        
        for i in range(0, total_len, CHUNK_SIZE):
            chunk = data[i : i + CHUNK_SIZE]
            value = dbus.Array(chunk, signature=dbus.Signature('y'))
            self.PropertiesChanged(GATT_CHRC_IFACE, {'Value': value}, [])
            time.sleep(0.02)
            
        return True

class SICService(Service):
    def __init__(self, bus, index, rx_callback):
        Service.__init__(self, bus, '/org/bluez/sic/service', index, SERVICE_UUID, True)
        self.write_char = SICWriteCharacteristic(bus, 0, self, rx_callback)
        self.add_characteristic(self.write_char)
        self.notify_char = SICNotifyCharacteristic(bus, 1, self)
        self.add_characteristic(self.notify_char)

class SICAdvertisement(dbus.service.Object):
    def __init__(self, bus, index):
        self.path = '/org/bluez/sic/advertisement' + str(index)
        self.bus = bus
        self.ad_type = 'peripheral'
        self.service_uuids = [SERVICE_UUID]
        self.local_name = 'SIC-Sink'
        self.include_tx_power = True
        dbus.service.Object.__init__(self, bus, self.path)
    def get_properties(self):
        properties = dict()
        properties['Type'] = self.ad_type
        properties['ServiceUUIDs'] = dbus.Array(self.service_uuids, signature='s')
        properties['LocalName'] = dbus.String(self.local_name)
        properties['IncludeTxPower'] = dbus.Boolean(self.include_tx_power)
        return {LE_ADVERTISEMENT_IFACE: properties}
    def get_path(self): return dbus.ObjectPath(self.path)
    @dbus.service.method(DBUS_PROP_IFACE, in_signature='s', out_signature='a{sv}')
    def GetAll(self, interface): return self.get_properties()[LE_ADVERTISEMENT_IFACE]
    @dbus.service.method(LE_ADVERTISEMENT_IFACE, in_signature='', out_signature='')
    def Release(self): pass

class BLEServer:
    def __init__(self, adapter_interface='hci0', rx_callback=None):
        self.adapter_interface = adapter_interface
        self.rx_callback = rx_callback
        self.mainloop = None

    def start(self):
        self.thread = threading.Thread(target=self._run, daemon=True)
        self.thread.start()

    def send(self, data):
        if hasattr(self, 'sic_service') and self.sic_service.notify_char:
            self.sic_service.notify_char.send_data(data)

    def _run(self):
        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
        self.bus = dbus.SystemBus()
        adapter_path = '/org/bluez/' + self.adapter_interface
        try:
            adapter_obj = self.bus.get_object(BLUEZ_SERVICE_NAME, adapter_path)
            adapter_props = dbus.Interface(adapter_obj, "org.freedesktop.DBus.Properties")
            adapter_props.Set("org.bluez.Adapter1", "Powered", dbus.Boolean(1))
            adapter_props.Set("org.bluez.Adapter1", "Discoverable", dbus.Boolean(1))
            adapter_props.Set("org.bluez.Adapter1", "Alias", dbus.String("SIC-Sink"))
        except: return

        service_manager = dbus.Interface(adapter_obj, GATT_MANAGER_IFACE)
        ad_manager = dbus.Interface(adapter_obj, LE_ADVERTISING_MANAGER_IFACE)
        app = Application(self.bus)
        self.sic_service = SICService(self.bus, 0, self.rx_callback)
        app.add_service(self.sic_service)
        self.advertisement = SICAdvertisement(self.bus, 0)
        mainloop = GLib.MainLoop()

        def register_ad_cb(): print(f"[BLE-Server] Publicidade iniciada!")
        def register_ad_error_cb(error): mainloop.quit()
        def register_app_cb():
            print(f"[BLE-Server] Serviço GATT registado.")
            ad_manager.RegisterAdvertisement(self.advertisement.get_path(), {}, reply_handler=register_ad_cb, error_handler=register_ad_error_cb)
        def register_app_error_cb(error): mainloop.quit()

        service_manager.RegisterApplication(app.get_path(), {}, reply_handler=register_app_cb, error_handler=register_app_error_cb)
        self.mainloop = mainloop
        try: mainloop.run()
        except: pass