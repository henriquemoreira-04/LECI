/*Meça o tempo de conversão do conversor A/D. Para isso, configure o porto RD11
(disponível no ponto de teste INT4 da placa DETPIC32) como saída digital e controle o seu
valor de modo a que esteja ativo durante o tempo em que a conversão está a ser realizada.
Com o osciloscópio meça o tempo durante o qual RD11 está ativo, a que corresponde, com
boa aproximação, o tempo total de conversão, e tome nota desse valor (não se esqueça de
remover a chamada à system call printInt()). */

#include <detpic32.h>

int main(void){
    volatile int aux;

    // COFIGURAR EL MODULO A/D


    TRISBbits.TRISB4 = 1; // RB4 digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RB4 configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 1-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequenc

    // configurar la puerta RD11 como output 
    
    TRISDbits.TRISD11 = 0;   // la salida es un 0 recuerda 

    while(1){
        AD1CON1bits.ASAM = 1; // Start conversion
        
        LATDbits.LATD11 = 1; // poner el bit prendido para medir tiempo 

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done 

        LATDbits.LATD11 = 0; // ponemos el bit a 0 lo reseteamos 

        aux = ADC1BUF0;

        IFS1bits.AD1IF == 0; // resetea la bandera de la conversion
    }
    return 0;
}



