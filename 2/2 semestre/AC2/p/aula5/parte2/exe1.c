/*Mantendo a frequência de refrescamento em 100 Hz, altere o programa de modo a
implementar um contador crescente módulo 60. A frequência de incremento deverá ser
2 Hz e os valores devem ser mostrados nos dois displays, em decimal, e nos 8 LED
ligados o porto E, em BCD. A conversão para BCD pode ser feita, de forma simplificada e
desde que o valor de entrada seja representável em BCD com 8 bits, pela seguinte função: */

// 1/2 = 0.50 = 500ms  1/100 = 0.01 =10ms

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
        int dhigh = value >> 4;

        if(displayflag == 0){
            LATDbits.LATD5 = 1;
            LATDbits.LATD6 = 0;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dlow] << 8);
        }
        else{
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 1;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dhigh] << 8); // aqui tenemos que empujarlos porque no comienza en el rb8
        }

        displayflag = !displayflag;

}

unsigned char toBcd(unsigned char value){
    return (((value / 10) << 4) + (value % 10));
}

int main(void){
    unsigned int i;
    unsigned int counter = 0;

    // rb8 - rb14 outputs
    TRISB = TRISB & 0x80FF;
    // re0 - re7 outputs;
    TRISE = TRISE & 0xFF00;
    // rd5 e rd6 out;
    TRISD = TRISD & 0xFF9F;

    while(1){
        i = 0;
        do{
            send2displays(toBcd(counter));

            delay(10);  // frecuencia de refresco de 100 hz

            i++;
        }while(i < 50); // 50* 10 = 500 ms frecuencia de aumento

        counter = (counter + 1) % 60;

        // mostrar en los leds 

        LATE = ((LATE & 0xFF00) | toBcd(counter)); // aqui el numero ya comienza en el pin
    }
    return 0;

}


//                               7654 3210
//                   1111 1111   0000 0000;                                    
