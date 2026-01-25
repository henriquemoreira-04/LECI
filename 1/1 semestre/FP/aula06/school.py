# Complete o programa!

import sys 

# a)
def loadFile(fname, lst):
    with open(fname,'r') as file:
        file.readline()  # Skip header line 
        for line in file :
            cosas = line.strip().split('\t')
            
            numero = int(cosas[0])
            nome = cosas[1]
            nota1 = float(cosas[5])
            nota2 = float(cosas[6])
            nota3 = float(cosas[7])
            
            x = (numero , nome , nota1 , nota2 , nota3)
            lst.append(x)
        return lst
    
# b) Crie a função notaFinal aqui...
def notafinal(reg):
    notas = (reg[-3] + reg[-2] + reg[-1]) / 3
    return notas

# c) Crie a função printPauta aqui...
def printpautal(lst, file=sys.stdout):
    print("{:6>s} {:^50s} {:5>s}".format("NUMERO","NOME","NOTA") ,file=file)
    for i in lst:
        print("{:>6d} {:^50s} {:>5.2f}".format(i[0], i[1], notafinal(i)),file=file )

# d)
def main():
    lst = []
    # ler os ficheiros
    loadFile("school1.csv", lst)
    loadFile("school2.csv", lst)
    loadFile("school3.csv", lst)
    
    # ordenar a lista
    lst.sort()
    
    # mostrar a pauta
    printpautal(lst)


# giardando archivo 

    print("guardando arquivo...")
    with open("pauta.txt",'w') as f:
        # Llamamos a la MISMA función, pero enviando la salida al archivo f
        printpautal(lst,file=f)
    
          

# Call main function
if __name__ == "__main__":
    main()


