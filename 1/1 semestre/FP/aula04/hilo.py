# Complete the code to make the HiLo game.

import random

def playHiLo():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101)

    print("I picked a number between 1 and 100. Can you guess it?")
    # put your code here
    
    contador = 0
    while True:
        x = int(input("coloque un numero:"))   # dentro de los while el valor de la condiion tiene que variar , si no loop infinito
        if secret > x:
            print("numero que eligio low")
        elif secret < x:
            print("numero high")
        else:
            break
        contador+=1
    
    print("numero correcto en {} intentos".format(contador))
    


playHiLo()

