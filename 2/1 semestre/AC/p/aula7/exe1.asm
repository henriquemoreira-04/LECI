	.data
	.eqv print_int10,1
str1:	.asciiz "Arquitetura de Computadores I"
	
	.text
	.globl main
main:			# int main(void)
	# salvaguardar la stack 
	
	addiu $sp,$sp,-4 # abrir espacio en la stack
	sw $ra,0($sp)    # se guarda el enderezo de retorno para el sistema operativo
	
	la $a0,str1 	# cargar la string
	jal strlen	#   strlen(str1)   llamar a la funcion 
	
	li $v0,print_int10
	move $a0,$v0
	syscall		# print_int10(strlen(str));
	
	li $v0,0	# return 0;
	
	# 5 reponer la stack original 
	
	lw $ra,0($sp)		# reponer direccion al ra de el stack
	addiu $sp,$sp,4		# se suma lo que se sustrajo 
	
	jr $ra
	
strlen:	li $t1,0		# int len=0;

while:	lb $t0,0($a0)		# cargar byte actual = char = *s
	addiu $t0,$t0,1		# s++
	
	beq $t0,'\0',endw	# (*s++ != '\0')
	
	addi $t1,$t1,1		# len++
	
	j while
endw:	move $v0,$t1		# resultado de la funcion devolvida

	jr $ra			# fin de la funcion strlen
	
	
	