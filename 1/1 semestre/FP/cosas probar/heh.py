def cubos_piramide(n):
    # Caso base: si n es 0, no hay cubos
    if n == 0:
        return 0
    # Caso recursivo: suma los cubos de la línea actual (n^2) y las líneas anteriores
    return n**2 + cubos_piramide(n - 1)

# Ejemplo de uso
n = int(input("Introduce el número de líneas de la pirámide: "))
total_cubos = cubos_piramide(n)
print(f"Para {n} líneas, la pirámide tiene {total_cubos} cubos.")
