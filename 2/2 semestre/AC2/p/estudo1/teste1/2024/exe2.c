/*

Questão 2 
Escreva e teste um programa, em linguagem C, que faça todas 
as configurações necessárias e que converta o sinal na entrada do módulo A/D (AN4/RB4), 
à frequência de 6Hz, com 2 conversões por cada amostra, e que:

i) mostre no ecrã do PC a média dos resultados da conversão, em hexadecimal formatado com 3 dígitos 
(os valores devem ser apresentados em linhas consecutivas do ecrã);

ii) apresente uma medida do valor obtido, numa escala 0 a 9, no display menos significativo da placa;

iii) a cada nova conversão mude o estado do LED1, ligado ao porto RE1 (valor inicial: RE1=0).

Faça a deteção do fim de conversão por polling. Edite o seu programa no ficheiro f12.c.
*/

#include <detpic32.h>

void delay(unsigned int ticks){
    resetCoreTimer();
    while(readCoreTimer() <  ticks);
}

int main(void){

    // a ) configure los ad 

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

    //  b)  el display

    TRISB = TRISB & 0x80FF; //  RB14 … RB8  segmento como salida 
    
    TRISDbits.TRISD5 = 0; // como salida 
    TRISDbits.TRISD6 = 0; // como salida
    
    LATDbits.LATD5 = 1 ; // prendo el menos significativo
    LATDbits.LATD6 = 0 ; // apago  el menos significativo 

    // c) 

    TRISEbits.TRISE1 = 0; // como salida 
    LATEbits.LATE1 = 0; // estado apagado inicial 

    static const char disp7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    unsigned int media;
    unsigned int valor_escala;

    while(1){

        AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        int *p = (int *)(&ADC1BUF0);

        media = (p[0] + p[4])/2; // hago la suma de las dos conversiones y hago la media 
        // ojo la conversion del puntero solo va de 4 en 4 

        valor_escala = (media * 9 + 511) / 1023;   // la fomrula de la escala 

        printInt(media , 16 | 3 << 16); // esta parte solo para que se ponga en el temrinal de la pc 
        putChar('\n');      

        LATB = (LATB & 0x80FF) | (disp7scodes[valor_escala] << 8);

        IFS1bits.AD1IF = 0; // hago el reset 

        LATEbits.LATE1 = !LATEbits.LATE1; // luego de cada conversion que cambie el estado del LED1 

        delay(3333333);


        
    }
    return 0;

}
