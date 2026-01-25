#No jogo Bulls-and-Cows, o jogador tenta descobir um código secreto composto por N símbolos de um alfabeto pequeno, 
# por exemplo algarismos ou letras. Em cada tentativa, 
# o jogador introduz N símbolos e o computador dá uma pontuação que indica quantos símbolos 
# estão certos na posição certa (os Bulls) e quantos estão certos, mas na posição errada (as Cows). 
# Por exemplo, se o segredo for '4271', a tentativa '1234' tem uma pontuação de 1 Bull (o ‘2’) e 2 Cows (‘1’ e ‘4’).
#Complete a função score(guess, secret) para devolver a pontuação de uma tentativa. Por exemplo, score('1234', '4271') decve devolver (1, 2).


def score(guess,secret):
    
    bulls = 0
    cows = 0
    
    secretsobra = []
    guesssobra = []
    
    
    # buscar los bulls
    for i in range(len(secret)):
        if secret[i] == guess[i]:
            bulls += 1
        else:
            secretsobra.append(secret[i])
            guesssobra.append(guess[i])
            
    # buscar los cows 
    
    for j in guesssobra:  # tengo que cer que quedo en las sobras 
        if j in secretsobra: # si j esta esta en las sobras de secret osea si ese numero existe  
            cows+=1
            secretsobra.remove(j) # lo quito de sobras en caso tal se repita 
            
    return bulls,cows
            
   
   
                
                

def main():
    x = score('1234','4271')
    print(x)
    
main()