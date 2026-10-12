//Escreva a função main() para teste da função send2displays(). A função main()
//deverá ter a seguinte estrutura:

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

        int dhigh,dlow;

        //select display high
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;

        // send digit_high (dh) to display: 

        dhigh = value >> 4; // tener los 4 bits mas significativos

        LATB = (LATB & 0x80FF)| (disp7Scodes[dhigh] << 8);

        //select display low
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;

        // send digit_high (dh) to display: 

        dlow = value & 0x0F;

        LATB = (LATB & 0x80FF)| (disp7Scodes[dlow] << 8);

}

int main(void){

    // configure RB8-RB14 as outputs = 0  

    TRISB = TRISB & 0x80FF;

    // configure RD5-RD6 as outputs = 0 

    TRISD = TRISD & 0xFF9F;

    while(1){
        send2displays(0x15);
        // wait 0.2 s
        delay(200);

    }
    return 0;
}
