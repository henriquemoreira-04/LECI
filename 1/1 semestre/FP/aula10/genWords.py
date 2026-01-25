
# Generates all length-3 words with symbols taken from the given alphabet.
def genWords3(symbols):
    return [ x+y+z for x in symbols for y in symbols for z in symbols ]


# Generates all length-n words with symbols taken from the given alphabet.
def genWords(symbols, n):
    # Caso base: palabras de longitud 0
    if n == 0:
        return [""]
    
    # Paso recursivo: obtenemos la lista de n-1
    palabraspequenas = genWords(symbols, n - 1)
    
    # Lista para guardar el resultado de tamaño n
    lst = []
    
    # Combinamos cada palabra pequeña con cada símbolo nuevo
    for palabra in palabraspequenas:
        for s in symbols:
            lst.append(palabra + s)
    
    return lst
def main():
    lstA = genWords3("abc")
    print(lstA)

    lstB = genWords("abc", 3)  # should return the same words, maybe in other order
    print(lstB)
    assert sorted(lstA) == sorted(lstB)

    lstC = genWords("01", 4)  # should return all length-4 binary words
    print(lstC)

if __name__ == "__main__":
    main()

