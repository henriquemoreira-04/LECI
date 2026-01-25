#Neste programa, countries é uma lista com dados de vários países. 
# Cada elemento da lista é um tuplo com o nome do país, o código do continente, a área e a população. A variável 
# countries2 contém outra lista do mesmo tipo.

#Complete a função morePop(countries, N) para devolver uma lista com os pares (área, nome) dos países com mais do que N habitantes. 
# Pressione Codecheck para conferir o resultado esperado.
#nao consigo copiar tudo mas tenho a lista por odem (nome,continente,area,populacao) tens q fzr sort para a populacao

#!!EXEMPLO!!
#nome, continente, area, populacao
#   [("Grenada", "Na", 344.0, 108825)]
#dps tem mais 4
## Complete...
#   lst2 = ...

def morePop(countries, N):
    countries2 = []
    
    listasorted = sorted(countries, lambda x: x[3])  # podemos ordenarla de una vez 
    
    for i in listasorted: # pero lo haces con la lista que ya ordenaste 
        if i[3] > N:
            countries2.append(i)     # esto es facil 
    return countries2