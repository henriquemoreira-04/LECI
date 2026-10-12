/* O programa desenvolvido na aula anterior permite enviar 4 bits (um caracter hexadecimal)
para um dos displays. Escreva agora uma função que envie um byte (8 bits), ou seja dois
algarismos hexadecimais, para os dois displays, fazendo corresponder os 4 bits menos
significativos ao display low e os 4 bits mais significativos ao display high. */

#include <detpic32.h>

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

        LATB = (LATB & 0x80FF)| (disp7Scodes[dhigh] << 8);

}
