/*O objetivo deste exercício é implementar um contador BCD crescente módulo 30, com
visualização nos dois displays de 7 segmentos da placa DETPIC32. O contador deve
incrementar a uma frequência de 1 Hz, gerada por interrupção do timer T1. O refrescamento
dos displays deve ser feito a uma frequência de 100 Hz, gerada por interrupção do timer T2.
Devem ser efetuadas todas as configurações necessárias ao correto funcionamento do
sistema e utilizada a função send2displays previamente desenvolvida. Justifique a
necessidade de atribuir maior prioridade às interrupções do timer T1 relativamente às do
timer T2, considerando a consistência dos dados enviados para os displays. */

#include <detpic32.h>


unsigned char tobcd(unsigned char value){
    return(((value / 10) << 4 ) | (value % 10));
}


volatile unsigned char global_counter = 0;

void send2displays(unsigned char value){
    static const char disp7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    static char displayflag = 0;

    int dlow = value & 0x0F;
    int high = value >> 4;

    if(displayflag == 0){

        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = ((LATB & 0x00FF) | (disp7scodes[dlow] << 8));
    }
    else{

        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1  ;
        LATB = ((LATB & 0x00FF) | (disp7scodes[high] << 8));

    }

    displayflag = !displayflag;

}

void _int_(4) isr_T1(void){

    static int div_software = 0;
    static int internal_count = 0;

    div_software++;

    if(div_software >= 2){

        div_software = 0;

        internal_count = (internal_count + 1) % 30;
        global_counter = tobcd(internal_count);
    }

    IFS0bits.T1IF = 0; 

}

void _int_(8) isr_T2(void){

    send2displays(global_counter);

    IFS0bits.T2IF = 0;

}

int main(void){

    // 1. CONFIGURACIÓN DE PUERTOS DIGITALES PARA LOS DISPLAYS
    TRISB = TRISB & 0x00FF;  // RB8 a RB15 configurados como salidas para los segmentos
    TRISDbits.TRISD5 = 0;    // RD5 salida (Control de display unidades)
    TRISDbits.TRISD6 = 0;    // RD6 salida (Control de display decenas)

    // 2. CONFIGURACIÓN TIMER 1 (Base física: 2 Hz para lograr 1 Hz por software)
    T1CONbits.TCKPS = 3;     // Prescaler 1:256 (Código 3 en Tipo A)
    PR1 = 39062;             // Periodo calculado
    TMR1 = 0;                // Limpiar cuenta
    
    // Configuración de la RSI de T1:
    IPC1bits.T1IP = 3;       // PRIORIDAD ALTA (Nivel 3) para asegurar consistencia
    IEC0bits.T1IE = 1;       // Habilitar interrupciones de T1
    IFS0bits.T1IF = 0;       // Limpiar bandera
    
    T1CONbits.TON = 1;       // Arrancar Timer 1


    // 3. CONFIGURACIÓN TIMER 2 (Frecuencia: 100 Hz para refresco visual)
    T2CONbits.TCKPS = 5;     // Prescaler 1:32 (Código 5 en Tipo B)
    PR2 = 62499;             // Periodo calculado
    TMR2 = 0;                // Limpiar cuenta
    
    // Configuración de la RSI de T2:
    IPC2bits.T2IP = 2;       // PRIORIDAD BAJA (Nivel 2) subordinada al Timer 1
    IEC0bits.T2IE = 1;       // Habilitar interrupciones de T2
    IFS0bits.T2IF = 0;       // Limpiar bandera
    
    T2CONbits.TON = 1;       // Arrancar Timer 2


    // 4. ACTIVACIÓN DEL SISTEMA GLOBAL
    EnableInterrupts();

    while(1)
    {
        IdleMode(); // La CPU descansa y el hardware gestiona de forma asíncrona las RSI
    }
    return 0;
}