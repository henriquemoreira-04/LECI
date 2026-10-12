//Construa a tabela que relaciona as combinações binárias de 4 bits (dígitos 0 a F) com o
//respetivo código de 7 segmentos, de acordo com o circuito montado no ponto anterior e
//com a definição gráfica dos dígitos apresentada na Figura 5. Com os códigos de 7
//segmentos de cada um dos 16 dígitos complete a declaração do array seguinte: 

//Segmento	Binario (Pins 15...8)	Hexadecimal (valor para LATB)
//a	0000 0001 0000 0000	0x0100
//b	0000 0010 0000 0000	0x0200
//c	0000 0100 0000 0000	0x0400
//d	0000 1000 0000 0000	0x0800
//e	0001 0000 0000 0000	0x1000
//f	0010 0000 0000 0000	0x2000
//g	0100 0000 0000 0000	0x4000

//Carácter,Segmentos necesarios,Suma (Bits 0-6),Valor Hex (para el array)
//0,a+b+c+d+e+f,0x01+02+04+08+10+20,    0x3F
//1,b+c,0x02+04,                        0x06
//2,a+b+g+e+d,0x01+02+40+10+08,         0x5B
//3,a+b+g+c+d,0x01+02+40+04+08,         0x4F
//4,f+g+b+c,0x20+40+02+04,              0x66
//5,a+f+g+c+d,0x01+20+40+04+08,         0x6D
//6,a+f+e+d+c+g,0x01+20+10+08+04+40,    0x7D
//7,a+b+c,0x01+02+04,                   0x07
//8,a+b+c+d+e+f+g,Todos (0x7F),         0x7F
//9,a+b+g+f+c,0x01+02+40+20+04,         0x6F

//a  0x7700
//b  0x7c00
//c  0x3900
//d  0x5e00
//e  0x7900
//f  0x7100

#include <detpic32.h>

int main(void){

    // poner rb8 a rb14 salida 

    TRISB = TRISB & 0x80FF;

    // poner rd5 a rd6 como salida 

    TRISD = TRISD & 0xFF9F;

    // prender los el display derecha 

    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;

    while(1){
        LATB = ((LATB & 0x80FF)| 0x3F00);
    }
    return 0;



}
