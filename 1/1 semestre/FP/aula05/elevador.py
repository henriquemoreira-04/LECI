
ALTURA = 3.0  # Altura em metros de um andar
VIAGENS = 4   # Número de viagens diárias feitas por cada morador

def distanciaElevador(lista):
    contador = 0 
    for i in range(len(lista)): # usamos len para que itere toda la lista
        
        moradoresenpiso = lista[i] # esto permite acceder al valor 
        distanciapormorador = (ALTURA * i) * VIAGENS 
        distanciatotal = moradoresenpiso * distanciapormorador
        contador += distanciatotal
    
    return contador
        

def pisos():
    lista = []
    x = int(input("diga quantos pisos tiene el predio:"))
    for i in range(x+1):
        y = int(input("diga quantos pisos tiene el piso {} :".format(i)))
        lista.append(y)
    return lista
   
def main():
    # Numero de moradores em cada piso de um prédio:
    predio = pisos()  # 4 moradores no piso 0, 2 no piso 1, ...
    
    # Calcular distância percorrida pelo elevador num dia
    m_por_dia = distanciaElevador(predio)

    # E a distância percorrida num ano
    km_por_ano = (distanciaElevador(predio) / 1000 ) * 365

    # Mostrar resultado
    print("No predio", predio)
    print("o elevador percorre", m_por_dia, "m por dia")
    print("ou seja,", km_por_ano, "km por ano") 



if __name__ == "__main__":
    main()

