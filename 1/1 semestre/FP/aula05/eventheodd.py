def eventheodd(s):
    listapar = []
    listaimpar = []
    str = ""
    for i in range(0,len(s),2):
        listapar.append(s[i])    # cuidado con los not int 
        
    for i in range(1,len(s),2):
        listaimpar.append(s[i])  # pedir el valor
        
    listat = listapar + listaimpar
    
    for i in listat:
        str+= i
        
    return str
            
    
def main():
    x = input("diga una palabra:")
    print(eventheodd(x))

main()