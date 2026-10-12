
// factor de division 4 

// osea en la formula   del U2BRG

#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000));
}

void putc(char byte){
    // Espera enquanto o buffer de transmissão estiver cheio (UTXBF == 1)
    while(U2STAbits.UTXBF == 1);

    // Envia o caráter para o registo de transmissão
    U2TXREG = byte;
}

int main(void){
    // === CONFIGURAÇÃO DA UART2 (115200, N, 8, 1) com Sobreamostragem de 4 ===

    // 1 - Configure BaudRate Generator
    U2BRG = 43;            // NOVO VALOR: Calculado para fator de divisão 4
    U2MODEbits.BRGH = 1;   // MODIFICADO: 1 = Fator de divisão por 4 (high speed)

    // 2 – Configure number of data bits, parity and number of stop bits
    U2MODEbits.PDSEL = 0;  // 8 bits de dados, sem paridade
    U2MODEbits.STSEL = 0;  // 1 stop bit

    // 3 – Enable the transmitter and receiver modules
    U2STAbits.UTXEN = 1;   // Ativa o módulo de transmissão
    U2STAbits.URXEN = 1;   // Ativa o módulo de receção

    // 4 – Enable UART2
    U2MODEbits.ON = 1;     // Ativa a UART2 globalmente

    // === CICLO PRINCIPAL ===
    while(1){
        putc('+');         // Envia o caráter '+' através da nova configuração
        delay(1000);       // Mantém a frequência de 1 Hz (espera 1s)
    }
    
    return 0;
}