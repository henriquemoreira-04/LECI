def parseTime(s):
    try:
        #caso 1 no tiene h 
        if "h" not in s :
            return int(s)
        
        lista = s.split("h")
        horas  = int(lista[0]) *60
        
        # caso lista[1] vacio
        if lista[1] == "":
            minutos = 0
        else:
            minutos  = int(lista[1])
        
        return horas + minutos
    except:
        return None
     
                




print(parseTime("45"))      # Salida: 45
print(parseTime("2h10"))    # Salida: 130
print(parseTime("2h"))      # Salida: 120
print(parseTime("abc"))     # Salida: None
print(parseTime("2habc"))   # Salida: None
