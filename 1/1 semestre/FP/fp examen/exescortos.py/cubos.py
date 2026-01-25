def total_cubos(n):
    # Caso base: Si la pirámide tiene solo 1 nivel, contiene 1 cubo
    if n==1:
        return 1
    # Caso recursivo: Suma el nivel actual (n^2) con el total de cubos en los niveles inferiores
    return n**2 + total_cubos(n-1)     # cuidado con las lineas 

# Pruebas
print(total_cubos(1))  # Salida: 1 (1 nivel)
print(total_cubos(2))  # Salida: 5 (1 + 4)
print(total_cubos(3))  # Salida: 14 (1 + 4 + 9)
print(total_cubos(4))  # Salida: 30 (1 + 4 + 9 + 16)
