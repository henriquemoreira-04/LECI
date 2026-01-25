def progresion(a,r,n):
    """
    a: primer término
    r: razón (factor de multiplicación)
    n: número de términos
    """
    assert isinstance(n, int), "n should be an int"
    assert n >= 0, "n should not be negative"
    
    if n == 0:
        print("0=0")
        return 0
    
    progresion = "PG="
    suma = 0
    termino = a
    
    for i in range(n):
        suma += termino
        progresion += "{}".format(termino)
        if i < n - 1:
            progresion += "+"
        termino *= r
        
    
    progresion+="={}".format(suma)
        
    
    print(progresion)
    return suma
    
    
def main():
    # Ejemplo 1: 2 + 4 + 8 + 16 + 32 =62
    print(progresion(2, 2, 5))
    print()
    
    
main()