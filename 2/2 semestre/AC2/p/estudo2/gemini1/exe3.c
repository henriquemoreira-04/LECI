/*Escreva e teste um programa que faça todas as configurações necessárias e que implemente a 
comunicação série entre a placa DETPIC32 (UART2) e o PC, funcionando de acordo com as seguintes especificações:

Parâmetros de comunicação: 19200 bps, no parity, 8 data bits, 1 stop bit.

Quando for recebido o caracter 'D' (Down), deve ser decrementado um contador decrescente 
módulo 10 (valores de 9 a 0) e o resultado deve ser mostrado nos 4 LED ligados aos portos RE3 a RE0; o valor inicial del contador deve ser o seu valor máximo (9).

Quando for recebido o caracter 'S' (Set) o valor do contador deve ser forçado ao seu valor 
máximo (9), el resultado deve ser mostrado nos 4 LED, e deve ser transmitida a string "VALOR MAXIMO".

O processamento de receção de um caracter deve ser feito, obrigatoriamente, por interrupção. O processamento de transmissão deve ser feito por polling.*/

// u2teg = (20000000) / (16 * 19200) - 1 = 64
 
//pterm 19200,N,8,1

#include <detpic32.h>

volatile unsigned char contador = 9;

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
		putc(c);
		
		if(c == 'D'){
		
			if(contador == 0){
			
				contador = 9;
			
			}else{
			
			contador--;
			
			}
			
			LATE = ( LATE & 0xFFF0 ) | contador;
		
		}else if( c == 'S'){
		
		
			contador = 9;
			LATE = ( LATE & 0xFFF0 ) | contador;
			putstr("VALOR MAXIMO");
			
		
		
		}
		
	 IFS1bits.U2RXIF = 0; 
	
	}



}

int main(void){

	//RE3 a RE0
	// 1111 1111 1111 0000
	
	TRISE = TRISE & 0xFFF0;
	
	LATE = ( LATE & 0xFFF0 ) | contador;
	
	// uart  19200 bps, no parity, 8 data bits, 1 stop bit.
	
	U2BRG = 64;
	U2MODEbits.BRGH = 0;
	
	U2MODEbits.PDSEL = 0;
	U2MODEbits.STSEL = 0;
	
	U2STAbits.URXEN = 1;
	U2STAbits.UTXEN = 1;
	
	
	
	// interrut  FS1<8> IEC1<8> IPC8<4:2>
	
	U2STAbits.URXISEL = 0;
	
	
	IEC1bits.U2RXIE = 1;
	IEC1bits.U2TXIE = 0;
	
	IPC8bits.U2IP = 3;
	
	
	IFS1bits.U2RXIF = 0; // recordar esto es reset la interrup de lo que quiero 
	
	U2MODEbits.ON = 1;
	
	EnableInterrupts();

	while(1){
	
		IdleMode();
	
	
	}
	
	return 0;


}
