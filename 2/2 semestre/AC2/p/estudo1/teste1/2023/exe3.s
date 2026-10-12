/*
Questão 3 [4 valores]
Complete o programa assembly que consta do ficheiro f93.s, de modo a que faça todas as configurações
necessárias e que mostre nos 5 LED, ligados aos portos RE6 a RE2, o valor de um contador decrescente
módulo 25 (valor inicial: 0); o contador deve ser decrementado com uma frequência de 4.6Hz; 

o valor do
contador deve também ser mostrado no ecrã do PC, em binário formatado com 5 bits (os valores devem ser
apresentados em linhas consecutivas do ecrã). O valor da frequência deve ser obtido com o menor erro
possível.
*/

    .equ SFR_BASE_HI, 0xBF88    # Parte alta de las direcciones de memoria
    .equ TRISE, 0x6100          # Offset para TRISE
    .equ LATE,  0x6110          # Offset para LATE

    .equ PRINT_INT, 6           # Syscall para printInt
    .equ PUT_CHAR, 3            # Syscall para putChar
    .equ READ_CORE_TIMER, 11    # Syscall para readCoreTimer
    .equ RESET_CORE_TIMER, 12   # Syscall para resetCoreTimer

    .data
    .text
    .globl main

main:
    # --- 1. CONFIGURACIÓN DE PUERTOS (TRISE) ---
    # Queremos RE6 a RE2 como salidas (poner a 0 esos bits)
    # Máscara para borrar esos bits: 0xFF83 (1111 1111 1000 0011 en binario)
    lui  $t0, SFR_BASE_HI       # Cargar 0xBF88 en t0
    lw   $t1, TRISE($t0)        # Leer TRISE actual
    andi $t1, $t1, 0xFF83       # Aplicar máscara (AND)
    sw   $t1, TRISE($t0)        # Guardar en TRISE
    
    # Inicializar el contador
    li   $s0, 0                 # $s0 será nuestra variable 'contador' (Inicia en 0)

while_infinito:
    # --- 2. MOSTRAR EN LOS LEDS (LATE) ---
    lui  $t0, SFR_BASE_HI       
    lw   $t1, LATE($t0)         # Leer LATE actual
    andi $t1, $t1, 0xFF83       # Apagar los LEDs de RE6 a RE2 (Misma máscara)
    
    sll  $t2, $s0, 2            # Hacer (contador << 2) para alinearlo con RE2
    or   $t1, $t1, $t2          # Insertar el contador en LATE
    sw   $t1, LATE($t0)         # Guardar y encender físicamente los LEDs

    # --- 3. MOSTRAR EN EL PC (printInt) ---
    move $a0, $s0               # Argumento 1: el valor del contador
    li   $a1, 0x00050002        # Argumento 2: Formato (2 | 5 << 16). Explicación abajo.
    li   $v0, PRINT_INT         # Preparar Syscall 6
    syscall                     # Ejecutar impresión
    
    li   $a0, '\n'              # Argumento 1: salto de línea
    li   $v0, PUT_CHAR          # Preparar Syscall 3
    syscall                     # Ejecutar impresión de carácter

    # --- 4. DELAY EXACTO DE 4.6Hz ---
    # 20.000.000 / 4.6 = 4347826 ticks
    li   $v0, RESET_CORE_TIMER
    syscall                     # Equivalente a resetCoreTimer();

delay_loop:
    li   $v0, READ_CORE_TIMER
    syscall                     # $v0 ahora tiene los ticks actuales
    li   $t1, 4347826           # Límite de ticks
    blt  $v0, $t1, delay_loop   # Branch if Less Than: Si es menor, repite el loop

    # --- 5. LÓGICA DEL CONTADOR DECRECIENTE (Módulo 25) ---
    addi $s0, $s0, -1           # contador = contador - 1
    
    bgez $s0, fin_if            # Branch if Greater or Equal Zero: Si es >= 0, salta el if
    li   $s0, 24                # Si llegó aquí es porque bajó de 0, forzamos a 24

fin_if:
    j    while_infinito         # Jump: Volver al inicio del while(1)

    # (Buena práctica: terminar el programa aunque nunca llegue aquí)
    li   $v0, 0
    jr   $ra