/*2. Pretende-se estender o funcionamento do contador, permitindo controlar o seu
comportamento através de dois dip-switches da placa DETPIC32, DS4 (RB3) e DS1 (RB0):
• DS1 define o sentido da contagem: ON → contagem crescente; OFF → contagem
decrescente.
• DS4 controla o estado do contador: ON → funcionamento normal; OFF → contador em
pausa (i.e. incremento/decremento suspenso, mantendo-se a visualização).
A leitura dos dip-switches deve ser efetuada continuamente, influenciando o comportamento
do contador em tempo real, e deve ser feita na RSI do timer T2. */


#include <detpic32.h>

#define TIMER1_VECTOR 4
#define TIMER2_VECTOR 8

// Variables globales compartidas entre las RSI
volatile unsigned char global_counter = 0; // Almacena el valor en BCD para los displays
volatile char flag_pause = 0;             // 0 -> Funcionamiento normal, 1 -> Pausa
volatile char flag_direction = 1;         // 1 -> Crescente, 0 -> Decrescente

// Función auxiliar para convertir decimal a BCD
unsigned char tobcd(unsigned char value){
    return (((value / 10) << 4) | (value % 10));
}

// Función de multiplexación de los displays (100 Hz)
void send2displays(unsigned char value){
    static const char display7scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    static char displayFlag = 0;

    unsigned char high = value >> 4;   // Decenas
    unsigned char low = value & 0x0F;  // Unidades

    if(displayFlag == 0)
    {
        LATDbits.LATD5 = 1; // Activa unidades
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x00FF) | (display7scodes[low] << 8);
    }
    else
    {
        LATDbits.LATD5 = 0; 
        LATDbits.LATD6 = 1; // Activa decenas
        LATB = (LATB & 0x00FF) | (display7scodes[high] << 8);
    }

    displayFlag = !displayFlag;
}

// =============================================================================
// RSI TIMER 1 - Actualización del contador (Frecuencia efectiva: 1 Hz)
// =============================================================================
void _int_(TIMER1_VECTOR) isr_T1(void){
    static int div_software = 0;
    static int internal_count = 0; // Cuenta decimal de 0 a 29

    div_software++;
    if(div_software >= 2) // Base física de 2 Hz dividida por 2 por software = 1 Hz
    {
        div_software = 0;
        
        // EXCLUSIVO: Solo incrementa o decrementa si NO está en pausa (DS4 == ON)
        if(flag_pause == 0) 
        {
            if(flag_direction == 1) 
            {
                // Contar hacia arriba: 0, 1, 2 ... 28, 29, 0
                internal_count = (internal_count + 1) % 30; 
            }
            else 
            {
                // Contar hacia abajo: 29, 28 ... 1, 0, 29
                internal_count = (internal_count + 29) % 30; 
            }
            
            global_counter = tobcd(internal_count); // Convertir a BCD para la pantalla
        }
    }

    IFS0bits.T1IF = 0; // Limpiar bandera del Timer 1
}

// =============================================================================
// RSI TIMER 2 - Refresco visual y Lectura de Dip-Switches (Frecuencia: 100 Hz)
// =============================================================================
void _int_(TIMER2_VECTOR) isr_T2(void){
    
    // 1. LEER LOS DIP-SWITCHES EN TIEMPO REAL (Exigencia del enunciado)
    // DS1 (RB0): ON (1) -> Crescente; OFF (0) -> Decrescente
    flag_direction = PORTBbits.RB0; 

    // DS4 (RB3): ON (1) -> Normal (flag_pause=0); OFF (0) -> Pausa (flag_pause=1)
    if(PORTBbits.RB3 == 1) {
        flag_pause = 0; // Funcionamiento normal
    } else {
        flag_pause = 1; // Suspender incremento/decremento
    }

    // 2. MANTENER LA VISUALIZACIÓN EN LOS DISPLAYS
    send2displays(global_counter); 

    IFS0bits.T2IF = 0; // Limpiar bandera del Timer 2
}

// =============================================================================
// FUNÇÃO PRINCIPAL
// =============================================================================
int main(void){

    // 1. CONFIGURACIÓN DE PUERTOS PARA LOS DISPLAYS
    TRISB = TRISB & 0x00FF;  // RB8 a RB15 como salidas para segmentos
    TRISDbits.TRISD5 = 0;    // RD5 salida (control display derecho)
    TRISDbits.TRISD6 = 0;    // RD6 salida (control display izquierdo)

    // 2. CONFIGURACIÓN DE ENTRADAS PARA LOS DIP-SWITCHES
    TRISBbits.TRISB0 = 1;    // RB0 (DS1) configurado como entrada digital
    TRISBbits.TRISB3 = 1;    // RB3 (DS4) configurado como entrada digital

    // 3. CONFIGURACIÓN TIMER 1 (Base física: 2 Hz)
    T1CONbits.TCKPS = 3;     // Prescaler 1:256
    PR1 = 39062;             
    TMR1 = 0;                
    IPC1bits.T1IP = 3;       // Prioridad Alta (Nivel 3)
    IEC0bits.T1IE = 1;       
    IFS0bits.T1IF = 0;       
    T1CONbits.TON = 1;       

    // 4. CONFIGURACIÓN TIMER 2 (Frecuencia: 100 Hz)
    T2CONbits.TCKPS = 5;     // Prescaler 1:32
    PR2 = 62499;             
    TMR2 = 0;                
    IPC2bits.T2IP = 2;       // Prioridad Baja (Nivel 2)
    IEC0bits.T2IE = 1;       
    IFS0bits.T2IF = 0;       
    T2CONbits.TON = 1;       

    // 5. ACTIVACIÓN GLOBAL DEL SISTEMA
    EnableInterrupts();

    while(1)
    {
        IdleMode(); // CPU en bajo consumo
    }
    return 0;
}