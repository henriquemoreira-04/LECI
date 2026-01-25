	.data 
	.align 3
	
	.eqv print_float,2
	.align 3
s1:	
	.asciiz "St1"  # ofsset 0
	.space 12 		# 16 - 4 
	
	.double 3.141592653589 # ofsset 16
	
	.word 291,756  #offset 24
	
	.byte  'X'		#offset 32
	.space 3
	
	.float 1.983		# ofset 36
	
	.text 
	.globl main
	
main:			#int main(void)
	#prologo 
	
	addiu $sp,$sp,-4
	sw $ra ,0($sp)	
	
	jal f1 		# retorna $f0
	
	mov.s $f12,$f0
	li $v0,print_float
	syscall
	
	lw $ra ,0($sp)
	addiu $sp,$sp,4
	jr $ra 
	
	
f1:	la $t0,s1	# cargamos la struct 


	#s1.g
	
	l.d $f0,16($t0)	# $f0 = s1.g
	
	#s1.k
	
	l.s $f2,36($t0)	
	
	#double s1.k
	
	cvt.d.s $f2,$f2	# $f2 = (double)s1.k
	
	#s1.a2[1]
	
	lw $t1,28($t0)  # OJO a2 comienza en 24 + 4 bytes llega a 28 
			# $t1 = s1.a[1]
	
	mtc1 $t1,$f4
	cvt.d.w $f4,$f4	# $f4 =  (double)s1.a2[1] 
	
	div.d $f4,$f4,$f2 # (double)s1.a2[1] / (double)s1.k)
			
	mul.d $f0,$f0,$f4	# s1.g * (double)s1.a2[1] / (double)s1.k
	
	cvt.s.d $f0,$f0		# (float)(s1.g * (double)s1.a2[1] / (double)s1.k);
	
	# return ya eb f0 
	
	jr $ra 
			  
	
	
	
	
	
	
	
	
	
	
	

