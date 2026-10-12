# Mapa de registos
# p: $t0
# pultimo: $t1
# *p: $t2
# soma: $t3

	.data
	.eqv SIZE,4
	.eqv print_int10,1
	

array:	.word 7692, 23, 5, 234
	.text
	.globl main

main:				#void main (void)
	li $t3,0		#int soma = 0;
	
	la $t0,array    	#p = array;
	
	li $t1,SIZE     	# pultimo = SIZE
	addi $t1,$t1,-1 	# pultimo = SIZE - 1
	sll $t1,$t1,2   	# size -1 * 4
	
	addu $t1,$t1,$t0 	# pultimo=array+SIZE-1;
	
while:	
	bgtu $t0,$t1,endw        #while( p <= pultimo )
	lw $t2,0($t0)		# $t2 = *p  loas word inteito *p
	add $t3,$t3,$t2		# soma = soma + (*p);
	addiu $t0,$t0,4         # sumar 4 por int bytes 
	
	j while
	
endw:	li $v0,print_int10
	move $a0,$t3
	syscall			#print_int10(soma);
	
	jr $ra
	