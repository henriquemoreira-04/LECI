# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
#

	.data
	.eqv print_string, 4
	
str1:	.asciiz "ITED - orievA ed edadisrevinU"
	
	.text 
	.globl main
	
strrev: addiu $sp,$sp,-16 # letendo el codigo vemos que necesitamos 4 registros 4 x 4 16 bytes 
	
	sw $ra,0($sp)		# guadar retorno 
	sw $s0,4($sp)		# guarda $s0 = str
	sw $s1,8($sp)		# guarda $s1 = p1
	sw $s2,12($sp) 		# guarda $s2 = p2
	
	move $s0,$a0		# registro called save para el atgumento que paso en a0
	move $s1,$a0		# p1 = str
	move $s2,$a0    	# p2 = str
	
while1:	lb $t0,0($s2)		# caracter apuntadoa a *p2
	beq $t0,'\0',endw1	#*p2 != '\0'
	
	addiu $s2,$s2,1		#p2++
	j while1
	
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
	
# ----------------------------------------------#
#funcion auxiliar exchange 
exchange:	# a0 = c1  a1 = c2

	lb $t0,0($a0)   # aux = *c1 valor inicial caracter lo guardo
	lb $t1,0($a1)	#  *c2    guarda el segundo 
	
	sb $t1,0($a0)   # lo que guardo , donde lo guardo 
	sb $t0,0($a1)   # 
	
	jr $ra 
#-----------------------------------------------------------------------	
main:  				#int main(void)
	addiu $sp,$sp,-4	# abro el espacio en la stack
	sw $ra,0($sp)		#guardar retorno para so
	
	la $a0,str1		# cargar str
	
	jal strrev		# strrev(str)
	
	move $a0,$v0
	li $v0,print_string 
	syscall
	
	li $v0,0		#return 0
	
	
	# epilogo
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra