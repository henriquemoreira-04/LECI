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
    # Necesitamos guardar $ra y los registros $s0-$s3 que usaremos
    addiu   $sp, $sp, -20
    sw      $ra, 16($sp)
    sw      $s3, 12($sp)    # Guarda var 'i'
    sw      $s2, 8($sp)     # Guarda var 'cnt10'
    sw      $s1, 4($sp)     # Guarda var 'cnt5'
    sw      $s0, 0($sp)     # Guarda var 'cnt1'

    # Inicialización de variables
    li      $s0, 0          # cnt1 = 0
    li      $s1, 0          # cnt5 = 0
    li      $s2, 0          # cnt10 = 0
    li      $s3, 0          # i = 0

loop:
    # --- 1. IMPRIMIR DATOS ---
    li      $a0, '\r'
    li      $v0, putChar
    syscall

    # Imprimir cnt1 (1 Hz)
    move    $a0, $s0
    li      $a1, 0x0005000A # Base 10 | 5 Dígitos (0x0005000A)
    li      $v0, printInt
    syscall

    li      $a0, ' '        # Espacio
    li      $v0, putChar
    syscall

    # Imprimir cnt5 (5 Hz)
    move    $a0, $s1
    li      $a1, 0x0005000A
    li      $v0, printInt
    syscall

    li      $a0, ' '        # Espacio
    li      $v0, putChar
    syscall

    # Imprimir cnt10 (10 Hz)
    move    $a0, $s2
    li      $a1, 0x0005000A
    li      $v0, printInt
    syscall

    # --- 2. BASE DE TIEMPO (100 ms) ---
    # Usamos 100ms porque es el periodo de 10Hz (la frecuencia más rápida)
    li      $a0, 100        
    jal     delay           

    # --- 3. LÓGICA DE INCREMENTO ---
    
    # A) cnt10 siempre suma (Frecuencia base)
    addi    $s2, $s2, 1

    # B) Verificar cnt5 (Cada 2 vueltas)
    # Calculamos el resto: $t0 = i % 2
    rem     $t0, $s3, 2     
    bnez    $t0, check_cnt1 # Si resto != 0, saltar
    addi    $s1, $s1, 1     # Si resto == 0, incrementar

check_cnt1:
    # C) Verificar cnt1 (Cada 10 vueltas)
    # Calculamos el resto: $t0 = i % 10
    li      $t1, 10
    rem     $t0, $s3, $t1   
    bnez    $t0, update_i   # Si resto != 0, saltar
    addi    $s0, $s0, 1     # Si resto == 0, incrementar

update_i:
    addi    $s3, $s3, 1     # i++
    j       loop            # Repetir ciclo

    # --- EPÍLOGO (Formalidad) ---
    lw      $s0, 0($sp)
    lw      $s1, 4($sp)
    lw      $s2, 8($sp)
    lw      $s3, 12($sp)
    lw      $ra, 16($sp)
    addiu   $sp, $sp, 20
    li      $v0, 0
    jr      $ra

# ----------------------------------------------------------------
# FUNCIÓN DELAY (Versión corregida)
# ----------------------------------------------------------------
delay:
    # $a0 = ms
    # Usamos $t2 para el cálculo para no tocar $t0/$t1 del sistema o usuario
    li      $t4, 20000          # K = 20000
    mul     $t2, $a0, $t4       # $t2 = ms * 20000

    li      $v0, resetCoreTimer
    syscall

wait_delay:
    li      $v0, readCoreTimer  # ¡IMPORTANTE! Leer DENTRO del bucle
    syscall
    blt     $v0, $t2, wait_delay
    
    jr      $ra