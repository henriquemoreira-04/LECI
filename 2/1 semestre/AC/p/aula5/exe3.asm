#define SIZE 10
#define TRUE 1
#define FALSE 0

#void main(void)
#{
 #   static int lista[SIZE];
  #  int houveTroca, i, aux;
   # int *p; // Necesario para el bucle de lectura

#    print_string("Introduza 10 numeros:\n");
 #   for(p = lista; p < lista + SIZE; p++)
  #  {
   #     *p = read_int(); 
    #}

    
    #do
    #{
     #   houveTroca = FALSE;
     
       # for (i=0; i < SIZE-1; i++)
        #{
         #   if (lista[i] > lista[i+1])
          #  {
           #     aux = lista[i];
            #    lista[i] = lista[i+1];
             #   lista[i+1] = aux;
              #  houveTroca = TRUE;
            #}
       # }
    #} while (houveTroca == TRUE);

    
    #print_string("Array ordenado:\n");
    #for(i=0; i < SIZE; i++)
    #{
     #   print_int10(lista[i]);
      #  print_string("; ");
    #}
#}


# Mapa de registos:
# houve_troca: 	$t4
# i: 		$t5
# lista: 	$t6
# lista + i: 	$t7
# aux_val1:	$t8 (lista[i])
# aux_val2:	$t9 (lista[i+1])

	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv read_int, 5

lista:	.space 40 		# 10 inteiros * 4 bytes
str1:	.asciiz "Introduza 10 numeros:\n"
str2:	.asciiz "Array ordenado:\n"
str3:	.asciiz "; "

	.text
	.globl main

main: 
	# --- 1. LEITURA (Usando Ponteiros) ---
	li 	$v0, print_string
	la 	$a0, str1
	syscall

	la 	$t0, lista		# p = lista
	li 	$t1, SIZE
	sll 	$t1, $t1, 2		# SIZE * 4
	addu 	$t1, $t0, $t1		# limite = lista + 40 bytes

input_loop:
	bge 	$t0, $t1, end_input	# while (p < limite)
	
	li 	$v0, read_int
	syscall
	sw 	$v0, 0($t0)		# *p = read_int()
	
	addiu 	$t0, $t0, 4		# p++
	j 	input_loop
end_input:

	# --- 2. ORDENAÇÃO (Bubble Sort) ---
	# Inicializar registos fixos
	la 	$t6, lista		# Carregar endereço base da lista

do:	
	li 	$t4, FALSE		# houveTroca = FALSE
	li 	$t5, 0			# i = 0

for:	
	# while (i < SIZE - 1)
	# SIZE - 1 = 9
	li 	$t3, SIZE
	addi 	$t3, $t3, -1		# $t3 = 9
	bge 	$t5, $t3, endfor	# Se i >= 9, sai do for

	# Calcular endereço de lista[i]
	sll 	$t7, $t5, 2		# Offset = i * 4
	addu 	$t7, $t6, $t7		# $t7 = &lista[i]

	# Carregar valores para comparação
	lw 	$t8, 0($t7)		# $t8 = lista[i]
	lw 	$t9, 4($t7)		# $t9 = lista[i+1] (4 bytes à frente)

if:	
	# if (lista[i] > lista[i+1])
	# Se lista[i] <= lista[i+1], NÃO troca (salta para endif)
	ble 	$t8, $t9, endif

	# Troca (Swap)
	sw 	$t8, 4($t7)		# lista[i+1] = $t8 (antigo lista[i])
	sw 	$t9, 0($t7)		# lista[i] = $t9 (antigo lista[i+1])
	
	li 	$t4, TRUE		# houveTroca = TRUE

endif:
	addi 	$t5, $t5, 1		# i++
	j 	for

endfor:
	# while (houveTroca == TRUE)
	# Se houveTroca for TRUE (1), volta ao 'do'
	beq 	$t4, TRUE, do

	# --- 3. IMPRESSÃO (Usando Índices) ---
	li 	$v0, print_string
	la 	$a0, str2
	syscall

	li 	$t5, 0			# i = 0 (Reutilizamos $t5)

print_loop:
	# while (i < SIZE)
	li 	$t3, SIZE
	bge 	$t5, $t3, end_prog

	# Acesso indexado: lista[i]
	sll 	$t7, $t5, 2		# i * 4
	addu 	$t7, $t6, $t7		# base + offset (base $t6 já estava carregada)
	lw 	$a0, 0($t7)		# Carrega valor para imprimir

	li 	$v0, print_int10
	syscall

	li 	$v0, print_string
	la 	$a0, str3		# Imprime "; "
	syscall

	addi 	$t5, $t5, 1		# i++
	j 	print_loop

end_prog:
	jr 	$ra			# Termina
