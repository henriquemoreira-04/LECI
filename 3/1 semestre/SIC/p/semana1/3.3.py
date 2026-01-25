import bluetooth

def scan_bluetooth_devices(timeout=8):
    try:
        print("Scanning for Bluetooth devices...")
        nearby_devices = bluetooth.discover_devices(
            duration=timeout, 
            lookup_names=True,
            flush_cache=True
        )
        
        print(f"Found {len(nearby_devices)} devices.")
        
        for addr, name in nearby_devices:
            print(f"Device: {name}, Address: {addr}")
            
            # Descubrir servicios para cada dispositivo
            services = bluetooth.find_service(address=addr)
            if services:
                print(f"Services found: {len(services)}")
                for service in services:
                    print(f"  Service: {service.get('name', 'Unknown')}")
                    print(f"  UUID: {service.get('service-id', 'N/A')}")
            else:
                print("No services found.")
            print("-" * 40)
            
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    scan_bluetooth_devices()