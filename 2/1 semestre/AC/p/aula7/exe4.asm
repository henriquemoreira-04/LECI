	.data 
str1:	.asciiz "Arquitetura de "
str2:	.space 50
str3:	.asciiz "\n"
str4:	.asciiz "Computadores I "

	.eqv print_string, 4
	
	.text 
	.globl main
	
strcat:  
	addiu $sp,$sp,-12	# cortamos 3 
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1,8($sp)
	
	move $s0, $a0		# dst
	move $s1, $a1 		# src
	
	move $t0,$s0	# p = dst
	
while1: 
	lb $t1,0($t0)	# cargar el puntero primer direccion $t1 = *p
	beq $t1,'\0',endw1	# *p != '\0')
	addiu $t0,$t0,1		# p++
	
	j while1
	
endw1:	move $a0,$t0		# llamar p 
	move $a1,$s1		# llamar src moverlo 
	jal strcpy
	
	move $v0,$s0		#return dst 
	
	#epilogo
	lw $ra ,0($sp)
	lw $s0, 4($sp)
	lw $s1,8($sp)		# recuerda lo haces al contrario 
	addiu $sp,$sp,12	# cortamos 3 
	
	
	jr $ra
	
strcpy:
# Mapa de registros:
# dst: $a0 (Dirección base destino)
# src: $a1 (Dirección base origen)
# i:   $t0
# char: $t1 (La letra que copiamos)
# aux: $t2, $t3 (Direcciones calculadas)

	li $t0,0	# i = 0;

do:	addu $t2 , $a0,$t0  # $t2 = dst[i]
	addu $t3,$a1,$t0	# $t3 = src[i]
	#los cargo y guardo 
	
	lb $t4,0($t3)	# src[i] pasa a $t4
	sb $t4,0($t2)   # guardamos esa letra en $t2 dst 
	# $t2 = src
	addi $t0,$t0,1	#i++
while_cpy:	
	bne $t4, '\0', do 	#src[i++] != '\0'
	
	move $v0,$a0
	
	jr $ra
	
main:			#int main(void)

	addiu $sp,$sp,-4
	sw $ra,0($sp)

	la $a0,str2
	la $a1,str1
	jal strcpy	# strcpy(str2, str1); $v0
	
	la $a0,str2
	li $v0,print_string
	syscall			#print_string(str2);
	
	la $a0,str3
	li $v0,print_string
	syscall			#print_string(str3);
	
	la $a0,str2
	la $a1,str4
	jal strcat		# strcat(str2, "Computadores I") ); $v0
	
	move $a0,$v0
	li $v0,print_string	#print_string( strcat(str2, "Computadores I") );
	syscall
	
	li $v0,0		#return 0
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra 
	
	
	
	
