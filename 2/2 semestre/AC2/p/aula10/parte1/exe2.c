/*

2. Configure a UART2, com o valor de U2BRG que calculou no ponto anterior (para 115200
bps) e com os seguintes parâmetros de comunicação: sem paridade, 8 data bits, 1 stop bit
(115200,N,8,1) - consulte os registos UxMODE e UxSTA no manual da UART.
 
int main(void)
 {
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    // 4 – Enable UART2 (see register U2MODE)
 } 

*/

// 115200 , N , 8 , 1 

#include <detpic32.h>

int main(void){

    // 1 - Configure BaudRate Generator
    U2BRG = 10;
    U2MODEbits.BRGH = 0;  // 0 = factor de division por 16 

    // 2 – Configure number of data bits, parity and number of stop bits

    U2MODEbits.PDSEL = 0; // 00 = 8 data bits sem paridade 
    U2MODEbits.STSEL = 0; // 0 = 1 stop bit 

    // 3 – Enable the trasmitter and receiver modules (see register U2STA)

    U2STAbits.UTXEN = 1; // modulo de transmision 
    U2STAbits.URXEN = 1; // modulo de recepcion 
    
    // 4 enable uart 

    U2MODEbits.ON = 1; // 1 = activa el modulo 

    while(1){

    }
    return 0;
}