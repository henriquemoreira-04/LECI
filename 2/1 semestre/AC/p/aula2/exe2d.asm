	.data
	.text
	.globl main
main:	
	li $t0,0x5
	srl $t1,$t0,1
	xor $t2,$t0,$t1
	jr $ra