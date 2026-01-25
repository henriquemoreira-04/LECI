	.data
	
number:	.double 144
xn:	.double 1.0
val1:  .double 0.0
val2:	.double 0.5
 
	.text
	.globl main
main:	
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $t0, number
	l.d $f12, 0($t0)
	
	jal sqrt	# retorno en f0
	
	mov.d $f12, $f0  # mi entrada $f12 pasa a f0
	li $v0, 3	# print_double 
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

sqrt:	# $f12 = val 
	
	la $t0,xn
	l.d $f0,0($t0) 	# $f0 = xn = 1.0;
	
	li $t1,0	# $t1 = i = 0
	
	la $t2,val1
	l.d $f2,0($t2)	# $f2 = val1 = 0.0
	
ifelsesqrt:	
	c.le.d $f12,$f2	# if(val > 0.0)
	bc1t elsesqrt   # si es verdad salta al else
	
do:	mov.d $f4,$f0	#   aux  = $f4 mi auxiliar  guardo una copia 
	
	la $t4,val2
	l.d $f6,0($t4)	# $f6 = 0.5
	
	div.d $f10 ,$f12 ,$f0	# $f12 =  val/xn     cuidado con matar a f12
	add.d $f8,$f0,$f10	# $f8 =  xn + val/xn
	
	mul.d $f0,$f6,$f8	# 0.5 * (xn + val/xn);
	
	# while((aux != xn) && (++i < 25));
	
	c.eq.d $f4,$f0   # 
	bc1t endifelsesqrt
	
	addi $t1,$t1,1	# ++i 
	li $t6 , 25 
	bge $t1,$t6,endifelsesqrt
	
	j do 

elsesqrt:	mov.d $f0,$f2

endifelsesqrt:	jr $ra 