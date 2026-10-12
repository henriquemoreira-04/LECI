/*
Questão 1 [6.5 valores]
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 
6 LEDs ligados aos portos RE7 a RE2, o padrão 110000, 011000, 001100, ..., 000011, 110000, 011000, ... O 
padrão deve mudar com uma frequência que depende do estado lógico dos "switches" DS3 e DS1 (ligados aos 
portos RB2 e RB0): ambos OFF, f=3.5Hz; ambos ON, f=10.5Hz; qualquer outra combinação mantém a 
frequência anterior (valor inicial: 10.5Hz). O valor da frequência deve ser obtido com o menor erro possível.
Edite o seu programa no ficheiro f81.c.
*/


#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);
}

int main(void){

    // RE7 a RE2 

    TRISE = TRISE &  0xFF03; // salida 

    //                    7654 3210
    //                  ff  0 0 0 0  0 0 1 1

    // RB2 E RB0 entrasa

    TRISBbits.TRISB2 = 1; // ds3 entrada
    TRISBbits.TRISB0 = 1;  // ds1 entrada 

    unsigned int patron = 48;
    unsigned int ticks_espera = 1904761;

    while(1){

        LATE = (LATE & 0xFF03) | ( patron << 2);

        unsigned int ds3 = PORTBbits.RB2;
        unsigned int ds1 = PORTBbits.RB0;

        if(ds3 == 0 && ds1 == 0){
            ticks_espera = 5714285;
            
        }else if( ds3 == 1 && ds1 == 1){
            ticks_espera = 1904761;}
            

            delay(ticks_espera);

            if(patron == 3){
                patron = 48;
            }else{
                patron =  patron >> 1;
            }
        


    }
    return 0;
}
