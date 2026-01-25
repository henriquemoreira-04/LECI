	.data 
	
	.eqv SIZE,10
	.eqv read_double,7
	.eqv print_double ,3 
	.eqv zero,0
	
a:	.space 80
	
	.text
	.globl main

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
	jal max	#retornoi en $f0
	
	mov.d $f12,$f0	# porque retrona double 
	li $v0,print_double
	syscall	
			# ojo con esto hermano cuidado 
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $v0,0	#return 0;
	jr $ra

#---------------------------------------------------------#
max:	# a0 = p    unsingned a1 = n   retorno $f0
	
	addiu $t0,$a1,-1	# n-1
	sll $t0,$t0,3		# i * 8
	addu $t1,$a0,$t0	# t1 = u = p+n-1
	
	l.d $f0,0($a0)		# max = p* cargar el puntero double 
	addiu $a0,$a0,8		# p++
	
formax:	bgt $a0,$t1,endformax	# p <= u;

ifmax:	l.d $f2,0($a0)	# $f2 = *p
	c.le.d	$f2,$f0		#if(*p > max)
	bc1t	endiffmax	# si esverdad que es <= salta al final 
	
	mov.d $f0,$f2
endiffmax:

	addiu $a0,$a0,8		# p ++
	j formax

endformax: 		
		jr $ra		# max ya esta en $f0
	
	
	 