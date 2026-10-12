## contador bineario decreciente de 4 bits (modulo 16) , frecuencia de 4 hz.

    .equ ADDRBASEHI,0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120

    .data
    .text
    .globl main

    .equ	READ_CORE_TIMER, 11
	.equ	RESET_CORE_TIMER, 12

main:

    lui $t1,ADDRBASEHI

    # configurar RE4 - RE1 como salidas (bits 4,3,2,1 a cero)

    lw      $t2,TRISE($t1)
    andi    $t2,$t2,0xFFE1 # este limpia los bits 1,2,3,4  a cero 
    sw      $t2 ,TRISE($t1)

    li $t0,0                ## un contador

while:
    
    lw      $t2,LATE($t1)        ## esto lee el estado actual 
    andi    $t2,$t2, 0xFFE1    ## limpiar el hueco de bits 4-1 

    sll     $t3,$t0,1           ## desplazar contador 1 a la izquierda (aliear con RE1)
    or      $t2,$t2,$t3         ## fusionar 
    sw      $t2, LATE($t1)      ## lo escribe en los leds 

    ##frecuencia de 4 hz 
    ## para 1hz en una placa de 40 hz serian 20,000,000 / 4  = 5,000,000

     li     $v0,RESET_CORE_TIMER             ## RESET_CORE_TIMER
    syscall

delay:
    
    li      $v0,READ_CORE_TIMER              ##READ_CORE_TIMER
    syscall 
    li      $t4, 5000000
    blt     $v0,$t4,delay      ## si es menor a 5M sigue esperando 

    ##incrementamos el contador 

    addi    $t0,$t0,-1               ## $t0 = t0 + 1 
    andi    $t0,$t0,0x000F          ## limita el contador a modulo 16

    j while 




