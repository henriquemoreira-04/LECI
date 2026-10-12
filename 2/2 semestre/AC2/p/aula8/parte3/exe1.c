/*Faça um programa que, usando polling e a função delay(), ligue o LED0 durante 3
segundos, quando se prime o pulsador INT1 (o LED0 está ligado ao porto RE0). */

#include <detpic32.h>


void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < (20000 * ms));

}

int main(void){

    TRISEbits.TRISE0 = 0;     // Configurar RE0 como salida (para el LED0)
    LATEbits.LATE0 = 0;       // Inicializar el LED0 apagado
    
    TRISDbits.TRISD8 = 1;

    while(1){

        while(PORTDbits.RD8 == 1);

        LATEbits.LATE0 = 1;

        delay(3000);

        LATEbits.LATE0 = 0;
    }
    return 0;
}