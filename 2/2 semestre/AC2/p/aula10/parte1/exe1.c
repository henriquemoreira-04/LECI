/*Calcule o valor inteiro a carregar no registo U2BRG, de modo a obter uma taxa de
transmissão/receção (baudrate) de 115200 bps. Para este cálculo considere um fator de
divisão do relógio (fator de sobreamostragem) de 16.
a) Anote o arredondamento por excesso e por defeito do valor que calculou e, para os dois
casos, calcule o baudrate real que o hardware vai efetivamente gerar.
b) Para os dois valores que obteve, calcule o erro percentual entre o baudrate real obtido e
o baudrate ideal (115200), e tire conclusões sobre qual o valor de U2BRG que deve ser
utilizado.*/

/*


U2BRG = F PBCLK + 8 X BAUDRATE / 16 X BAUDRATE  - 1 

20 000 000 + ( 8 * 115200) /  16 x 115200  - 1 

10 

a) arrendodamento real 

baud real =  f pbclk / 16 x ( U2BRG + 1 ) =  113636,36 

caso 2 arrendodear arriba 

104 166 , 67 

b ) erro poncentual 

ERRO = BAUD REAL - BAUD IDEAL  / BAUD IDEAL X 100% == -1,36 % 

usamos el redondameanto ahacia abajo por causa del valor entre +- 2% de error 




*/