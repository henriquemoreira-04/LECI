##define SIZE 15
#
#int toi(char *);
#int avz(int *, int);
#
#int func1(int *fl, int k, char *av[])
#{
#    int i;
#    int res;
#
#    if ((k >= 2) && (k <= SIZE)) {
#        i = 2;
#        do {
#            fl[i] = toi(av[i]);
#            i++;
#        } while (i < k);
#        res = avz(fl, k);
#        print_int10(res);
#    } else {
#        print_string("Invalid argc");
#        res = -1;
#    }
#    return res;
#}


# primer ejercicio guines 7,8 ojo con las stack  

#mapa de registros:
#f1: s0
#k: s1 
#av: s2
#i: s3
#res: s4
#*************************************************

# anotaciones , cuidado con las stacks 
# los valores de las stack sw ra 0 (sp)
# sw $s0 4(sp , ) , ojo con los endiff do while 
# ojo como piden las funciones puede der ao m a1 asi las quieren 
# recuerda esos jal 

#************************************************************************

	.data 
	.eqv SIZE,15
	.eqv print_int10,1
	.eqv print_string,4
	
str1:	.asciiz "Invalid argc"
	
	.text
	.globl func1

func1:  # prologo 5 * 4 + 4 = 24 
	addiu $sp,$sp,-24
	sw $ra,0($sp)  
	sw $s0,4($sp) 
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	
	move $s1,$a1  # $s1 = k
	move $s2,$a2  # s2 = av
	move $s0,$a0 # s0  = f1

if:	blt $s1,2,else   #  if(k >= 2)
	bgt $s1,SIZE,else  #if k <= SIZE
	
	li $s3,2		# i = 2;
	
do:	sll $t0,$s3,2	# array de punteros quiere i * 4 
	addu $t1,$s2,$t0	# memoria 
	lw $a0,0($t1)		#  av[i]   llamo el valor
	jal toi			# toi(av[i]); $v0
		
	sll $t0,$s3,2		# i * 4 
	addu $t2,$s0,$t0	# f1[i]
	sw $v0,0($t2)		# fl[i] = toi(av[i]);
	
	addi $s3,$s3,1		# i++;
	
	blt $s3,$s1,do		#} while (i < k);
	
enddo:  move $a0,$s0
	move $a1,$s1			
				#avz(fl, k);
	jal avz			# retorna $ v0
	
	move $s4,$v0		##res = avz(fl, k);
	
	move $a0,$s4
	li $v0,print_int10	#print_int10(res);
	syscall
	
	j endif


else:	
	la $a0,str1
	li $v0,print_string
	syscall			# print_string("Invalid argc");
	
	li $s4,-1		# res = -1;
	

endif:
	li $v0,$s4		#return res;
	
	#epilogo 
	lw $ra,0($sp) 
	lw $s0,4($sp) 
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	addiu $sp,$sp,24
	
	jr $ra 









