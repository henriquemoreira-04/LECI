#Exercicio 1.1
def comprimento(lista):
	if lista == []:     
		return 0
	return 1+ comprimento(lista[1:])

#Exercicio 1.2
def soma(lista):
	if lista ==[]:
		return 0
	return lista[0] + soma(lista[1:])

#Exercicio 1.3
def existe(lista, elem):
	if lista==[]:
		return False
	return (lista[0]==elem) or existe(lista[1:],elem)

#Exercicio 1.4
def concat(l1, l2):
	if l1==[]:
		return l2
	
	if l2==[]:          # no necesario
		return l1
	
	return [l1[0]]+ concat(l1[1:],l2)

#Exercicio 1.5
def inverte(lista):
	if lista==[]:
		return[]
	primerelemento = [lista[0]]   #el primer elemento de uno a uno 
	sublista = inverte(lista[1:])
	return sublista + primerelemento
	

#Exercicio 1.6
def capicua(lista):
	if len(lista)<=1:  #una lista vacia o con un elemento es capicua 
		return True
	
	primer= lista[0]
	ultimo = lista[-1]

	if primer == ultimo:
		return capicua(lista[1:-1]) # el inicio y el final de la lista
	else:
		return False
 
	

#Exercicio 1.7
def concat_listas(lista):
	if lista== []:
		return []
	
	return lista[0] + concat_listas(lista[1:])

#Exercicio 1.8
def substitui(lista, original, novo):   #original = x  novo = y
	if lista==[]:
		return []
	
	primer=lista[0]

	if primer == original:
		primer = novo                     #el original se cambia al nuevo
		return [primer]+substitui(lista[1:],original,novo)
	else:         # procesamiento de todos los demas en caso los otros sean 
		return [primer]+substitui(lista[1:],original,novo)




#Exercicio 1.9
def fusao_ordenada(lista1, lista2):
	if lista1==[]:
		return lista2
	
	if lista2==[]:
		return lista1
	
	if lista1[0] < lista2[0]:
		return [lista1[0]] + fusao_ordenada(lista1[1:],lista2)  ## los que te quedamde la lista 1 
	
	elif lista1[0] > lista2[0]:
		return [lista2[0]] +fusao_ordenada(lista1,lista2[1:])  # igual pero con la 2 
	
	else:
		return [lista1[0],lista2[0]] + fusao_ordenada(lista1[1:],lista2[1:])  # con repeticion
	
	


#Exercicio 1.10
def lista_subconjuntos(lista):
	if lista == []:
		return [[]]

	primer=[lista[0]]
	resto = lista[1:]
	subconjuntoconresto=lista_subconjuntos(resto)
    
	vazio = []
	for i in subconjuntoconresto:
		novo = primer + i
		vazio.append(novo)

	todos = subconjuntoconresto + vazio
	
	return todos


#Exercicio 2.1
def separar(lista):
	if lista == []:
		return([],[])
	
	a =lista[0][0] #busca el primer elemento del set 
	b=lista[0][1] # el segundo

	primer = (a,b) 
	resto=lista[1:]

	listaa = []
	listab = []
	(listaa, listab) = separar(resto) # van separando por pares

	
	return ([a] + listaa, [b]+listab) 
				



#Exercicio 2.2
def remove_e_conta(lista, elem):
	if not lista:
		return ([],0)
	
	h = lista[0]
	resto=lista[1:]

	(listan,count)=remove_e_conta(resto,elem)
	if h==elem:
		return (listan,count+1)
	else:
		return ([h]+listan,count)

#Exercicio 3.1
def cabeca(lista):
	if lista==[]:
		return None
	return lista[0]

#Exercicio 3.2
def cauda(lista):
	if lista==[]:
		return None
	return lista[1:]


#Exercicio 3.3
def juntar(l1, l2):
    if l1 is None or l2 is None or len(l1) != len(l2):
        return None

    if not l1:
        return []

    return [(l1[0], l2[0])] + juntar(l1[1:], l2[1:])

    

#Exercicio 3.4
def menor(lista):
	if not lista:
		return None
	
	if (len(lista))==1:
		return lista[0]
	
	resto = menor(lista[1:])
	return lista[0] if lista[0] < resto else resto
	
	 

#Exercicio 3.6
def max_min(lista):
	if lista==[]:
		return None 
	
	if len(lista)==1:
		return (lista[0],lista[0])
	
	primer=lista[0]
	(max, min) = max_min(lista[1:])

	if primer < min:
		min = primer     
	else:
		min

	if primer > max:
		max = primer
	else:
		max 

	all = (max,min)
	
	return all		





	
	
