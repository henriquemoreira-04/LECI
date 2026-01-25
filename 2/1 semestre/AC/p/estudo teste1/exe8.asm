#void main(void)
#
#	static int[] = {8, 4, 15, -1987, 327, -9, 27, 16};
#	int i, v;
#
#	i = 0;
#	do {
#		v = val[i];
#		val[i] = val[i+SIZE/2];
#		val[i+SIZE/2] = v;
#	} while(++i < (SIZE / 2));
#
#	print_string("Result is: ");
#	i = 0;
#	do {
#		print_int10(val[i++);
#		print_char(',');
#	} while (i < SIZE);
#}

# exe dos leite based
# mapa de registros  
# $t0 = i
# $t1 = v
#$t2 = val[0]  

	.data
val:	.word 8, 4, 15, -1987, 327, -9, 27, 16
	.eqv print_string,4
	.eqv print_int10 ,1
	.eqv print_char,11