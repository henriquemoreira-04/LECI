# Mapa de registos
# p:          $t1
# pultimo:    $t2

	.data
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11

array:	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"

	.text
	.globl main
main:			#void main(void)
	la $t1,array	#p = array
	
	li $t0,SIZE
	sll $t0,$t0,2	# 3 * 4 = 12 bytes es secuencia por ponteiro
	
	addu $t2,$t1,$t0	#  pultimo = array + SIZE;
	
for:	bgeu $t1,$t2,endfor	# bgeu unsigned ponteiro  p < pultimo;
	
	li $v0,print_string
	lw $a0,0($t1)		# *p
	syscall			# print_string(*p);
	
	li $v0,print_char
	li $a0,'\n'
	syscall			#print_char('\n');
	
	addiu $t1,$t1,4		#p++
	j for 

endfor: jr $ra