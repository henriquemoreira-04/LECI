/*5. Reponha a frequência das interrupções do timer 3 em 25 Hz, configure os portos RD0 e RD2
como saídas e inicialize-os com o valor lógico 0. Na RSI do timer T1 faça o toggle (mudar o
estado lógico) do porto RD0 e na RSI do timer T3 faça o toggle do porto RD2. Com o
osciloscópio observe os sinais nestes dois portos e meça os tempos a 1 e a 0 dos dois sinais
(RD2 e RD0 estão disponíveis nos pontos de teste OC3 e OC1, respetivamente)*/

#include <detpic32.h>

void _int_(4) isr_T1(void){

    LATDbits.LATD0 = !LATDbits.LATD0;

    IFS0bits.T1IF = 0;

}

void _int_(12) isr_T3(void){

    LATDbits.LATD2 = !LATDbits.LATD2;

    IFS0bits.T3IF = 0;

}

int main(void){

    // configurar los puertos rd0 rd2 salida 

    TRISDbits.TRISD0 = 0;
    TRISDbits.TRISD2 = 0;

    LATDbits.LATD0 = 0;
    LATDbits.LATD2 = 0;


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

