/*Substitua o atendimento por polling por atendimento por interrupção, configurando o timer T3
para gerar interrupções à frequência de 2 Hz. */

#include <detpic32.h>

void _int_(12) isr_T3(void){

    putchar('H');

    IFS1bits.AD1IF == 0 ;
}

int main(void){

    T3CONbits.TCKPS = 8; // 1:256 prescaler (i.e. fout_presc = 625 KHz)
    PR3 =  39062;
    TMR3 = 0; // Clear timer T2 count register
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag 

    T3CONbits.TON = 1; // encender el timer 3 

    EnableInterrupts();

    while(1){

        IdleMode();

    }
    return 0;

}