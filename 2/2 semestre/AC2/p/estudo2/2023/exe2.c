/*
Considere que a gama de tensão na entrada AN4/RB4 da ADC (0 a 3.3V) 
da placa DETPIC32 representa um valor de temperatura na gama 10ºC a 75ºC.
Escreva e teste um programa que realize todas as configurações necessárias 
e que apresente continuamente o valor da temperatura nos dois displays de sete segmentos, em decimal.

Especificações:

A ADC deve fazer duas (2) conversões por cada amostra.

A frequência de amostragem da ADC deve ser 5Hz, obtida através da utilização do Core Timer.

O fim de conversão da ADC deve ser processado por polling.

A frequência de refrescamento dos displays deve ser 140Hz; 

o refrescamento dos displays deve ser feito por interrupção, usando o timer T3.*/

// 75 - 10 = 65   ((65*media)511) / 1023 + 10;

// 5 hz 1/5 * 20000000

// pr3 = (20000000)/(140 * x) - 1  35713  1:4 2



#include <detpic32.h>


volatile unsigned char tempg = 0;

unsigned char tobcd(unsigned char val){

    return(((val / 10) << 4) | (val % 10));
}


void send2displays(unsigned char value){

    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    static char displayflag = 0;

    int dlow = value & 0x0F;
    int dhigh = value >> 4;

    if(displayflag == 0){

        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = ((LATB & 0x00FF) | (display7scodes[dlow] << 8));


    }else{

        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = ((LATB & 0x00FF) | (display7scodes[dhigh] << 8));
    }

    displayflag = !displayflag;

}


void _int_(12) isr_T3(void){

    send2displays(tobcd(tempg));
    
    IFS0bits.T3IF = 0;

}

int main(void){

	// config rb8 rb 14
	
	TRISB = TRISB & 0x00FF;
	
	//RD6, RD5 
	
	TRISDbits.TRISD5 = 0;
	TRISDbits.TRISD6 = 0;
	
	LATDbits.LATD5 = 0;
	LATDbits.LATD6 = 0;
	
	//adc
	
	TRISBbits.TRISB4 = 1; // RBx digital output disconnected
	AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
	AD1CON1bits.SSRC = 7; 
	AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
	AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
	AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples
	AD1CHSbits.CH0SA = 4; // replace x by the desired input
	AD1CON1bits.ON = 1; // Enable A/D 
	
	// timer 3
	
	T3CONbits.TCKPS = 2; 
	PR3 = 35713 ; 
	TMR3 = 0; 
	T3CONbits.TON = 1;
	
	// interrupcion 
	
	IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
	IEC0bits.T3IE = 1; // Enable timer T2 interrupts
	IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag 
	
	EnableInterrupts(); 
	
	unsigned int i , media;

	while(1){
	
		// ADC1BUF0
		
		AD1CON1bits.ASAM = 1; // Start conversion 
		
		while( IFS1bits.AD1IF == 0);
		
		unsigned int soma = 0;
		
		int *p = (int *)(&ADC1BUF0);
		
		for (i = 0; i < 2 ; i++){
		
			soma += p[i*4];
		
		} 
		
		media = soma/2;
		
		tempg = (((65 * media) + 511) / 1023) + 10;
		
		IFS1bits.AD1IF = 0;
		
		resetCoreTimer();
		while(readCoreTimer() < 4000000);
	
	}
	
	return 0;

}


