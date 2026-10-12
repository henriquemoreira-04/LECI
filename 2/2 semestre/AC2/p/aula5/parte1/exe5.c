/*Escreva um programa que implemente um contador crescente módulo 256. O contador
deve ser incrementado com uma frequência de 5 Hz e o seu valor deve ser mostrado nos
dois displays em hexadecimal. A frequência de refrescamento do sistema de visualização
deve ser 50 Hz. */

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

        0x77 , 0x7C , 0x39 ,  0x5E, 0x79, 0x71};

        static char displayflag = 0;

        int dlow = value & 0x0F;
        int dh = value >> 4;

        if(displayflag == 0){
            // low
            LATDbits.LATD5 = 1;
            LATDbits.LATD6 = 0;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dlow] << 8);

        }
        else{
            //high
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 1;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dh] << 8);
        }
        
        displayflag = !displayflag;

}

int main(void){
    
    unsigned int counter = 0;
    unsigned int i;
    
    // rb8-rb14 out 
    TRISB = TRISB & 0x80FF;
    // rd5 rd 6 out
    TRISD = TRISD & 0xFF9F;

    while(1){
        i = 0;
        do {
            send2displays(counter);
            delay(20);  // frecuencia de refresco
            i++;

        }while(i < 10); // frecuencia de incremento 5 Hz = 1/5 = 0.2s = 200ms   200/20 = 10
        
        counter = (counter + 1 ) % 256; // modulo 256 contador 
    }
    return 0;

}
