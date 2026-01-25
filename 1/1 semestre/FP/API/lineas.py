def checkmail(email):
    if email.count("@") != 1:   # verificar que tiene un solo arroba
        return "ErrorF"
    
    user,domain = email.split("@") # partir la frase en el dominio e imai;
    
    if len(user)<3:
        return "ErrorU"
    if ".." in user or not all(c.isalnum() or c == '.' for c in user):
        return "ErrorU"
    
    
    if len(domain)<3:
        return "ErrorD"
    if ".." in domain or not all(c.isalnum() or c == '.' for c in domain):
        return "ErrorD"
    
    return "Valid"
    
    
    



def main():
    email = 'ab@dom.com'
    email2 = 'usuario@dominio.co'
    print(checkmail(email))
    print(checkmail(email2))
    
main()