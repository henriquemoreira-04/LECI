## Contador Johnson de 4 bits (sequência: 0000, 0001, 0011, 0111, 1111, 1110, 1100,
## 1000, 0000, 0001, ...), com uma frequência de atualização de 1.5 Hz; para implementar
## este contador observe que o bit a introduzir na posição menos significativa quando se faz o
## deslocamento à esquerda corresponde ao valor negado que o bit mais significativo tinha na
## iteração anterior.

    .equ ADDRBASEHI, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120

    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12

    .data
    .text
    .globl main

main:
    lui $t1, ADDRBASEHI

    # condigurar las portos re4-re1

    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFFE1
    sw $t2, TRISE($t1)

    li $t0, 0                ## contador

while:
    lw $t2, LATE($t1)        ## esto lee el estado actual
    andi $t2, $t2, 0xFFE1    ## limpiar el bit de los leds
    sll $t3, $t0, 1          ## desplazar contador 1 a la izquierda (aliear con RE1)
    or $t2, $t2, $t3         ## fusionar
    sw $t2, LATE($t1)        ## lo escribe en los leds

    ##frecuencia de 1.5 hz
    ## para 1.5hz en una placa de 40 hz serian 20

    li $v0, RESET_CORE_TIMER
    syscall

delay:

    li $v0, READ_CORE_TIMER
    syscall
    li $t4, 13333333
    blt $v0, $t4, delay      ## si es menor a 13333333 sigue esperando

    ##logica del contador johnson

    ## ver que valor tiene el bit mas significativo (bit 3) del contador

    andi $t5, $t0, 0x0008    ## aisalamos el bit 3, lo mira por 1000
    sll $t0, $t0, 1
    andi $t0, $t0, 0x000F    ## limitamos a 4 bits

    bne $t5, $0, esuno       ## si el bit 3 es 1, el nuevo bit a introducir es 0

    ori $t0, $t0, 0x0001     ## si el bit 3 es 0, el nuevo bit a introducir es 1

esuno:
    j while

## aqui tenemos el contador de los jhonsn queva a contar colocando de la parte izquierda el numero negado del bit mas significativo 