import hashlib
import random

# --- Función que busca una frase con SHA256 que empiece con '000' ---
def find_hash_with_prefix(student_number, prefix='000'):
    base_sentence = f"My student number is {student_number} and I like solving cryptopuzzles! Nonce="
    nonce = 0
    attempts = 0

    while True:
        attempts += 1
        text = base_sentence + str(nonce)
        hash_value = hashlib.sha256(text.encode()).hexdigest()

        if hash_value.startswith(prefix):
            return text, hash_value, attempts
        nonce += 1

# --- Lista de números de estudiante para probar ---
student_numbers = [119809, 119810, 119811, 1234, 2469, 55555, 99999, 202500, 314159, 100000]

# --- Ejecutar la búsqueda para cada número ---
results = []
for num in student_numbers:
    sentence, hash_value, attempts = find_hash_with_prefix(num)
    results.append(attempts)
    print(f"\nStudent number {num}")
    print(f"Sentence: {sentence}")
    print(f"SHA256:   {hash_value}")
    print(f"Attempts: {attempts}")

# --- Calcular el promedio ---
average_attempts = sum(results) / len(results)
expected = 2 ** (4 * 3)  # 3 hex digits = 12 bits, so expected = 2^12 = 4096

print("\n-----------------------------------")
print(f"Average attempts: {average_attempts:.2f}")
print(f"Expected (theoretical): {expected}")
print(f"Ratio (measured/expected): {average_attempts / expected:.3f}")
print("-----------------------------------")
