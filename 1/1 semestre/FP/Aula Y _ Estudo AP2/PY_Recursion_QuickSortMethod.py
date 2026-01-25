def sort(lst):
	if len(lst)==1:
		return lst
	elif len(lst)==0:
		return []
	else:
		return sort([e for e in lst[1:] if e<=lst[0]]) + [lst[0]] + sort([e for e in lst[1:] if e>lst[0]])

words=['mariana','banana','goncalo','ana','teste','maria','otorrinolaringologista','987654321']

for n in words:
	print("{} in order is like: {}".format(n,sort(list(n))))
	
numbers=[54,26,93,17,77,31]
print(numbers)
print(sort(numbers))
