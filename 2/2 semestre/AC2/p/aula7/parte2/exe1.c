#include <detpic32.h>

volatile int adc_value;

void _int_(27) isr_adc(void){

    LATDbits.LATD11 = 0;

    adc_value = ADC1BUF0;

    LATDbits.LATD11 = 1;

    AD1CON1bits.ASAM = 1; // Start conversion 

    IFS1bits.AD1IF == 0;
    
}

int main(void){

    // rd11 como salida

    TRISDbits.TRISD11 = 0;
    LATDbits.LATD11 = 1; // iniciar en 1 para arrancar 

    // ADC 

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    // RBx digital output disconnected
    // RBx configured as analog input
    // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;
    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 1-1;
    // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4;
    // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1;
    // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence


    // RSI  

    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts 
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag 
    IEC1bits.AD1IE = 1; // enable A/D interrupts 

    EnableInterrupts();

    // comenzar la conversion en bucle 
    AD1CON1bits.ASAM = 1;

    while(1){

    }
    return 0;
}
