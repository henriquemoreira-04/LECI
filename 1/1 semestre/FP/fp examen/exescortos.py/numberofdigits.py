#Complete numberOfDigits(n) para devolver o número de dígitos do número inteiro n. 
# A solução tem de ser recursiva e não pode usar strings nem ciclos. 
# Note que o resto da divisão por dez dá o dígito menos significativo (1234%10 → 4) e o quociente tem os restantes dígitos (1234//10 → 123).

def numberOfDigits(n):
    assert n >= 1   # en los numeros no puedes poner len 
    
    if n // 10 == 0:
        return  1
    else:
        numeros =  1 + numberOfDigits(n//10)
        return numeros
    


print(numberOfDigits(4532))   #        