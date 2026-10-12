/*Escreva e teste um programa que faça todas as configurações necessárias e que implemente a 
comunicação série entre a placa DETPIC32 (UART2) e o PC, funcionando de acordo com as seguintes especificações:

Parâmetros de comunicação: 9600 bps, odd parity, 8 data bits, 2 stop bits.

Quando for recebido o caracter 'U', deve ser incrementado um contador 
módulo 16 e o resultado deve ser mostrado nos 4 LED ligados 
aos portos RE4 a RE1; o valor inicial do contador deve ser o seu valor máximo.

Quando for recebido o caracter 'R' o valor do contador deve ser 
reposto com o seu valor mínimo, o resultado deve ser mostrado nos 4 LED, e deve ser transmitida a string "RESET".

O processamento de receção de um caracter deve ser feito, 
obrigatoriamente, por interrupção. O processamento de transmissão deve ser feito por polling.

Nota importante: nesta questão não podem ser usados system calls.*/

#include <detpic32.h>


// (20000000)/(16 * 9600) -1 = 129

volatile unsigned char contador = 15;


void putc(char byte){
	
	while(U2STAbits.UTXBF == 1);
 	U2TXREG = byte;

}

void putstr(char *str){

	while(*str != '\0'){
	
		putc(*str);
		str++;
	
	}

}


void _int_(32) isr_uart2(void){

	if(IFS1bits.U2RXIF){
		
		char c = U2RXREG;
		
		putc(c); // eco
		
		if(c == 'U'){
		
			contador = (contador + 1) % 16;
			LATE = (LATE & 0xFFE1) | (contador << 1);
			
		
		} else if( c == 'R'){
		
			contador = 0;
			LATE = (LATE & 0xFFE1) | (contador << 1);
		
			putstr("FUCK AC2");
		
		}
		
		IFS1bits.U2RXIF = 0;
	
	}

	


}


int main(void){

	// RE4 A RE1 
	// 1111 1111 1110 0001
	TRISE = TRISE & 0xFFE1;
	LATE = (LATE & 0xFFE1) | (contador << 1);
	
	// uart 9600 bps, odd parity, 8 data bits, 2 stop bits.
	
	U2BRG = 129;
	U2MODEbits.BRGH = 0;
	
	U2MODEbits.PDSEL = 2;
	U2MODEbits.STSEL = 1;
	
	U2STAbits.UTXEN = 1; // activar la trasnmision y la recepcion 
	U2STAbits.URXEN = 1;
	  	
	// uart interrup 
	
	U2STAbits.URXISEL = 0; // BIT A 0
	
	IEC1bits.U2RXIE = 1;
	IEC1bits.U2TXIE = 0;    // poner el enable del interrup como me lo piden 
	
	IPC8bits.U2IP = 3;
	
	IFS1bits.U2RXIF = 0;
	
	U2MODEbits.ON = 1;
	
	EnableInterrupts();
	


	while(1){
	
		IdleMode();
	
	
	}
	return 0;



}











