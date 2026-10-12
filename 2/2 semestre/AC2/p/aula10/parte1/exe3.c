/*

Acrescente ao código que escreveu no exercício anterior uma função para o envio de um
carater para a porta série. No programa principal envie, usando essa função, o carater '+' a
uma frequência de 1 Hz.
 int main(void)
 {
 // Configure UART2 (115200, N, 8, 1)
 while(1)
 {
 putc('+');
 // wait 1 s
 }
 return 0;
 }
 void putc(char byte)
 {
 // wait while UART2 UTXBF == 1
 // Copy "byte" to the U2TXREG register
 }


*/


#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000));

}

void putc(char byte){

    while( U2STAbits.UTXBF == 1);

    U2TXREG = byte;
}

int main(void){

    //Configure UART2 (115200, N, 8, 1)

    U2BRG = 10;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 0;

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;


    while(1){

        putc('+');

        delay(1000);
    }
    return 0;
    

}