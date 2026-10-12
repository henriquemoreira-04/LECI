/*Escreva um programa que:
a) configure o porto RB4 como entrada analógica; configure o módulo A/D de acordo com as
indicações dadas anteriormente e de modo a que o número de conversões consecutivas
seja 1;

b) em ciclo infinito: i) dê ordem de conversão; ii) espere pelo fim de conversão; iii) utilizando
a system call printInt(), imprima o resultado da conversão (disponível em ADC1BUF0)
em hexadecimal, formatado com 3 dígitos ( printInt(ADC1BUF0, 16 | 3 << 16) ).

 int main(void)
 {
 // Configure the A/D module and port RB4 as analog input
 while(1)
 {
 // Start conversion
 // Wait while conversion not done (AD1IF == 0)
 // Read conversion result (ADC1BUF0 value) and print it
 // Reset AD1IF
 }
 return 0;
 } */

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
    AD1CON2bits.SMPI = 1-1; // Interrupt is generated after N samples
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

        printInt(ADC1BUF0, 16 | 3 << 16);
        putChar('\n');
        
        IFS1bits.AD1IF == 0; // resetea la bandera de la conversion 

    }
    return 0;
 }


