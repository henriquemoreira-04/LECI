/* 

int main(void) {
    int counter = 0;
    while (1) {
        putChar('\r');
        printInt(counter, 10 | 4 << 16);
        resetCoreTimer();
        while (readCoreTimer() < 200000); // Espera activa
        counter++;
    }
    return 0;
}

## ciclo infinito perfecto 

*/

    .equ    putChar,3
    .equ    printInt,6
    .equ    resetCoreTimer,12
    .equ    readCoreTimer,11

    .data 
    .text
    .globl main

main:   
    li $t0,0            ## t0 = int counter = 0;

while1:                  ## while(1) {
    
    li $a0,'\r'
    li $v0,putChar 
    syscall             ##putChar('\r');

    move $a0,$t0
    li $a1,0x0004000A    # ancho 4 hex = 0x0004000A , base 10
    li $v0,printInt
    syscall              ##printInt(counter, 10 | 4 << 16);

    li $v0,resetCoreTimer
    syscall             ##resetCoreTimer();

    li $t1,200000       ## cargamos la constante K 

while2:

    li $v0,readCoreTimer
    syscall             


    blt $v0,$t1,while2  ## si el tiempo actual < K vuelve a leer 

    addi $t0,$t0,1      ##incrementa el contador

    j while1

endwhile:
    li $v0,0
    jr $ra 


## en la placa deberia de salir , un contador que se actualia 10 ms 