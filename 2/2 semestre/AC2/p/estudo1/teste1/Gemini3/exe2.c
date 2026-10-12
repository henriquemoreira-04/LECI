/*

Questão 2 [10 valores]
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que converta o 
sinal na entrada do módulo A/D (AN4/RB4), à frequência de 5Hz, com 2 conversões por cada amostra, e que:

i) mostre no ecrã do PC a média dos resultados da conversão, em hexadecimal formatado com 3 dígitos (os 
valores devem ser apresentados sempre na mesma linha do ecrã);

ii) apresente uma medida do valor obtido, numa escala 0 a F (em hexadecimal), no display mais 
significativo da placa (mantendo o menos significativo sempre apagado);

iii) a cada nova conversão mude o estado do LED2, ligado ao porto RE2 (valor inicial: RE2=0).

Faça a deteção do fim de conversão por polling. Edite o seu programa no ficheiro f2.c.zzz

*/


#include <detpic32.h>

void delay(unsigned int ms){
	resetCoreTimer();
	while(readCoreTimer() < ms);
}

void send2display(unsigned char value){
    static const char disp7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    

    // RD6, RD5 

    LATDbits.LATD5 = 0;
    LATDbits.LATD6 = 1;

    LATB = (LATB & 0x80FF) | (disp7scodes[value] << 8);
    
}


int main(void){

    //adc 

    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples
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

    //led LED2, ligado ao porto RE2 (valor inicial: RE2=0).

    TRISEbits.TRISE2 = 0;
    LATEbits.LATE2 = 0;

    unsigned int soma, i ,media,valor_escalar;

    while(1){

        AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        int *p = (int *)(&ADC1BUF0);

        soma = 0;

        for( i = 0; i < 2; i++){

            soma = soma + p[i*4];
        }

        media = soma / 2;

        printInt(media , 16 | 3 << 16);
        putChar(' ');

        valor_escalar = ((media * 15 + 511) /1023) + 0;

        send2display(valor_escalar);

        IFS1bits.AD1IF = 0;

        LATEbits.LATE2 = !LATEbits.LATE2;        

        delay(4000000);


    }
    return 0;

}
