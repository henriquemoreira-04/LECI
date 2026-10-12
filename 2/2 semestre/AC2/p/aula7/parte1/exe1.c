/*O programa-esqueleto apresentado de seguida mostra a estrutura-base do programa para 
interagir com a ADC utilizando interrupções, ainda numa versão simplificada.  
Na  função  main(),  após  as  configurações  iniciais,  é  dada  ordem  de  conversão  à  ADC, 
seguindo-se a entrada do programa num ciclo infinito. Quando a ADC termina a conversão, 
gera uma interrupção e o programa salta para a respetiva RSI. Nessa rotina, o resultado da 
conversão é lido e impresso. 
Antes de terminar, a RSI dá nova ordem de conversão à ADC e regressa ao ciclo infinito do 
programa  principal.  Sempre  que  uma  conversão  termina,  é  gerado  um  novo  pedido  de 
interrupção e o processo repete-se, caraterizando um funcionamento em free run mode. 
Neste primeiro exercício pretende-se que a ADC gere a interrupção ao fim de 1 conversão 
(SMPI=0)*/

#include <detpic32.h>

void _int_(27) isr_adc(void){

    int valor_adc = ADC1BUF0;

    printInt(valor_adc, 16 | (3 << 16)); // valor hexadecimal con 3 digitos 
    putChar("\n"); // slat de la linea 

    AD1CON1bits.ASAM = 1; // comenzar la conversion 

    IFS1bits.AD1IF = 0; // Reset AD1IF flag 

}

int main(void){

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

    }
    return 0;
}
