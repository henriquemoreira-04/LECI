/*Integre no programa anterior o sistema de visualização que desenvolveu na aula 5. Faça as
alterações que permitam a visualização do valor da amplitude da tensão nos displays de 7
segmentos, em decimal. O programa deverá:
a) efetuar 5 sequências de conversão A/D por segundo (frequência de amostragem de 5
Hz), cada uma delas com 4 amostras;
b) enviar informação para o sistema de visualização a cada 10 ms (frequência de
refrescamento de 100 Hz). 
Arquitetura d*/

#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK/1000));
}

void send2displays(unsigned char value){

    static const char disp7scodes[] = {
        //0 a 9
        // numeros de 0 a 9
        0x3F , 0x06,  0x5B,  0x4F, 0x66, 0x6D,0x7D,  0x07 , 0x7F, 0x6F,

        // letras de A a F

        0x77 , 0x7C , 0x39 ,  0x5E, 0x79, 0x71};

    static char displayflag = 0;

    int dlow = value & 0x0F; // prender la parte baja 0000 1111
    int dhigh = value >> 4; // prende la parte alta 

    if(displayflag == 0){
        // display low 
        LATDbits.LATD5 = 1; 
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0X80FF) | (disp7scodes[dlow] << 8); 

    }else{
        // display high 
        // display low 
        LATDbits.LATD5 = 0; 
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0X80FF) | (disp7scodes[dhigh] << 8); 
    }

    displayflag = !displayflag;



}

unsigned char tobcd(unsigned char value){
    return( (value / 10) << 4 | (value % 10));
}

int main(void){

    TRISB = TRISB & 0x80FF; // configurar RB14-RB8 como salidas 
    TRISD = TRISD & 0xFF9F; // configutar RD6-RD5 como salidas 

    TRISBbits.TRISB4 = 1; // RB4 digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RB4 configured as analog input
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
    // configuration sequencia

    int i = 0;
    unsigned int v = 0;
    unsigned char valordisplay = 0;  // aqui se guardara ek valro formatado

    while(1){

        if(i == 0){ // 0 , 200 , 400 ,

            AD1CON1bits.ASAM = 1; // Start conversion
            while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

            int *p = (int *)(&ADC1BUF0); // iniciar el puntero 

            unsigned int soma = 0; // para la suma 

            unsigned int j; // para buscar los primeros 4 valores 

            for (j = 0; j < 4; j++){
                soma = soma + p[i*4];

            }
            unsigned int media = soma / 4; // calculamor la media 

            v = (media * 33 + 511) / 1023; // tenemos el voltaje 

            // Limpiar bandera ADC
            IFS1bits.AD1IF = 0;  // refrescamos 

            // comvertir el entero a BCD 
            valordisplay = tobcd(v);

        }

        send2displays(valordisplay);
        delay(10);

        // avanxar el contador de 0 1 19 (10ms * 20 = 200)
        i = (i +1) % 20;
    }
    return 0;

}
