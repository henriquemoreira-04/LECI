	.data
	.eqv read_int,5
	.eqv print_float ,2
val1:	.float 2.59375
val2:	.float 0.0
	.text
	.globl main
	
main:	la $t0,val1		#int main(void)
	l.s $f2,0($t0)	# $f2 = val 1
	la $t1,val2
	l.s $f4,0($t1)	# $f4 = 0.0
	
do:	li $v0,read_int
	syscall
	mtc1 $v0,$f0	# lko que esta en v0 va a f0  tiene el patron (no es float aun )
	
	cvt.s.w $f0,$f0	# ahora ya es float f0 
	
	mul.s  $f12,$f0,$f2	#  res = (float)val * 2.59375;
	# mul.s el registro tiene que ser par 
	# tiene qu ser f 12 para salir 
	li $v0,print_float
	syscall			# print_float( res );
	
	# (Opcional) Imprimir salto de línea para que se vea bonito
	li	$a0, 10		# ASCII '\n'
	li	$v0, 11
	syscall
	
	# condicion while 
	c.eq.s $f12,$f4	# bandera interna si o no (no)
	
	bc1f	do	# Branch if Coprocessor 1 False
	
	li $v0,0
	jr $ra
	
	
	
# b) 7,78125 
# parte inteira 0111
# parte fracionaria 0.78125 
#      0.78125 * 2
# 1     .5625 * 2
# 1     .125 * 2
# 0     .25 * 2
# 0     .5 * 2
# 1     1.0 
# 0111.11001 * 2⁰
# 1.1111001 * 2²
# 127+2 = 129 
# 0 1000000	1 11110010000000000000000


	
	
	