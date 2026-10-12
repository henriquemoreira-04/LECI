#include <detpic32.h>

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
    // configuration sequencia

    while(1){
        
        AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done
        
        //paso 1 tener las 4 muestras y sumarlas 
        int *p = (int *)(&ADC1BUF0);
        unsigned int i;
        unsigned int soma = 0;

        for (i = 0; i < 4; i++){   // queremos recorres las 4 primeras muestras 
            soma = soma + p[i*4]; // sumamos los valores 
            
        }

        unsigned int media = soma / 4; // paso 2 = tenemos la media 
        
        unsigned v = (media * 33 + 511) / 1023; // paso 3 formula para tener los voltios 

        // paso 4 : imprimir las cosas

        printInt(v / 10 , 10| 1 << 16); // imprime la parte entera 
        putChar('.'); // pone el punto 
        printInt(v % 10 , 10| 1 << 16); // imprime la parte decimal
        putChar('\n');

        IFS1bits.AD1IF == 0; // paso 5 OBLIGATORIO = limpiar la bandera 

    }
    return 0;
}
