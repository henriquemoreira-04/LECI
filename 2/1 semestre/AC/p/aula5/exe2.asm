# Mapa de registos
# p = lista : $t0
# *p : $t1   (Registo temporário para guardar o valor armazenado em memória)
# lista + Size : $t2

	.data
	
	.eqv SIZE,10
	.eqv print_string,4
	.eqv print_int10,1
	
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
	
lista:	.word 	8, -4, 3, 5, 124, -15, 87, 9, 27, 15 #.word ya alinea un endereco multiplo de 4
	
	.text
	.globl main
	
main:				#void main(void)
	li $v0,print_string
	la $a0,str1
	syscall			# print_string(str1);
	
	la $t0,lista		# llamo a la lista addres $t0 = p = lista
	
	li $t3, SIZE		# $t3 = SIZE
	sll $t3,$t3,2		# SIZE * 4 necesito 40 bytes de memoria 
	
	addu $t2,$t0,$t3  	#$t2 = lista + SIZE ( $t3) suma unsigned no suma normal

for:	bge $t0,$t2,endfor	#p < lista + SIZE;
	
	lw $t1,0($t0)		#*p = $t1
	
	li $v0,print_int10
	move $a0,$t1
	syscall			# print_int10( *p );
	
	li $v0,print_string
	la $a0,str2
	syscall			#print_string("; ");
	
	addiu $t0,$t0,4  	#  p++ ; este es addiu punteiro int 4 
	j for
	

endfor:	jr $ra
	
	
	
