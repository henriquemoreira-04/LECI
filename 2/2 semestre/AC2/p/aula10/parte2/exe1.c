/*Parte II
1. Altere a função main() de modo a configurar a UART1 com 115200 bps, paridade par, 8
data bits e 1 stop bit (115200,E,8,1), e altere a função putc() de modo a enviar um carater
para a UART1 (designe a nova função por putc1()). */


#include <detpic32.h>


void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < (20000 * ms));
}

void putc1( char byte){

    while(U1STAbits.UTXBF == 1);
    U1TXREG = byte;
}

void putstr(char * str){

    while(*str != 0){

        putc(*str);
        str++;
    }
}



int main(void){

    // // === CONFIGURAÇÃO DA UART1 (115200, E, 8, 1) ===
    // 1 - Configurar el generador de Baudrate para 460800 bps con BRGH = 1
    U1BRG = 10;            // Valor calculado para 460800 bps con factor de división 4
    U1MODEbits.BRGH = 1;   // 1 = Fator de divisão por 4 (Obrigatório para esta velocidade! )

    // 2 – Configurar la trama para paridad ÍMPAR y 1 stop bit (O, 8, 1)
    U1MODEbits.PDSEL = 1;  // 10 (2 em decimal) = 8 data bits, paridade ÍMPAR (Odd) [cite: 45]
    U2MODEbits.STSEL = 0;  // 0 = 1 stop bit [cite: 46]

    // 3 – Activar los módulos de transmisión y recepción [cite: 111]
    U1STAbits.UTXEN = 1;   // Ativa o módulo de transmissão [cite: 111]
    U1STAbits.URXEN = 1;   // Ativa o módulo de receção [cite: 111]

    // 4 – Activar la UART2 globalmente [cite: 112]
    U1MODEbits.ON = 1;     // Liga a UART2 [cite: 112]

    while(1){
        putstr("hola migos todo bien\n");
        delay(1000);
    }

    return 0;
}
