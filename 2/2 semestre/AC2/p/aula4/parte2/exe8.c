//Altere o programa anterior de modo a mostrar o valor lido do dip-switch no display mais
//significativo. 


#include <detpic32.h>

int main(void){
    int dips, code;
    static const char disp7Scodes[] = {
        // numeros de 0 a 9
        0x3F , 0x06,  0x5B,  0x4F, 0x66, 0x6D,0x7D,  0x07 , 0x7F, 0x6F,

        // letras de A a F

        0x77 , 0x7C , 0x39 ,  0x5E, 0x79, 0x71 };
    
    
    // configure RB0 to RB3 as inputs 

    TRISB = ((TRISB & 0xFFF0)| 0x000F);

    // configure RB8 to RB14 outputs 

    TRISB = TRISB & 0x80FF;

    // rd5 e rd6 outputs 

    TRISD = TRISD & 0xFF9F;

    // select display low 
    // prendeer con 1 apagado con 0 
    LATDbits.LATD5 = 0;  
    LATDbits.LATD6 = 1;

    while(1){

        dips = PORTB & 0x000F;

        code =  disp7Scodes[dips];

        // send code to display 
        LATB = ((LATB & 0x80FF) | (code << 8));
    }
    return 0;


}

