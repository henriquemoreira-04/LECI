	.data
val1:  .float 1.0
vald1: .double 0.0
xn:	.double 1.0
val2:	.double 0.5
	
	.eqv SIZE,10
	.eqv print_double,3
	.eqv read_double, 7 	
				
array:	.space 80  # 10 * 8 

	.text
	.globl main


main:   	# int main(void)

	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	li $t0,0	# i = 0
	
	la $t4,array # direciion no es doble
	
formain:	
	
	bge $t0,SIZE,endformain
	
	li $v0,read_double 
	syscall 		# read double $f0
	
	sll $t2,$t0,3		# i * 8
	addu $t5,$t4,$t2      #  array[i]
	
	s.d $f0,0($t5)		# arr[i] = read_double();
	
	addi $t0,$t0,1		# i++	
	j formain
	 
endformain: 
	
	la $a0,array
	li $a1,SIZE
	jal average 	# $f0
	mov.d $f12,$f0
	li $v0,print_double 
	syscall			# print_double( average(arr, SIZE) );
	
	la $a0,array
	li $a1,SIZE
	jal var 	#  print_double( var(arr, SIZE) );
	mov.d $f12,$f0
	li $v0,print_double 
	syscall		
	
	
	la $a0,array
	li $a1,SIZE
	jal stdev 	#  print_double( stdev(arr, SIZE) );
	mov.d $f12,$f0
	li $v0,print_double 
	syscall		
	
	
	li $v0,0
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra

var:	
	addiu $sp,$sp,-24
	sw $ra,0($sp)		#$ra
	sw $s0,4($sp)		#array
	sw $s1,8($sp)		#nval
	sw $s2,12($sp)		#i
	s.s $f20,16($sp)	#media
	s.s $f22,20($sp)	# soma
	
	move $s0,$a0		# $s0 =  array
	move $s1,$a1		# $s1 = nval 
	jal average		# $f0 average(array, nval);
	
	cvt.s.d $f20,$f0        # media = (float)average(array, nval);
	
	li $s2,0		# i=0
	
	mtc1 $0,$f22
	cvt.s.w $f22,$f22	# soma = 0.0
	
forvar:	bge $s2,$s1,endforvar   # i < nval;
	
	sll $t0,$s2,3		# cargar el i double i * 8 
	addu $t2,$s0,$t0	# $t2 = double array[i]
	
	# --- [CORREGIDO 1: Carga segura] ---
	l.d $f4, 0($t2)		# Cargar el double de la RAM
	cvt.s.d $f12, $f4	# Convertirlo a float para operar
	
	# --- [CORREGIDO 2: Instrucción sub.s] ---
	sub.s $f12,$f12,$f20	# Resta de floats: (float)arr[i] - media
	
	li $a0,2		
	jal xtoy		# $f0
	
	add.s $f22,$f22,$f0     # soma = soma +  xtoy((float)array[i] - media, 2);
	
	addi $s2,$s2,1
	j forvar 
	

endforvar: 

	mtc1 $s1,$f24 
	cvt.d.w $f24,$f24 #  double)nval;
	
	cvt.d.s $f26,$f22 #  (double)soma
	
	div.d $f0,$f26,$f24  # soma / nval 
	
	
	#epilogo 
	lw $ra,0($sp)		#$ra
	lw $s0,4($sp)		#array
	lw $s1,8($sp)		#nval
	lw $s2,12($sp)		#i
	l.s $f20,16($sp)	#media
	l.s $f22,20($sp)	# soma
	addiu $sp,$sp,24
	
	jr $ra 


stdev:	
	addiu $sp,$sp,-4
	 sw $ra,0($sp)
	 
	 jal var	# $f0\
	 
	 mov.d $f12,$f0	# 
	 
	 jal sqrt	# revuelve en $f0
	 
	 lw $ra,0($sp)
	 addiu $sp,$sp,4
	 
	 jr $ra




# a0 = array , $a1 =  int n $f0 double 
average:	addi $t0,$a1,-1	# $t0 = i =  n-1
		
		#double sum = 00
		la $t1,vald1
		l.d $f0 , 0($t1)
		
forda:		blt $t0,$0,endforda
		
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