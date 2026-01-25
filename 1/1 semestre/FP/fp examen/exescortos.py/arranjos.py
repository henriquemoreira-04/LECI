# NMEC: 119809
# NOME: Henrique Moreira Malaver 

# Complete
def arranjos(n,k):
    
    if k == 0:
        return 1
    
    if 0<k<=n:
        return n * arranjos(n-1,k-1) 



def main():
    x = arranjos(10,3) # 720
    print(x)

if __name__ == "__main__":
    main()      