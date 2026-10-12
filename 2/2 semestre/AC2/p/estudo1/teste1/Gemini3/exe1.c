/*

Questão 1 [10 valores]
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 
6 LEDs ligados aos portos RE5 a RE0, o padrão 110000, 011000, 001100, ..., 000011, 110000... (valor inicial: 
110000). O padrão deve mudar com uma frequência que depende do estado lógico dos "switches" DS4 e DS3 
(ligados aos portos RB3 e RB2): ambos OFF, f=2Hz; ambos ON, f=6Hz; qualquer outra combinação mantém a 
frequência anterior (valor inicial: 6Hz). O valor da frequência deve ser obtido com o menor erro possível.
Edite o seu programa no ficheiro f1.c.

*/

void delay(unsigned int ms){
	resetCoreTimer();
	while(readCoreTimer() < ms);
}

int main(void){

	TRISE = TRISE & 0xFFC0; // salida re5 re0 
	
	// sw ds4 ds3 rb3 rb2 
	
	TRISBbits.TRISB3 = 1;
	TRISBbits.TRISB2 = 1;
	
	unsigned int patron = 48;
	unsigned int frecuencia = 3333333 ; // 6 hz
	
	while(1){
	
		LATE = (LATE & 0xFFC0) | (patron);
		
		unsigned int ds4 =  PORTBbits.RB3;
		unsigned int ds3 =  PORTBbits.RB2;
		
		if( ds4 == 0 && ds3 == 0){
		
			frecuencia = 10000000;
		}else if(ds4 == 1 && ds3 == 1){
		
			frecuencia = 3333333;
		}
		
		if(patron == 3){
			
			patron = 48;
		
		}else{
			patron = patron >> 1;
		
		}
	
	
	
	}
	return 0;
}





// 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111

// 1 2 3 4 5 6 7 8 9 a b c d e f

// re5 re0     7654  3210
//              ff 110 0   0 0 0 0 
