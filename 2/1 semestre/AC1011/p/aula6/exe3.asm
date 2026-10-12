# Mapa de registos:
# i:            $t0
# j:            $t1
# array[i][j]:  $t3 (Usado temporalmente para direcciones y el valor final)
# $t4 = SIZE

	.data
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	
array:	.word str1 ,str2 ,str3

str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "videojuegos"

str4 :  .asciiz "\nString #"
str5:	.asciiz ":"

	.text 
	.globl main
main:				#void main(void)
	li $t0,0		# i = 0
	li $t4,	SIZE		# $t4 = SIZE
	
for:	bge $t0,$t4,endfor      #  while (i < SIZE)
	
	li $v0,print_string
	la $a0,str4
	syscall			#print_string( str4);
	
	li $v0,print_int10
	move $a0,$t0
	syscall			#print_int10( i );
	
	li $v0,print_string
	la $a0,str4
	syscall			#print_string(str5);
	
	li $t1,0		# j = 0 
	
while:
	la $t3,array		#$t3 = array[0]
	sll $t2,$t0,2		# i * 4 multiplicas el i corre las array
	addu $t3,$t3,$t2	# &array[i]
	lw $t3,0($t3)		#array[i][0] 
	addu $t3,$t3,$t1	#array[i][j]
	lb $t3,0($t3)		#$t3 = array[i][j] la jo percorre la string no
	
	beq $t3,'\0',endwhile
	
	li $v0,print_char
	move $a0,$t3
	syscall			#print_char(array[i][j]);
	
	li $v0, print_char
	li $a0,'-'
	syscall			#print_char('-');
	
	addiu $t1,$t1,1
	
	j while
	
endwhile: addi $t0,$t0,1	#i++
	j for 	
	
endfor: jr $ra