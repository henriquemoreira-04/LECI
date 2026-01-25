def soma(lst):
	if len(lst)==1:
		return lst[0]
	else:
		return lst[0]+soma(lst[1:])

lst=[1,2,3,4,5,6,7,8,9]
print(soma(lst))
