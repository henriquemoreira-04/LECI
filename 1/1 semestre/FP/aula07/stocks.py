
# Constantes para indexar os tuplos:
NAME,DATE,OPEN,MAX,MIN,CLOSE,VOLUME = 0,1,2,3,4,5,6

def main():
    lst = loadStockFile("nasdaq.csv")
    # Show just first and last tuples:
    print("first:", lst[1])
    print("last:", lst[-1])
    
    print("a) totVol=", totalVolume(lst))

    print("b) maxVal=", maxValorization(lst))
    
    stocksDic = stocksByDateByName(lst)
    print("c) CSCO@11:", stocksDic['2020-10-12']['CSCO'])
    print("c) AMZN@22:", stocksDic['2020-10-22']['AMZN'])

    port = {'NFLX': 100, 'CSCO': 80}
    print("d) portfolio@01:", portfolioValue(stocksDic, port, "2020-10-01"))
    print("d) portfolio@30:", portfolioValue(stocksDic, port, "2020-10-30"))

def loadStockFile(filename):
    lst = []
    with open(filename) as f:
        for line in f:
            parts = line.strip().split('\t')
            name = parts[NAME]
            date = parts[DATE]
            tup = (name, date, float(parts[OPEN]), float(parts[MAX]),
                float(parts[MIN]), float(parts[CLOSE]), int(parts[VOLUME]))
            lst.append(tup)
    return lst

def totalVolume(lst):
    totVol = {}
    # Complete ...
    for i in lst:
        if i[NAME] not in totVol:  # i[name] lst lista de tuplos estoy indexando dentro d los tuplos 
            totVol[i[NAME]] = i[VOLUME] # agregar si no existe
        else:
            totVol[i[NAME]] += i[VOLUME]  # si existe ya sabes 
        

    return totVol

def maxValorization(lst):
    vMax = {}
    
    for i in lst:
        # 1. Extraemos los datos necesarios usando las constantes
        name = i[NAME]
        date = i[DATE]
        open_val = i[OPEN]
        close_val = i[CLOSE]
        
        valorizacion = (close_val/open_val) -1
        
        if date not in vMax:
            vMax[date] = (name,valorizacion)  # asi aggrefo al dic el tuplo
        else:
            nombreexistente, valorexistente = vMax[date] # guarda una copia de los valores que ta existen 
            
            if valorizacion > valorexistente:   # ve cual valorixacion es mayor 
                vMax[date] = (name,valorizacion) # sisi la de hoy es mayor la cambia 
                
                
        

def stocksByDateByName(lst):
    dic = {}
    # Complete ...
    
    for tuple in lst:
        
        name = tuple[NAME]
        date = tuple[DATE]
        
        if date not in dic:
            dic[date] = {}
            
        dic[date][name] = tuple 
    

    return dic

def portfolioValue(stocks, portfolio, date):
    assert date in stocks
    val = 0.0
    # Garante que a data existe nos dados (fail-fast)
    assert date in stocks, f"A data {date} não existe nos registos."
    
    total_val = 0.0
    
    # 1. Obter o 'mercado' daquele dia específico.
    # Isto devolve o dicionário: {'NFLX': (tuplo...), 'CSCO': (tuplo...), ...}
    daily_market = stocks[date]
    
    # 2. Percorrer as ações que o investidor possui
    for symbol, qty in portfolio.items():
        
        # Verificar se a empresa existe nos registos desse dia
        if symbol in daily_market:
            # Recuperar o tuplo de dados dessa empresa
            stock_data = daily_market[symbol]
            
            # Extrair o preço de fecho (usando a constante CLOSE definida no início)
            close_price = stock_data[CLOSE]
            
            # Somar ao total: quantidade * preço
            total_val += qty * close_price
            
        else:
            # Opcional: Avisar se houver ações no portfólio sem dados nesse dia
            print(f"Aviso: Não há dados para {symbol} na data {date}.")

    return total_val

    return val

if __name__ == "__main__":
    main()
