//Repita o exercício anterior para um contador decrescente módulo 10, atualizado a uma
//frequência de 2.7Hz.
//Para o decremento do contador (módulo 10) poderá fazer: 

#include <detpic32.h>

int main(void){
    
    // configurar losp puertos re3-re6 como salida
    TRISE = TRISE & 0xFF87;
    // colocar el contador en 9 de ahi para abajo
    unsigned int counter = 9;

    while(1){
        // actualizar los puertos de salida 
        LATE = ((LATE & 0xFF87) | counter << 3 );

        resetCoreTimer();
        // 2.7 hz 
        while( readCoreTimer() < 7407407 );
        // aqui para no tener problemas con los negativos 
        counter = ((counter - 1 + 10) % 10);
    }
    return 0;

}
