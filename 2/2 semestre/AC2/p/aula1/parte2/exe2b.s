##     int main(void)
##     {
##          char c;
##          int cnt = 0;
##          while(1) {
##              c = inkey();     ahi algo presionado aqui ??
##              if( c == 'R' )
##                  cnt = 0;
##              putChar('\r');
##              printInt(cnt, 10 | 3 << 16); // ver nota 3 na página seguinte
##              cnt = (cnt + 1) & 0xFF;
##              wait(4);
##          }
##          return 0;
##      }


##      void wait(int ts)
##      {
##          int i;
##          for(i=0; i < 515000 * ts; i++); // wait approximately ts/10 seconds
##      }


## A system call inkey() não é bloqueante, ou seja, se foi premida uma tecla devolve o
## respetivo código ASCII, mas se não foi premida qualquer tecla devolve o valor 0 (0x00).


    .equ inkey,1
    .equ putChar,3
    .equ printInt,6

    .data
    .text
    .globl main

main:
    ## prologo recuerda porque usa una funcion aparte seria la funcion mas el ra

    addiu $sp,$sp,-8
    sw $ra,0($sp)
    sw $s0,4($sp)

    li $s0,0            ##int cnt = 0;

while:              
                        ##while(1);
    li $v0,inkey        ## c = inkey();
    syscall
    move $t0,$v0        ## lo guardo en c = t0

if: 
    li $t1,'R'          ## codigo ascci del t1 = R
    bne $t0,$t1,endiff
    li $s0,0            ## cnt = 0;

endiff:
    li $a0,'\r'
    li $v0,putChar
    syscall             ## putChar('\r');

                        
    move $a0,$s0        # mover el count en s0 a a0
    li $a1,0x0003000A
    li $v0,printInt
    syscall             ##printInt(cnt, 10 | 3 << 16);
    ## una fomra de hacerlo  

    addi $s0,$s0,1      ##cnt = cnt + 1 
    andi $s0,$s0,0xFF   ##cnt = (cnt + 1 ) & 0xFF;
    ##aqui solo se mantienen los 8 bits 

    li $a0,4            ## meter en los valores son los a el valor 
    jal wait            ## llamar a la funcion 

    j while             ## subir arriba , lo have asi porque espera tanto tiempo 

    ## epilogo 
    lw $ra,0($sp)
    lw $s0,4($sp)
    addiu $sp,$sp,8
    li $v0,0            ##return 0;
    jr $ra              ## acaba el programa 


## funcion wait(4);

wait:
    li $t0,0                ## t0 = i = 0 
    
    li $t1,515000
    mul $t1,$a0,$t1         ## $t1 = lim (ts*515000)

for:
    bne $t0,$t1,endfor      ##i < 515000 * ts;
    addi $t0,$t0,1

    j for 

endfor:
    jr $ra                  ## vuelve al main 

    

##Lo que verás es básicamente un cronómetro digital 
##de 8 bits que cuenta del 0 al 255 y se reinicia, 
##todo en una misma línea de texto.