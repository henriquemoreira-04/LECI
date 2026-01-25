#define SIZE 10
#define TRUE 1
#define FALSE 0

#void main(void)
#{
    #static int lista[SIZE];
    #int houveTroca;
    #int aux;
    #int *p, *pUltimo;

    
    #print_string("Introduza 10 numeros:\n");
    
    #// Calculamos o endereço limite para a leitura (lista + SIZE)
    
    #pUltimo = lista + SIZE; 
    
    #for (p = lista; p < pUltimo; p++)
    #{
     #   *p = read_int();
    #}

    #// --- 2. Ordenação (Bubble Sort com Ponteiros) ---
    
    #// pUltimo agora aponta para o ÚLTIMO elemento válido (SIZE - 1)
    
    #// Isto é crucial porque vamos comparar *p com *(p+1)
    
    #pUltimo = lista + (SIZE - 1);

    #do
    #{
        #houveTroca = FALSE;
        
        #// O ciclo vai desde o início até AO ANTES do último
    
            #for (p = lista; p < pUltimo; p++)
        #{
            #// Comparar *p com o seu vizinho da frente *(p+1)
        
               #if (*p > *(p+1))
           # {
          #      aux = *p;
         #       *p = *(p+1);
        #        *(p+1) = aux;
       #         houveTroca = TRUE;
      #      }
     #   }
    #} while (houveTroca == TRUE);

    #// --- 3. Impressão do conteúdo (Usando Ponteiros) ---
    
    #print_string("Array ordenado:\n");
   # pUltimo = lista + SIZE; // Limite para impressão (fim do array)
    
    #for (p = lista; p < pUltimo; p++)
    #{
   #     print_int10(*p);
  #      print_string("; ");
 #   }
#}


## Mapa de registos:
# p:          $t0
# pUltimo:    $t1
# *p:         $t2
# *(p+1):     $t3
# houveTroca: $t4
# aux:        $t5
# base lista: $t6 (usado para inits)

	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv read_int, 5

	.align 2
lista:	.space 40		# 10 inteiros * 4 bytes
str1:	.asciiz "Introduza 10 numeros:\n"
str2:	.asciiz "Array ordenado:\n"
str3:	.asciiz "; "

	.text
	.globl main

main:
	# --- 1. LEITURA DE VALORES ---
	li	$v0, print_string
	la	$a0, str1
	syscall

	la	$t0, lista		# p = lista
	
	li	$t1, SIZE
	sll	$t1, $t1, 2		# SIZE * 4 bytes
	addu	$t1, $t0, $t1		# pUltimo (para leitura) = lista + 40 bytes

read_loop:
	bge	$t0, $t1, end_read	# while (p < lista + SIZE)
	
	li	$v0, read_int
	syscall
	sw	$v0, 0($t0)		# *p = valor lido
	
	addiu	$t0, $t0, 4		# p++
	j	read_loop
end_read:

	# --- 2. ORDENAÇÃO (Bubble Sort com Ponteiros) ---
	
	# Calcular pUltimo = lista + (SIZE - 1)
	# Isto é o endereço do último elemento, para não sair fora nos comparativos
	la	$t6, lista		# Base
	li	$t1, SIZE
	addi	$t1, $t1, -1		# SIZE - 1 (9)
	sll	$t1, $t1, 2		# (SIZE - 1) * 4 bytes
	addu	$t1, $t6, $t1		# $t1 = pUltimo real

do_sort:
	li	$t4, FALSE		# houveTroca = FALSE
	la	$t0, lista		# p = lista (reiniciar p no início)

for_sort:
	# while (p < pUltimo)
	bge	$t0, $t1, end_for_sort

	# Carregar *p e *(p+1)
	lw	$t2, 0($t0)		# $t2 = *p
	lw	$t3, 4($t0)		# $t3 = *(p+1)  <-- O offset 4 pega o vizinho
	
	# if (*p > *(p+1))
	ble	$t2, $t3, no_swap	# Se *p <= *(p+1), não troca

	# Troca (Swap)
	sw	$t3, 0($t0)		# *p = *(p+1)
	sw	$t2, 4($t0)		# *(p+1) = *p (o antigo valor de *p)
	
	li	$t4, TRUE		# houveTroca = TRUE

no_swap:
	addiu	$t0, $t0, 4		# p++
	j	for_sort

end_for_sort:
	# while (houveTroca == TRUE)
	beq	$t4, TRUE, do_sort	# Se houve troca, repete o processo

	# --- 3. IMPRESSÃO ---
	li	$v0, print_string
	la	$a0, str2
	syscall

	la	$t0, lista		# p = lista
	
	# Recalcular o limite final (lista + SIZE) para imprimir tudo
	li	$t1, SIZE
	sll	$t1, $t1, 2
	la	$t6, lista
	addu	$t1, $t6, $t1		# limite = fim do array

print_loop:
	bge	$t0, $t1, end_main	# while (p < limite)

	lw	$a0, 0($t0)		# Carregar *p
	li	$v0, print_int10
	syscall

	li	$v0, print_string
	la	$a0, str3
	syscall

	addiu	$t0, $t0, 4		# p++
	j	print_loop

end_main:
	jr	$ra
	
	

	
