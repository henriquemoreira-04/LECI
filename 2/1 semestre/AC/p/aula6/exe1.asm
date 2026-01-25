# Mapa de registos
# i:            $t0
# array (base): $t1
# &array[i]:    $t2

	.data
	
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	
# Definimos el array de PUNTEROS.
# Cada elemento es una .word que contiene la dirección de una etiqueta (str1, str2...)
	
array: .word str1, str2 , str3

str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"

	.text 
	.globl main
	
main:			#void main(void)
	li $t0,0	# i = 0
	
for:	bge $t0,SIZE,endfor # for i < size 
	la $t1 , array 	# $t1 = array[0]
	sll $t3,$t0,2	# $t3 = i * 4
	addu $t2,$t1,$t3	# array [i]
	
	lw $a0,0($t2)	# cargar el valor 
	
	li $v0,print_string
	syscall 		# print_string(array[i]);
	
	li $v0,print_char
	li $a0,'\n'	
	syscall			#print_char('\n');
	
	
	addi $t0,$t0,1
	j for
	
endfor: jr $ra


#lw $a0, 0($t2): Abres la cajita 0x10010004. Dentro NO está la letra 'd' de "de". Dentr
#está el número 0x10010020 (la dirección donde vive la palabra "de")