/*O objetivo deste exercício é fazer a configuração do sistema de interrupções e dos timers T1
e T3: o timer T1 a gerar interrupções à frequência de 5 Hz e o timer T3 a gerar interrupções
à frequência de 25 Hz.
a) Determine as constantes relevantes para que o timer T1 (tipo A) gere eventos de
interrupção a cada 200 ms (5 Hz) e o timer T3 (tipo B) gere eventos de interrupção a cada
40 ms (25 Hz).
b) Escreva o programa principal com todas as configurações necessárias e as Rotinas de
Serviço à Interrupção dos timers T1 e T3. Nas rotinas de serviço à interrupção deve
apenas imprimir um caracter: '1' na RSI do timer T1 e '3' na RSI do timer T3. */


// recordar tipo  A ( 1 8 64 256)
// tipo b ( 1 2 4 8 16 32 64 256)

#include <detpic32.h>

void _int_(4) isr_T1(void){

    putChar('1');

    IFS0bits.T1IF = 0;

}

void _int_(12) isr_T3(void){

    putChar('3');

    IFS0bits.T3IF = 0;

}

int main(void){

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

