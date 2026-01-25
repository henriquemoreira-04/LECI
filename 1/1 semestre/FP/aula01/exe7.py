import math

# Leitura dos comprimentos dos catetos
print("Cálculo da hipotenusa e ângulo de um triângulo retângulo")
print("=" * 50)

a = float(input("Digite o comprimento do cateto A: "))
b = float(input("Digite o comprimento do cateto B: "))

# Cálculo da hipotenusa usando diferentes métodos
# Método 1: usando o operador **
hipotenusa_1 = (a**2 + b**2)**0.5

# Método 2: usando a função pow
hipotenusa_2 = math.sqrt(math.pow(a, 2) + math.pow(b, 2))

# Método 3: usando a função hypot (mais recomendada)
hipotenusa_3 = math.hypot(a, b)

# Cálculo do ângulo entre os lados A e C (em graus)
# O ângulo é dado por: arctan(B/A)
angulo_radianos = math.atan(b / a)  # retorna em radianos
angulo_graus = math.degrees(angulo_radianos)  # converte para graus

# Exibição dos resultados
print("\n" + "=" * 50)
print("RESULTADOS:")
print(f"Cateto A: {a:.2f}")
print(f"Cateto B: {b:.2f}")
print(f"Hipotenusa (método 1 - operador **): {hipotenusa_1:.2f}")
print(f"Hipotenusa (método 2 - sqrt + pow): {hipotenusa_2:.2f}")
print(f"Hipotenusa (método 3 - função hypot): {hipotenusa_3:.2f}")
print(f"Ângulo entre A e C: {angulo_graus:.2f}°")