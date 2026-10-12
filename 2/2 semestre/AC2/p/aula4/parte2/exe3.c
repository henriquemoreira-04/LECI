//Selecionando em sequência o display menos significativo e o display mais significativo
//envie para os portos RB8 a RB14, em ciclo infinito e com uma frequência de 2 Hz, a
//sequência binária que ativa os segmentos do display pela ordem a, b, c, d, e, f, g, a, ...; a
//frequência de 2 Hz deve ser controlada usando a função delay().

// 1 hz = 1 sehundo = 2 hz =   d = 1 / t = 1 /f = 1/2 = 0,5 s = 500ms

#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK / 1000)); // divide la parte por ms 
}

int main(void){

    int i;
    unsigned char segment;
    // enable display low(rd5) and disable display high(rd6)
    // prender el derecho latd5 = 1
    LATDbits.LATD5 = 1;
    // apagar el izquierdo es el d6 = 0 
    LATDbits.LATD6 = 0;

    // configure RB8-RB14 as outputs 
    TRISB = TRISB & 0x80FF;

    // configure RD5 - RD6 as outputs 
    TRISD = TRISD & 0xFF9F;

    while(1){
        segment = 1;
        for (i = 0; i < 7; i++){
            // send segment value to display poner nuevo segmento 
            LATB = (LATB & 0x80FF) | (segment << 8);
            
            // wait 0.5 second 
            delay(500);
            
            // preparamos el siguiente segmento
            segment = segment << 1;
        }
        // toggle display selection  invertimos 
        LATDbits.LATD5 = !LATDbits.LATD5;

        LATDbits.LATD6 = !LATDbits.LATD6;
    }
    return 0;

}











//                            1   1  1 1    1  1  1 1   1 0 0 1  1 1 1 1
//                            15 14 13 12   11 10 9 8   7 6 5 4  3 2 1 0