## Contador binário módulo 16 crescente/decrescente cujo comportamento depende do valor
## lido do porto de entrada RB3: se RB3=1, contador crescente; caso contrário contador
## decrescente; frequência de atualização de 2 Hz.

## nueva entrada RB3

## frecuencia de 2 hz ahora sera 10,000,000

## dentro del buvle si rb3 = 1 sumamos sino vamos a restar;


    .equ ADDRBASEHI, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE,  0x6120
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050

    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12

    .data
    .text
    .globl main

main:

    lui $t1, ADDRBASEHI

    ## configuracion

    ## RE4 - RE1 como salida (leds)

    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFFE1     ## limpiar los bits 4-1 para salida
    sw $t2, TRISE($t1)        ## escribre en los leds

    ## RB3 como entrada (un switch selector)

    lw $t2, TRISB($t1)
    ori $t2, $t2, 0x0008      ## forzar el bit 3 a '1'
    sw $t2, TRISB($t1)

    li $t0, 0                 ## contador

while:

    lw $t2, LATE($t1)         ## esto lee el estado actual
    andi $t2, $t2, 0xFFE1     ## limpiar el hueco de bits 4-1
    sll $t3, $t0, 1           ## desplazar contador 1 a la izquierda (aliear con RE1)
    or $t2, $t2, $t3          ## fusionar
    sw $t2, LATE($t1)         ## lo escribe en los leds

    li $v0, RESET_CORE_TIMER  ## RESET_CORE_TIMER
    syscall

delay:

    li $v0, READ_CORE_TIMER   ## READ_CORE_TIMER
    syscall
    li $t4, 10000000
    blt $v0, $t4, delay       ## si es menor a 5M sigue esperando

    # decidir la direccion (logica de RB3)

    lw $t2, PORTB($t1)        # leemos el switch
    andi $t2, $t2, 0x0008     # aisalamos el bit 3

    beq $t2, $0, decreciente  # si rb3 == 0 el contador sera decreciente

creciente:
    addi $t0, $t0, 1
    j endcounter

decreciente:
    addi $t0, $t0, -1

endcounter:
    andi $t0, $t0, 0x000F     ## activa el modulo de 16 mantiene los 4 bits
    j while

## aqui el deep switch a cambiar es el 4 porque ese sera el RB3 