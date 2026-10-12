## tris es para saber la configuracion , PORT  es para lectura  y el LAT la escritura 

## configurar u porto RE0 como salida y el porto RB0 como entrada;
## usando un cico infinito , ler o valor do porto de entrada e escreva esse valor no porto de saida 
## RE0 = RB0.

    .equ ADDRBASEHI,0xBF88               ## la parte alta de la dirrecion(comun para todos)
    .equ TRISE,0x6100                    ##Configuracion del puerto E
    .equ LATE,0x6120                     ##Escritura del puerto E 
    .equ TRISB,0x6040                    ## configurar el puerto B 
    .equ PORTB,0x6050                    ## lectura del puerto B 

    .data 
    .text
    .globl main

main:
        lui $t1,ADDRBASEHI                   ##cargar la base en t1 0xbf880000   


        ##configurasr RE0 como salida 
        lw      $t2,TRISE($t1)               ## Read : leemos el estado actual de TRISE
        andi    $t2,$t2,0xFFFE               ## Modify : andi con 0 coloca el bit a 0
                                         ## fffe = 111110, asi forzamos el bit a 0 (salida)
        sw      $t2,TRISE($t1)               ## Write = guardamos el cambio


        ##configurar el RB0 como input 
        lw $t2, TRISB($t1)                  ## Read: leemos TRISB
        ori $t2,$t2,0x0001                  ## Modify = ori con 1 pone el bit a 1 
                                        # esto fieerxa el bit a 1 
        sw $t2, TRISB($t1)                   # write guardamos 


while:                                  ## ciclo infinito
        ## leer la entrada de RB0
        lw $t2,PORTB($t1)               ## leemos todo el puerto B 
        andi $t2,$t2,0x0001             ## usamos una mascara para borrar todo excepto el bit 0.
                                        ## ahora $t2 valdra 0 o 1.

        # --- 2. ESCRIBIR en la salida (RE0) ---
        # Para escribir, usamos LATE y la técnica Read-Modify-Write de nuevo.

        lw $t3,LATE($t1)                ## leemos como estan los leds ahora 
        andi $t3,$t3,0xFFFE             ## limpiamos el sitio donde vamos a escribir el bit 0 = 0
        or $t3,$t3,$t2                  ## oegamos eso para el valor del switch ($t2)
        sw $t3,LATE($t1)                ## escribimos ese resultado a los leds

        j while

endwhile:
        li $v0,0                        ## return 0;
        jr $ra 

## aqui el va a leer el puerto y ve , si 1 = rb0 este en 0 no se prende nada , si esta en 1 el led se va a prender 
