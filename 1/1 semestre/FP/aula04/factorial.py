def factorial(n):
    fact = 1
    for i in range(n,0,-1):
        fact*=i
    return fact


print(factorial(0))
print(factorial(4))
print(factorial(5))