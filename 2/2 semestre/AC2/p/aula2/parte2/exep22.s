    .equ    resetCoreTimer, 12
    .equ    readCoreTimer, 11
    .equ    printInt, 6
    .equ    putChar, 3

    .data
    .text
    .globl main

# ----------------------------------------------------------------
# MAIN
# ----------------------------------------------------------------
main:
    # --- PRÓLOGO ---
    addiu   $sp, $sp, -20
    sw      $ra, 16($sp)
    sw      $s3, 12($sp)    # 'i' (contador de vueltas global)
    sw      $s2, 8($sp)     # 'cnt5' (5 Hz)
    sw      $s1, 4($sp)     # 'cnt3' (3.33 Hz)
    sw      $s0, 0($sp)     # 'cnt1' (1 Hz)

    # Inicializar a 0
    li      $s0, 0          
    li      $s1, 0          
    li      $s2, 0          
    li      $s3, 0          

loop:
    # --- 1. VISUALIZACIÓN ---
    li      $a0, '\r'
    li      $v0, putChar
    syscall

    # Imprimir cnt1 (1 Hz)
    move    $a0, $s0
    li      $a1, 0x0005000A # Base 10, 5 dígitos
    li      $v0, printInt
    syscall

    li      $a0, ' '        
    li      $v0, putChar
    syscall

    # Imprimir cnt3 (3.33 Hz)
    move    $a0, $s1
    li      $a1, 0x0005000A 
    li      $v0, printInt
    syscall

    li      $a0, ' '        
    li      $v0, putChar
    syscall

    # Imprimir cnt5 (5 Hz)
    move    $a0, $s2
    li      $a1, 0x0005000A 
    li      $v0, printInt
    syscall

    # --- 2. BASE DE TIEMPO (100 ms) ---
    # Esta es la base común para 200ms, 300ms y 1000ms
    li      $a0, 100        
    jal     delay           

    # --- 3. ACTUALIZAR CONTADOR GLOBAL ---
    addi    $s3, $s3, 1     # i++

    # --- 4. LÓGICA DE FRECUENCIAS ---

    # A) Chequear 5 Hz (Cada 200ms -> 2 vueltas)
    rem     $t0, $s3, 2     # $t0 = i % 2
    bnez    $t0, check_3hz  # Si no es múltiplo de 2, salta
    addi    $s2, $s2, 1     # cnt5++

check_3hz:
    # B) Chequear 3.33 Hz (Cada 300ms -> 3 vueltas)
    li      $t1, 3
    rem     $t0, $s3, $t1   # $t0 = i % 3
    bnez    $t0, check_1hz  # Si no es múltiplo de 3, salta
    addi    $s1, $s1, 1     # cnt3++

check_1hz:
    # C) Chequear 1 Hz (Cada 1000ms -> 10 vueltas)
    li      $t1, 10
    rem     $t0, $s3, $t1   # $t0 = i % 10
    bnez    $t0, end_loop   # Si no es múltiplo de 10, salta
    addi    $s0, $s0, 1     # cnt1++

end_loop:
    j       loop            

    # --- EPÍLOGO ---
    lw      $s0, 0($sp)
    lw      $s1, 4($sp)
    lw      $s2, 8($sp)
    lw      $s3, 12($sp)
    lw      $ra, 16($sp)
    addiu   $sp, $sp, 20
    li      $v0, 0
    jr      $ra

# ----------------------------------------------------------------
# FUNCIÓN DELAY
# ----------------------------------------------------------------
delay:
    li      $t4, 20000          # K = 20000
    mul     $t2, $a0, $t4       # $t2 = ms * 20000

    li      $v0, resetCoreTimer
    syscall

wait_delay:
    li      $v0, readCoreTimer  
    syscall
    blt     $v0, $t2, wait_delay
    
    jr      $ra