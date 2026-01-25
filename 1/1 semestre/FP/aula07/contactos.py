# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {:^40s} : {:>12s}".format("Numero", "Nome","Morada"))
    for cosa in dic:
        print("{:>12s} : {:^40s} : {:>12s}".format(cosa, dic[cosa][0],dic[cosa][1]))
        
        
def addContact(contacts):
    numero = input("insira un numero de telefono:")
    nombre = input ("diga el nombre del contacto:")
    contacts[numero] = nombre    # adicionar diccionario   dic[key] = value
    
def removecontact(contacts):
    
    numeroborrar = input("diga numero que quiere eliminar:")  # aqui es la clave
    contacts.pop(numeroborrar)   # borra la clave por ende el valor en el dic
    
def procurarcontacto(contacts):
    
    numerobuscar = input("dime que numero quieres buscar:")
    
    if numerobuscar in contacts:
        print( contacts.get(numerobuscar))    # busca si la key esta y devuelve el value
    else:
        print(numerobuscar)
        
        
def filterPartName(contacts, partName):
    """Returns a new dict with the contacts whose names contain partName."""
    partnombre = {}
    
    for key,value in contacts.items():  # percorres ambas cosas 
        if partName in value:  # cuidado con lo que quiero ver 
            partnombre[key] = value  # adicionar al diccionario
    print(partnombre)  # que me muestre los nombres
    
    

def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos:")
    print("(A)dicionar contacto:")
    print("(R)emover contacto:")
    print("Procurar (N)úmero:")
    print("Procurar (P)arte do nome:")
    print("(T)erminar:")
    op = input("opção?:").upper()   # converts to uppercase...
    return op




def mainloop(contactos):
    """Repeatedly show menu and execute user actions on given dictionary."""

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        elif op == "A":
            addContact(contactos)
        elif op == "R":
            removecontact(contactos)
        elif op == "N":
            procurarcontacto(contactos)
        elif op == "P":
            s = input("dime que parte del nombre quieres buscar:")
            filterPartName(contactos,s)
        else:
            print("Não implementado!")


def main():
    """Start the program."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": ("Universidade de Aveiro",'Aveiro'),
        "727392822": ("Cristiano Aveiro",'Porto'),
        "387719992": ("Maria Matos",'Seia'),
        "887555987": ("Marta Maia",'Lisboa'),
        "876111333": ("Carlos Martins",'Pimba'),
        "433162999": ("Ana Bacalhau",'Katchau')
        }

    # Enter loop to interact with the user
    mainloop(contactos)


# O programa começa aqui
if __name__ == "__main__":
    main()

