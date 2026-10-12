/*Com a solução implementada no ponto anterior o tempo de ativação de cada um dos
displays ficou equilibrado, mas é visível a alternância entre os dois. Para resolver esse
problema é necessário aumentar a frequência de trabalho do processo de visualização
(frequência de refrescamento1
) de modo a que o olho humano não detete a alternância na
seleção dos displays.
Aumente sucessivamente a frequência de refrescamento do sistema de visualização
(usando a função delay()) para 20Hz, 50 Hz e 100 Hz, e observe os resultados. */

// 20 hz = 1/20 = 50ms    50 = 1/50 =20ms  100 = 1/100 =10ms    *1000 ms no te olvides

#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK/1000));
}

void send2displays(unsigned char value){

    static const char disp7Scodes[] = {
        // numeros de 0 a 9
        0x3F , 0x06,  0x5B,  0x4F, 0x66, 0x6D,0x7D,  0x07 , 0x7F, 0x6F,

        // letras de A a F

        0x77 , 0x7C , 0x39 ,  0x5E, 0x79, 0x71 };

    static char displayFlag = 0; 
    // static variable: doesn't loose its
    //  value between calls to function

    // send digit_low (dl) to display: 
    int digitlow = value & 0x0F;
    // send digit_high (dh) to display: 
    int digithigh = value >> 4;
    
    if( displayFlag == 0){

        // select display low

        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF)|(disp7Scodes[digitlow] << 8);  
    }
    else{
        // select diplay high
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF)|(disp7Scodes[digithigh] << 8);  
    }

    // toggle (invertir conmutar) displayflag variable 

    displayFlag = !displayFlag;
}

int main(void){

    // configure RB8-RB14 as outputs = 0  

    TRISB = TRISB & 0x80FF;

    // configure RD5-RD6 as outputs = 0 

    TRISD = TRISD & 0xFF9F;

    while(1){
        send2displays(0x67);
        // wait 0.2 s
        delay(10); // en 10 ms el ojo no distingue se queda siempre prendido

    }
    return 0;
}