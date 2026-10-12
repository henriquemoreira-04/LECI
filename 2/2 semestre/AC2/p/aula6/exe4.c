/*Altere a configuração do módulo A/D de modo a que o conversor efetue 4 conversões
consecutivas. Observe o resultado. */


# include <detpic32.h>

 int main(void){

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
    // configuration sequenc

    while(1){

        AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        int *p = (int *)(&ADC1BUF0); // esto apunta al inicio del buffer 
        unsigned int i;
        for(i=0; i<16; i++){
            // imprimir la base 10 en 4 digitos 
            printInt(p[i*4] , 10 | 4 << 16); //valor , base y cantidad digito
            putChar(' ');
        }
        putChar('\n'); // salta la linea 
        
        IFS1bits.AD1IF == 0; // resetea la bandera de la conversion 

    }
    return 0;
}


// recuerda que el valor maximo es 1023 v  por eso cuando lo muesves da ese numero 