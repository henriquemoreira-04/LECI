# Mapa de registos:
# argc:     $t0 (Guardamos $a0 aquí porque syscall destruye $a0)
# argv:     $t1 (Guardamos $a1 aquí por seguridad)
# i:        $t2
# Offset:   $t3

	.data
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv exit, 10

str1:	.asciiz "Nr. de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "
	
	.text
	.globl main
main:	
	move $t0,$a0	# $t0 = argc
	move $t1,$a1	# $t1 = argv
	
	li $v0,print_string
	la $a0,str1
	syscall			#print_string(str1);
	
	li $v0,print_int10	
	move $a0,$t0
	syscall			#print_int10(argc);
	
	li $t2,0		# i = 0
	
for:	bge $t2,$t0,endfor	#i < argc;
	
	li $v0,print_string
	la $a0,str2
	syscall			#print_string(str2);
	
	li $v0,print_int10	
	move $a0,$t2
	syscall			#print_int10(i);
	
	li $v0,print_string
	la $a0,str3
	syscall			#print_string(str3);
	
	sll $t3,$t2,2		# i * 4 
	addu $t4,$t1,$t3	# argv[i]
	
	li $v0,print_string
	lw $a0,0($t4)
	syscall			# print_string(argv[i]);
	
	addi $t2,$t2,1
	
	j for
	
	

endfor: li $v0,exit
	syscall			#return 0;