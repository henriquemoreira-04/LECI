#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK/1000));
}

void send2displays(unsigned char value){
    static const char disp7Scodes[] = {
        0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
    };
    static char displayflag = 0;
    int dlow = value & 0x0F;
    int dhigh = value >> 4;

    if(displayflag == 0){
        LATDbits.LATD5 = 1; LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | (disp7Scodes[dlow] << 8); // [cite: 34]
    } else {
        LATDbits.LATD5 = 0; LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | (disp7Scodes[dhigh] << 8); // [cite: 33, 34]
    }
    displayflag = !displayflag;
}

unsigned char toBcd(unsigned char value){
    return (((value / 10) << 4) + (value % 10)); // [cite: 143]
}

int main(void){
    unsigned int i, counter = 0;
    int ledtimer = 0;
    int nIter; // Variable para el número de refrescos

    // Configuración de puertos
    TRISB = (TRISB & 0x80FF) | 0x0001; // RB8-14 out, RB0 in [cite: 32, 34, 144]
    TRISD = TRISD & 0xFF9F;            // RD5-6 out [cite: 33]
    TRISE = TRISE & 0xFF00;            // RE0-7 out [cite: 138]
    TRISCbits.TRISC14 = 0;             // RC14 (LED D11) out [cite: 146]
    
    LATCbits.LATC14 = 0; // Empezar apagado

    while(1){
        // 1. Decidir la frecuencia de la cuenta según el switch DS1 [cite: 144, 145]
        // Ascendente (5Hz): 200ms / 10ms = 20 iteraçoes
        // Descendente (2Hz): 500ms / 10ms = 50 iteraçoes
        nIter = (PORTBbits.RB0 == 1) ? 20 : 50;

        // 2. Bucle ÚNICO de refresco y temporización del LED
        i = 0;
        do {
            send2displays(toBcd(counter));
            delay(10); // Refresco a 100 Hz [cite: 132]

            if(ledtimer > 0) {
                LATCbits.LATC14 = 1;
                ledtimer--; // Resta 10ms cada ciclo
            } else {
                LATCbits.LATC14 = 0;
            }
        } while(++i < nIter);

        // 3. Lógica de incremento/decremento y límites
        if(PORTBbits.RB0 == 1) { // Modo UP
            counter = (counter + 1) % 60;
            if(counter == 59) ledtimer = 500; // 500 * 10ms = 5s [cite: 146]
        } 
        else { // Modo DOWN
            if(counter == 0) {
                ledtimer = 500;
                counter = 59;
            } else {
                counter--;
            }
        }

        // Mostrar en puerto E (LEDs) en BCD [cite: 138, 140]
        LATE = (LATE & 0xFF00) | toBcd(counter);
    }
    return 0;
}