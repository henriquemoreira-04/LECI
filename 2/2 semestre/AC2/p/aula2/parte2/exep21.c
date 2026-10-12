// quiero un civlo infinito las varibales deben ser formatadas en con base 10 en 5 digitos 

int main(void){
    int cnt1=0;
    int cnt5=0;
    int cnt10=0;
    
    int i = 0;  // el contados de vueltas (ticks)

    while (1)
    {   // 1 . visualizacion (Base 10, 5 digitos -> 0x0005000A)

       putChar('/r');  // es el carriage return 
       printInt(cnt1, 10|(5<<16)); // cuidado con esto mejor dejar asi porque el shift debe ser antes 

       putChar('/r');  // es el carriage return 
       printInt(cnt5, 10|(5<<16));

       putChar('/r');  // es el carriage return 
       printInt(cnt10, 10|(5<<16));
       
       // 2. Base de tiempo única (10 Hz)
        delay(100);

        // 3. Lógica de Frecuencias
        cnt10++; // 10 Hz: Suma siempre

        if (i % 2 == 0) // 5 Hz: Suma si i es múltiplo de 2
            cnt5++;

        if (i % 10 == 0) // 1 Hz: Suma si i es múltiplo de 10
            cnt1++;
        
        i++; // Siguiente vuelta

    } return 0;
    
}