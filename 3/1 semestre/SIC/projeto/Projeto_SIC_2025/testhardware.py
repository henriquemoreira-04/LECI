# Importamos el driver como si fueramos el programa principal
from common.ble_driver import BluetoothDriver

print("--- Iniciando Teste de Hardware ---")
try:
    driver = BluetoothDriver("hci0")
    if driver.adapter:
        print("Hardware detetado com sucesso!")
        driver.scan(2000)
    else:
        print("Nenhum adaptador encontrado.")
except Exception as e:
    print(f"Erro: {e}")