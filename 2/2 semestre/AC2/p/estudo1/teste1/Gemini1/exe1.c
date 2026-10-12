/* 


Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 

8 LEDs ligados aos portos RE7 a RE0, o padrão 11000000, 01100000, 00110000, ..., 00000011, 11000000... 

(valor inicial: 11000000). O padrão deve mudar com uma frequência que depende do estado lógico dos 
\
"switches" DS4 e DS3 (ligados aos portos RB3 e RB2): ambos OFF, f=2.5Hz; ambos ON, f=8.5Hz; qualquer 

outra combinação mantém a frequência anterior (valor inicial: 2.5Hz). O valor da frequência deve ser 

obtido com o menor erro possível.

Edite o seu programa no ficheiro f1.c.



*/


#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);

}

int main(void){

    TRISE = TRISE &  0xFF00; // re7 a re0 salida
    
    // sw

    // ds4 e ds3 entrada // rb3 rb2 

    TRISBbits.TRISB3 = 1;
    TRISBbits.TRISB2 = 1;

    unsigned int patron = 192;
    unsigned int frecuencia = 8000000; // 2,5 hz 

    while(1){

        LATE = (LATE & 0xFF00 ) | (patron);

        unsigned int ds4 = PORTBbits.RB3;
        unsigned int ds3 = PORTBbits.RB2;

        if (ds4 == 0 && ds3 == 0){
            frecuencia = 8000000;
        }else if(ds4 == 1 && ds3 == 1 ){
            frecuencia = 2352941;
        }
        

        if(patron == 3 ){
            patron = 192;
        }else{
            patron = patron >> 1;
        }

        delay(frecuencia);
    }
    return 0;



}
