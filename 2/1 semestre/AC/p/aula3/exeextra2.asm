# mapa registros
# $t0 = res
# $t1 = i
# $t2 = mdor
# $t3 = mdo
# $t4 = 0x0F

	.data
str1:   .asciiz "Introduza dois numeros: "
str2:   .asciiz "\nResultado: "

	.eqv print_string,4
	.eqv print_int10,1
	.eqv read_int,5

	.text	
	.globl main
main:
    li $t0,0           # res = 0
    li $t1,0           # i = 0

    # print_string("Introduza dois numeros: ")
    li $v0,print_string
    la $a0,str1
    syscall

    li $t4,0x0F

    # mdor = read_int() & 0x0F
    li $v0,read_int
    syscall
    and $t2,$v0,$t4

    # mdo = read_int() & 0x0F
    li $v0,read_int
    syscall
    and $t3,$v0,$t4

while:
    beq $t2,$0,endw        # if mdor == 0 → salir
    bge $t1,4,endw         # if i >= 4 → salir

    # if (mdor & 1) != 0 → res += mdo
    andi $t5,$t2,1
    beq $t5,$0,endif
    addu $t0,$t0,$t3       # res = res + mdo
endif:

    sll $t3,$t3,1          # mdo = mdo << 1
    srl $t2,$t2,1          # mdor = mdor >> 1
    addiu $t1,$t1,1        # i++

    j while

endw:
    # print_string("Resultado: ")
    li $v0,print_string
    la $a0,str2
    syscall

    # print_int10(res)
    li $v0,print_int10
    move $a0,$t0
    syscall

    jr $ra
