/*Observe, para os diferentes valores de duty-cycle da alínea anterior, que o brilho do LED D11
(ligado ao porto RC14 da placa DETPIC32-IO) depende do valor do duty-cycle do sinal de
PWM gerado. Para isso configure como saída o porto RC14 e altere o programa principal de
modo a ler, em ciclo infinito, o valor do porto RD0 e a escrever o valor lido no porto RC14. */

#include <detpic32.h>

void setPWM(unsigned int dutycycle){
    if(dutycycle > 100) dutycycle = 100;
    OC1RS = (((PR3 + 1) * dutycycle) / 100);
}

int main(void){

    // =========================================================================
    // 1. CONFIGURAÇÃO DE PORTOS (I/O DIGITAL)
    // =========================================================================
    TRISDbits.TRISD0 = 1;       // Configurar RD0 (OC1) como ENTRADA para podermos ler a onda
    TRISCbits.TRISC14 = 0;      // Configurar RC14 (LED D11) como SAÍDA para controlar o brilho
    LATCbits.LATC14 = 0;        // Inicializar o LED apagado

    // =========================================================================
    // 2. CONFIGURAÇÃO DO TIMER T3 (Base de Tempo para 100 Hz)
    // =========================================================================
    T3CONbits.TCKPS = 3;        // Prescaler 1:8
    PR3 = 24999;                // Período para 100 Hz
    TMR3 = 0;                   // Reset ao contador
    
    // =========================================================================
    // 3. CONFIGURAÇÃO DO MÓDULO OC1 (PWM)
    // =========================================================================
    OC1CONbits.OCM = 6;         // Modo PWM
    OC1CONbits.OCTSEL = 1;      // Base de tempo: Timer 3
    
    // Teste aqui os valores do enunciado mudando este número (ex: 10, 65, 80)
    setPWM(5);                 // Configura o Duty Cycle 
    OC1R = OC1RS;               // Inicialização segura do registo primário
    
    // Ligar os módulos de hardware
    T3CONbits.TON = 1;          
    OC1CONbits.ON = 1;          

    // =========================================================================
    // 4. CICLO INFINITO DE POLLING DIRETO (Sem IdleMode)
    // =========================================================================
    while(1)
    {
        // Lê o valor lógico atual da onda PWM no porto RD0
        // e escreve-o diretamente no porto RC14 (LED D11)
        LATCbits.LATC14 = PORTDbits.RD0;
    }

    return 0;


}