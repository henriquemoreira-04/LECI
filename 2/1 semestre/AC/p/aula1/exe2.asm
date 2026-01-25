	.data
			#nada a colocar de momento  
	.text
	.globl main
main:	ori $t0,$0,5	 # x,2,3,4,5     t0 = x sustituir val x por valor pretendido
	ori $t2, $0,8	 # t2 = 8
	add $t1,$t0,$t0  # t1 = t0 + t0 = x + x = 2 * x
	sub $t1,$t1,$t2  # t1 = t1 - t2 = y = 2 * x - 8
	jr $ra		 #fim del programa 