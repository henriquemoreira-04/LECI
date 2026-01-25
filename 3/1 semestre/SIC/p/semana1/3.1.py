import bluetooth

def scan_bluetooth_devices(timeout=8):
    try:
        print("Scanning for Bluetooth devices...")
        nearby_devices = bluetooth.discover_devices(
            duration=10, 
            flush_cache=True, 
            lookup_names=True, 
            lookup_class=False, 
            device_id=-1, 
            iac=10390323)
        print(f"Found {len(nearby_devices)} devices.")
        for addr, name in nearby_devices:
            print(f"Device: {name}, Address: {addr}")
    except bluetooth.BluetoothError as e:
        print(f"Bluetooth error: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    scan_bluetooth_devices()
