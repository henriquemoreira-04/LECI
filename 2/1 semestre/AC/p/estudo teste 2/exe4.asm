.data									
AA:	.asciiz "#F47D3FA2"						##0x1001003c               memoria 10
BB:	.word   5							# 0x10010046 -> 48 padding 	    + 2 + 4 
CC:	.word   0x52, 0x126C, 0x3A, 0x139A8, 0xABA, 0x7C38		# 0x1001004c 		    + 24 
	.align  2							# 0x10010064		 + nada 
DD:	.space  4							#  0x10010068		+ 4  44

	.text
	.globl  main

main:   la      $t0, CC	# 8		t0 inicioarry				#0x00400038
        la      $t1, BB   # 8		t1 5				#0x00400040
        lw      $t1, 0($t1) # 4 	5				#0x00400048
        sll     $t1, $t1, 2 # 4		5 * 4				#0x0040004c
        addu    $t1, $t0, $t1 # 4	20+ 10046				#0x00400050
        xor     $t2, $t2, $t2 # 4					#0x00400054

L1:     lw      $t3, 0($t0) # 4						#0x00400058
        lw      $t4, 0($t1) # 4						#0x0040005c
        sw      $t3, 0($t1) # 4						##0x00400060
        sw      $t4, 0($t0) # 4						#0x00400064
        andi    $t4, $t4, 0x0f # 4					##0x00400068
        add     $t2, $t2, $t4 # 4					#0x0040006c
        addiu   $t0, $t0, 4 # 4						#0x00400070
        addiu   $t1, $t1, -4 # 4					##0x00400074
        blt     $t0, $t1, L1 # 8 					##0x00400078
									#0x00400080
L2:     la      $t5, DD							
        sw      $t2, 0($t5)
        la      $t3, AA
        lw      $v0, 0($t3)
        jr      $ra

# primera preginta 

# comeca 0x1001003c

#comeza 0x00400038
