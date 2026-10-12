/*

Escreva e teste um programa que faça todas as configurações necessárias 
e que implemente a comunicação série entre a placa DETPIC32 (UART2) e o PC, 

funcionando de acordo com as seguintes especificações:

Parâmetros de comunicação: 2400 bps, even parity, 8 data bits, 2 stop bits.

Deve ser feito o eco de todos os carateres recebidos.

Deve ser mostrado nos 4 LED ligados 
aos portos RE3 a RE0 o valor binário de um contador crescente módulo 10; 
o valor do contador deve ser incrementado sempre que for 
recebido o carater 'F' (o valor inicial do contador deve ser o seu valor mínimo).

Quando for recebido o carater 'C' o valor do contador 
deve ser reposto com o seu valor mínimo, o resultado deve ser 
mostrado nos 4 LED, e deve ser transmitida a string "VALOR MINIMO".

O processamento de receção de um caracter deve ser feito, 
obrigatoriamente, por interrupção. O processamento de transmissão deve ser feito por polling.

Nota importante: nesta questão não podem ser usados system calls.

// UARTS = (20000000) /(2400 * 16 ) - 1 = 520

*/


#include <detpic32.h>

volatile unsigned char contador = 0;

void putc(char byte)
{
 	while (U2STAbits.UTXBF == 1);
 	U2TXREG = byte;
} 


void putstr(char *str){
	while( *str != '\0'){
		putc(*str);
		str++;
	}
}


void _int_(32) isr_uart2(void){

	if(IFS1bits.U2RXIF){
	
		char c = U2RXREG;
		
		putc(c); // eco obligatorio 
		
		if(c == 'F'){
		
		contador = (contador + 1 ) % 10 ;
		
		LATE = (LATE & 0xFFF0) | contador;
		
		} else if( c == 'C'){
		
			contador = 0;
			LATE = (LATE & 0xFFF0) | contador;
			putstr("VALOR MINIMO");
			
		}
		
		IFS1bits.U2RXIF = 0;
	
	} 




}


int main(void){

	// configurar los leds 
	
	TRISE = TRISE & 0xFFF0; // RE3 A RE0 A SALIDA 
	
	LATE = LATE & 0xFFF0; // primero a 0 apagado 
	
	// configurar uart  2400 bps, even parity, 8 data bits, 2 stop bits.
	
	U2BRG = 520;
	U2MODEbits.BRGH = 0;
	
	U2MODEbits.PDSEL = 1;
	U2MODEbits.STSEL = 1;
	
	U2STAbits.UTXEN = 1;
	U2STAbits.URXEN = 1;
	
	
	// uart con interrup 
	
	U2STAbits.URXISEL = 0;
	
	IEC1bits.U2RXIE = 1;
	IEC1bits.U2TXIE = 0;
	
	IPC8bits.U2IP = 3;
	
	IFS1bits.U2RXIF = 0;
	
	U2MODEbits.ON = 1;
	
	EnableInterrupts(); 


	while(1){
	
		IdleMode();
	
	}
	
	return 0;



}
