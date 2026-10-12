//Implemente, em linguagem C, um contador crescente módulo 10, atualizado a uma
//frequência de 4.6Hz (o valor da frequência deve ser obtido com o menor error possível). O
//resultado deverá ser observando nos 4 LED ligados aos portos RE6 a RE3. 

#include <detpic32.h>

int main(void){
    //Configurar os portos RE6-RE3 como saídas: 
    TRISE = TRISE & 0xFF87;
    //Inicializar a variável do contador: 
    unsigned int counter = 0;
    
    while(1){
        //Atualizar os portos de saída (RE6-RE3) com o valor da variável do contador: 
        LATE = ((LATE & 0xFF87) | counter << 3);

        // Esperar 1/4,6 s3
        resetCoreTimer();
        while(readCoreTimer() < 4347826);

        //Incrementar a variável do contador, módulo 10:
        // esto asegura que eel numero no llegue a mas de 10 el %
        counter = ((counter + 1) % 10);   

    }
    return 0;

}

































