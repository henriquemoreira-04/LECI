def palindromo(s):
    
    # Caso base 1: cadena vacía o de longitud 0
    if len(s) <= 1:
        return True
    
    # Verificar si primero y último son iguales
    if s[0] != s[-1]:
        return False
    
    # Llamada recursiva con el substring interno
    return palindromo(s[1:-1])
       
            
    
def main():
    x = input("diga un palindromo:")
    print(palindromo(x))

main()