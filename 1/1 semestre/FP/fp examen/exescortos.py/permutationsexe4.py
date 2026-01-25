def permutations(s):
    #caso 1 una letra
    if len(s) == 1:
        return [s]
    
    resultado = []
    for i in range(len(s)):
        car1 = s[i]  # el caracter ahora mismo 
        permutacionesresto = permutations(s[:i] + s[i+1:])
        
        for j in permutacionesresto:
            resultado.append( car1 + j)
    
    return resultado









print(permutations("a"))      # Salida: ['a']
print(permutations("ab"))     # Salida: ['ab', 'ba']
print(permutations("abc"))    # Salida: ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']
print(permutations("xyzh"))    # Salida: ['xyz', 'xzy', 'yxz', 'yzx', 'zxy', 'zyx']
