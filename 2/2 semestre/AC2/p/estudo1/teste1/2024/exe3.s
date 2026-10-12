# Questão 3 
# Complete o programa assembly que consta do ficheiro f13.s, de modo a que faça todas as configurações
# necessárias e que mostre nos 5 LED, ligados aos portos RE5 a RE1, a sequência 00001, 00010, 00100, ...,
# 10000, 00001, ... (valor inicial: 00001); o valor instantâneo da sequência deve mudar com uma frequência de
# 2.3Hz.
# O valor instantâneo da sequência deve também ser mostrado no ecrã do PC, em binário formatado com 5 bits
# (os valores devem ser apresentados em linhas consecutivas do ecrã). O valor da frequência deve ser obtido
# com o menor erro possível.


    .equ  resetCoreTimer,12
    .equ  readCoreTimer,11
    .equ  printInt,6
    .equ  putChar,3

    .equ  BASEHI, 0xBF88 # parte alta 
    .equ TRISE, 0x6100   # parte baja 
    .equ LATE, 0x6120   # parte baja 


    .data 
    .text
    .globl main 

main:

    # primera parte configurar los puertos (read modify write)

    lui $t1, BASEHI 
    lw $t2,TRISE($t1) # leer 

    # ver los puertos 

    andi $t2,$t2,0xFFC1 # modify  
    sw $t2, TRISE($t1) # write 

    li $s0,1 

while:

    lw $t2, LATE($t1)
    andi $t2,$t2,0xFFC1

    sll $t3, $s0, 1     # desplazamos el bit uno a la izquierda para alinear con re1
    or $t2,$t2,$t3
    sw $t2,LATE($t1)

    # print int 

    move $a0,$s0
    li $a0 , 0x00050002
    li $v0 , printInt
    syscall 

    # put char 

    li $a0 , '\n'
    li $v0 ,  putChar
    syscall 

    li $v0 , resetCoreTimer # resetCoreTimer();
    syscall

whiledelay:

    #( readCoreTimer() < ticks) ; 

    li $v0 , readCoreTimer
    syscall

    li $t4 ,  8695652
    blt $v0,$t4,whiledelay

    # ring counter 

    sll $s0,$s0,1    # mover el 1 a la izquierda 

    li $t5, 32
    bne $s0,$t5,skip_reset

    li $s0,1 

skip_reset:

    j while 

    jr $ra 





