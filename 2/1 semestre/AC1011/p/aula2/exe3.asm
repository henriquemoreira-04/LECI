	.data
str1:	.asciiz "Hola amigos como estan\n" #poner \n para que la string
str2:	.asciiz "AC1 - p\n"                #no salga pegada 
	
	
	.eqv print_string,4
	.text
	.globl main

main:	
	#llamada de la primera string 
	li $v0, print_string   # $v0 para que la funcion funcione 
	la $a0,str1            # la y a0 para cargar el argumento de la string
	syscall                # llamada de la funcion 
	
	#llamada de la segunda string
        li $v0, print_string   # $v0 para que la funcion funcione 
	la $a0,str2            # 
	syscall                # llamada de la funcion 




	jr $ra