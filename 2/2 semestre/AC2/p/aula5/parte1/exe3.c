/*Reescreva a função send2displays(), como se apresenta a seguir, de modo a que,
sempre que for invocada, envie, de forma alternada, apenas um dos dois dígitos para o
sistema de visualização. Isto é, em chamadas sucessivas à função, o comportamento
deverá ser: enviar "digit_low", enviar "digit_high", enviar "digit_low", enviar
"digit_high", ... */

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
    // static variable: doesn't loose its variabkle statica aquella que no pierde el valor despues de perderlo anres 
    // de al avaeriable  incluso despues delos demas 
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
        delay(10);

    }
    return 0;
}
