# test_node.py
import sys
import os

# Esto asegura que Python encuentre las carpetas 'node' y 'common'
# (Aunque estando en la raíz, suele funcionar directo)
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from node.main_node import IoTNode

print("--- INICIANDO TESTE DO NÓ ---")
print("Nota: Pára com Ctrl+C")

try:
    # Usamos 'hci0' para probar si solo tienes un dongle o el interno.
    # Si estás usando el externo específico, cambia a 'hci1'.
    node = IoTNode(interface="hci0") 
    node.start()
except KeyboardInterrupt:
    print("\nTeste interrompido pelo utilizador.")
except Exception as e:
    print(f"\nERRO CRÍTICO: {e}")