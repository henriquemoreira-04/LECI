/*
Questão 2 
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que converta o 
sinal na entrada do módulo A/D, à frequência de 4Hz, com 4 conversões por cada amostra, e que:

i) mostre no ecrã do PC o complemento para 1 da média dos resultados da conversão, em binário formatado 
com 12 bits (os valores devem ser apresentados sempre na mesma linha do ecrã);

ii) apresente uma medida do valor obtido, em hexadecimal, numa escala 4 a E, no display mais significativo ou 
menos significativo, dependendo do estado do "switch" DS4 (ligado ao porto RB3): DS4 ON mostrar no display 
menos significativo;

iii) a cada nova conversão mude o padrão dos LEDs ligados aos portos RE6 e RE1 entre 01, 10, 01, ... (valor 
inicial: RE6=1, RE1=0).

Faça a deteção do fim de conversão por polling. Edite o seu programa no ficheiro f82.c.
*/


#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);
}

void send2displays(unsigned int valor , unsigned int estado){
    static const char display7scodes[]= {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    if(estado == 1){
            LATDbits.LATD5 = 1;
            LATDbits.LATD6 = 0;

        }else{
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 1;

        }

        LATB = (LATB & 0x80FF) | (display7scodes[valor] << 8);

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

    TRISB = TRISB & 0x80FF; // RB14 … RB8 

    //RD6, RD5 

    TRISDbits.TRISD5 = 0; // salida
    TRISDbits.TRISD6 = 0; // salida

    // ds4 rb3 

    TRISBbits.TRISB3 = 1; // entrada

    //RE6 RE1 

    TRISEbits.TRISE6 = 0;
    TRISEbits.TRISE1 = 0;
    LATEbits.LATE6 = 1;
    LATEbits.LATE1 =0 ;


    unsigned int media,soma, valor_escala, i;

    while(1){

        AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        int *p = (int *)(&ADC1BUF0);

        soma = 0;

        for(i=0;i<4;i++){
            soma = soma + p[i*4];
        }

        media = soma / 4 ;

        valor_escala = ((media * 10 + 511) / 1023) + 4;

        unsigned int comp1 =  (~media) & 0x0FFF; // quiero los primeros 12 el resto basura 
        printInt(comp1 , 2 | 12 << 16);
        putChar('\r');                        // 'r' misma linea '\n' lineas consecutivas 

        
        unsigned int estadosw =  PORTBbits.RB3;

        

        send2displays(valor_escala , estadosw);

        
        
        IFS1bits.AD1IF = 0;

        // leds 
        LATEbits.LATE6 = !LATEbits.LATE6;
        LATEbits.LATE1 = !LATEbits.LATE1;



        delay(5000000);

    }
    return 0;


}
