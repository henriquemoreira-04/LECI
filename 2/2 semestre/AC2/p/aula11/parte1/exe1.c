/*Escreva o programa principal para teste da receção de um caracter, por interrupção. O
programa principal deve ter a seguinte estrutura:
 int main(void)
 {
 // Configure UART2: 115200, N, 8, 1
 // Configure UART2 interrupts, with RX interrupts enabled
 // and TX interrupts disabled:
 // enable U2RXIE, disable U2TXIE (register IEC1)
 // set UART2 priority level (register IPC8)
 // clear Interrupt Flag bit U2RXIF (register IFS1)
 // define RX interrupt mode (URXISEL bits)
 // Enable global Interrupts

 while(1)
 {
 IdleMode();
 }
 return 0;
 } */


#include <detpic32.h>

int main(void){

    // Configure UART2: 115200, N, 8, 1

    // === 1. CONSTRUIÇÃO E CONFIGURAÇÃO DA UART2 (115200, N, 8, 1) ===
    U2BRG = 10;            // Valor calculado para 115200 bps [cite: 374]
    U2MODEbits.BRGH = 0;   // Fator de divisão por 16

    U2MODEbits.PDSEL = 0;  // 8 data bits, sem paridade [cite: 374]
    U2MODEbits.STSEL = 0;  // 1 stop bit [cite: 374]

    U2STAbits.UTXEN = 1;   // Ativa o módulo de transmissão (útil para o eco posterior)
    U2STAbits.URXEN = 1;   // Ativa o módulo de receção

    // === 2. CONFIGURAÇÃO DO SISTEMA DE INTERRUPÇÕES DA UART2 ===
    U2STAbits.URXISEL = 0; // Define o modo de interrupção RX (00 = 1 caráter disponível) [cite: 350, 351, 380]

    IEC1bits.U2RXIE = 1;   // Ativa interrupções de receção (U2RXIE no IEC1) 
    IEC1bits.U2TXIE = 0;   // Desativa interrupções de transmissão (U2TXIE no IEC1) 

    IPC8bits.U2IP = 3;     // Define o nível de prioridade da UART2 no IPC8 [cite: 357, 378]

    IFS1bits.U2RXIF = 0;   // Limpa a flag de interrupção U2RXIF no IFS1 [cite: 363, 379]

    // === 3. ATIVAÇÃO DO MÓDULO E INTERRUPÇÕES GLOBAIS ===
    U2MODEbits.ON = 1;     // Ativa a UART2 [cite: 374]
    
    EnableInterrupts();

    while(1){

        IdleMode();
    }
    return 0;

}