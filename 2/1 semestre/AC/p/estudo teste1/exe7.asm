#static char *array[] = {"Array", "de", "ponteiros"};
#int i;
#for (i = 0; i < 3; i++) {
 #   char c = array[i][0]; // Solo el primer char de cada string
 #   print_char(c);
#}

	.data
str1:	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"
	
array: 	.word str1, str2, str3 # Un array de direcciones
	.eqv print_char,11
       	.text
       	.globl main
main:	li $t0,0	# t0 = i = 0
	la $t1 ,array   # $t1 = array[0]
	
for:	bge $t0,3,endfor
	
	# PASO 1 :es un array de ponteiros entonces i * 4
	sll $t2,$t0,2
	
	# PASO 2 : obtener direccion de array[i]
	addu $t3,$t1,$t2
	
	# Paso 3: Obtener el valor en array[i], que es un puntero
	lw $t4,0($t3)   # cargar el t4 array[i]
	lb $a0,0($t4)   # cargar el primer caracter
	
	li $v0,print_char
	syscall
	
	addiu $t0,$t0,1
	
	j for
	

endfor:	jr $ra 
       
       	
       