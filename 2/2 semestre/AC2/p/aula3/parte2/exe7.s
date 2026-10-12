## Contador Johnson de 4 bits com deslocamento à esquerda ou à direita, dependendo do
## valor lido do porto de entrada RB2: se RB2=1, deslocamento à esquerda; frequência de
## atualização de 1.5 Hz. 

    .equ ADDRBASEHI, 0xBF88          # Parte alta de la dirección base
    .equ TRISE,      0x6100          # Configuración Puerto E
    .equ LATE,       0x6120          # Escritura Puerto E
    .equ TRISB,      0x6040          # Configuración Puerto B
    .equ PORTB,      0x6050          # Lectura Puerto B

    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12

    .data 
    .text 
    .globl main

main:

    lui $t1, ADDRBASEHI              # Cargar la base en t1

    ## limpiar los RE4-RE1 

    lw $t2,TRISE($t1)                # Leer TRISE
    andi $t2,$t2,0xFFE1              # Configurar RE4-RE1 como salida (0)
    sw $t2,TRISE($t1)

    ## poner RB2  como entrada (bit 2 = 1 )

    lw $t2,TRISB($t1)
    ori $t2,$t2,0x0004
    sw $t2,TRISB($t1)

    ## contador 

    li $t0,0                        ## contador 

while:
    ## 2. ACTUALIZAR LEDs (RE4-RE1)
    lw      $t2, LATE($t1)
    andi    $t2, $t2, 0xFFE1         # Limpiar espacio de LEDs
    sll     $t3, $t0, 1              # Alinear contador a partir de RE1
    or      $t2, $t2, $t3            # Fusionar
    sw      $t2, LATE($t1)           # Escribir en LATE

    ## frecuencia de 1.5 hz 

    li $v0,RESET_CORE_TIMER 
    syscall                         ## RESET_CORE_TIMER

delay:

    li $v0,READ_CORE_TIMER                       ## READ_CORE_TIMER
    syscall
    li $t4,13333333
    blt $v0,$t4,delay               ## si es menor sigue esperando 

    ## decidir la direccion leyendo el RB2 

    lw $t2,PORTB($t1)           ## leer el portb b 
    andi $t2,$t2,0x0004         ### separar el bit 2 aislarlo 

    beq $t2,$0,jonr             ## si es 0 ira a la derecha 

jonl:

    andi $t5,$t0,0x0008      ## aisalamos el bit 0, lo mira por 0001
    sll $t0,$t0,1            ## desplazamiento a la izquierda
    
    andi $t0,$t0,0x000F      ## limitamos a 4 bits

    bne $t5,$0,endcounter    ## si el bit 3 es 1, el nuevo bit a introducir es 0 

    ori $t0,$t0,0x0001      ## si el bit 3 es 0, el nuevo bit a introducir es 1

    j endcounter

jonr:
    andi $t5,$t0,0x0001      ## aisalamos el bit 0, lo mira por 0001
    srl $t0,$t0,1            ## desplazamiento a la derecha
    
    andi $t0,$t0,0x000F      ## limitamos a 4 bits

    bne $t5,$0,endcounter         ## si el bit 0 es 1, el nuevo bit a introducir es 0 

    ori $t0,$t0,0x0008      ## si el bit 0 es 0, el nuevo bit a introducir es 1



endcounter:
    j while 
