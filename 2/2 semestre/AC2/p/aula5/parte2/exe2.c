/*Altere o programa anterior de modo a que o sistema se comporte como um contador
módulo 60 up/down, em que o sentido de contagem seja dependente do valor lógico
imposto pelo dip-switch 1 (DS1, ligado ao porto RB0): ON – contagem ascendente, OFF –
contagem descendente. */

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
    return(((value / 10) << 4 ) + (value % 10));
    // primero obtenemos las decenas y movemos 4 bits 
    // despues calculamos las unidades rodo en binario bits
}

int main(void){

    unsigned int i;
    unsigned int counter = 0;

    // configurar los puertos

    // rb8 - rb14 outputs
    TRISB = TRISB & 0x80FF;
    // rb0 = DS1 entrada 
    TRISB = TRISB | 0x0001;
    // re0 - re7 outputs;
    TRISE = TRISE & 0xFF00;
    // rd5 e rd6 out;
    TRISD = TRISD & 0xFF9F;

    while(1){
        i = 0;
        do{
            send2displays(toBcd(counter));
            delay(10);
            ++i;

        }while(i < 50);

        //logica del DS1 

        // ON contagen ascendente 
        if(PORTBbits.RB0 == 1){
            counter = (counter + 1) % 60;

        }
        else{
            
            if(counter == 0){

                counter = 59;
            }

            else{

                counter --;
            }
        }

        LATE = (LATE & 0xFF00)| toBcd(counter);
    }

    return 0;

}
