	.data 
	.eqv print_int10 , 1
str1:	.asciiz "101101"
	
	.text 
	.globl main
	
main:	
	addiu $sp,$sp,-4
	sw $ra ,0($sp)
	
	la $a0,str1
	jal atoi	# atoi(str) $v0
	
	move $a0,$v0
	li $v0,print_int10	
	syscall		#print_int10( atoi(str) );
	
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $v0,0	# return 0
	
	jr $ra 
	
# Mapa de registos
# res:$v0
# s:$a0
# *s:$t0
# digit:$t1
# Sub-rotina terminal: não devem ser usados registos $sx

atoi:	li $v0,0	# res = 0
	
while:	lb $t0,0($a0)	# $t0 = *s
	
	blt $t0,'0',endw #*s >= '0'	
	bgt $t0,'1',endw #*s <= '1'   # ascci cuidado conesto los atoi
	 
	addiu $t1,$t0,-48	# digit = *s++ - '0';  los ayoi usamos los ascii 
	
	addiu $a0,$a0,1  # ++
	
	sll $v0,$v0,1	# res * 2
	
	addu $v0,$v0,$t1	# res = 10 * res + digit;
	
	j while 

endw:	jr $ra 