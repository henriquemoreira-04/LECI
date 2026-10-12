/*Escreva e teste um programa que faça todas as configurações necessárias e que gere na saída OC4 do PIC32 um sinal 
com uma frequência de 130Hz e "duty-cycle" dependente do estado do "switch" DS2 (ligado ao porto RB1), de acordo com 
a especificação seguinte, considerando um valor inicial de "duty-cycle" de 50%:

RB1: 0 - "duty-cycle" alterna entre 25% e 75%, a cada 1.3s (para esta temporização deve ser usado o Core Timer).

RB1: 1 - o sinal gerado mantém o último valor de "duty-cycle" aplicado.

NOTE: O valor do porto RB2 deve ser verificado antes da mudança para um novo valor de "duty-cycle".
Deve ser usado o timer T3 como referência e a sua configuração deve permitir a geração do sinal PWM com a máxima resolução possível.


PR3 = 20 mhz / 130 x 4   =  38462   1:2  2 

oc4 = (38462 + 1) * 0,50  = 19231

oc4 = (38462 + 1) * 0,25 = 9616

oc4 = (38462 + 1) * 0,75 = 28847

ciclos =  1.3 x 20 000 000

26000000 s 

*/

// recuerda el octsel es 0 para T2 y 1 para T3 

#include <detpic32.h>

void delay_13s(void){

    resetCoreTimer();
    while(readCoreTimer() < 26000000);

}


int main(void){

    // rb1 rb2 

    TRISBbits.TRISB1 = 1;
    TRISBbits.TRISB2 = 1; //  DS son entradas 

    // configurar timer 3 

    T3CONbits.TCKPS = 2;
    PR3 = 38462 ; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    // configurar el OC4 

    OC4CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC4CONbits.OCTSEL = 1;// Use timer T2 as the time base for PWM generation
    OC4RS = 19231; // Ton constant
    OC4CONbits.ON = 1; // Enable OC1 module 

    // variable estado 

    int flag_25_75 = 0;

    while(1){

        if (PORTBbits.RB1 == 0){

            if(PORTBbits.RB2 == 1){

                if(flag_25_75 == 0){

                    OC4RS = 9616;

                    flag_25_75 = 1; // la cambiamos 


                }else{

                    OC4RS = 28847;
                    flag_25_75 = 0;

                }
            }
            delay_13s();


        }else{

            resetCoreTimer();
            while(readCoreTimer() < 200000); // pausa de 10ms


        }

    }
    return 0;

}


