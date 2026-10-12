##int main(void)
#{
 #   char c;
  #  int cnt = 0;
   # do
    #{
     #   c = getChar();
      #  putChar( c );
       # cnt++;
    #} while( c != '\n' );
    # printInt(cnt, 10);
    # return 0;   
#}                                              

##o exit en assembly

    .equ     getChar,2
    .equ     putChar,3
    .equ     printInt,6
    .equ     exit, 10     
    .data
    .text
    .globl main

main:
    li $t1,0    # cnt = 0;

do: 
    
    li $v0,getChar
    syscall             # getChar();
    move $t0,$v0        # t0 = c = v0 = getchar
                        # c = getChar();

    move $a0,$t0         # lo mueves al a0
    addi $a0,$t0,1    # c+1 y lo guarda 
    li $v0,putChar      # caracter como im
    syscall             ##putChar( c );

    addi $t1,$t1,1  # cnt++;

                        # recuerda en unn do while no cambias signo
    li $t2 ,10          # el codigo ascci de '\n' es 10
    bne $t0,10,do       # while( c != '\n' );

endo:

    move $a0,$t1        # primer argumento valor del cnt
    li $a1,10           # segundo la base : decimal
    li $v0,printInt
    syscall             # printInt(cnt, 10);

    jr $ra              # return 0;

# cambiando de putchar(c) a putchar (c+1)


## getchar es bloqueante osea solo regresa cuando necesita una tecla


    


