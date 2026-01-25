#include <stdio.h>

#// Declaración de la función (prototipo)
#double f2c(double ft);

#int main(void)
#{
 #   double f, c;
    
  #  printf("Introduza temperatura em Fahrenheit: ");
   # scanf("%lf", &f);  // Leemos un double (%lf)
    
   # c = f2c(f);        // Llamamos a la función
    
   # printf("Temperatura em Celsius: %lf\n", c); // Imprimimos double
    #return 0;
#}

#double f2c(double ft)
#{
 #   // Fórmula: (5.0 / 9.0) * (ft - 32.0)
  #  return (5.0 / 9.0 * (ft - 32.0));
#}
	
	
	.data 
val1:	.double 5.0
val2:	.double 9.0
val3:	.double 32.0

# Textos para la interfaz
str1:	.asciiz "Introduza temperatura em Fahrenheit: "
str2:	.asciiz "Temperatura em Celsius: "
str3:	.asciiz "\n"
	.text
	.globl main

main:				# #int main(void)
	#prologo
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str1
	li $v0,4	##  printf("Introduza temperatura em Fahrenheit: ");
	syscall
	
	li $v0,7
	syscall		## el valor leido queda en  $f0
	
	
	mov.d $f12,$f0	# mover lo que esta en f0 a a0 = f12 
	jal f2c		# resultado a $f0
	
	la	$a0, str2		
	li	$v0, 4
	syscall
	
	# Salto de línea estético
	la	$a0, str3
	li	$v0, 4
	syscall
	
	mov.d	$f12,$f0		# print_double 
	li	$v0, 3
	syscall
	
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	li $v0,0
	jr $ra
	
	

f2c:	#$f12 =  ft 
	
	# no hace falta proologo es temporal 
	
	#1 cargar constantes desde memoria 
	
	la $t0,val1
	l.d $f2,0($t0)	# f2 = val1
	
	la $t1,val2
	l.d $f4,0($t1)	# f4 = val2
	
	la $t2,val3
	l.d $f6,0($t2)	# f6 = val3
	
	sub.d $f12,$f12,$f6	# ff12 = ft - 32.0
	
	div.d $f2,$f2,$f4	#  f2 = 5.0 / 9.0
	
	mul.d $f8,$f2,$f12	# $f8 
	
	mov.d	$f0,$f8		# Mueve el contenido de $f8 a $f0
	
	jr $ra
