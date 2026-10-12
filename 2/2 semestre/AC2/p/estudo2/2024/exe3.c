/*

Escreva e teste um programa que faça todas as configurações 
necessárias e que 
implemente a comunicação série entre a placa DETPIC32 (UART2) 
e o PC, funcionando de acordo com as seguintes especificações:

Parâmetros de comunicação: 
9600 bps, odd parity, 8 data bits, 2 stop bits.

Deve ser feito o eco de todos os carateres recebidos.

O estado do LED7 (ligado ao porto RE7), 
deve mudar sempre que for recebido um novo carater 
(valor inicial: 0).

Quando for recebido o carater 
'D' deve ser enviada a string "DSD=", 
seguida do valor decimal definido 
pelos 4 switches DS4 a DS1, ligados aos 
portos RB3 a RB0 (e.g. DSD=12).

O processamento de receção de 
um caracter deve 
ser feito, obrigatoriamente, por interrupção. 
O processamento de transmissão deve ser feito por polling.

NOTA: Nesta questão, a transmissão de 
informação deve ser realizada exclusivamente 
utilizando o código de acesso à UART que escrever 
para a resolução do exercício. Não é permitido o 
uso de system calls ou de qualquer outra função de 
impressão disponível.


U2BRG = (20000000 / 16 * x) - 1  = 129


*/

#include <detpic32.h>

void putc(char byte){

    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}

void putstr(char *str){
    while(*str != '\0'){
        putc(*str);
        str++;
    }
}

void _int_(32) isr_uart2(void){

    if(IFS1bits.U2RXIF ){

        char c = U2RXREG;
        putc(c);

        LATEbits.LATE7 = ! LATEbits.LATE7;

        if(c == 'D'){
            putstr("DSD=");

            int valorsw = PORTB & 0x000F;

            if(valorsw >= 10){
                putc((valorsw / 10) + '0');
            }
            putc((valorsw % 10) + '0');
        }

        IFS1bits.U2RXIF = 0;

    }



}

int main(void){

    // configurar led 7 RE7 y cvalor inicial 0

    TRISEbits.TRISE7 = 0;
    LATEbits.LATE7 = 0;

    // config los sw RB3 A RB0

    TRISB = TRISB | 0x000F;

    // configurar el UART (9600 , impar , 8 , 2)

    U2BRG = 129;          // El número calculado con la fórmula
    U2MODEbits.BRGH = 0;  // 0 si divides por 16, 1 si es por 4 (velocidades altas)

    U2MODEbits.PDSEL = 2; // Paridad (0=Ninguna, 1=Par, 2=Impar)
    U2MODEbits.STSEL = 1; // Stop bits (0=1 stop bit, 1=2 stop bits)

    U2STAbits.UTXEN = 1;  // Activa Transmisión
    U2STAbits.URXEN = 1;  // Activa Recepción

    // interrupcion UART 

    U2STAbits.URXISEL = 0; // interrpcion con un caracter 

    IEC1bits.U2RXIE = 1; //  habilitar interrupcion INTERRUP ENABLE 
    IEC1bits.U2TXIE = 0; // trasmision por polling , 0 

    IPC8bits.U2IP = 3; // Interrupt priority

    IFS1bits.U2RXIF = 0; // limpiar la bandera del la interrupcion e rx 


    U2MODEbits.ON = 1;

    EnableInterrupts();

    while(1){

        IdleMode();

    }

    return 0;


}


