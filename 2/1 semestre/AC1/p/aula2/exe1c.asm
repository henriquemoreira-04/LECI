	.data
	.text
	.globl main
main:
	ori $t0,$0,0x1234 # sustituir val 1 e 2 por los valores pedidos
	nor $t1,$0,$t0   # para que el nor efectue una ngacion completa
	
	jr $ra    # fin del programa 