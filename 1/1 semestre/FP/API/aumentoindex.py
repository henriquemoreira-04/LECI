def findrise(lst):
    return [ i for i in range(1,len(lst)) if lst[i] > lst[i-1] ]
    
def main():
    lista = [5,9,8,4,9,1]
    lista2 = [4,6,2,8,10,90]
    print(findrise(lista))
    print(findrise(lista2))


main()    


#[1, 3, 4, 5]