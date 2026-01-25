humano = int(input("segundos totales:"))

h = humano // 3600
resto = humano % 60 # el resto de las horas 
m = resto//60  # agarras ese resto y le pones  los minutos
s = resto % 60  # de ese resto sacas los segundos restantes

print("{:02d}:{:02d}:{:02d}".format(h, m, s))