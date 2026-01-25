def entradadedatos(numif, numsup):
    while True:
        numero = int(input("Introduzca un umero entre 1 e 10:"))
        if numero >= 1 and numero <= 10:
            break
    return(numero)    
        
        
        
def tabela(numero):
    for i in range(1, 11, 1):
        print(numero, "*", i, "=" , numero * i)

def main():
    n = entradadedatos(1,10)
    tabela(n)

main()     


