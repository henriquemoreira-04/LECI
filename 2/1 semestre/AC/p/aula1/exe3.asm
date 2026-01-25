	.data
	.text
	.globl main
main:	ori $v0,$0,5    # v0 = 5    guarda e numero 
	syscall         # chamada ao syscall read_init()
	or $t0,$0,$v0    #t0 = vo = valor lido del teclado 
		        # valor de x pretendido
	
	
	ori $t2,$0,8    # t2= 8
	add $t1,$t0,$t0 #t1 = 2x
	sub $t1,$t1,$t2 # t1= t1-t2 = 2x - 8  t1 = y
	
	#a)
	#system call print int  
	or $a0,$0,$t1 # $a0=y=t1
	ori $v0,$0,1
	syscall 	# llamada de syscall print init()
			
	
	#b)
	#system call print int 16
	or $a0,$0,$t1 
	ori $v0,$0,34
	syscall		
	
	#c)
	#system call print intu 16 unsinged
	or $a0,$0,$t1 
	ori $v0,$0,36
	syscall		
	
	jr $ra		#fin de programa
	
		     	     