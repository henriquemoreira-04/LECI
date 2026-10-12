// formulas importantes
#include <detpic32.h>

/*

//valor_escalar = ((media * 15 + 511) /1023) + 0;

 // PR3 = 20 mhz / f x k   =  

 //oc4 = (prx + 1 ) * duty  = 19231

73 - 7 = 66 

tempp  =   ()

pr3 = 20 m / 250   x  2 -1  =  39999  1:2  1 

ms = 1/ hz x 20mhz 

U2BRG = (20000000 / 16 * x) - 1

00 8 bits datos sem paridad
01 8 bits par even 
10 8 bits impar not even 
11 9 bits sem paridad 



*/
 

void send2displays(unsigned char value){

    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    static char displayflag = 0;

    int dlow = value & 0x0F;
    int dhigh = value >> 4;

    if(displayflag == 0){

        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = ((LATB & 0x00FF) | (display7scodes[dlow] << 8));


    }else{

        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = ((LATB & 0x00FF) | (display7scodes[dhigh] << 8));
    }

    displayflag = !displayflag;

}

void delay_13s(void){

    resetCoreTimer();
    while(readCoreTimer() < 26000000);

}


unsigned char tobcd(unsigned char val){

    return(((val / 10) << 4) | (val % 10));
}



// vector timer 3 12  timer 2 8 timer 1 4  UART2  32 


// adc guion 6 

TRISBbits.TRISBx = 1; // RBx digital output disconnected
AD1PCFGbits.PCFGx= 0; // RBx configured as analog input
AD1CON1bits.SSRC = 7; 
AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
AD1CON2bits.SMPI = N-1; // Interrupt is generated after N samples
AD1CHSbits.CH0SA = x; // replace x by the desired input
AD1CON1bits.ON = 1; // Enable A/D 

// timer  guion 8


T2CONbits.TCKPS = 5; 
PR2 = 62499; 
TMR2 = 0; 
T2CONbits.TON = 1;

// timer e interrupciones  guion 7 

T2CONbits.TCKPS = 5; 
PR2 = 62499; 
TMR2 = 0; 
T2CONbits.TON = 1;

IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6])
IEC0bits.T2IE = 1; // Enable timer T2 interrupts
IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag 
EnableInterrupts();

// guia  6 

AD1CON1bits.ASAM = 1; // Start conversion

while( IFS1bits.AD1IF == 0 );

IFS1bits.AD1IF = 0

ADC1BUF0;

AD1CON1bits.ASAM = 1; // Start conversion 

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        int *p = (int *)(&ADC1BUF0);

        soma = 0;

        for( i = 0; i < 2; i++){

            soma = soma + p[i*4];
        }

        media = soma / 2;

        valor_escalar = ((media * 15 + 511) /1023) + 0;

        send2display(valor_escalar);

        IFS1bits.AD1IF = 0;

        LATEbits.LATE2 = !LATEbits.LATE2;        

        delay(4000000);

 
// OC guion 8

// timer configuration sequence)
 OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
 OC1CONbits.OCTSEL = x;// Use timer T2 = 0 T3 = 1  as the time base for PWM generation
 OC1RS = x; // valor 
 OC1CONbits.ON = 1; // Enable OC1 module 

 // UART

UxBRG = x;          // El número calculado con la fórmula
UxMODEbits.BRGH = x;  // 0 si divides por 16, 1 si es por 4 (velocidades altas)

UxMODEbits.PDSEL = x; // Paridad (0=Ninguna, 1=Par, 2=Impar)
UxMODEbits.STSEL = x; // Stop bits (0=1 stop bit, 1=2 stop bits)

UxSTAbits.UTXEN = 1;  // Activa Transmisión
UxSTAbits.URXEN = 1;  // Activa Recepción

// uart interrupcion 

U2STAbits.URXISEL = 0;
IEC1bits.U2RXIE = 1;
IEC1bits.U2TXIE = 0;
IPC8bits.U2IP = 3;
IFS1bits.U2RXIF = 0;
U2MODEbits.ON = 1;
EnableInterrupts();


 void putc(char byte) {
    while (U2STAbits.UTXBF == 1); // Espera mientras el buffer de transmisión esté lleno
    U2TXREG = byte;               // Escribe el byte en el registro de transmisión
}

void putstr(char *str) {
    while (*str != '\0') {
        putc(*str);               // Envía el carácter actual apuntado
        str++;                    // Avanza al siguiente carácter en memoria
    }
}




