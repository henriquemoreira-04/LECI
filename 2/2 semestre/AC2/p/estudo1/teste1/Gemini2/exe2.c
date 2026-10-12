/*


Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que converta o 

sinal na entrada do módulo A/D (AN4/RB4), à frequência de 6Hz, com 2 conversões por cada amostra, e que:

i) mostre no ecrã do PC a média dos resultados da conversão, em base 10 formatado com 4 dígitos (os 
valores devem ser apresentados em linhas consecutivas do ecrã);

ii) apresente uma medida do valor obtido, numa escala 0 a 9, num dos displays de 7 segmentos 
dependendo dos "switches" DS2 e DS1 (ligados a RB1 e RB0 respetivamente): 

   - DS2 ON e DS1 OFF: mostrar no display mais significativo; 
   - DS2 OFF e DS1 ON: mostrar no display menos significativo; 
   - Qualquer outra combinação deve apagar ambos os displays;

iii) a cada nova conversão mude o estado do LED1, ligado ao porto RE1 (valor inicial: RE1=0).
Faça a deteção do fim de conversão por polling. Edite o seu programa no ficheiro f2.c.
*/


#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() < ticks);
}

void send2displays(unsigned int value, unsigned int flag){
    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    int dlow = value;
    int dhigh = value;

    //RD6, RD5 
    if(flag == 0){
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;

        LATB = (LATB & 0x80FF) | (display7scodes[dlow] << 8);
        
    }else if(flag == 1){

        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;

        LATB = (LATB & 0x80FF) | (display7scodes[dhigh] << 8);
    
    }else{
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 0;
    }


}

int main(void){

    // adc 

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
    TRISDbits.TRISD5 = 0; // salida 
    TRISDbits.TRISD6 = 0; // salida 

    // sw ds2 ds1 rb1 rb0

    TRISBbits.TRISB0 = 1; // entrada
    TRISBbits.TRISB1 = 1; // entrada

    // leds
    
    //do LED1, ligado ao porto RE1 (valor inicial: RE1=0).

    TRISEbits.TRISE1 = 0;
    LATEbits.LATE1 = 0; // apagado 

    unsigned int i,soma,media,valor_escalar = 0,flag;

    while(1){

        AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 );

        int *p = (int *)(&ADC1BUF0);

        soma = 0;

        for(i=0;i<2;i++){
            soma = soma + p[i*4];
        }
        media = soma / 2;

        printInt(media , 10 | 4 << 16);
        putChar('\n');

        valor_escalar = ((media * 9 + 511) / 1023) + 0;

        unsigned int ds2 = PORTBbits.RB1;
        unsigned int ds1 = PORTBbits.RB0;


        if(ds2 == 1 && ds1 == 0){
            flag = 1;
            send2displays(valor_escalar,flag);
            
        }else if(ds2 == 0 && ds1 == 1){
            flag = 0;
            send2displays(valor_escalar,flag);}
        else{

            send2displays(valor_escalar,flag);
            flag = 3;

        }

        


        IFS1bits.AD1IF = 0;

        LATEbits.LATE1 = !LATEbits.LATE1; // toggle 


        delay(3333333); // 6 hz



    }
    return 0;
}
