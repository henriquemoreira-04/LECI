	.data 
	.eqv print_double,3
	
vid:    .double 0.35
	
	.align 3
s2:     
	.asciiz "Str_1" # offset 0
	.space 10   # 16 - 6
	
	.word 2023 # offset 16   4 
	.space 4
	
	.double 2.718281828459045 # offset 24
	
	.asciiz "Str_2"		# offset 32
	
	
	.text 
	.globl main
	
main:   #prologo
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	
	la $a0,s2	# &s2
	jal f2 		# $f0
	
	mov.d $f12,$f0
	li $v0,print_double 
	syscall 	# print_double( f2(&s2) );
	
	li $v0,0	# return 0;
	#epilogo 
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra 	
	
f2:	
	la $t2,vid
	l.d $f8,0($t2)	# $f8 = 0.35
	
	l.d $f0,24($a0) # $f0 =  p->g
	
	lw $t3,16($a0) # $t3 = p->i
	
	mtc1 $t3 ,$f2
	cvt.d.w $f2 , $f2 # (double)p->i
	
	mul.d $f0,$f0,$f2 # p->g * (double)p->i
	
	div.d $f0,$f0,$f8 # p->g * (double)p->i / 0.35;
	
	# retunr en f0 ya 
	
	jr $ra  
	
	
	
	
	