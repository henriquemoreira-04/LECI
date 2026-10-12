/*Questão 1 [5 valores] (Tempo estimado: 25')
Escreva um programa que faça todas as configurações necessárias e que gere 
na saída OC4 do PIC32 um sinal com uma frequência de 200Hz e "duty-cycle" 
dependente do estado dos "switches" DS2 e DS1 (ligados aos portos RB1 e RB0, respetivamente), 
de acordo com a especificação seguinte (valor inicial do "duty-cycle" - 40%):

RB1: 0, RB0: 1 -> 15%

RB1: 1, RB0: 1 -> 80%

Restantes combinações -> mantém o valor de "duty-cycle" anterior

O programa deve verificar, a cada 500 µs, o valor presente nos "switches" e alterar o "duty-cycle" 
do sinal de saída, em conformidade (para esta temporização deve ser usado o Core Timer).

Deve ser usado o timer T2 como referência e a sua configuração deve permitir a geração do sinal PWM com a máxima resolução possível.*/

// pr2 = (20000000)/(200*x ) -1 = 49999 1:2 1

// oc1rs = (49999 +1 ) * 0,40 =  20000
//oc1rs = (49999 +1 ) * 0,15 = 7500
//oc1rs = (49999 +1 ) * 0,80 =  40000

// 500 us =  500*10^-6*20*10^6 = 10000

#include <detpic32.h>

int main(void){


	// rb1 rb0
	
	TRISBbits.TRISB0 = 1;
	TRISBbits.TRISB1 = 1;
	
	// timer t2 
	
	T2CONbits.TCKPS = 1; // 1:32 prescaler (i.e Fout_presc = 625 KHz)
 	PR2 = 49999; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
 	TMR2 = 0; // Reset timer T2 count register
 	T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the
	
	// oc4
	
	OC4CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
	OC4CONbits.OCTSEL = 0;// Use timer T2 as the time base for PWM generation
	OC4RS = 20000; // Ton constant
	OC4CONbits.ON = 1; // Enable OC1 module 

	while(1){
	
		int rb0 = PORTBbits.RB0;
		int rb1 = PORTBbits.RB1;
				
		if( rb1 == 0 && rb0 == 1){
		
			OC4RS = 7500;
		
		
		}else if(rb1 == 1 && rb0 == 1){
		
			OC4RS = 40000;			
	
		}
	
	
		resetCoreTimer();
		while(readCoreTimer() < 10000);
	
	}
	
	return 0;


}     
