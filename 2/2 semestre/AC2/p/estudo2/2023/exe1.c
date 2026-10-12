/*

Escreva e teste um programa que faça todas as configurações necessárias e que 
gere na saída OC2 do PIC32 um sinal com uma frequência de 120Hz e "duty-cycle" 
dependente do estado dos "switches" DS3 e DS1 (ligados aos portos RB2 e RB0, respetivamente),
 de acordo com a especificação seguinte (valor inicial do "duty-cycle" - 75%):

RB2: 0, RB0: 0 -> 30%

RB2: 1, RB0: 1 -> 55%

Restantes combinações -> mantém o valor de "duty-cycle" anterior

O programa deve verificar, a cada 360 µs, o valor presente nos "
switches" e alterar o "duty-cycle" do sinal de saída, em conformidade (para esta temporização deve ser usado o Core Timer).

Deve ser usado o timer T3 como referência e a sua configuração 
deve permitir a geração do sinal PWM com a máxima resolução possível.

*/

// pr3  = (20000000)/(120 x ) - 1  = 41666  1:4 

// oc2 = (41666 + 1) * 0,75 = 31250
// oc2 = (41666 + 1) * 0,30 = 12500
// oc2 = (41666 + 1) * 0,55 =  22917
// 7200

#include <detpic32.h>

int main(void){

	// rb2 rb0 
	
	TRISBbits.TRISB0 = 1; // entrada
	TRISBbits.TRISB2 = 1;
	
	// config timer 
	
	T2CONbits.TCKPS = 2; 
	PR2 = 41666; 
	TMR3 = 0; // Clear timer T2 count register
	T2CONbits.TON = 1; // Enable 
	
	// config OC2
	
	OC2CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
 	OC2CONbits.OCTSEL = 1;// Use timer T3 as the time base for PWM generation
 	OC2RS = 31250; // Ton constant
 	OC2CONbits.ON = 1; // Enable OC1 module 
 	
 	while(1){
 		int rb0 = PORTBbits.RB0;
 		int rb2 = PORTBbits.RB2;
 		
 		// 1 rb2 0 rb0 0 30 
 		
 		if(rb2 == 0 && rb0 ==0){
 		
 			OC2RS = 12500;
 			
 		}else if(rb2 == 1 && rb0 ==1){
 		
 				OC2RS = 22917;
 			
 		}
 		
 		resetCoreTimer();
 		while(readCoreTimer() < 7000);
 	
 	}
 	return 0;
 	
 }
