/*Calcule as constantes relevantes e configure o timer T3, de modo a gerar eventos com uma
frequência de 2 Hz. Em ciclo infinito, faça polling do bit de fim de contagem T3IF
(IFS0<T3IF>) e envie para o ecrâ o caracter '.' sempre que esse bit fique ativo: */

#include <detpic32.h>

// cualquier es 65535

// PR3 = (fpbclk/ K * f out ) - 1 = (20 000 000 / 256 * 2) - 2

int main(void){

    T3CONbits.TCKPS = 8; // 1:256 prescaler (i.e. fout_presc = 625 KHz)
    PR3 =  39062;
    TMR3 = 0; // Clear timer T2 count register
    T3CONbits.TON = 1; 

    while(1){

        while(IFS0bits.T3IF == 0);

        IFS0bits.T3IF = 0;

        putChar('H');

    }
    return 0;
}