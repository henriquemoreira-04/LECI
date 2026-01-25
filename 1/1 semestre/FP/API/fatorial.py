#5!=5x4x3x2x1
#120

def factorial(n):
    assert isinstance(n, int), "n should be an int"
    assert n >= 0            , "n should not be negative"
    # Complete aqui
    
    numero = "{}!=".format(n)
    count = 1
    for i in range (n,0,-1):
        count = count * i
        numero = numero + "{}".format(i)
        if i != 1:
            numero += "x"
        else:
            numero+= "={}".format(count)
    print(numero)
    return count
        
def main():
    print(factorial(5))
    print(factorial(6))
    print(factorial(7))
    print(factorial(10))

main()              