#Um palíndromo é uma palavra que se lê de igual forma de trás para a frente e da frente para trás

def ispalindrome(word):
	if len(word)==1:
		return True
	else:
		if word[0]==word[-1]:
			if len(word)==2:
				return True
			else:
				return ispalindrome(word[1:-1])
		else:
			return False
				
	

words=['Z','ana','casa','otorrinolaringologista','arroz','ovo','2002','1000002','100001','lol','ratar']
for word in words:
	if ispalindrome(word):
		print("{} IS a palindrome".format(word.capitalize()), end="\n\n")
	else:
		print("{} IS NOT a palindrome".format(word.capitalize()), end="\n\n")
