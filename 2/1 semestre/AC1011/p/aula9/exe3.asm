	.data 
	
	.eqv SIZE,10
	.eqv read_double,7
	.eqv print_double ,3 
	.eqv zero,0
	
vald1:	.double 0.0
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
	jal average	#retornoi en $f0
	
	mov.d $f12,$f0	# porque retrona double 
	li $v0,print_double
	syscall	
			# ojo con esto hermano cuidado 
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $v0,0	#return 0;
	jr $ra

# a0 = array , $a1 =  int n $f0 double 
average:	addi $t0,$a1,-1	# $t0 = i =  n-1
		
		#double sum = 00
		la $t1,vald1
		l.d $f0 , 0($t1)
		
forda:		blt $t0,zero,endforda
		
		#array[i]
		sll $t1,$t0,3	# i * 8 double 2 elevado a 3 
		
		addu $t1,$a0,$t1	# array[i]
		
		l.d $f2,0($t1)		# pongo el array en double 
		
		add.d $f0,$f0,$f2	# sum += array[i];
		
		addi $t0,$t0,-1
		j forda			

endforda:	mtc1 $a1,$f4		# mover crudo a coprocesador
		cvt.d.w	$f4 ,$f4	# Convertir Word a Double. Ahora $f4 es n.0
		
		div.d $f0,$f0,$f4	# return sum / (double)n;
		
		jr $ra 