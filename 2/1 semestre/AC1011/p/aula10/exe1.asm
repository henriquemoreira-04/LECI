# main do mano leitner 


#mapa de registros 
# x -> $f20 ,  y -> $s0 

	.data 
val1:	.float 1.0
float:	.float 2.0
int:	.word  3
	.text
	.eqv zero,0
	.eqv print_float, 2
	.globl main



xtoy:	# prologo
	
	addiu $sp,$sp,-12 # abs , i , result , 4 * 3 = 12 
	sw $ra,0($sp)
	s.s $f20,4($sp)		# guardamos el x salvar 
	sw $s0,8($sp)		# guardamos el int y 			
	 	 
	move $s0,$a0		# $s0 = y
	mov.s $f20,$f12		# $f20 =  x
	
	move $a0,$s0		# llamo a y   redundante pero me sirve
	jal abs			# abs rerona $v0
	move $t1,$v0		# retrona valor 
	# $t1 = abs(y)
	
	la $t2,val1
	l.s $f2,0($t2)		# puedo usar f0 porque es lo que retorna 
	#$f0 = result = 1.0
	
	li $t3,0 		#  $t3 = i = 0
	
forxtoy: 
		bge $t3,$t1,endforxtoy			# i < abs(y)
	
ifxtoy:	
		ble $s0,0,elsextoy		#if(y > 0)
		mul.s $f2,$f2,$f20	# result *= x;
	        j endifelse
	
elsextoy: 
		div.s $f2,$f2,$f20	# result /= x;
	
endifelse: 	addi $t3,$t3,1
	   	j forxtoy
	
endforxtoy:	mov.s $f0,$f2
		# result ya est en f0
		#epilogo
	 
		lw $ra,0($sp)
		l.s $f20,4($sp)		# guardamos el x salvar 
		lw $s0,8($sp)		# guardamos el int y 	
		addiu $sp,$sp,12 # abs , i , result , 4 * 3 = 12
		jr $ra

abs:	# int val  $a0
	
if:		bge $a0,0,endiffabs	# if(val < 0)
		sub $a0,$0,$a0		# val = -val;
	

endiffabs: 	move $v0,$a0		# volver para el retonro 
		jr $ra 
		
main:		addiu $sp, $sp, -4
		sw $ra, 0($sp)
	
		la $t2, float
		l.s $f12, 0($t2)  # se guarda en f12 porque xtoy espera eso $f12
		la $t2, int
		lw $a0, 0($t2)
	
		jal xtoy
		mov.s $f12, $f0 
		li $v0, print_float
		syscall
	
		#epilogo
		lw $ra, 0($sp)
		addiu $sp, $sp, 4

		jr $ra

