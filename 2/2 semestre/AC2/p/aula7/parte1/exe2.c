/*Integre no programa anterior o sistema de visualização em displays de 7 segmentos. Faça
as alterações que permitam a visualização do valor da tensão nos displays de 7 segmentos,
em decimal. */

# include <detpic32.h>

volatile unsigned char voltage = 0;

void delay(unsigned int ticks){
    resetCoreTimer(); // Corregida la 'T' mayúscula
    while(readCoreTimer() < ticks);
}

unsigned char tobcd(unsigned char value){
    return(((value / 10) << 4 )| (value % 10));
}

void send2displays(unsigned char value){

    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    static char displayFlag = 0;

    unsigned char high = value >> 4;
    unsigned char low = value & 0x0F;

    if(displayFlag == 0)
    {
        // 1. Seleccionar el Display Menos Significativo (Unidades)
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        // 2. Enviar el patrón de segmentos al puerto B (bits 8 al 15)
        LATB = (LATB & 0x00FF) | (display7scodes[low] << 8);
    }
    else
    {
        // 1. Seleccionar el Display Más Significativo (Decenas con punto decimal)
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        // 2. Enviar el patrón activando además el bit 7 (0x80) para encender el punto decimal (V.)
        LATB = (LATB & 0x00FF) | ((display7scodes[high] | 0x80) << 8);
    }

    displayFlag = !displayFlag; // Alternar para la siguiente llamada
}

void _int_(27) isr_adc(void){
    
    int i , sum = 0 , average , v_amplitude;

    int *p = (int *)(&ADC1BUF0);
    for( i = 0 ; i < 8; i++){
        sum += p[i*4];
    }

    average = sum / 8;

    v_amplitude = ((average * 33 + 511) / 1023);

    voltage = tobcd(v_amplitude);

    IFS1bits.AD1IF = 0;
}

int main(void){
     unsigned int count = 0;

    // diplay 

    TRISB = TRISB & 0x00FF; // rb8 a rb15 salida display 
    TRISDbits.TRISD5 = 0; // salida 
    TRISDbits.TRISD6 = 0; // salida 

    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 8-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequen

    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts 
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag
    IEC1bits.AD1IE = 1; // enable A/D interrupts 
    EnableInterrupts(); // Macro defined in "detpic32.h" 

    while(1)
    {
        if(count == 0){
            AD1CON1bits.ASAM = 1; // Start conversion 
        }

        send2displays(voltage);
        count = (count + 1) % 20;

        delay(200000);
    }
    return 0;
    

}


/*// El Core Timer del MIPS incrementa cada 2 ciclos de reloj.
    // Como la frecuencia del CPU es de 40 MHz, se incrementa a 20 MHz.
    // 20 MHz significa 20,000,000 ciclos por segundo, o 20,000 ciclos por milisegundo (ms).
    resetCoreTimer();
    while(readCoreTimer() < (20000 * ms));*/