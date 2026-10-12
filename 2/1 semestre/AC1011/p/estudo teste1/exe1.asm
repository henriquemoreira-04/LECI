#mapa de registros 
# $t0 = val 
# t1 = n = 0
# $t2 = min 
# $t3 = max 

	.data 
str1:	.asciiz "digite ate 20 inteiros (0 para terminar): "
str2:	.asciiz "Maximo/Minimo sao "
	
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_char,11
	.eqv read_int,5
	
	.text
	.globl main 
main:				#void main(void)
	li $t1,0		# n = 0 $ t1 
	li $t2 ,0x7FFFFFFF      
	li $t3, 0x80000000
	
	li $v0,print_string	#print_string("Digite até 20 inteiros (zero para terminar):");
	la $a0 , str1
	syscall 
	
do:	li $v0,read_int
	syscall 
	move $t0,$v0			#val = read_int();

if1:	beq $t0,0,else			#if (val != 0) {

if2:	ble $t0,$t3,if3			#if ( val > max)	
	move $t3,$t0
	
if3:	bge $t0,$t2,else		#if (val < min)
	move $t2,$t0	
	
else:  addi $t1,$t1,1


while:	bge $t1 ,20,endw
	beq $t0,0,endw			#while( (n < 20) && (val != 0) );
	
	j do 				# !!! cuidado con los jump para esto


endw:	li $v0 , print_string 		#print_string("Máximo/mínimo são: ");
	la $a0,str2
	syscall 
	
	li $v0,print_int10		#print_int10(max);
	move $a0,$t3
	syscall 
	
	li $v0,print_char
	li $a0,':'
	syscall 			#print_char(':');
	
	
	li $v0,print_int10		#print_int10(max);
	move $a0,$t2
	syscall 
	
	jr $ra
