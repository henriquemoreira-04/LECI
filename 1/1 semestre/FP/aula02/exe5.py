s = int(input("diga los segundos de duracion:"))

precio = 0
porcentaje = 0.12/60  # mosca con estas cosas chamo  

if s <= 60:
    precio = 0.12
elif s > 60:
    precio = porcentaje * s   
    
print(precio)     