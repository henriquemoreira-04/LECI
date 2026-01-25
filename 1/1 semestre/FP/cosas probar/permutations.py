def permutations(s):
    # Caso base: si la cadena está vacía, devolver una lista con una cadena vacía
    if len(s) == 0:
        return ['']
    
    # Lista para almacenar las permutaciones
    result = []
    
    # Iterar sobre cada carácter en la cadena
    for i, char in enumerate(s):
        # Resto de la cadena sin el carácter actual
        remaining = s[:i] + s[i+1:]
        
        # Llamada recursiva para obtener las permutaciones del resto
        for perm in permutations(remaining):
            # Añadir el carácter actual al inicio de cada permutación
            result.append(char + perm)
    
    return result

# Ejemplo de uso
print(permutations("xyrt"))  # ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']