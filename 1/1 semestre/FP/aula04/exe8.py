def total():
    tot = 0
    contador = 0
    while True:
        n = input("introduzca un numero:")
        if n == '':
            break
        n = float(n)
        tot += n
        contador +=1
    return (tot / contador)
        
          # cuidado porque int("") no tiene sentido no puede
        
        
        
def main():
    tot = total()
    print(tot)

if __name__ == "__main__":
    main()
