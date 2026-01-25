
# EJEMPLO LISTA INDEXCACION 


#char str[] = "banana";
#int count = 0;
#int i;
#for (i = 0; str[i] != '\0'; i++) {
   # if (str[i] == 'a') {
  #      count++;
 #   }
#}

	.data
str1:	.asciiz "banana"
	.text
	.globl main
main:	li $t1,0		#nt count = 0;
	li $t0,0		#int i = 0
	la $t2,str1	#ponteiro para str[0]
	
for:	addu $t3,$t2,$t0	# t3 = str + i * 1
	lb $t4,0($t3)           # t4 = str[i]
	beq $t4,'\0',endfor
        
        
if:     bne $t4,'a',endif
	addiu $t1,$t1,1

endif:  addiu $t0,$t0,1
	j for		

endfor: jr $ra