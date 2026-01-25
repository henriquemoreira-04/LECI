def reverse(name):
	if len(name)==1:
		return name
	else:
		return reverse(name[1:])+name[0]
		
	
names=['Z','Ana','Otorrinolaringologista','Teste','12345']
for name in names:
	print("The reverse of {} is {}.".format(name,reverse(name)), end="\n\n")
