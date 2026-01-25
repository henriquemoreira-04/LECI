def permutaciones(s):
    if len(s) == 0:
        return['']

    result = []

    for i,char in enumerate(s):
        resto = s[:i] + s[i+1:]

        for perm in permutaciones(resto):
            result.append(char + perm)    

    return result     

print(permutaciones("trg"))