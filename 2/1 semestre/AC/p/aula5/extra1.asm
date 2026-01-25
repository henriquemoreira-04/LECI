#define SIZE 10
#void main(void) {
 #   static int lista[SIZE];
  #  int i, j, aux;

   # // --- LEITURA ---
   # print_string("Introduza 10 numeros:\n");
    #for(i = 0; i < SIZE; i++) {
     #   lista[i] = read_int();
    #}

    #// --- ORDENAÇÃO (Sequential Sort) ---
    #for(i = 0; i < SIZE-1; i++) {       // Ciclo Externo
     #   for(j = i + 1; j < SIZE; j++) { // Ciclo Interno (começa em i+1)
      #      if(lista[i] > lista[j]) {
       #         // Swap
        #        aux = lista[i];
         #       lista[i] = lista[j];
          #      lista[j] = aux;
           # }
        #}
    #}

    #// --- ESCRITA ---
    #print_string("Array ordenado:\n");
    #for(i = 0; i < SIZE; i++) {
     #   print_int10(lista[i]);
      #  print_string("; ");
    #}
#}



# Mapa de Registos:
# i:        $t0
# j:        $t1
# base:     $t2 (endereço base de 'lista')
# addr_i:   $t3 (endereço de &lista[i])
# addr_j:   $t4 (endereço de &lista[j])
# val_i:    $t5 (valor lista[i])
# val_j:    $t6 (valor lista[j])
# aux/tmp:  $t7

	.data
	.eqv SIZE, 10
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.align 2
lista:	.space 40		# 10 inteiros * 4 bytes
str1:	.asciiz "Introduza 10 numeros:\n"
str2:	.asciiz "Array ordenado:\n"
str3:	.asciiz "; "

	.text
	.globl main

main:
	# --- 1. LEITURA (Ciclo simples com índice i) ---
	li	$v0, print_string
	la	$a0, str1
	syscall

	li	$t0, 0			# i = 0

read_loop:
	li	$t7, SIZE
	bge	$t0, $t7, start_sort	# while (i < SIZE)

	li	$v0, read_int
	syscall				# Ler valor

	la	$t2, lista		# Carregar base array
	sll	$t7, $t0, 2		# i * 4
	addu	$t7, $t2, $t7		# Endereço de lista[i]
	sw	$v0, 0($t7)		# Guardar na memória

	addi	$t0, $t0, 1		# i++
	j	read_loop

start_sort:
	# --- 2. ORDENAÇÃO (Sequential Sort) ---
	li	$t0, 0			# i = 0 (Reiniciar i)

outer_loop:
	# Condição: i < SIZE - 1
	li	$t7, SIZE
	sub	$t7, $t7, 1		# SIZE - 1
	bge	$t0, $t7, end_sort	# Se i >= SIZE-1, termina
	
	# Inicializar j: j = i + 1
	addi	$t1, $t0, 1		# j = i + 1

inner_loop:
	# Condição: j < SIZE
	li	$t7, SIZE
	bge	$t1, $t7, next_outer	# Se j >= SIZE, vai para próximo i

	# --- CORPO DO LOOP ---
	la	$t2, lista		# Base array
	
	# Carregar lista[i]
	sll	$t3, $t0, 2		# i * 4
	addu	$t3, $t2, $t3		# $t3 = &lista[i]
	lw	$t5, 0($t3)		# $t5 = valor de lista[i]
	
	# Carregar lista[j]
	sll	$t4, $t1, 2		# j * 4
	addu	$t4, $t2, $t4		# $t4 = &lista[j]
	lw	$t6, 0($t4)		# $t6 = valor de lista[j]

	# if (lista[i] > lista[j])
	ble	$t5, $t6, no_swap	# Se lista[i] <= lista[j], não troca

	# Swap (Troca na memória)
	sw	$t6, 0($t3)		# lista[i] recebe valor de j
	sw	$t5, 0($t4)		# lista[j] recebe valor de i

no_swap:
	addi	$t1, $t1, 1		# j++
	j	inner_loop

next_outer:
	addi	$t0, $t0, 1		# i++
	j	outer_loop

end_sort:

	# --- 3. IMPRESSÃO ---
	li	$v0, print_string
	la	$a0, str2
	syscall

	li	$t0, 0			# i = 0

print_loop:
	li	$t7, SIZE
	bge	$t0, $t7, end_prog	# while (i < SIZE)

	# Calcular endereço lista[i]
	la	$t2, lista
	sll	$t7, $t0, 2		# i * 4
	addu	$t7, $t2, $t7		# &lista[i]
	lw	$a0, 0($t7)		# Carregar valor para argumento $a0

	li	$v0, print_int10
	syscall

	li	$v0, print_string
	la	$a0, str3		# "; "
	syscall

	addi	$t0, $t0, 1		# i++
	j	print_loop

end_prog:
	jr	$ra			# Fim