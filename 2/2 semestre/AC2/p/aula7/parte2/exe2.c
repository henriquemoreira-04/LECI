/*Pretende-se agora estimar o overhead global associado ao atendimento de uma
interrupção no PIC32. Para esse efeito, é ainda necessário considerar o tempo
correspondente ao regresso ao programa interrompido, essencialmente determinado pelo
tempo de execução do epílogo (reposição do contexto salvaguardado no início da RSI).
Para medir esse tempo, coloque o porto de saída RD11 ao nível lógico 1 no final da RSI
(como última instrução da rotina) e volte a colocá-lo ao nível lógico 0 no ciclo infinito do
programa principal. Meça, com o osciloscópio, o intervalo de tempo durante o qual o porto
RD11 permanece ativo e expresse esse valor em número de ciclos de relógio. . Adicionando
esse valor ao obtido no ponto anterior, obtém-se uma boa estimativa do overhead global no
atendimento de uma interrupção no PIC32. */


#include <detpic32.h>

volatile int adc_value;

void _int_(27) isr_adc(void){

    adc_value = ADC1BUF0;
    AD1CON1bits.ASAM = 1;      // Start conversion (Free Run Mode)
    IFS1bits.AD1IF = 0;        // Reset AD1IF flag 

    LATDbits.LATD11 = 1; // SET RD11 = 1

}

int main(void){

    // rd11 como salida

    TRISDbits.TRISD11 = 0;
    LATDbits.LATD11 = 1; // iniciar en 1 para arrancar 

    // ADC 

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    // RBx digital output disconnected
    // RBx configured as analog input
    // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;
    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 1-1;
    // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4;
    // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1;
    // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence


    // RSI  

    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts 
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag 
    IEC1bits.AD1IE = 1; // enable A/D interrupts 

    EnableInterrupts();

    // comenzar la conversion en bucle 
    AD1CON1bits.ASAM = 1;

    while(1){

        LATDbits.LATD11 = 0;

    }
    return 0;
}
