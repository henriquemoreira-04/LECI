def fibo(n):
    if n <=1:
        return n
    
    else:
        primer = 0
        segundo = 1
        
        for n in range(2,n+1):
            
            fibo = primer + segundo 
            primer = segundo 
            segundo = fibo 
            
        return fibo     
    
print(f"Fib(5) = {fibo(5)}")   # Debe ser 5
print(f"Fib(7) = {fibo(7)}")   # Debe ser 13
print(f"Fib(8) = {fibo(8)}")   # Debe ser 21    
# manera iterativa 