/*Considere que a gama de tensão na entrada AN4/RB4 da 
ADC (0 a 3.3V) da placa DETPIC32 representa um valor de 
temperatura na gama 7ºC a 73ºC. 
Escreva e teste um programa que realize todas as \
configurações necessárias e que apresente continuamente o 
valor da temperatura nos dois displays de sete segmentos, em decimal.

Especificações:

A ADC deve fazer duas (2) conversões por cada amostra.

A frequência de amostragem da ADC deve ser 5Hz, obtida 
através da utilização do Core Timer.

O fim de conversão da ADC deve ser processado por polling.

A frequência de refrescamento dos displays deve ser 250Hz; 
o refrescamento 
dos displays deve ser feito por interrupção, usando o timer T3.



73 - 7 = 66 

tempp  =   ()

pr3 = 20 m / 250   x  2 -1  =  39999  1:2  1 

ms = 1/ hz x 20mhz 

*/


#include <detpic32.h>

volatile unsigned char tempglobal  = 0;

unsigned char tobcd(unsigned char val);

void send2displays(unsigned char value);

void _int_(12) isr_T3(void){

    send2displays(tobcd(tempglobal));

    IFS0bits.T3IF = 0; // limpiar bandera del timer 3 

}

unsigned char tobcd(unsigned char val){

    return(((val / 10) << 4) | (val % 10));
}

void send2displays(unsigned char value){

    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    static char displayflag = 0;

    int dlow = value & 0x0F;
    int dhigh = value >> 4;

    if(displayflag == 0){

        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = ((LATB & 0x00FF) | (display7scodes[dlow] << 8));


    }else{

        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = ((LATB & 0x00FF) | (display7scodes[dhigh] << 8));
    }

    displayflag = !displayflag;

}

int main(void){

    // rb8 - rb15 

    TRISB = TRISB & 0x00FF;

    // rD6 5 salidas

    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;

    // iniciar apafado 

    LATDbits.LATD5 = 0;
    LATDbits.LATD6 = 0;

    // adc 

    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; 
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    AD1CON1bits.ON = 1; // Enable A/D 

    // timer e interrupcion 

    T3CONbits.TCKPS = 1; 
    PR3 = 39999; 
    TMR3 = 0; 
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag 

    EnableInterrupts();

    unsigned int i,media;

    while(1)
    {

        AD1CON1bits.ASAM = 1; // Disparar la conversión

        while(IFS1bits.AD1IF == 0);

        unsigned int soma = 0;

        int *p = (int *)(&ADC1BUF0);

        for(i = 0 ; i < 2 ; i++){

            soma += p[i*4];
        }

        media = soma / 2 ;  // ver la suma 

        tempglobal = (((66 * media ) + 511) / 1023 ) + 7; // pide la temperatura 

        IFS1bits.AD1IF = 0; // reinicar el adc 

        resetCoreTimer();
        while(readCoreTimer() < 4000000);
        
    }
    return 0;
}




