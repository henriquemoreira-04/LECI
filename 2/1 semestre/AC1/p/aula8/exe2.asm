	.data
	
str:	.space 33

	.eqv STR_MAX_SIZE, 33
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_char, 11
	
buf_static:	.space 33
	
	.text 
	.globl main
main:					#int main(void)
	addiu $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0, 4($sp)		# Guardamos $s0 porque lo usamos para 'val'
	
domax:	li $v0,read_int
	syscall
	move $s0,$v0		#  $ v0 = val = read int ()
	
	# --- BASE 2 ---
	move $a0, $s0		# arg1: n
	li $a1, 2		# arg2: base
	la $a2, str		# arg3: buffer
	jal itoa		# llamada
	
	move $a0, $v0		# imprimir resultado
	li $v0, print_string
	syscall
	
	li $a0, '\n'		# imprimir salto de línea
	li $v0, print_char
	syscall

	# --- BASE 8 ---
	move $a0, $s0
	li $a1, 8
	la $a2, str
	jal itoa
	
	move $a0, $v0
	li $v0, print_string
	syscall
	
	li $a0, '\n'
	li $v0, print_char
	syscall
	
	# --- BASE 16 ---
	move $a0, $s0
	li $a1, 16
	la $a2, str
	jal itoa
	
	move $a0, $v0
	li $v0, print_string
	syscall
	
	li $a0, '\n'
	li $v0, print_char
	syscall
	
	bne $s0,0,domax
	
	li $v0,0

	lw $ra,0($sp)
	lw $s0, 4($sp)		# Guardamos $s0 porque lo usamos para 'val'
	addiu $sp,$sp,8
	jr $ra








# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia

itoa:  	# PROLOGO 1 reservar 24 bytes 
	addiu $sp,$sp,-24    	# 5 se pueden usar 20 pero uso 24 para alinear bien

	sw $ra,0($sp)		# cosas
	sw $s0,4($sp)		# #s0 para n 
	sw $s1,8($sp)		# s1 para b
	sw $s2,12($sp)		# s2 para s
	sw $s3,16($sp)		# s3 para p 
	
	# 2 COPIAR LOS VALORES 
	move $s0,$a0		# $s0 = n
	move $s1,$a1		#$s1 = b
	move $s2,$a2		# $s2 = s
	move $s3,$a2		# s =  p
	
dowhile:	divu $s0,$s1		# 1 dividir 
		mflo $s0		# n/b 
		mfhi $a0		# resto  = (digit)
	
	jal toascii 		# retorno $v0
	
	sb $v0,0($s3)		# *p
	
	addiu $s3,$s3 ,1	#*p++ = toascii(digit)
	
	bgt $s0,0,dowhile		# while n > 0
	
	sb $0,0($s3)		# *p = '\0';
	
	move $a0,$s2		#
	jal strrev		# strrev( s ); $v0
	
	move $v0,$s2		# return s;
	
	# epilogo 
	
	lw $ra,0($sp)		# cosas
	lw $s0,4($sp)		# #s0 para n 
	lw $s1,8($sp)		# s1 para b
	lw $s2,12($sp)		# s2 para s
	lw $s3,16($sp)		# s3 para p 
	
	addiu $sp,$sp,24
	
	jr $ra 
	
toascii:	addiu $v0,$a0,'0'	# v = v + 0 

iftoascii:	ble $v0,'9',endiftoascci
		addiu $v0,$v0,7
			
endiftoascci:   jr $ra 


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
	
	
exchange:
	lb $t0,0($a0)
	lb $t1,0($a1)
	sb $t1,0($a0)
	sb $t0,0($a1)
	jr $ra
	
	
print_int_ac1:	# a0 = val a1 = base

		addiu $sp,$sp,-4	# llama a itoa
		sw $ra,0($sp)
		
		la $a2,buf_static	#
		jal itoa		# $v0
		
		move $a0,$v0
		li $v0,print_string
		syscall
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		jr $ra
	
	
	
	
	