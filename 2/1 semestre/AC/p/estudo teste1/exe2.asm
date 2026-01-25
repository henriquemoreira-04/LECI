    .data
str1:   .asciiz "Result is: "        # Mensaje a imprimir

    .eqv print_int10, 1             # Código syscall para imprimir enteros
    .eqv print_char, 11             # Código syscall para imprimir caracteres
    .eqv print_string,4             # Código syscall para imprimir cadenas
    .eqv SIZE, 8                    # Tamaño del array (8 elementos)

    .align 2
val:    .word 8,4,15,-1987,327,-9,27,16   # Array de valores inicial

    .text
    .globl main

main:
    li $t0, 0                       # i = 0
    la $t2, val                     # $t2 = dirección base del array val

    li $t4, SIZE                    # $t4 = SIZE
    srl $t4, $t4, 1                 # $t4 = SIZE/2 → número de intercambios (4)
    sll $t7, $t4, 2                 # $t7 = (SIZE/2)*4 → desplazamiento en bytes (16)

# -------- PRIMER DO-WHILE: intercambio de valores --------
do:
    sll $t3, $t0, 2                 # $t3 = i * 4 (desplazamiento en bytes)
    add $t3, $t3, $t2               # $t3 = &val[i]

    lw $t1, 0($t3)                  # $t1 = v = val[i]

    add $t6, $t3, $t7               # $t6 = &val[i + SIZE/2]

    lw $t5, 0($t6)                  # $t5 = val[i + SIZE/2]
    sw $t5, 0($t3)                  # val[i] = val[i + SIZE/2]
    sw $t1, 0($t6)                  # val[i + SIZE/2] = v

    addi $t0, $t0, 1                # i++
    blt $t0, $t4, do                # repetir mientras i < SIZE/2

# -------- Imprimir resultado --------
    li $v0, print_string            # syscall print_string
    la $a0, str1                    # cargar mensaje
    syscall

    li $t0, 0                       # i = 0 para recorrer el array de nuevo

# Segundo bucle para imprimir los valores del array
do1:
    sll $t1, $t0, 2                 # $t1 = i*4
    add $t1, $t1, $t2               # $t1 = &val[i]
    lw $a0, 0($t1)                  # cargar val[i] en $a0 para imprimir
    li $v0, print_int10             # syscall print_int10
    syscall

    li $v0, print_char              # imprimir coma separadora
    li $a0, ','
    syscall

    addi $t0, $t0, 1                # i++
    blt $t0, SIZE, do1              # continuar mientras i < SIZE

    jr $ra                          # return



