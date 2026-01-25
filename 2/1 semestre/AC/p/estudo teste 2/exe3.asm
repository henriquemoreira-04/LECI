
#double func3(int nv, t_kvd *pt)
#{
#    int i, j;
#    double sum = 0.0;
#
#    for (i = 0; i < nv; i++, pt++) {
#        j = 0;
#        do {
#            sum += (double) pt->quest[j];
#            j++;
#        } while (j < pt->nm);
#
#        pt->acc = (int) (sum / pt->grade);
#    }
#    return (pt->grade * (double) pt->cq);
#}


#Mapa de registros:
#nv: $a0
#pt:	$a1			16
#i: $t0				14
#j:	$t1			30	
#sum: $f2

#********************************************************************

# ojo con las memorias y esas cosas por favor 

#*******************************************************************

#SUSTITUYE XX POR EL VALOR QUE DEBERIA SER 

#typedef struct
#{				ALIGN       SIZE       OFFSET
#		 int acc;	 4	     4          0
#	unsigned char nm;        1          1          	4
#	    double grade;        8          8          	5->8
#	  char quest[14];        1          14          16
#		  int cq;        4          4          	30->32
#} t_kvd;			 8/3       36->40

	.data 
	
sum:	.double 0.0
	.text
	.globl func3
	
	

func3:	
	la $t0,sum
	l.d $f2,0($t0)	# $f2 = double sum = 0.0;
	
	li $t0,0	# i = 0;
	
for:	bge $t0,$a0,endfor		# i < nv
	
	li $t1,0			# j = 0;
	
do:	addu $t2,$a1,$t1		#memoria pt->quest[j];
	lb $t3,16($t2)			#  valor pt->quest[j];
	
	mtc1 $t3,$f4
	cvt.d.w $f4,$f4			# (double) pt->quest[j];
	add.d $f2,$f2,$f4		# sum += (double) pt->quest[j];
	
	addi $t1,$t1,1			# j++;
	
	
	lbu $t4,4($a1)			# pt -> nm ;
	
	blt $t1,$t4,do			# } while (j < pt->nm);
	
enddo: 						
	lw $t5,0($a1)			# $t5 = pt ->acc
	
	l.d $f6,8($a1)			# f6 = pt->grade
	
	div.d 	$f10,$f2,$f6		# (sum / pt->grade);
	cvt.w.d $f10,$f10			#
	mfc1 $t6,$f10			# (int) (sum / pt->grade);
	
	sw $t6,0($a1)			#pt->acc = (int) (sum / pt->grade);
	
	
	
	addi $t0,$t0,1				# i++
	addi $a1,$a1,40				#pt++
	j for 

endfor:	
	
	 l.d $f16,8($a1)	# pt grade
	 
	 lw $t7,32($a1)		#    pt->cq
	 
	 mtc1 $t7,$f8
	 cvt.d.w $f8,$f8	# (double) pt->cq
	 
	 mul.d $f0,$f16,$f8	# (pt->grade * (double) pt->cq);
	 jr $ra			# ya esta en f0 




















