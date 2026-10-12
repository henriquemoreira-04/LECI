// O  do programa seguinte é piscar o bit 14 do porto C (RC14), ao qual está ligado um
// LED na placa DETPIC32, a uma frequência de 1 Hz. Para a temporização pode utilizar-se a
//função delay() já apresentada anteriormente: 

// 1 hz = 0.5 s = 500 ms 

#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK / 1000));
}

int main(void) {

    // configurar el puerto RC14 como salida
    TRISCbits.TRISC14 = 0;
    
    while(1){
        delay(500);

        // aqui queremos invertir entonces usaremos el XOR ^

        LATC = LATC ^ (1 << 14);

    }
    return 0;
}
