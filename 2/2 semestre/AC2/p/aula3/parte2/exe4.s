## Contador em anel de 4 bits (ring counter) com deslocamento à esquerda ou à direita,
## dependendo do valor lido do porto RB1: se RB1=1, deslocamento à esquerda. Frequência
## de atualização de 3 Hz (deslocamento à esquerda: 0001, 0010, 0100, 1000, 0001, …).

    .equ ADDRBASEHI, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050

    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12

    .data
    .text
    .globl main

main:
    lui $t1, ADDRBASEHI

    # 1. CONFIGURACIÓN (RE4-RE1 salidas, RB1 entrada)
    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFFE1    # LEDs como salida
    sw $t2, TRISE($t1)

    lw $t2, TRISB($t1)
    ori $t2, $t2, 0x0002    # RB1 como entrada (bit 1)
    sw $t2, TRISB($t1)

    # 2. INICIALIZACIÓN
    li $t0, 1              # El valor inicial es 0001 (un solo LED)

while:
    # 3. MOSTRAR EN LEDs (Alineando con RE1)
    lw $t2, LATE($t1)
    andi $t2, $t2, 0xFFE1
    sll $t3, $t0, 1         # Desplazamos para que coincida con RE1
    or $t2, $t2, $t3
    sw $t2, LATE($t1)

    ## esperar los 3 hz

    li $v0, RESET_CORE_TIMER
    syscall

delay:
    li $v0, READ_CORE_TIMER
    syscall
    li $t4, 6666667              ## valor de 3hz
    blt $v0, $t4, delay

    # logica del desplazamiento

    lw $t2, PORTB($t1)
    andi $t2, $t2, 0x0002    # leemos el RB1

    beq $t2, $0, derecha      # si rb1 ==0 mover a la derecha

izquierda:
    sll $t0, $t0, 1         # Desplaza bit a la izquierda
    bne $t0, 0x0010, check_loop # Si no se ha pasado del bit 4 (0x10 = 16), ok
    li $t0, 0x0001         # Si se pasó, vuelve al inicio (bit 0)
    j check_loop

derecha:
    srl $t0, $t0, 1         # Desplaza bit a la derecha
    bne $t0, 0, check_loop  # Si no es cero, todavía hay un bit
    li $t0, 0x0008         # Si llegó a cero, reinicia en el bit más alto (bit 3)

check_loop:
    j while

## aqui tenemos un ejercicio de un contador en ring anillo , donde si el rb1 osea el 2 esta aapagado se desplaza de izq a der ,
## al contrario se desplazan de der a izq 