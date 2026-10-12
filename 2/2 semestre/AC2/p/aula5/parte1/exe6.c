/*Com a frequência de refrescamento usada no exercício anterior continua a notar-se a
comutação entre os dois displays, efeito que é comum designar-se por flicker. De modo a
diminuir, ou mesmo eliminar, o flicker, a frequência de refrescamento (refresh rate) tem que
ser aumentada.
Mantendo a frequência de atualização do contador em 5Hz, altere o programa anterior de
forma a aumentar a frequência de refrescamento de 50 Hz (20 ms) para 100 Hz (10 ms), e
observe os resultados. */


#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK/1000));
}

void send2displays(unsigned char value){
    static const char disp7Scodes[] = {
        // numeros de 0 a 9
        0x3F , 0x06,  0x5B,  0x4F, 0x66, 0x6D,0x7D,  0x07 , 0x7F, 0x6F,

        // letras de A a F

        0x77 , 0x7C , 0x39 ,  0x5E, 0x79, 0x71};

        static char displayflag = 0;

        int dlow = value & 0x0F;
        int dhigh = value >> 4;

        if(displayflag == 0){
            LATDbits.LATD5 = 1;
            LATDbits.LATD6 = 0;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dlow] << 8);
        }
        else{
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 1;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dhigh] << 8);
        }

        displayflag = !displayflag;
}

int main(void){
    unsigned int i;
    unsigned int counter = 0;

    // rb8-rb14 outputs;
    TRISB = TRISB & 0x80FF;
    // rd5 - rd6 outputs
    TRISD = TRISD & 0xFF9F;

    while(1){
        i = 0;
        do{
            send2displays(counter);
            delay(10); // frecuencia de refresco 100 Hz = 1/100 = 0.01s = 10ms
            ++i;
        }while(i < 20); // frecuencia de aumento 5 Hz = 1/5 = 0.2s = 200ms   200/10 = 20

        counter = (counter + 1) % 256;
    }
    return 0;

}

// aumentamos la velocudad a 10 ms para quitar el flicker , osea que np tenga los parpadeos

