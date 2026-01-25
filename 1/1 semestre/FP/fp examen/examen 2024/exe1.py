def printTrip(trip):
    for i in trip:
        
        ruta = "{}-{}".format(i[0],i[1])
        distancia = i[2]
        minutostotales = i[3]
        
        horas = minutostotales // minutostotales
        
        minutos = minutostotales % 60 
        
        tiempohora = minutostotales /60
            
        velocidade  = distancia / tiempohora
        
        print("{:<25s}  {:>4d}km  {:02d}h{:02d}min {:>6.1f}km/h".format(ruta,distancia,horas,minutos,velocidade))
        
             

def statstrip(trip):
    minutos = 0
    distancia = 0
    
    for i in trip:
       minutos += i[3]
       distancia += i[2]
       
    horas = minutos / 60
    
    if horas > 0:
        velocidade_media  = distancia / horas
    else:
        velocidade_media = 0
        
    x = ("{} {} {:4.2f}".format(distancia,minutos,velocidade_media))
    return x
   
   
       
       


def topSpeed(trip):
    
    cosa = sorted(trip,key = lambda x: -x[2])
    return cosa 
    


def loadtrip(fname):
   lista = []
   with open (fname , "r") as file:
       for line in file:
           cosa = line.strip().split(";")
           origem  = cosa [0]
           destino = cosa [1]
           distancia = int(cosa[2])
           tempo = int(cosa[3])
           x = (origem,destino,distancia,tempo)
           lista.append(x)
           return lista
           

        
    
trip = [
    ("Aveiro", "Albergaria", 20, 20),
    ("Albergaria", "Espinho", 50, 60),
    ("Espinho", "Porto", 30, 40),
    ("Porto", "Coimbra", 120, 90),
    ("Coimbra", "Leiria", 75, 60),
    ("Leiria", "Lisboa", 100, 120)
]

printTrip(trip)

print(statstrip(trip))
print(topSpeed(trip))
