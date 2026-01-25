#mapa de registros 
# $t0 = p
#$t1 = *p
#
#
	.data
	
		
	.eqv SIZE,20
	.eqv print_string,4
	.eqv read_string,8

str:	.space 21
str1:	.asciiz "Introduza uma string: "
	
	.text
	.globl main
main:				#void main(void)
	li $v0,print_string
	la $a0,str1
	syscall			#print_string("Introduza uma string: ");
	
	la $a0,str		# str
	li $a1,SIZE		# SIZE
	
	li $v0,read_string
	syscall
	
	la $t0,str		# p = str;

while:	lb $t1,0($t0)		# *p
	
	beq $t1,'\0',endw	#while (*p != '\0')
	
	addi $t1,$t1,-0x61      #*p – 'a'
	addi $t1,$t1,0x41       #*p = *p – 'a' + 'A';

	addi $t0,$t0,1		#p++
	
	j while
	
endw:	li $v0,print_string 
	la $a0,str
	syscall			# print_string(str);
	
	jr $ra
		