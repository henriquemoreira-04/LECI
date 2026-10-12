.equ    resetCoreTimer, 12
    .equ    readCoreTimer, 11
    .equ    printInt, 6
    .equ    putChar, 3
    .equ    inkey, 1            # Syscall para leer teclado

    .data
    .text
    .globl main

# ----------------------------------------------------------------
# MAIN
# ----------------------------------------------------------------
main:
    # --- PRÓLOGO ---
    # Reservamos espacio para $ra y 6 registros ($s0 a $s5)
    addiu   $sp, $sp, -28
    sw      $ra, 24($sp)
    sw      $s5, 20($sp)    # Flag de PAUSA (0=Run, 1=Stop)
    sw      $s4, 16($sp)    # Tiempo de DELAY (Variable)
    sw      $s3, 12($sp)    # 'i' (contador de vueltas)
    sw      $s2, 8($sp)     # 'cnt10'
    sw      $s1, 4($sp)     # 'cnt5'
    sw      $s0, 0($sp)     # 'cnt1'

    # --- INICIALIZACIÓN ---
    li      $s0, 0          # cnt1 = 0
    li      $s1, 0          # cnt5 = 0
    li      $s2, 0          # cnt10 = 0
    li      $s3, 0          # i = 0
    
    li      $s4, 100        # Tiempo inicial: 100ms (Modo Normal 'N')
    li      $s5, 0          # Estado inicial: 0 (Corriendo 'R')

loop:
    # --- 1. LECTURA DEL TECLADO (inkey) ---
    li      $v0, inkey      # Syscall 1 (inkey)
    syscall
    move    $t0, $v0        # Guardar tecla leída en $t0

    # Si $t0 es 0, significa que no se pulsó nada. Saltamos a verificar estado.
    beq     $t0, 0, check_status

    # --- PROCESAR TECLAS ---
    # Convertimos minúsculas a mayúsculas si es necesario o duplicamos los beq
    
    # Tecla 'A' (Acelerar)
    beq     $t0, 'A', set_fast      
    beq     $t0, 'a', set_fast      
    
    # Tecla 'N' (Normal)
    beq     $t0, 'N', set_normal    
    beq     $t0, 'n', set_normal
    
    # Tecla 'S' (Stop/Suspender)
    beq     $t0, 'S', set_stop      
    beq     $t0, 's', set_stop
    
    # Tecla 'R' (Run/Retomar)
    beq     $t0, 'R', set_run       
    beq     $t0, 'r', set_run
    
    j       check_status    # Si es otra tecla, ignorar y seguir

# --- MANEJADORES DE ESTADO ---
set_fast:
    li      $s4, 50         # Delay = 50ms (Frecuencia base sube a 20Hz)
    j       check_status

set_normal:
    li      $s4, 100        # Delay = 100ms (Frecuencia base vuelve a 10Hz)
    j       check_status

set_stop:
    li      $s5, 1          # Flag = 1 (Modo Pausa activado)
    j       check_status

set_run:
    li      $s5, 0          # Flag = 0 (Modo Pausa desactivado)
    j       check_status

# --- 2. CHEQUEO DE ESTADO (STOP vs RUN) ---
check_status:
    # Si Flag ($s5) == 1, estamos en PAUSA.
    # Saltamos al inicio (loop) para seguir leyendo teclas sin actualizar nada.
    beq     $s5, 1, loop

    # --- 3. IMPRIMIR (Solo si estamos en RUN) ---
    li      $a0, '\r'
    li      $v0, putChar
    syscall

    # Imprimir cnt1 (Lento)
    move    $a0, $s0
    li      $a1, 0x0005000A # Hex: 5 dígitos, base 10
    li      $v0, printInt
    syscall

    li      $a0, ' '        
    li      $v0, putChar
    syscall

    # Imprimir cnt5 (Medio)
    move    $a0, $s1
    li      $a1, 0x0005000A 
    li      $v0, printInt
    syscall

    li      $a0, ' '        
    li      $v0, putChar
    syscall

    # Imprimir cnt10 (Rápido)
    move    $a0, $s2
    li      $a1, 0x0005000A 
    li      $v0, printInt
    syscall

    # --- 4. DELAY DINÁMICO ---
    # Usamos el valor guardado en $s4 (100 o 50)
    move    $a0, $s4        
    jal     delay           

    # --- 5. LÓGICA DE CONTADORES ---
    # Nota: Mantenemos la lógica relativa. Si el delay se hace la mitad (50ms),
    # los contadores sumarán el doble de rápido automáticamente.
    
    addi    $s2, $s2, 1     # cnt10++ (Siempre suma en cada ciclo)
    addi    $s3, $s3, 1     # i++ (Contador global de ciclos)

    # Verificar cnt5 (Se actualiza cada 2 ciclos: 10Hz/2 = 5Hz)
    rem     $t0, $s3, 2     # $t0 = i % 2
    bnez    $t0, check_cnt1 
    addi    $s1, $s1, 1     # cnt5++

check_cnt1:
    # Verificar cnt1 (Se actualiza cada 10 ciclos: 10Hz/10 = 1Hz)
    li      $t1, 10
    rem     $t0, $s3, $t1   # $t0 = i % 10
    bnez    $t0, end_loop   
    addi    $s0, $s0, 1     # cnt1++

end_loop:
    j       loop            # Volver arriba

    # --- EPÍLOGO ---
    lw      $s0, 0($sp)
    lw      $s1, 4($sp)
    lw      $s2, 8($sp)
    lw      $s3, 12($sp)
    lw      $s4, 16($sp)
    lw      $s5, 20($sp)
    lw      $ra, 24($sp)
    addiu   $sp, $sp, 28
    li      $v0, 0
    jr      $ra

# ----------------------------------------------------------------
# FUNCIÓN DELAY (Tu versión corregida)
# ----------------------------------------------------------------
delay:
    # $a0 = ms
    li      $t4, 20000          # K = 20000
    mul     $t2, $a0, $t4       # $t2 = ms * 20000 (Usamos $t2 temporal)

    li      $v0, resetCoreTimer
    syscall

wait_delay:
    li      $v0, readCoreTimer  
    syscall
    blt     $v0, $t2, wait_delay # Bucle hasta que el tiempo pase
    
    jr      $ra