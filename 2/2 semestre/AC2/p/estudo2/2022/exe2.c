/*Considere que a gama de tensão na entrada AN4/RB4 da ADC (0 a 3.3V) da placa 
DETPIC32-IO representa um valor de temperatura na gama 15ºC a 65ºC. Escreva e teste 
um programa que realize todas as configurações necessárias e que apresente continuamente 

o valor da temperatura nos dois displays de sete segmentos, em decimal.

Especificações:

A ADC deve fazer duas (2) conversões por cada amostra.

A frequência de amostragem da ADC deve ser 10Hz, obtida através da utilização do Core Timer.

O fim de conversão da ADC deve ser processado por polling.

A frequência de refrescamento dos displays deve ser 120Hz.

O refrescamento dos displays deve ser feito por interrupção, usando o timer T2.

*/

// 65 - 15   = 50 
// temp golbal  =  (((50 * media ) + 511) / 1023) + 15;

// 120  41666 1:4  

#include <detpic32.h>

volatile unsigned char tempg = 0;

unsigned char tobcd(unsigned char value){

	return(((value / 10) << 4) | value % 10 );

}

void send2displays(unsigned char value){

	static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
	static char displayflag = 0;
	
	int dl = value & 0x0F;
	int dh = value >> 4;
	
	if(displayflag == 0){
	
		LATDbits.LATD5 = 1;
		LATDbits.LATD6 = 0;
		LATB = (LATB & 0x00FF) | (display7scodes[dl] << 8);
	
	}else{
	
	
		LATDbits.LATD5 = 0;
		LATDbits.LATD6 = 1;
		LATB = (LATB & 0x00FF) | (display7scodes[dh] << 8);
	
	}
	
	displayflag = !displayflag;


}


void _int_(8) isr_T2(void){

	send2displays(tobcd(tempg));
	IFS0bits.T2IF = 0;
}




int main(void){

	// diplay 
	TRISB = TRISB & 0x00FF;
	
	// los cosos que lo muestran 
	TRISDbits.TRISD5 = 0;
	TRISDbits.TRISD6 = 0;
	LATDbits.LATD5 = 0;
	LATDbits.LATD6 = 0;
	
	// adc 
	
	
	TRISBbits.TRISB4 = 1; // RBx digital output disconnected
	AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
	AD1CON1bits.SSRC = 7; 
	AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
	AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
	AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples
	AD1CHSbits.CH0SA = 4; // replace x by the desired input
	AD1CON1bits.ON = 1; // Enable A/D
	
	// timer 2 
	
	T2CONbits.TCKPS = 2; // 1:32 prescaler (i.e. fout_presc = 625 KHz)
 	PR2 = 41666; // 
 	TMR2 = 0; // Clear timer T2 count register
 	T2CONbits.TON = 1; 
	
	// interrupcion 
	
	IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6])
 	IEC0bits.T2IE = 1; // Enable timer T2 interrupts
 	IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag 
 	
 	EnableInterrupts(); // Macro defined in "detpic32.h" 
	 
	unsigned int i , media;

	while(1){
	
		AD1CON1bits.ASAM = 1; // Start conversion 
		while( IFS1bits.AD1IF == 0 ); 
	
		int soma = 0;
		
		int *p = (int *)(&ADC1BUF0);

		for(i = 0 ; i < 2; i++){
		
			soma += p[i*4];
		
		}
		
		media = soma / 2 ;
		
		tempg = (((50 * media ) + 511) / 1023) + 15;
		
		
	
		IFS1bits.AD1IF = 0;
		
		resetCoreTimer();
		while(readCoreTimer() < 2000000);
	
	
	}
	
	return 0;


} 
