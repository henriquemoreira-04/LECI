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

    li $t1,2000000      ## cargamos la constante K 

while2:

    li $v0,readCoreTimer
    syscall             


    blt $v0,$t1,while2  ## si el tiempo actual < K vuelve a leer 

    addi $t0,$t0,1      ##incrementa el contador

    j while1

endwhile:
    li $v0,0
    jr $ra 


## en la placa deberia de salir , un contador que se actualia 100 veces por segundo

## en el punto c aqui se va modificando los velocidades a los hz

/*
 1) 10 hz = 20.000.000/10 = 2.000.000

 2) 5 hz = 20.000.000/10 = 4.000.000

 3) 1 hz = 20.000.000/1 == igual 

 el core timer de la plata va a 20MHz 
 
 Valor = 20.000.000/ frecuencia que deseo



 */