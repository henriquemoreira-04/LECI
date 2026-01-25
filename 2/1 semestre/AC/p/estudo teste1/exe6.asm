#int lista[] = {10, 20, 30};

# EJEMPLO PONTEIRO NORMAL

#int suma = 0;
#int *p;
#int *p_ultimo = lista + 3;

#for (p = lista; p < p_ultimo; p++) {
 #   suma = suma + *p;
#}

	.data
lista:	.word 10,20,30
	.eqv SIZE,12
	.text
	.globl main
	

main:	la $t0,lista   # primero 
	li $t1,0
	la $t2,lista   # ultimo 
	addiu $t2,$t2,SIZE 
	
for:	bge $t0,$t2,endfor
	lw $t3, 0($t0)    #*p
	addu $t1,$t1,$t3   #suma = suma + *p 
	
	addiu $t0,$t0,4
	j for
	
endfor:	
	jr $ra
	