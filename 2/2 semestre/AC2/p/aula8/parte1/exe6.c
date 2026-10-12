/*Configure os portos RE1 e RE3 como saídas e na RSI do timer 3 faça o toggle do porto RE3
e na RSI do timer 1 faça o toggle do porto RE1. Observe nos LEDs 3 e 1 o comportamento
do programa.*/

#include <detpic32.h>

void _int_(4) isr_T1(void){

    LATEbits.LATE1 = !LATEbits.LATE1;

    IFS0bits.T1IF = 0;

}

void _int_(12) isr_T3(void){

   LATEbits.LATE3 = !LATEbits.LATE3; //

    IFS0bits.T3IF = 0;

}

int main(void){

    // re1 re 3 salida 

    TRISEbits.TRISE1 = 0;
    TRISEbits.TRISE3 = 0;

    LATEbits.LATE1 = 0;
    LATEbits.LATE3 = 0;

    // f bclk = 20 mhz  f out = 5 

    // tipo a  =  1 8 64 256

    // del 1 

    T1CONbits.TCKPS = 2 ; 
    PR1 = 62499; // 20 000 000 / 64 * 5 
    TMR1 = 0; // Clear timer T2 count register
    
    IPC1bits.T1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T2 interrupts
    IFS0bits.T1IF = 0; // Reset timer T2 interrupt flag 
    
    T1CONbits.TON = 1; 


    // config timer 3 

    T3CONbits.TCKPS = 5 ; 
    PR3 = 24999; // 20 000 000 / * 25  
    TMR3 = 0; // Clear timer T2 count register
    
    IPC3bits.T3IP = 2; 
    IEC0bits.T3IE = 1; 
    IFS0bits.T3IF = 0; 
    
    T3CONbits.TON = 1; 

    EnableInterrupts();

    while (1)
    {
        IdleMode();
    }
    return 0;
    

}
