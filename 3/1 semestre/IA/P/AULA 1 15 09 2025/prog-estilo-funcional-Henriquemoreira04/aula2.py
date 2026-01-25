#Exercicio 4.1
impar = lambda x: x % 2!= 0

#Exercicio 4.2
positivo = lambda x: x >= 0

#Exercicio 4.3
comparar_modulo = lambda x,y: abs(x) < abs(y)

#Exercicio 4.4
import math
cart2pol = lambda x,y: (math.sqrt(x**2 + y**2),math.atan2(y,x))

#Exercicio 4.5
ex5 = lambda f,g,h:  lambda x,y,z: h(f(x,y),g(y,z))

#Exercicio 4.6
def quantificador_universal(lista, f):
    if lista==[]:
        return False
    
    primer= lista[0]
    resto= lista[1:]
    
    if f(primer) == True:
        return True
    
    all = quantificador_universal(resto,f)
    return all


#Exercicio 4.8
from functools import reduce
def subconjunto(lista1, lista2):
    return reduce(lambda x,y: True if (x and y in lista2) else False, lista1 ,True) # reduce(funcion,iterable,valor inicial)
    

#Exercicio 4.9
def menor_ordem(lista, f):
    return reduce(lambda x,y: x if f(x,y) else y,lista)  # la funcion ya te hace la comparacion 

#Exercicio 4.10
def menor_e_resto_ordem(lista, f):
    menor = (reduce(lambda x,y: x if f(x,y) else y,lista))
    return (menor , filter(lambda x: x!=menor,lista))

#Exercicio 5.2
def ordenar_seleccao(lista, ordem):
    lista = lista[:] 
    n = len(lista)
    
    for i in range(n):
        indice_min = i
        for j in range(i + 1, n):
            if ordem(lista[j], lista[indice_min]):  
                indice_min = j
        
        lista[i], lista[indice_min] = lista[indice_min], lista[i]
    
    return lista