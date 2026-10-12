/*Escreva um programa que faça todas as configurações necessárias e que gere na saída 
OC2 do PIC32 um sinal com uma frequência de 150Hz e "duty-cycle" dependente do estado dos 
"switches" DS4 e DS1 (ligados aos portos RB3 e RB0, respetivamente), de acordo com a 
especificação seguinte (valor inicial do "duty-cycle" - 25%):

RB3: 0, RB0: 1 -> 25%

RB3: 1, RB0: 0 -> 70%

Restantes combinações -> mantém o valor de "duty-cycle" anterior

O programa deve verificar, a cada 250 µs, o valor presente nos "switches" 
e alterar o "duty-cycle" do sinal de saída, em conformidade (para esta temporização deve ser usado o Core Timer).

Deve ser usado o timer T2 como referência e a sua configuração deve 
permitir a geração do sinal PWM com a máxima resolução possível.*/

// pr2 = (20000000)/(150 * 4) - 1  = 33332  1:4  2
// oc2 = ( 33332 + 1) * 0.25 =  8333
//oc2 = ( 33332 + 1) * 0.70 = 23333
// 250 * 10^-6 * 20 * 10^6 = 5000

#include <detpic32.h>

int main(void){

	// rb3 e rb0 entrada 
	
	TRISBbits.TRISB0 = 1;
	TRISBbits.TRISB3 = 1;
	
	// timer T2 
	
	T2CONbits.TCKPS = 2;
 	PR2 = 33332; // 
 	TMR2 = 0; // Clear timer T2 count register
 	T2CONbits.TON = 1;
 	
 	// OC2 
 	
 	OC2CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
 	OC2CONbits.OCTSEL =0;// Use timer T2 as the time base for PWM generation
 	OC2RS = 8333; // Ton constant
 	OC2CONbits.ON = 1; // Enable OC1 module 
	

	while(1){
	
	int rb3 = PORTBbits.RB3;
	int rb0 = PORTBbits.RB0;
	
	if(rb3 ==0 && rb0 == 1 ){
		
		OC2RS = 8333;
		
	
	}else if(rb3 ==0 && rb0 == 1){
	
		
		OC2RS = 23333;
	
	}
	
	resetCoreTimer();
	while(readCoreTimer() < 5000);
	
	}
	return 0;

}
