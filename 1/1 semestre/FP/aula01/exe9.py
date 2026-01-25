# Parâmetros do problema específico
andares = 3
moradores_por_andar = 2
altura_andar = 3
viagens_por_dia = 2
velocidade = 1  # m/s
dias_ano = 365

print("=== CASO ESPECÍFICO ===")
print(f"Prédio com R/C + {andares} andares, {moradores_por_andar} moradores por andar")
print(f"Altura por andar: {altura_andar}m")
print(f"Viagens por morador por dia: {viagens_por_dia}")
print(f"Velocidade do elevador: {velocidade} m/s")

# Cálculo usando fórmula da progressão aritmética
# Soma dos andares: 1 + 2 + 3 + ... + n = n(n+1)/2
soma_andares = andares * (andares + 1) / 2
print(f"\nSoma dos andares (1+2+...+{andares}): {soma_andares}")

# Distância total por dia (metros)
# Cada morador no andar i: 2 viagens × i × altura_andar
# Total: moradores_por_andar × viagens_por_dia × altura_andar × soma_andares
distancia_dia = moradores_por_andar * viagens_por_dia * altura_andar * soma_andares
print(f"Distância percorrida por dia: {distancia_dia:.2f} metros")

# Distância anual (km)
distancia_ano_metros = distancia_dia * dias_ano
distancia_ano_km = distancia_ano_metros / 1000

# Tempo de funcionamento por ano (horas)
# tempo = distância / velocidade
tempo_ano_segundos = distancia_ano_metros / velocidade
tempo_ano_horas = tempo_ano_segundos / 3600

print("\n=== RESULTADOS ===")
print(f"Distância percorrida por ano: {distancia_ano_km:.2f} km")
print(f"Tempo de funcionamento por ano: {tempo_ano_horas:.2f} horas")

# Cálculo detalhado para verificação
print("\n=== CÁLCULO DETALHADO ===")
print("Para cada andar:")
distancia_total = 0
for i in range(1, andares + 1):
    distancia_andar = moradores_por_andar * viagens_por_dia * altura_andar * i
    print(f"Andar {i}: {moradores_por_andar} moradores × {viagens_por_dia} viagens × {altura_andar}m × {i} = {distancia_andar}m/dia")
    distancia_total += distancia_andar

print(f"Total por dia (verificação): {distancia_total}m")
print(f"Total por ano: {distancia_total * dias_ano / 1000:.2f} km")