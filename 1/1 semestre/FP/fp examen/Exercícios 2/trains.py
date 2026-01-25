# NMEC: 119809
# NOME: HENRIQUE MOREIRA MALAVER

import random

"""
Um vagão é uma lista [mercadoria, quant] com 0<quant<=60 toneladas.
Um comboio é uma lista de vagões.
"""

# Capacidade máxima dos vagões:
Qmax = 60

# Constantes para indexar os vagões.
# Se w==['coal', 45], então w[M]=='coal' e w[Q]==45.
M,Q = 0,1

# Esta função cria um comboio aleatório (NÃO PRECISA PERCEBER).
def randomTrain(a, b=0):
    types = ["coal", "iron", "sand", "salt", "sugar", "rice"]
    n = a if a>b else random.randint(a, b)
    train = []
    for i in range(n):
        wagon = [random.choice(types), random.randint(1, Qmax)]
        train.append(wagon)
    return train


#a)
def quantityOf(t, m):
    """Quantidade total de mercadoria de tipo m no comboio t."""
    total = 0
    for vagon in t:
        if vagon[0] == m:
            total = total + vagon[1]
    return total        
#b)
# b)
def unload(t, m, q):
    """Descarrega quantidade q de mercadoria de tipo m."""
    for vagon in range(len(t) -1 ,-1, -1):
        if t[vagon][0] == m:
            if t[vagon][1] <= q:
                q -= t[vagon][1]
                t.pop(vagon)
            else:
                t[vagon][1] -= q
                q = 0
                break
    return q            

#c)
def merchandise(t):
    """Devolve tabela com a quantidade de cada mercadoria no comboio t."""
    diccionario = {}
    for vagon in t:
        m , cantidad = vagon
        if m in diccionario:
            diccionario[m] = diccionario[m] + cantidad
        else:
            diccionario[m] = cantidad
    return diccionario                      


#d)
def trainsPerMerchandise(trains):
    dic = {}
    for (nombre,vagones) in trains.items():
        for vagon in vagones:
            m = vagon[0]
            if m not in dic:
                dic[m] = set()
            dic[m].add(nombre)
    return dic            




def main():
    random.seed("abc") # Pode alterar o argumento para obter comboios distintos

    t = [['coal', 30], ['rice', 50], ['iron', 5], ['rice', 42], ['coal', 45]]
    #t = randomTrain(5)  # descomente se quiser gerar outro comboio
    print("t:", t)
    
    print("\na)")
    print(quantityOf(t, 'rice'),    # 92
          quantityOf(t, 'iron'),    # 5
          quantityOf(t, 'coal'),    # 75
          quantityOf(t, 'salt'))    # 0

    print("\nb)")
    q = unload(t, 'rice', 40)
    print("unload(t, 'rice', 40) ->", q)
    print("t:", t)
    q =unload(t, 'coal', 50)
    print("unload(t, 'coal', 50) ->", q)
    print("t:", t)
    q =unload(t, 'iron', 20)
    print("unload(t, 'iron', 20) ->", q)
    print("t:", t)

    print("\nc)")
    print(merchandise(t))
    print("t:", t)

    print("\nd)")
    trains = { tid: randomTrain(1,5) for tid in ['T1', 'T2', 'T3', 'T4'] }
    print("trains:", trains)
    trainsPerM = trainsPerMerchandise(trains)
    print(trainsPerM)

####
if __name__ == "__main__":
    main()



