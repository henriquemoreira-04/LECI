import bluetooth

def get_device_name(mac_address, timeout=10):
    print(f"Looking up name for MAC address: {mac_address}")
    name = bluetooth.lookup_name(mac_address, timeout=timeout)
    if name:
        print(f"Device name: {name}")
    else:
        print("Could not find device name (timeout or not in range).")
    return name

# ¡FALTABA ESTA PARTE PARA EJECUTARLO!
if __name__ == "__main__":
    # Ejemplo de uso con tu MAC address
    mac = "F8:5C:7E:80:2C:25"
    device_name = get_device_name(mac)
    
    if device_name:
        print(f"El nombre del dispositivo es: {device_name}")
    else:
        print("No se pudo encontrar el dispositivo.")