/*Altere o programa, que resultou do ponto anterior, de modo a que quando o contador atinge
o seu valor limite (59 ou 00, dependendo do modo de funcionamento) seja ativado, durante
5s, o LED D11 ligado ao porto RC14. Durante esse tempo a contagem decorre normalmente.*/


#include <detpic32.h>

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < ms * (PBCLK/1000));
}

void send2displays(unsigned char value){
    static const char disp7Scodes[] = {
        // numeros de 0 a 9
        0x3F , 0x06,  0x5B,  0x4F, 0x66, 0x6D,0x7D,  0x07 , 0x7F, 0x6F,

        // letras de A a F

        0x77 , 0x7C , 0x39 ,  0x5E, 0x79, 0x71};

        static char displayflag = 0;

        int dlow = value & 0x0F;
        int dhigh = value >> 4;

        if(displayflag == 0){
            LATDbits.LATD5 = 1;
            LATDbits.LATD6 = 0;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dlow] << 8);
        }
        else{
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 1;
            LATB = (LATB & 0x80FF)|(disp7Scodes[dhigh] << 8); // aqui tenemos que empujarlos porque no comienza en el rb8
        }

        displayflag = !displayflag;

}

unsigned char toBcd(unsigned char value){
    return(((value / 10) << 4 ) + (value % 10));
    // primero obtenemos las decenas y movemos 4 bits 
    // despues calculamos las unidades rodo en binario bits
}

int main(void){

    unsigned int i;
    unsigned int counter = 0;
    unsigned int ledtimer = 0;

    // configurar los puertos

    // rb8 - rb14 outputs
    TRISB = TRISB & 0x80FF;
    // rb0 = DS1 entrada 
    TRISB = TRISB | 0x0001;
    // re0 - re7 outputs;
    TRISE = TRISE & 0xFF00;
    // rd5 e rd6 outputs;
    TRISD = TRISD & 0xFF9F;

    TRISCbits.TRISC14 = 0; // configurar salida

    LATCbits.LATC14 = 0; // el led RC14 comienza apagado


    // puedes poner un limite con if else y ver el limite para poner solo un while 

    while(1){

        i = 0;  // para el refresco
        
        //logica del DS1 

        // ON contagen ascendente 
        if(PORTBbits.RB0 == 1){   // leemos si e puerto esta en 1 

            do{

            send2displays(toBcd(counter));   // mandamos el valor al display en modo BCD
            delay(10); // frecuencia de refresco 


            // logica del led

            if(ledtimer > 0){           
                LATCbits.LATC14 = 1;   // lo prendemos 
                ledtimer--;   // ledtimer cada 10 ms para los 5 segundos por eo el refresco
            }else{
                 LATCbits.LATC14 = 0;
                
            }


            ++i;

            }while(i < 20); // frecuencia de aumento

            counter = (counter + 1) % 60;

            if(counter == 59){
                ledtimer = 500; // 500 * 10 = 5 segundos
            }

        }

        else{ // contaje descendente

            do{

            send2displays(toBcd(counter));
            delay(10); // frecuencia de refresco
            
            // logica del led
            if(ledtimer > 0){
                LATCbits.LATC14 = 1;
                ledtimer--;
            }else{
                 LATCbits.LATC14 = 0;
                
            }

            ++i;

            }while(i < 50); // frecuencia de aumento
            
            if(counter == 0){

                ledtimer = 500;
                counter = 59;
            }

            else{
                counter --;
            }
        }

        LATE = (LATE & 0xFF00)| toBcd(counter); // meter en los leds 
    }

    return 0; // acabar el programa

}


// se puede hacer de una forma mas optimizada 