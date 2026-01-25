def entradadedatos():
    numero = int(input("digite un numero inteiro :"))
    if numero < 0:
        print("debe introducir un numero positivo:")
        return None
    menor = numero
    maior = numero
    soma = numero
    conta = 1
    while (numero > 0):
        numero = int(input("introduzca outro numero:"))
        if numero < 0:
            break
        if (numero > maior):
            maior = numero
        if (numero < menor):
            menor = numero
        soma = soma + numero
        conta = conta + 1
    media = soma / conta
    return(maior ,menor ,media)

def resultados(a):
    print("Mayor: {} \nMenor: {} \nMedia: {:.1f}".format(a[0], a[1], a[2]))

def main():
    dados = entradadedatos()
    resultados(dados)

main()        



