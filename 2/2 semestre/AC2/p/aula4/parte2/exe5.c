//Aumente a frequência para 5 Hz, 10 Hz e 100 Hz e observe, para cada uma destas
//frequências, o comportamento do sistema.

// 5 hz = 1/5 200   10 hz = 1/10 *1000 = 100 = 1/100 * 1000 = 10 

#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK / 1000)); // divide la parte por ms 
}

int main(void){

    int i;
    unsigned char segment;
    // enable display low(rd5) and disable display high(rd6)
    // meter 5 = 1 y 6 = 0          para que el display se prenda debe recibir un 0 logico osea 1 electrico
    LATD = ((LATD & 0xFF9F) | 0x0020);

    // configure RB8-RB14 as outputs 
    TRISB = TRISB & 0x80FF;

    // configure RD5 - RD6 as outputs 
    TRISD = TRISD & 0xFF9F;

    while(1){
        segment = 1;
        for (i = 0; i < 7; i++){
            // send segment value to display poner nuevo segmento 
            LATB = (LATB & 0x80FF) | (segment << 8);
            
            
            delay(10);
            
            // preparamos el siguiente segmento
            segment = segment << 1;
        }
        // toggle display selection  invertimos CON XOR  
        LATD = LATD ^ 0x0060;
    }
    return 0;

}


// 0000 0000  0110    0000