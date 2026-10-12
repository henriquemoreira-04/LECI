#mapa de registro $t0 = a , $t1=b $t2 = a +b
	
	
	.data
str1:	.asciiz "Introduzca 2 numeros\n" # string despues de data
str2:	.asciiz "A soma dos dois numeros e\n"
	
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	
	.text
	.globl main
main:	
	#llamada primera string
	li $v0,print_string
	la $a0,str1
	syscall			#print_string(str1)
	
	#llamada de read int de a 
	ori $v0,$0,read_int
	syscall               # valor lido e retornado em $v0
	or $t0,$v0,$0          # $t0 = read_int
	
	
	#llamada de read int de b
	ori $v0,$0,read_int
	syscall               # valor lido e retornado em $v0
	or $t1,$v0,$0          # $t1 = read_int
	
	
	#llamada segunda string
	li $v0,print_string
	la $a0,str2
	syscall			#print_string(str2) 
	
	add $t2 ,$t1,$t0
	
	#print int
	
	          
	li $v0,print_int10      #print_string
	or $a0,$0,$t2  
	syscall	
	
	jr $ra
