def entradadedatos():
    numero = int(input("Digite un número entero (o un número negativo para terminar): "))
    
    if numero < 0:
        print("Debe ingresar al menos un número positivo.")
        return None
    
    menor = numero
    maior = numero
    soma = numero
    conta = 1
    
    while True:
        numero = int(input("Introduzca otro número (o un número negativo para terminar): "))
        if numero < 0:
            break  # Salimos del bucle cuando el número es negativo
        if numero > maior:
            maior = numero
        if numero < menor:
            menor = numero
        soma = soma + numero
        conta = conta + 1

    media = soma / conta
    return (maior, menor, media)

def resultados(a):
    if a is not None:
        print("Mayor:", a[0])
        print("Menor:", a[1])
        print("Media:", a[2])

def main():
    datos = entradadedatos()
    resultados(datos)

main()
