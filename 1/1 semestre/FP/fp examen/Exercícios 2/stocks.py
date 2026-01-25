# NMEC: 119809
# NOME: HENRIQUE MOREIRA MALAVER

def printStocks(stocks):
# 1 primero el for y el tuplo igual a mi I 
    for i in stocks:
        (empresa, cidade, abertura, fecho, volume) = i
# 2 sacar el valor de lo que falta , siempre piden alguma mierda
        valorizacion = ( (fecho - abertura) /abertura)*100


#3  formatar el mambo 

        print(f"{empresa:<7} {cidade:<10} {abertura:8.2f} {fecho:8.2f} {volume:>9} {valorizacion:5.1f}%")


    
def main():
    # Cada tuplo stock = (empresa, cidade, abertura, fecho, volume)
    stocks = [
        ('INTC', 'London', 34.249, 34.451, 1792860),
        ('TSLA', 'London', 221.33, 229.63, 398520),
        ('EA', 'Paris', 72.63, 68.98, 1189510),
        ('INTC', 'Tokyo', 33.22001, 34.28999, 4509110),
        ('TSLA', 'Paris', 217.35, 217.75, 252500),
        ('ATML', 'Frankfurt', 8.23, 8.36, 810440),
        ]

    print("\na)")
    printStocks(stocks)

    print("\nb)")
    stocks2 = sorted(stocks, key=lambda x: (x[0] ,-x[4]))
    printStocks(stocks2)

    print("\nc)")
    stocks3 = [ ]
    stocks3 = [stock for stock in stocks if stock[1] == "Paris"]
    printStocks(stocks3)

    
    def load(fname):
        stock = []
        with open (fname,'r') as file:
            for line in file:
                fields = line.strip().split('\t')

                empresa = fields[0]
                cidade = fields [1]
                abertura = float(fields[2])
                fecho = float(fields[3])
                volume = int(fields[4])

                stock.append((empresa,cidade,abertura,fecho,volume))

            return stock        

    
    
    
    print("\nd)")
    stocks4 = print(load("stock.txt"))
   
    

if __name__ == "__main__":
    main()

