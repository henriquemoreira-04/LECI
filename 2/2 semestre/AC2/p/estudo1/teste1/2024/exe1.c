/*
Questão 1
Escreva e teste um programa, em linguagem C, que faça todas as configurações necessárias e que mostre nos 4 LED ligados aos portos RE5 a RE2, o valor de um contador decrescente módulo 12 (valor inicial: 0). 

A frequência de atualização do contador deve depender, continuamente, do estado lógico do "switch" DS3 (ligado ao porto RB2): DS3 OFF, f=2.3Hz; DS3 ON, f=5.5Hz.

O valor do contador deve também ser mostrado no ecrã do PC, em decimal formatado com 2 dígitos (os valores devem ser apresentados em linhas consecutivas do ecrã).

O valor da frequência deve ser obtido com o menor erro possível. Edite o seu programa no ficheiro f11.c.
*/

#include <detpic32.h>

int main(void){

    TRISE = TRISE & 0xFFC3; // poner RE5 - RE2 como salidas
    
    TRISB = TRISB | 0x0004; // poner RB2  como entrada 
    
    unsigned int contador = 0; // iniciar el contadot 
    unsigned int tiempoespera; // poner el timepo de espaera para mi delay 

    while(1){

        LATE  = (LATE & 0xFFC3) | (contador << 2 ); // es para escribir las cosas

        printInt(contador, 10 | 2 << 16); // contador imprimirlo cotador , decimal 10 , lo imprimer en el terminal  
        putChar('\n');  //  lineas consecutivas 

        if (PORTBbits.RB2 == 0){ // si ds3 apagado f = 2.3 hz 

            tiempoespera = 8695652;

        }else{ // si ds3 prendido 1 f = 5.5 

            tiempoespera = 3636363;

        }
        

        resetCoreTimer();
        while(readCoreTimer() < tiempoespera );

        contador = (contador - 1 + 12 ) % 12; // contador decresciente modulo 12 
    }
    
    return 0;
}





