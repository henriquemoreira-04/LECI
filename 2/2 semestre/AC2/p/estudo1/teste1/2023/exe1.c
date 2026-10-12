
/*/*
Questão 1 [6 valores]
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 
6 LED ligados aos portos RE7 a RE2, o padrão 110000, 011000, 001100, ..., 000011, 110000, 011000, ... (valor 
inicial: 110000). O padrão deve mudar com uma frequência que depende do estado lógico dos "switches" DS3 
e DS1 (ligados aos portos RB2 e RB0): ambos OFF, f= 4.6Hz; ambos ON, f=7.3Hz; qualquer outra combinação 
mantém a frequência anterior (valor inicial: 7.3Hz). O valor da frequência deve ser obtido com o menor erro 
possível.
Edite o seu programa no ficheiro f91.c.
*/


#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);
}



int main(void){

    TRISE = TRISE & 0xFF03; //  RE7-RE2  meter como salida   
    
    TRISB =  TRISB | 0x0005;  // entrada DS3 DS1 (RB2 RB0 )
    
    unsigned int patron = 48;

    unsigned int frecuencia = 2739726;

    while(1){

        LATE = (LATE & 0xFF03) | (patron << 2); // meter el valor inicial  // ojo yo quiero mover es LOS EEE

        unsigned int ds3 = PORTBbits.RB2; // leer el bit y el puerto 
        unsigned int ds1 = PORTBbits.RB0;

        if( ds3 == 0 && ds1 == 0){
            frecuencia = 4347826;

        }else if(ds3 == 1 && ds1 == 1){
            frecuencia = 2739726;
        }
        
        delay(frecuencia);

        if( patron == 3 ){
            patron = 48;

        }
        
        else{

            patron = patron >> 1;
        }


    }
    return 0;


}





// 2739726