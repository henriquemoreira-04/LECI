/*Teste o programa anterior com diferentes valores de configuração da UART2: 600,N,8,1;
1200,O,8,2; 9600,E,8,1; 19200,N,8,2; 115200,E,8,1; 230400,E,8,2;
460800,O,8,1; 576000,N,8,1.
Notas:
• Para os valores de baudrate 230400, 460800 e 576000, terá que usar,
obrigatoriamente, um fator de sobreamostragem de 4.
• No PC o programa pterm3
 tem que ser executado com os mesmos parâmetros com
que configurou a UART2 (por exemplo: pterm 600,N,8,1). */

#include <detpic32.h>


void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < (20000 * ms));
}

void putc( char byte){

    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}

void putstr(char * str){

    while(*str != 0){

        putc(*str);
        str++;
    }
}



int main(void){

    // 1 - Configurar el generador de Baudrate para 460800 bps con BRGH = 1
    U2BRG = 10;            // Valor calculado para 460800 bps con factor de división 4
    U2MODEbits.BRGH = 1;   // 1 = Fator de divisão por 4 (Obrigatório para esta velocidade! )

    // 2 – Configurar la trama para paridad ÍMPAR y 1 stop bit (O, 8, 1)
    U2MODEbits.PDSEL = 2;  // 10 (2 em decimal) = 8 data bits, paridade ÍMPAR (Odd) [cite: 45]
    U2MODEbits.STSEL = 0;  // 0 = 1 stop bit [cite: 46]

    // 3 – Activar los módulos de transmisión y recepción [cite: 111]
    U2STAbits.UTXEN = 1;   // Ativa o módulo de transmissão [cite: 111]
    U2STAbits.URXEN = 1;   // Ativa o módulo de receção [cite: 111]

    // 4 – Activar la UART2 globalmente [cite: 112]
    U2MODEbits.ON = 1;     // Liga a UART2 [cite: 112]

    while(1){
        putstr("hola migos todo bien\n");
        delay(1000);
    }

    return 0;
}
