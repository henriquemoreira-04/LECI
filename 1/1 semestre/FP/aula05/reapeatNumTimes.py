def reapeatNumTimes(n):
    lista = []
    for i in range(1,n+1):
        x = [i] * i
        lista.extend(x)
    return lista
    



def main():
    x = int(input("diga un numero"))
    print(reapeatNumTimes(x))
    
    
main() 
    
    
    