/*

Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 
6 LEDs ligados aos portos RE5 a RE0, o valor de um contador crescente módulo 50 (valor inicial: 0). O 
contador deve ser incrementado com uma frequência que depende do estado lógico do "switch" DS3 
(ligado ao porto RB2): DS3 OFF, f=4Hz; DS3 ON, f=8Hz. O valor da frequência deve ser obtido com o 
menor erro possível.
Edite o seu programa no ficheiro f1.c.

*/


#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);
}

int main(void){

    // RE5 a RE0
    
    //         7654  3210    
    //          ff  1100   0000
    TRISE = TRISE & 0xFFC0; // salida 

    // ds3 rb2 entrada 

    TRISBbits.TRISB2 = 1;

    unsigned int contador = 0;
    unsigned int frecuencia = 5000000; // 4 

    while(1){

        LATE = (LATE & 0xFFC0) | (contador);

        if(PORTBbits.RB2 == 0){
            frecuencia = 5000000;
        }else{
            frecuencia = 2500000;
        }

        contador = (contador + 1 ) % 50;

        delay(frecuencia);

    }
    return 0;
}
