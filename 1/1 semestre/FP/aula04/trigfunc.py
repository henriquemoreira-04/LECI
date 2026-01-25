# Compute trigonometric functions with Taylor series.
# See: https://en.wikipedia.org/wiki/Taylor_series#Trigonometric_functions

import math


def sin_a(x):
    """Return approximation to sin x using Taylor series."""
    # sin x = x - x³/3! + x⁵/5! - x⁷/7! + ...
    soma = 0.0
    termo = x  # primer término: x¹ / 1!
    i = 0

    # Agregar términos hasta que la suma deje de cambiar
    while True:
        soma_anterior = soma
        soma += termo

        # siguiente término = -x² / ((2i+2)*(2i+3)) * termo anterior
        termo *= -x * x / ((2 * i + 2) * (2 * i + 3))
        i += 1

        # parar cuando el valor no cambie más (precisión alcanzada)
        if soma == soma_anterior:
            break

    return soma


# Constants
PI2 = math.pi * 0.5  # pi/2


def sin(x):
    """Return the sine of x."""
    # Reduce el ángulo al primer cuadrante usando simetrías del seno
    n, r = divmod(x, PI2)  # x = n*(pi/2) + r
    q = int(n) % 4         # cuadrante (0,1,2,3)

    # Aproximar y reconstruir según el cuadrante
    if q == 0:
        s = sin_a(r)
    elif q == 1:
        s = sin_a(PI2 - r)
    elif q == 2:
        s = -sin_a(r)
    else:  # q == 3
        s = -sin_a(PI2 - r)

    return s


def main():
    # Imprime los valores de seno calculados y el error comparado con math.sin
    print(f"{'angle':>5s} {'mysin':>19s} {'pysin':>19s} {'error':>19s}")
    for angle in range(0, 721, 15):  # probar de 0° a 720°
        x = math.radians(angle)
        mysin = sin(x)
        pysin = math.sin(x)
        error = mysin - pysin
        print(f"{angle:5d} {mysin:19.16f} {pysin:19.16f} {error:19.16f}")


if __name__ == "__main__":
    main()
