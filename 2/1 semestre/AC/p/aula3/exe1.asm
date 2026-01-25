#mapa de registros soma =$t0 , value $t1 , i = $t2 
	
	.data
str1:	.asciiz "Introduzca un numero:"
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos es:"
	
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	
	.text
	.globl main
main:				#void main(void)
	li 	$t0,0		# soma = 0
	li 	$t2,0		#i = 0

for:	bge 	$t2,5,endfor	#while mientras i < 5
	
	li 	$v0,print_string	#print_string("Introduza um numero: "); 
	la 	$a0,str1
	syscall
	
	li 	$v0,read_int
	syscall                 
	move 	$t1,$v0         # guardara el valor en t
				#value = read_int();
	
if:	ble	$t1,$0,else
	add	$t0,$t0,$t1
	j 	endif
	
	
	
else:	li $v0,print_string
	la $a0,str2
	syscall			#print_string("Valor ignorado\n");
	
	
endif:  addi	$t2,$t2,1      	# i++
	j	for		#)



endfor: 
	li $v0,print_string
	la $a0,str3
	syscall                	#print_string("A soma dos positivos e': ");
	
	li $v0,print_int10
	move $a0,$t0
	syscall			#print_int10(soma); 
	
	
	jr $ra			# }
