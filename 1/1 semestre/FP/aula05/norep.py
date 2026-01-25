def norep(s):
    if len(s) == 0:
        return ""
    
    resultado = s[0] # empiezas con el primer caracter
    
    for i in range(1,len(s)):
        if s[i] != s[i-1]:  # asi no hay problemas cuandpo llegas al final
            resultado+=s[i]
            
    return resultado
    

def main():
    x = input("diga una palabra:")
    print(norep(x))
    
main()