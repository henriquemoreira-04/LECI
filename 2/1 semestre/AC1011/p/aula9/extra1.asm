	.data 
	
	.eqv SIZE,10
	.eqv read_double,7
	.eqv print_double ,3 
	.eqv zero,0
	.eqv TRUE,1
	.eqv FALSE,0
	.eqv print_str, 4
a:	.space 80
	
	.text
	.globl main

#--------------------------------------------------------------------#


median:	 # a0 = a     a1 = nval  

do:	li $t0,FALSE		# $t0 = houvetroca
	li $t1 , 0		# t1 = i= 0
	addiu $t2,$a1,-1	# $t2 = nval -1 
	
fordo:	bge $t1,$t2,whiledo	# i < nval-1;

ifdo:	sll $t3,$t1,3		# i * 8
	addu $t3 ,$a0,$t3	# t3 = array[i] double
	
	l.d	$f0, 0($t3)	# $f0 = array[i]
	l.d	$f2, 8($t3)	# $f2 = array[i+1]
	
	c.le.d $f0,$f2
	bc1t	endifdo
	
	mov.d $f6,$f0	# aux = array[i]
	
	mov.d $f0,$f2	# array[i] = array[i+1];
	
	mov.d $f2 ,$f6		# array[i+1] = aux; array[i]
	
	s.d	$f0, 0($t3)	# Guardar nuevo array[i]
	s.d	$f2, 8($t3)	# Guardar nuevo array[i+1]
	
	li $t0,TRUE
	
	# --- SWAP DIRECTO A MEMORIA (Sin mov.d) ---
	# Guardamos $f2 (el pequeño) en la posición de i
	#s.d	$f2, 0($t3)	
	
	# Guardamos $f0 (el grande) en la posición de i+1
	#s.d	$f0, 8($t3)
	
endifdo: 	addi $t1,$t1,1	# i++
		j fordo
		
		
whiledo:	beq $t0,TRUE,do

enddo:		div $t5,$a1,2	# entero
		
		sll $t5,$t5,3	# i * 8 
		addu $t7,$a0,$t5 # direccion mas offset 
		
		l.d $f0,0($t7)	#array[nval / 2];
		
		jr $ra		# resultado ya en t0
#--------------------------------------------------------------------#
main:	#prologo 
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	li $t0,0	#  $t0 = i = 0

for1:	bge $t0,SIZE,endfor1	# i < SIZE;
	
	la $t1,a		# $t1 = a 
	sll $t2,$t0,3		# i * 8 double cuidado otro registro
	addu $t3,$t1,$t2	# a + i  a[i]
	li $v0,read_double
	syscall			# resultado en $f0
	
	s.d $f0,0($t3)
	
	addi $t0,$t0,1	#i++
	j for1

		
endfor1: 
	la $a0,a
	li $a1,SIZE
	jal median	#retornoi en $f0
	
	mov.d $f12,$f0	# porque retrona double 
	li $v0,print_double
	syscall	
			# ojo con esto hermano cuidado 
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $v0,0	#return 0;
	jr $ra