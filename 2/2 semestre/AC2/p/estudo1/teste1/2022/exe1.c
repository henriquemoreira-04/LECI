/*
Questão 1 [6.5 valores]
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 
6 LEDs ligados aos portos RE5 a RE0, o padrão 000001, 000010, 000100, ..., 100000, 000001, 000010, ..., 
100000, 000001, ... O padrão deve mudar com uma frequência que depende do estado lógico do "switch" DS3 
(ligado ao porto RB2): DS3 OFF, f=3Hz; DS3 ON, f=7Hz. O valor da frequência deve ser obtido com o menor 
erro possível.
Edite o seu programa no ficheiro f11.c.
*/


#include <detpic32.h>

void delay(unsigned int ticks){
	resetCoreTimer();
	while(readCoreTimer() < ticks);
	}
	
int main(void){

	TRISE  =  TRISE & 0xFFC0; 
	
	TRISBbits.TRISB2 = 1; // entrada 
	
	unsigned int patron = 1;
	unsigned int ticks_espera;
	
	while(1){
		
		LATE  = (LATE & 0xFFC0) | (patron);
		
		unsigned int ds3 = PORTBbits.RB2;
		
		if(ds3 == 0){ // 3 hz =  6666666
			ticks_espera = 6666666;
		
		
		}else{ // 7 hz 2857142
		
		ticks_espera = 2857142; }
		
		delay(ticks_espera);
		
		if(patron == 32 ){
		
			patron = 1;
		}
		
		else{ patron = patron << 1;
		
		}
		
	
			
	
	}
	return 0;

	

}

