/*Retome o exercício 6 da aula prática n.º 6. Nesse exercício implementou-se um sistema para
adquirir o valor da tensão na entrada AN4 da ADC e para visualizar o valor dessa tensão nos
displays de 7 segmentos. A frequência de amostragem da ADC era 5 Hz e a frequência de
refrescamento do sistema de visualização era 100 Hz. Estas frequências eram obtidas
através do Core Timer, usando polling.
Pretende-se agora a utilização de timers com atendimento por interrupção para controlar o
funcionamento do sistema:
• timer T1: determina a frequência de amostragem, i.e., o ritmo de leitura da entrada
analógica;
• timer T3: determina a frequência de refrescamento do sistema de visualização. 

a) Determine as constantes relevantes para que o timer T1 (tipo A) gere eventos de
interrupção a cada 200 ms (5 Hz) e o timer T3 (tipo B) gere eventos de interrupção a cada
10 ms (100 Hz)

timer 1 tipo A 5 hz 

PR1 =  (20mhz / 256 * 5 ) - 1  = 15634 1:3 

timer 3 tipo b 100 hz

pr3 = 20 mhz /   6249       1: 32  5 

b) Escreva o programa principal, onde, no essencial, se faz a configuração de todos os
dispositivos em utilização e se ativam globalmente as interrupções. 



*/

#include <detpic32.h>

volatile int voltage = 0;

void configureall(void){

     // displays 

    TRISB = TRISB & 0x00FF;     // RB8 a RB15 como saídas (segmentos)
    TRISDbits.TRISD5 = 0;       // RD5 como saída (display unidades)
    TRISDbits.TRISD6 = 0;

    // ADC 

    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 4 - 1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration 

    IPC6bits.AD1IP = 2;         // Prioridad de interrupción de la ADC = 2
    IFS1bits.AD1IF = 0;         // Limpiar bandera de aviso de la ADC
    IEC1bits.AD1IE = 1;         // Habilitar el permiso local de interrupción de la ADC

    
    // timer 1  tipo a 

    T1CONbits.TCKPS = 3; // 1:32 prescaler (i.e. fout_presc = 625 KHz)
    PR1 = 15624; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR1 = 0; // Clear timer T2 count register
    IPC1bits.T1IP = 3; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T2 interrupts
    IFS0bits.T1IF = 0; // Reset timer T2 interrupt flag 
    T1CONbits.TON = 1;

    // timer 3 tipo b 

    T3CONbits.TCKPS = 5; // 1:32 prescaler (i.e. fout_presc = 625 KHz)
    PR3 = 62499; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR3 = 0; // Clear timer T2 count register
    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag 
    T3CONbits.TON = 1;



}

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK/1000));
}

void send2displays(unsigned char value){

    static const char disp7scodes[] = {
        //0 a 9
        // numeros de 0 a 9
        0x3F , 0x06,  0x5B,  0x4F, 0x66, 0x6D,0x7D,  0x07 , 0x7F, 0x6F,

        // letras de A a F

        0x77 , 0x7C , 0x39 ,  0x5E, 0x79, 0x71};

    static char displayflag = 0;

    int dlow = value & 0x0F; // prender la parte baja 0000 1111
    int dhigh = value >> 4; // prende la parte alta 

    if(displayflag == 0){
        // display low 
        LATDbits.LATD5 = 1; 
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x00FF) | (disp7scodes[dlow] << 8); 

    }else{
        // display high 
        // display low 
        LATDbits.LATD5 = 0; 
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x00FF) | (disp7scodes[dhigh] << 8); 
    }

    displayflag = !displayflag;



}

unsigned char tobcd(unsigned char value){
    return( (value / 10) << 4 | (value % 10));
}


void _int_(4) isr_T1(void){
    
    // [EDITADO] Solo damos la orden de inicio y salimos. ¡Ya no hay bucle while!
    AD1CON1bits.ASAM = 1;       

    IFS0bits.T1IF = 0;          // Limpiar bandera del Timer 1


}

void _int_(27) isr_adc(void){
    unsigned int j;
    unsigned int soma = 0;
    unsigned int media;

    // Entramos aquí automáticamente cuando las 4 muestras están 100% listas
    int *p = (int *)(&ADC1BUF0);
    for(j = 0; j < 4; j++){
        soma += p[j * 4];       // Sumar el contenido de los buffers del ADC
    }

    media = soma / 4;                    // Calcular la media de las 4 muestras
    voltage = (media * 33 + 511) / 1023; // Convertir valor digital a escala decimal (0-33)

    IFS1bits.AD1IF = 0;                  // Limpiar bandera del módulo ADC
}

void _int_(12) isr_T3(void){

    send2displays(tobcd(voltage));
    IFS0bits.T3IF = 0;


}

int main(void){

    configureall();

    IFS1bits.AD1IF = 0;
    IFS0bits.T1IF = 0;
    IFS0bits.T3IF = 0;


    EnableInterrupts();

    while(1)
    {
        IdleMode();
    }
    return 0;
    
   



}