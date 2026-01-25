#mapa de registros    unsined   value = $t0   bit = $t1   i = $t2 $t3 =  0x80000000	
	.data
str1:	.asciiz "Introduzca un numero:"
str2:	.asciiz "\nO valor em binario es:"
	
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_char,11
	
	.text
	.globl main
main:				# void main(void)
	li $t2,0                #i = 0
	
	# llamada primera string 
	li $v0,print_string
	la $a0,str1
	syscall               	#print_string("Introduza um numero: "); 
	
	li $v0,read_int
	syscall 
	move $t0,$v0        	# value = read_int(); 
	
        li $v0,print_string
	la $a0,str2
	syscall       		#print_string("\nO valor em binário e': ");

	li $t3, 0x80000000

for:	bge $t2,32,endfor       # while i < 32 mientras
	
	
	and $t1,$t0,$t3        #bit = value & 0x80000000; // isola bit 31
	rem $t4,$t2,4

if:	beq $t1,0,else		#if(bit != 0)
	
	li $v0,print_char
        li $a0,'1'
        syscall
        j endif
        

        

else:	li $v0,print_char
        li $a0,'0'
        syscall
        
        
	
endif:	sll $t0,$t0,1
        addi $t2,$t2,1
	j for  
	

endfor: 
	jr $ra			# termina el programa 