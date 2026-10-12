/*
Questão 3 [5.0 valores]
Escreva e teste um programa, em assembly, que faça todas as configurações necessárias e que mostre nos 5 
LEDs, ligados aos portos RE6 a RE2, o valor de um contador decrescente módulo 25 (valor inicial: 0); o 
contador deve ser decrementado com uma frequência de 3.5Hz. O valor do contador deve também ser 
mostrado no ecrã do PC, em binário formatado com 5 bits; os valores devem ser apresentados em linhas 
consecutivas do ecrã. O valor da frequência deve ser obtido com o menor erro possível.
Edite o seu programa no ficheiro f83.s.
*/


    .equ SFR_BASE_HI, 0xBF88    # Parte alta da memória
    .equ TRISE, 0x6100          # Offset do TRISE
    .equ LATE,  0x6110          # Offset do LATE

    .equ PRINT_INT, 6           # Syscall para printInt
    .equ PUT_CHAR, 3            # Syscall para putChar
    .equ READ_CORE_TIMER, 11    # Syscall para ler ticks
    .equ RESET_CORE_TIMER, 12   # Syscall para resetar ticks

    .data
    .text
    .globl main

main:
    # --- 1. CONFIGURAÇÃO DE PORTOS (RE6 a RE2 como saídas) ---
    lui  $t0, SFR_BASE_HI
    lw   $t1, TRISE($t0)
    andi $t1, $t1, 0xFF83       # Máscara 1111 1111 1000 0011 para limpar os bits 6 a 2
    sw   $t1, TRISE($t0)
    
    # Iniciar contador em 0
    li   $s0, 0                 # $s0 = contador = 0

while_infinito:
    
    # --- 2. MOSTRAR NOS LEDs (RE6 a RE2) ---
    lui  $t0, SFR_BASE_HI
    lw   $t1, LATE($t0)
    andi $t1, $t1, 0xFF83       # Limpar os LEDs atuais da secção
    
    sll  $t2, $s0, 2            # Deslocar o contador 2 bits à esquerda (alinhar com RE2)
    or   $t1, $t1, $t2          # Inserir o contador
    sw   $t1, LATE($t0)         # Escrever nos LEDs

    # --- 3. MOSTRAR NO PC (Binário, 5 bits, nova linha) ---
    move $a0, $s0               # Argumento 1: valor do contador
    li   $a1, 0x00050002        # Argumento 2: formatação (2 | 5 << 16)
    li   $v0, PRINT_INT
    syscall
    
    li   $a0, '\n'              # Argumento 1: '\n' (nova linha)
    li   $v0, PUT_CHAR
    syscall

    # --- 4. ATRASO DE 3.5Hz ---
    li   $v0, RESET_CORE_TIMER
    syscall

delay_loop:
    li   $v0, READ_CORE_TIMER
    syscall
    li   $t1, 5714286           # Ticks para 3.5Hz (20.000.000 / 3.5 arredondado para cima)
    blt  $v0, $t1, delay_loop   # Repetir enquanto for menor

    # --- 5. LÓGICA DO CONTADOR DECRESCENTE (Módulo 25) ---
    addi $s0, $s0, -1           # Decrementa 1
    
    bgez $s0, fim_if            # Se o contador for >= 0, salta para fim_if
    li   $s0, 24                # Se ficou negativo (passou do 0), volta para 24

fim_if:
    j    while_infinito         # Loop eterno

    # Fim de programa
    li   $v0, 0
    jr   $ra