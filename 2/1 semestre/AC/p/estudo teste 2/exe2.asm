#float func2(float *a, float t, int n)
#{
#    float oldg = -1.0;
#    float g = 1.0;
#    float s = 0.0;
#    int k;
#
#    for (k = 0; k < n; k++) {
#        while ((g - oldg) > t) {
#            oldg = g;
#            g = (g + a[k]) / t;
#        }
#        s = s + g;
#        a[k] = g;
#    }
#    return s / (float) n;
#}

#------------------------------------------------------------------

#cuidado con los sll leer si es doul=ble o float 
# al dar store , $ quiero darseloa la memoria no el valor 
# cuidado con los valores de memoria 
#y esas cosas 
#cuidado con los j while 
# cuidado con los stores 
# puedo llamar solo a $t0 para no gastar registros 




#-----------------------------------------------------------------
#mapa de registros:
#a : $a0 es puntero 
# t : $f12
# n: $ a1
# oldg:$f2
# g:$f4
# s: $f0
# k:$t0 

	.data 
	
oldg:	.float -1.0
g:	.float 1.0
s:	.float 0.0
	
	
	.text
	.globl func2
	
func2:	
	la $t0,oldg
	l.s $f2,0($t0)			# $f2 =  float oldg = -1.0;
	
	la $t1,g
	l.s $f4,0($t1)			# f4 =  float g = 1.0;
	
	la $t2,s
	l.s $f0,0($t2)			# f0 = float s = 0.0;
	
	li $t3,0 			#k = 0
	
for:	bge $t3,$a1,endfor 		#  k < n
	
	sll $t4,$t3,2			# k * 8 
	addu $t5,$a0,$t4		# a[k]
	l.s $f6,0($t5)			# $f6 = float a[k]		
 	
	 
while:	sub.s $f8,$f4,$f2		# g - oldg 

	c.le.s $f8,$f12	
	bc1t   endwhile 		# while ((g - oldg) > t) {
	
	mov.s $f2,$f4			# oldg = g;
	
	add.s $f10,$f2,$f6		# (g + a[k])
	div.s $f10,$f10,$f12		# (g + a[k]) / t;
	
	mov.s $f4,$f10		#  g = (g + a[k]) / t;
	
	j while 
	
endwhile:

	add.s $f0,$f0,$f4	#s = s + g;
	
	s.s $f4,0($t5)		#  a[k] = g; 
	
	addi $t3,$t3,1		
	j for 

endfor:  mtc1 $a1,$f18
	cvt.s.w $f18,$f18	# (float) n;
	div.s $f0,$f0,$f18	# return s / (float) n;
	
	jr $ra			# acabo porque f0 ya esta  










