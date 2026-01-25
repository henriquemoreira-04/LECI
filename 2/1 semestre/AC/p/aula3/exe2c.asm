# mapa de registros
# value = $t0
# bit   = $t1
# i     = $t2
# tmp   = $t4

	.data
str1:   .asciiz "Introduzca un numero:"
str2:   .asciiz "\nO valor em binario es:"

	.eqv print_string,4
	.eqv read_int,5
	.eqv print_char,11

	.text
	.globl main
main:

    li $t2,0                # i = 0

    # print_string(str1)
    li $v0, print_string
    la $a0, str1
    syscall

    # value = read_int()
    li $v0, read_int
    syscall
    move $t0, $v0           # value = v0

    # print_string(str2)
    li $v0, print_string
    la $a0, str2
    syscall

for:
    bge $t2, 32, endfor     # while(i < 32)

    # imprimir espacio cada 4 bits
    rem $t4, $t2, 4
    bne $t4, $zero, skip_space

    li $v0, print_char
    li $a0, ' '
    syscall

skip_space:

    # bit = value >> 31
    srl $t1, $t0, 31

    # print_char('0' + bit)
    li $v0, print_char
    addi $a0, $t1, '0'
    syscall

    # value = value << 1
    sll $t0, $t0, 1

    addi $t2, $t2, 1
    j for

endfor:
    jr $ra
