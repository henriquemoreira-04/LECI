/*


Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que converta o 
sinal na entrada do módulo A/D (AN4/RB4), à frequência de amostragem de 10Hz, com 4 conversões por cada 
amostra, e que:

i) mostre no ecrã do PC a média dos resultados da conversão, em base 10 formatado com 4 dígitos;

ii) apresente uma medida do valor obtido, numa escala de 0 a 50 (em decimal), usando os dois displays de 
7 segmentos da placa em simultâneo (frequência de refrescamento de 100Hz);

iii) a cada nova conversão mude o estado do LED4, ligado ao porto RE4 (valor inicial: RE4=0).

Faça a deteção do fim de conversão por polling. Edite o seu programa no ficheiro f2.c.
*/


#include <detpic32.h>

unsigned char tobcd(unsigned char value){
    return((value / 10) << 4 | (value % 10));
}

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);

}

void send2displays(unsigned int value){

    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    static char displayflag = 0;

    unsigned int dlow = value & 0x0F;
    unsigned int dhigh = value >> 4;

    if (displayflag == 0){

        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;

        LATB = (LATB & 0x80FF) | (display7scodes[dlow] << 8);


    } else{
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;

        LATB = (LATB & 0x80FF) | (display7scodes[dhigh] << 8);
    }

    displayflag = ! displayflag;
}

int main(void){

    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 4-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence 

    // displays 

    TRISB = TRISB & 0x80FF;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;

    // led4 re4 ;
    
    TRISEbits.TRISE4 = 0;
    LATEbits.LATE4 = 0;

    unsigned int i , media , soma , valor_escalar;
    int contador = 0;

    while(1){

        if(contador == 0){
        
            AD1CON1bits.ASAM = 1; // Start conversion 

            while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done 

            int *p = (int *)(&ADC1BUF0);

            soma = 0;

            for(i=0;i<4;i++){
                soma = soma + p[i*4];
            }

            media = soma / 4;

            printInt(media , 10| 4 << 16 );
            putChar('\n');

            valor_escalar = ((media * 50 + 511)/1023) + 0;

            valor_escalar = tobcd(valor_escalar);

            LATEbits.LATE4 = !LATEbits.LATE4;
        
            IFS1bits.AD1IF = 0;
        }

        
        send2displays(valor_escalar);
        delay(200000);
        contador = (contador + 1 ) % 10;
    }
    return 0;
    
}

