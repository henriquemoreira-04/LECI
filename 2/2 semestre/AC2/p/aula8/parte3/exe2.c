/*Pretende-se agora fazer todo o processamento por interrupção (deteção e temporização).
Para isso, deve usar o timer 2 para gerar a temporização (3 segundos) e configurar o sistema
de interrupções para dar seguimento a interrupções do timer T2 e da entrada externa INT1.
A entrada INT1 deve ser configurada para gerar a interrupção na transição descendente
(registo INTCON<INT1EP>, ver página 89 do PIC32MX7XX Family Data Sheet). */

#include <detpic32.h>

// Mapeo oficial de vectores de interrupción (obtenidos del manual)
#define INT1_VECTOR 5
#define TIMER2_VECTOR 8

// Variable global compartida para contar el tiempo por software
// Se usa 'volatile' porque cambia dentro de una RSI asíncrona
volatile int timer2_ticks = 0; 

// =============================================================================
// 1. ROTINA DE SERVIÇO À INTERRUPÇÃO (RSI) - INTERRUPÇÃO EXTERNA INT1
// =============================================================================
void _int_(INT1_VECTOR) isr_INT1(void)
{
    LATEbits.LATE0 = 1;       // 1. Encender el LED0 inmediatamente al pulsar

    timer2_ticks = 0;         // 2. Resetear el contador de software
    TMR2 = 0;                 // 3. Resetear la cuenta del temporizador de hardware
    T2CONbits.TON = 1;        // 4. ENCENDER el Timer 2 para que empiece a contar los 3s

    /* * RESET DE BANDERA POR HARDWARE:
     * Según la tabla de la universidad: INT1 -> IFS0<7>. Ponemos a 0 el bit 7.
     */
    IFS0bits.INT1IF = 0;      
}

// =============================================================================
// 2. ROTINA DE SERVIÇO À INTERRUPÇÃO (RSI) - TIMER 2 (10 Hz -> Cada 100 ms)
// =============================================================================
void _int_(TIMER2_VECTOR) isr_T2(void)
{
    timer2_ticks++;           // Sumar 1 tick (ha pasado otra fracción de 100 ms)

    // LÓGICA DE CONTROL: 30 alertas x 100 ms = 3000 ms = 3 segundos exactos
    if (timer2_ticks >= 30)   
    {
        LATEbits.LATE0 = 0;   // 1. Apagar el LED0 (ya pasaron los 3 segundos)
        T2CONbits.TON = 0;    // 2. APAGAR el Timer 2 (detener el reloj hasta nuevo aviso)
        timer2_ticks = 0;     // 3. Resetear variable de control
    }

    /* * RESET DE BANDERA POR HARDWARE:
     * Según la tabla de la universidad: T2 -> IFS0<8>. Ponemos a 0 el bit 8.
     */
    IFS0bits.T2IF = 0;        
}

// =============================================================================
// 3. FUNÇÃO PRINCIPAL (MAIN)
// =============================================================================
int main(void)
{
    // -------------------------------------------------------------------------
    // CONFIGURACIÓN DE PUERTOS DIGITALES (I/O)
    // -------------------------------------------------------------------------
    TRISEbits.TRISE0 = 0;     // Configurar pin RE0 como salida digital (para el LED0)
    LATEbits.LATE0 = 0;       // Inicializar el LED0 en estado APAGADO

    TRISDbits.TRISD8 = 1;     // Configurar pin RD8 como entrada digital (pulsador INT1)

    // -------------------------------------------------------------------------
    // CONFIGURACIÓN DE LA INTERRUPÇÃO EXTERNA INT1 (Manual Pág. 89)
    // -------------------------------------------------------------------------
    INTCONbits.INT1EP = 0;    // bit INT1EP = 0 -> Configura flanco descendente (Falling Edge)
    IPC1bits.INT1IP = 2;      // IPC1<26:24>    -> Configurar prioridad de INT1 en nivel 2
    IFS0bits.INT1IF = 0;      // IFS0<7>        -> Limpiar bandera antes de activar la línea
    IEC0bits.INT1IE = 1;      // IEC0<7>        -> Habilitar el permiso local de INT1

    // -------------------------------------------------------------------------
    // CONFIGURACIÓN DEL TIMER T2 (Tipo B - Objetivo base: 10 Hz)
    // -------------------------------------------------------------------------
    /*
     * FÓRMULA DE DISEÑO: PR2 = (f_PBCLK / (K_PRESCALER * f_OUT)) - 1
     * Datos: f_PBCLK = 20 MHz, f_OUT = 10 Hz (cada interrupción = 100 ms).
     * Restricción Tipo B: K_PRESCALER máximo es 256.
     * PR2 = (20,000,000 / (256 * 10)) - 1 = (20,000,000 / 2560) - 1 = 7812.5 - 1 ≈ 7812
     * Validación: 7812 <= 65535 (Límite de 16 bits) -> ¡CÁLCULO VÁLIDO!
     */
    T2CONbits.TCKPS = 7;      // En Timers Tipo B, el código '7' equivale a Prescaler 1:256
    PR2 = 7812;               // Cargamos el valor de periodo calculado para 10 Hz
    TMR2 = 0;                 // Inicializamos el contador de tiempo actual en 0

    // Configuración de la RSI para T2 usando el mapa de registros:
    IPC2bits.T2IP = 2;        // IPC2<4:2>   -> Configurar prioridad de T2 en nivel 2
    IFS0bits.T2IF = 0;        // IFS0<8>     -> Limpiar bandera de T2
    IEC0bits.T2IE = 1;        // IEC0<8>     -> Habilitar el permiso local de T2

    /*
     * REQUISITO CLAVE: Iniciamos con el Timer APAGADO (TON = 0).
     * No debe contar tiempo hasta que el usuario pulse físicamente el botón INT1.
     */
    T2CONbits.TON = 0;        


    // -------------------------------------------------------------------------
    // HABILITACIÓN GLOBAL Y BUCLE ASÍNCRONO
    // -------------------------------------------------------------------------
    EnableInterrupts();       // Macro que activa el controlador central de interrupciones

    while(1)
    {
        /*
         * Colocamos el procesador en modo Idle. La CPU no ejecuta código, ahorrando
         * energía de manera drástica. El sistema despertará de forma automática
         * por hardware únicamente cuando ocurra un evento en INT1 o en el Timer 2.
         */
        IdleMode(); 
    }

    return 0;
}