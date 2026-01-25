#"2".isdigit() -> True. 
def countdigits(s):
    contador = 0
    for i in s:
        if i.isdigit() == True:
            contador += 1
    return contador
    


def main():
    x = "23 mil 456"
    print(countdigits(x))    


main()