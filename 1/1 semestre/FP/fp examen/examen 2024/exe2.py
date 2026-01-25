def distance(roads,c1,c2):
    if c1 == c2:
        return 0
    
   
    # Regla 2: Buscamos si existe la clave en el orden (c1, c2)
    if (c1, c2) in roads:
        return roads[(c1, c2)]
    
    # Regla 2: Buscamos si existe la clave en el orden (c1, c2)

    # Regla 3: ¡El Truco! Buscamos si existe la clave AL REVÉS (c2, c1)
    # Como es una carretera, se puede ir y volver.
    if (c2, c1) in roads:
        return roads[(c2, c1)]

    # Regla 4: Si no existe conexión directa
    return None
     
     
    

def travelDistance(roads, t):
    return 1


def neighbors(roads):
    


roads = {('Aveiro', 'Coimbra'): 65,('Agueda', 'Aveiro'): 48,('Porto', 'Agueda'): 65,('Lisboa', 'Santarem'): 78,
    ('Santarem', 'Leiria'): 72,
    ('Leiria', 'Porto'): 79
}

# Pruebas de distance
print(distance(roads, 'Aveiro', 'Coimbra'))  # Salida: 65
print(distance(roads, 'Coimbra', 'Aveiro'))  # Salida: 65
print(distance(roads, 'Braga', 'Aveiro'))    # Salida: None

# Pruebas de travelDistance
print(travelDistance(roads, ['Agueda', 'Aveiro', 'Porto']))  # Salida: 113
print(travelDistance(roads, ['Agueda', 'Coimbra', 'Aveiro']))  # Salida: None

# Pruebas de neighbors
print(neighbors(roads))
# Salida:
# {
#     'Aveiro': {'Coimbra': 65, 'Agueda': 48},
#     'Coimbra': {'Aveiro': 65},
#     'Agueda': {'Aveiro': 48, 'Porto': 65},
#     'Porto': {'Agueda': 65, 'Leiria': 79},
#     'Lisboa': {'Santarem': 78},
#     'Santarem': {'Lisboa': 78, 'Leiria': 72},
#     'Leiria': {'Santarem': 72, 'Porto': 79}
# }


