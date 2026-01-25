# a)

def inputfloatlist():
    lista = []
    while True:
        x = (input("coloque un numero:"))  # ojo con esto 
        if x == '':
            break        # break si sale normal 
        else:
            numero = float(x) 
            lista.append(numero)
    return lista
        

    

# b)


def countlower(lst,v):
    contador = 0 
    for i in range(len(lst)):
        if lst[i] < v:
            contador += 1
    return contador 
    
    


# c) 


def minmax(lst):
    if not lst:  # Si la lista está vacía
        return None, None
    
    minimo = lst[0]
    maximo = lst[0]  # Inicializar ambos con el primer elemento
    
    for i in range(1, len(lst)):  # Empezar desde el segundo elemento
        if lst[i] < minimo:
            minimo = lst[i]
        if lst[i] > maximo:  # Usar '>' para máximo
            maximo = lst[i]
    
    return minimo, maximo



# d)

def main():
    lst = inputfloatlist()
    print(lst)
    
    valores = minmax(lst)
    print(valores)
    
    medio = (valores[1] + valores[0] ) / 2
    print(medio)
    
    menores = countlower(lst,medio)
    print(menores)
    


main()