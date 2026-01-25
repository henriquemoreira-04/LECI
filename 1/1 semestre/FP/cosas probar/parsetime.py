def parseTime(s):
    # Caso 1: verificar si es un número (solo minutos)
    if s.isdigit():
        return int(s)
    
    # Caso 2: manejar formatos con 'h' (horas y posiblemente minutos)
    if 'h' in s:
        parts = s.split('h')
        if len(parts) == 2 and parts[0].isdigit() and (parts[1] == '' or parts[1].isdigit()):
            hours = int(parts[0])
            minutes = int(parts[1]) if parts[1] else 0
            return hours * 60 + minutes

    # Caso inválido
    return None

# Ejemplos de uso
print(parseTime("45"))    # 45
print(parseTime("3h10"))  # 190
print(parseTime("2h"))    # 120
print(parseTime("abc"))   # None
print(parseTime("2habc")) # None