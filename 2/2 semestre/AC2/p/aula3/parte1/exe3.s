## tris es para saber la configuracion , PORT  es para lectura  y el LAT la escritura 

##epita os exercícios anteriores usando como porto de entrada o porto RD8, que permite ler 
##o estado do pulsador "INT1" da placa DETPIC32 (i.e., RE0 = RD8 e RE0 = RD8\).

    .equ ADDRBASEHI,0xBF88               ## la parte alta de la dirrecion(comun para todos)
    .equ TRISE,0x6100                    ##Configuracion del puerto E
    .equ LATE,0x6120                     ##Escritura del puerto E 
    .equ TRISB,0x6040                    ## configurar el puerto B 
    .equ PORTB,0x6050                    ## lectura del puerto B
    .equ TRISD,0x60C0                    ## configurar el puerto D 
    .equ PORTD,0x60D0                    ## leer el puerto D 


    .data 
    .text
    .globl main

main:
        lui $t1,ADDRBASEHI                   ##cargar la base en t1 0xbf880000   

        lw $t2,TRISD($t1)                   ## Read: leemos TRISD
        ori $t2,$t2,0x0100                  ## Modify = ori con pone a 1 el bit 8 
        sw $t2, TRISD($t1)                  # write guardamos

        # RE0 como salida
        lw  $t2,TRISE($t1)
        andi $t2,$t2,0xFFFE
        sw  $t2,TRISE($t1)
        


while:                                  ## ciclo infinito
        
        lw   $t2, PORTD($t1)            # Leemos el puerto D 
        andi $t2, $t2, 0x0100           # Aislamos el bit 8 

        # --- OPERACIÓN CLAVE ---
        srl  $t2, $t2, 8            # Desplazamos 8 posiciones a la derecha
                                    # El bit que estaba en la pos 8 ahora está en la pos 0

        # Para RE0 = !RD8, añade aquí: xori $t2, $t2, 0x0001 

        xori $t2,$t2,0x0001         # la negada 

        lw   $t3, LATE($t1)         
        andi $t3, $t3, 0xFFFE       
        or   $t3, $t3, $t2          # Ahora los bits 0 coinciden perfectamente
        sw   $t3, LATE($t1)         

        j while
endwhile:
        li $v0,0                        ## return 0;
        jr $ra 