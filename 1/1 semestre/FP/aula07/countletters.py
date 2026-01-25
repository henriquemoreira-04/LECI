
def countletters(filename):
   contador = {} # Crear diccionario vacío
   
   try:
        # Agregué encoding='utf-8' porque "Os Lusíadas" tiene acentos
        with open(filename, "r", encoding='utf-8') as file:
            for line in file:
                for caracter in line: 
                    if caracter.isalpha():
                       
                        caracter = caracter.lower()
                        
                        if caracter not in contador:
                            contador[caracter] = 1   # mete algo en el diccioanario y el valor 
                        else:
                            contador[caracter] += 1 
                            
   except FileNotFoundError:
       print("Erro: O ficheiro '{}' não foi encontrado.".format(filename))
       return 
   
   # CORRECCIÓN 2: Todo esto debe estar indentado DENTRO de la función
   # para tener acceso a la variable 'contador'
   letrasordenadas = sorted(contador.keys())
    
   for letras in letrasordenadas:
        print("{} {}".format(letras, contador[letras]))

if __name__ == "__main__":
    # --- CAMBIO AQUÍ ---
    # En lugar de leer sys.argv, pedimos al usuario que escriba
    arquivo = input("Por favor, introduce el nombre del fichero de texto (ej: lusiadas.txt): ")
    
    # Llamamos a la función con lo que el usuario escribió
    countletters(arquivo)