def allmatches(lst):
    lista = []
    
    for i in lst:
        for j in lst:
            if i != j:
                x = (i,j)
                lista.append(x)
    
    
    return lista

def main():
    lst = ["BARCA","REAL","ATLETI","CITY"]
    print(allmatches(lst))

main()