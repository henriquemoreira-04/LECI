def numeros(n):
    divisores = []
    for i in range(1,n):
        if n % i == 0:
            divisores.append(i)
    return divisores
            
           
    
    
    
    

def main():
    n = int(input("diga un numero:"))
    divisores = numeros(n)
    soma = 0
    for i in divisores:
        soma += i
    
    if soma < n:
        print(f"{n} es numero deficiente")
    
    elif soma == n:
        print(f"{n} es un numero perfecto")
        
    else:
        print(f"{n} es un numero abundante")
        
     
    
    
    
main()