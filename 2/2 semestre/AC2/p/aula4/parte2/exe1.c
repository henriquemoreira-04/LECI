// Escreva um programa que configure os portos RB8 a RB14, RD5 e RD6 como saídas, que
//selecione apenas o display menos significativo (RD5=1, i.e. "CNTL_DISP_L"=1, e RD6=0) e
// que, em ciclo infinito, execute as seguintes tarefas:

// Ler um caracter do teclado e esperar que seja digitada uma letra entre 'a' e 'g'
// (utilize a system call getChar()). 

//Escrever no porto B a combinação binária que ligue apenas o segmento do display
//correspondente ao caracter lido (e apague todos os restantes); na Figura 4 pode ver
//o porto a que está ligado cada um dos segmentos (por exemplo, o segmento A está
//ligado ao porto RB8). 

//Teste o programa para todos os segmentos e repita o procedimento para o display mais
//significativo (RD6=1 e RD5=0). 

#include <detpic32.h>

int main(void){
    // RB8 A RB14 como salida 
    TRISB = TRISB & 0x80FF;

    // rd5 e rd6 como salidas
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
