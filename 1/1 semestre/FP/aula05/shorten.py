def shorten(s):
    string = ""
    for i in s:
        if i.isupper() == True:
            string += i
    
    return string  



def main():
    x = "Universidade de Aveiro"
    print(shorten(x))

main()