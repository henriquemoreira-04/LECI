/*  Escreva uma função que permita configurar o módulo OC1 para gerar qualquer valor de dutycycle entre 0 e 100, passado como argumento (note que pode usar PR3 na expressão de
cálculo do OC1RS). */


void setPWM(unsigned int dutycycle){

    if(dutycycle > 100){
        dutycycle = 100;
    }

    OC1RS = (((PR3 + 1) * dutycycle) / 100 );
}