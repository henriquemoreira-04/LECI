	.data
	.eqv STR_MAX_SIZE, 30
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	
str1:	.asciiz "I serodatupmoC euqirneH "
str2:	.space 31
str3:	.asciiz "String too long... "
	
	.text 
	.globl main
	
	
main:				#int main(void)
#----------------------------------------------------------------#
	addiu $sp,$sp,-4	# abro espacio de la stack
	sw $ra,0($sp)		#guarda retorno   (esto se hace siempre)
#-------------------------------------------------------------------#

	la $a0,str1
	jal strlen		# strlen(str1) devuelve en $v0
	
if:	bgt  $v0,STR_MAX_SIZE,else	#strlen(str1) <= STR_MAX_SIZE
	
	# OJO AQUÍ: dst va en $a0, src va en $a1 [cite: 185]
	la $a0,str2		# <-- DESTINO ($a0) = str2 (el vacío)
	la $a1,str1		# <-- ORIGEN  ($a1) = str1 (la frase)
	jal strcpy             # strcpy (str2,str1);
	
	la $a0,str2
	li $v0,print_string
	syscall			# print_string(str2);
	
	li $a0,'\n'
	li $v0,print_char	# print_string("\n");
	syscall
	
	la $a0,str2
	jal strrev		# strrev (str2)
	
	move $a0,$v0
	li $v0,print_string	#print_string(strrev(str2));
	syscall
	
	li $v0 , 0		# exit_value = 0;
	
	j end_main
	
endiff:

else:	la $a0,str3
	li $v0,print_string
	syscall			#print_string("String too long: ");
	
	la $a0,str1
	jal strlen		# strlen(str1) $v0
	
	move $a0,$v0
	li $v0,print_int10
	syscall			#print_int10(strlen(str1));
	
	li $v0,-1		# exit_value = -1;
	
end_main:	
		lw $ra,0($sp)	# primero recuperar $ra
		addiu $sp,$sp,4
		jr $ra
	
	

strlen:	li $t1,0		# int len=0;

while:	lb $t0,0($a0)		# cargar byte actual = char = *s
	addiu $a0,$a0,1		# s++
	
	beq $t0,'\0',endw	# (*s++ != '\0')
	
	addi $t1,$t1,1		# len++
	
	j while
endw:	move $v0,$t1		# resultado de la funcion devolvida

	jr $ra			# fin de la funcion strlen
	
strrev: addiu $sp,$sp,-16 # letendo el codigo vemos que necesitamos 4 registros 4 x 4 16 bytes 
	
	sw $ra,0($sp)		# guadar retorno 
	sw $s0,4($sp)		# guarda $s0 = str
	sw $s1,8($sp)		# guarda $s1 = p1
	sw $s2,12($sp) 		# guarda $s2 = p2
	
	move $s0,$a0		# registro called save para el atgumento que paso en a0
	move $s1,$a0		# p1 = str
	move $s2,$a0    	# p2 = str
	
while1_rev:	lb $t0,0($s2)		# caracter apuntadoa a *p2
	beq $t0,'\0',endw1	#*p2 != '\0'
	
	addiu $s2,$s2,1		#p2++
	j while1_rev
	
endw1:	addiu $s2,$s2,-1	#p2--

while2: bge $s1,$s2,endw2	#p1 < p2
	
	move $a0,$s1		# pasar los void en exchange 
	move $a1,$s2		# pasar los void en exchange 
	
	jal exchange 
			
	addiu $s1,$s1,1		#p1++;
	addiu $s2,$s2,-1	#p2--;
	
	j while2
	
endw2:  move $v0,$s0

	lw $ra , 0($sp)         # repone los direcciones de retorno 
	lw $s0 , 4($sp)         # en  os valores que use 
	lw $s1 , 8 ($sp)
	lw $s2 , 12($sp)
	
	addiu $sp,$sp,16       # libera el espacio de la sub rotina 
	 
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
	

exchange:
	lb $t0,0($a0)
	lb $t1,0($a1)
	sb $t1,0($a0)
	sb $t0,0($a1)
	jr $ra
	
	



