#define SIZE 4
#int array[4] = {7692, 23, 5, 234};

#void main(void) {
 #   int i = 0;          // Índice
  #  int soma = 0;       // Acumulador

   # while (i < SIZE) {          // Condición simple
    #    soma = soma + array[i]; // Acceso indexado
     #   i++;                    // Incrementamos i en 1 (no en 4)
    #}
    #print_int10(soma);
#}

# Mapa de registos
#soma = $t3
#t0 = array
# $t5 = array + i 


	.data
	.eqv SIZE,4
	.eqv print_int10,1

array:	.word 7692, 23, 5, 234
	.text
	.globl main

main:				#void main (void)
	li $t1,0		#int i = 0; 
	li $t3,0		#int soma = 0;
	
	la $t0,array    	#$t0 = array;	
while:	
	bge $t1,SIZE,endw          #while (i < SIZE) {
	
	sll $t5,$t1,2		# i * 4
	add $t5,$t0,$t5		# array + i    # cuidado no se puede destruit el i 
	
	lw $t4,0($t5)		# array[i]
	
	add $t3,$t3,$t4		#soma = soma + array[i]; 
	
	addi $t1,$t1,1 
	
	j while
	
endw:	li $v0,print_int10
	move $a0,$t3
	syscall			#print_int10(soma);
	
	jr $ra
	 