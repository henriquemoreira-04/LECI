    
    .equ    resetCoreTimer, 12
    .equ    readCoreTimer, 11
    .equ    printInt, 6
    .equ    putChar, 3

    .data
    .text
    .globl main

# --- Función Main (Para probar el delay) ---
main:
    addiu   $sp, $sp, -4    # Reservamos pila
    sw      $ra, 0($sp)     # Guardamos $ra porque vamos a llamar a una función

    li      $t0, 0          # contador = 0

loop:
    # 1. Imprimir '\r'
    li      $a0, '\r'
    li      $v0, putChar
    syscall

    # 2. Imprimir número
    move    $a0, $t0
    li      $a1, 0x0004000A # Base 10, ancho 4
    li      $v0, printInt
    syscall

    # 3. Incrementar contador
    addi    $t0, $t0, 1

    # 4. LLAMAR A LA FUNCIÓN DELAY (Prueba con 1000ms = 1 segundo)
    li      $a0, 1000       # Argumento ms = 1000
    jal     delay           # Saltamos a la función delay

    j       loop            # Repetir infinitamente

    # Epílogo (inalcanzable en while(1))
    lw      $ra, 0($sp)
    addiu   $sp, $sp, 4
    li      $v0, 0
    jr      $ra



/*
void delay(unsigned int ms)
{
 resetCoreTimer();
 while(readCoreTimer() < K * ms);
} 
*/

delay:
    
    li $v0,resetCoreTimer
    syscall                     ##resetCoreTimer();

    li $t1,20000                ## K = 20000
    mul $t0,$a0,$t1             ## t0 = ms*K

while:
    li $v0,readCoreTimer
    syscall                     ## el core timer lo reseteamos a cero

    blt $v0,$t0,while           ## while(readCoreTimer() < K * ms);

    jr $ra
    
