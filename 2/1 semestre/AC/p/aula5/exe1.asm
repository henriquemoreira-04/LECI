#mapa de registros
# i: $t0
# lista: $t1
# lista + i: $t2
#SIZE = $t3

	.data
	
	.eqv SIZE,5
	.eqv print_string,4
	.eqv read_int,5

str1: .asciiz 	"\nIntroduza um numero: "

	.align 2	#garantiza como es array entero multiplo 4
	
lista:	.space 20	#5 * 4 = 20 bytes 
	
	.text
	.globl main
	
main:				#void main(void)
	li $t0,0		# i = 0 
	
for:	li $t3,SIZE		# size = $t3
	bge $t0,$t3,endfor	# i < SIZE;
	
	li $v0,print_string
	la $a0,str1
	syscall			#print_string(str);
	
	li $v0,read_int		#$v0 = read_int();
	syscall
	
	la $t1,lista		#$t1 = lista  &lista[0]
	sll $t2,$t0,2		# i * 4 para que pueda saltar  calcular el offset
	addu $t2,$t1,$t2	# $t2 = &lista[i]
	
	sw $v0,0($t2)		# guardar valor leido en la memoria
	
	addi $t0,$t0,1		#i++
	
	j for
	
endfor:	jr $ra