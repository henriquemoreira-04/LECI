# Complete the code to make the HiLo game.

import random

def playHiLo():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101);

    print("I picked a number between 1 and 100. Can you guess it?")
    # put your code here
    valor = int(input("Value:"))
    count = 0 
    while valor != secret:
        if valor > secret:
            print("valor alto")
            valor = int(input("Value:"))
        
        elif valor < secret:
            print("valor bajo")
            valor = int(input("Value:"))
        
        else:
            ...
    
    print("CONGRATS!")
    print("numero de tentativas: {:d}".format(count))        


playHiLo()

