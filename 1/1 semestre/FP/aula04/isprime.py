def isprime(n):
    
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    
    for i in range(3,n,2):
        if n % i == 0:
            return False
    return True
        
def main():
   for num in range(1,101):
       if isprime(num) == True:
           print(f"el numero {num} es primo ")
       else:
           print(f"el numero {num} no es primo ")
        
main()