/*
Questão 2 [10 valores]
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que converta o 
sinal na entrada do módulo A/D (AN4/RB4), à frequência de 12Hz, com 4 conversões por cada amostra, e que:

i) mostre no ecrã do PC a média dos resultados da conversão, em binário formatado com 10 bits (os valores 
devem ser apresentados em linhas consecutivas do ecrã);

ii) apresente uma medida do valor obtido, em hexadecimal, numa escala 3 a C, no display mais significativo ou 
menos significativo, dependendo do estado do "switch" DS2 (ligado ao porto RB1): DS2 OFF mostrar no 
display menos significativo;

iii) a cada nova conversão mude o estado do LED4, ligado ao porto RE4 (valor inicial: RE4=0).

Faça a deteção do fim de conversão por polling. Edite o seu programa no ficheiro f92.c.
*/

#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);
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


    // display 

    TRISB = TRISB & 0x80FF;
    TRISDbits.TRISD5 = 0; // poner como salida display low 
    TRISDbits.TRISD6 = 0; // poner como salida display high 
    
    // rb1 ds entrada 

    TRISBbits.TRISB1 = 1; // entrada  DS1

    //led4 = re4 

    TRISEbits.TRISE4 = 0; // salida 
    LATEbits.LATE4 = 0;  // su inicio es apagafo 

    // array 

    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    unsigned int media;
    unsigned int valor_escala;
    unsigned int i;
    unsigned int soma;

    while(1){
        AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 );

        int *p = (int *)(&ADC1BUF0);

        soma = 0;

        for( i=0; i<4; i++){
            
            soma = soma + p[i*4];
        }
        media = soma / 4;

        valor_escala = ((media * 9 + 511) / 1023) + 3;

        printInt(media , 2 | 10 << 16 );
        putChar('\n');

        // depende de como este el ds1

        if (PORTBbits.RB1 == 0){
            LATDbits.LATD5 = 1;
            LATDbits.LATD6 = 0;

        }else{
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 1;

        }

        LATB = (LATB & 0x80FF) | (display7scodes[valor_escala] << 8);



        IFS1bits.AD1IF = 0; // reiniciar la conversion 

        LATEbits.LATE4 = !LATEbits.LATE4;


        delay(1666666);
    }
    return 0;


}
