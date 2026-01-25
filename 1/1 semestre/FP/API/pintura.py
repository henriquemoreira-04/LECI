import math 

diameter = float(input("Diameter (m)?"))
height = float(input("Height (m)?"))
numero_colunas = int(input("Number of columns? "))

radio = diameter / 2

area_coluna = 2 * math.pi * radio * height

area_total = area_coluna * numero_colunas

volumen_pintura = area_total / 8 # listros de tinta necesarios

volumen_pintura = round(volumen_pintura,2) # redondea a dos decimales 

volumen_can_larga= 3

volumen_can_pequena = 0.75

can_larga = math.floor(volumen_pintura / volumen_can_larga)

resto = volumen_pintura - (can_larga * volumen_can_larga)

can_pequena = math.ceil(resto/volumen_can_pequena)

if can_pequena >=4:
    can_larga += 1
    
print("----")
print(f"Paint volume (l): {volumen_pintura}")
print(f"Large cans: {can_larga}")
print(f"Small cans: {can_pequena}")   
 
