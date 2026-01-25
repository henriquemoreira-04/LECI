def hideCharacters(string) :
    secret = "*" * int(len(string))
    return secret

print(hideCharacters("abuelo"))


def isEven(page_number):
   if page_number % 2 == 0:
    return True
   else:
      return False 


def main() :
   page = int(input("Enter page number: "))
   if isEven(page):
      print(page)
   else :
      print("%60d" % page)
  
main()





def countspaces(string):
   spaces = 0
   for char in string :
      if char == " " :
         spaces = spaces + 1
   return spaces

def main() :
    userInput = input("Enter a string: ")
    spaces = countspaces(userInput)
    print(spaces)
   
main()