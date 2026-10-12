
/*
Questão 3 [5.0 valores]
Escreva e teste um programa, em assembly, que faça todas as configurações necessárias e que mostre nos 4 
LEDs, ligados aos portos RE4 a RE1, o padrão 1001, 0110, 1001, 0110, ... (valor inicial: 1001); o padrão deve 
mudar com uma frequência de 7Hz. O valor do padrão deve também ser mostrado no ecrã do PC, em binário 
formatado com 4 bits; os valores devem ser apresentados em linhas consecutivas do ecrã. O valor da 
frequência deve ser obtido com o menor erro possível.
Edite o seu programa no ficheiro f13.s.
*/






    .equ SFR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE,  0x6110

    .equ PRINT_INT, 6
    .equ PUT_CHAR, 3
    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12

    .data
    .text
    .globl main

main:
    # --- 1. CONFIGURACIÓN DE PUERTOS (RE4 a RE1 como saídas) ---
    lui  $t0, SFR_BASE_HI
    lw   $t1, TRISE($t0)
    andi $t1, $t1, 0xFFE1       # Máscara 1111 1111 1110 0001
    sw   $t1, TRISE($t0)
    
    # Padrão inicial: 1001 (9 em decimal)
    li   $s0, 9

while_infinito:
    
    # --- 2. MOSTRAR PADRÃO NOS LEDs ---
    lui  $t0, SFR_BASE_HI
    lw   $t1, LATE($t0)
    andi $t1, $t1, 0xFFE1       # Limpar os bits RE4 a RE1
    
    sll  $t2, $s0, 1            # Alinhar o padrão começando no RE1 (Shift Left 1)
    or   $t1, $t1, $t2          # Juntar o padrão com o resto do porto
    sw   $t1, LATE($t0)         # Escrever no LATE

    # --- 3. MOSTRAR NO PC (Binário, 4 bits, nova linha) ---
    move $a0, $s0               # Argumento 1: valor a imprimir
    li   $a1, 0x00040002        # Argumento 2: formatação (2 | 4 << 16)
    li   $v0, PRINT_INT
    syscall
    
    li   $a0, '\n'              # Argumento 1: caractere de nova linha
    li   $v0, PUT_CHAR
    syscall

    # --- 4. ATRASO DE 7Hz (20.000.000 / 7 = 2857143) ---
    li   $v0, RESET_CORE_TIMER
    syscall

delay_loop:
    li   $v0, READ_CORE_TIMER
    syscall
    li   $t1, 2857143           # Ticks para 7Hz
    blt  $v0, $t1, delay_loop   # Esperar até atingir o limite

    # --- 5. ALTERNAR PADRÃO (Entre 9 e 6) ---
    li   $t3, 9
    beq  $s0, $t3, mudar_para_6 # Se for 9, salta para mudar_para_6

mudar_para_9:
    li   $s0, 9                 # Se era 6, muda para 9
    j    fim_if                 # Salta para o fim do bloco

mudar_para_6:
    li   $s0, 6                 # Muda para 6 (0110 em binário)

fim_if:
    j    while_infinito         # Repetir o ciclo
    
    # Fim de programa
    jr   $ra