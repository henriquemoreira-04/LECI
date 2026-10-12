#include <detpic32.h>

int main(void){
    // RB8 A RB14 como salida 
    TRISB = TRISB & 0x80FF;

    // rd5 e rd6 como salida de los displays
    TRISD = TRISD & 0xFF9F;

    // selecionar el display menos sig a 1 = apagado != 0
    LATDbits.LATD5 = 1;

    LATDbits.LATD6 = 0;

    while(1){
        // ler del teclado una letra entre 'a' e 'g'
        char ch = getChar();          

        if (ch >= 'a' && ch <= 'g'){
            // el que contruyo ese aparato lo quiere asi que por eso suma el caracte lo resta con el que queremos y suma 
            LATB = (LATB & 0x80FF) | (1 << (ch - 'a' + 8)); 
        }
    }
    return 0;
    
}
