/*Escreva um programa que gere na saída OC1 um sinal com uma frequência de 100 Hz e um
duty-cycle de 25%, utilizando como base de tempo (referência) o timer T3. Adicionalmente,
o sinal PWM deve ser gerado com a máxima resolução possível (res = log2(fout_presc/fout). */

// t3 =  20.000.000 / 8 * 100 -1 = 24999

// OC1RS =  (pr3 + 1 ) * 0.25 = 6250

#include <detpic32.h>

int main(void){

    T3CONbits.TCKPS = 3; 
    PR3 = 24999; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 
    
    OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 1;// Use timer T3 as the time base for PWM generation
    OC1RS = 6250; // Ton constant
    OC1R = 6250; // Ton constant
    OC1CONbits.ON = 1; // Enable OC1 module 

    while(1){

        IdleMode();
    }
    return 0;


}