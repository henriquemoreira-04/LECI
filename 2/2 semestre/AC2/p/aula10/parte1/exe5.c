/*

Escreva e teste uma função para enviar para a porta série uma string (array de carateres
terminado com o carater '\0'). Utilize a função putc() para enviar cada um dos carateres
da string.
 int main(void)
 {
 // Configure UART2 (115200, N, 8, 1)
 while(1)
 {
 putstr("String de teste\n");
 // wait 1 s
 }
 return 0;
 }
 void putstr(char *str)
 {
 // use putc() function to send each charater ('\0' should not
 be sent)
 } 

*/

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

    U2BRG = 10;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 0;

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;

    while(1){

        putstr("hola migos todo bien\n");

        delay(1000);
    }

    return 0;
}



