	.data

# --- CONSTANTES DE OFFSETS (MAPA DE MEMORIA) ---
	.eqv off_id, 0
	.eqv off_fname, 4
	.eqv off_lname, 22
	.eqv off_grade, 40	# Alineado a múltiplo de 4

# --- ESTRUCTURA DE DATOS ---
	.align 2
stg:	.space 44		# Reservamos 44 bytes vacíos para la estructura student
				# (4 id + 18 fname + 15 lname + 3 padding + 4 grade)

# --- TEXTOS PARA PEDIR DATOS (INPUT) ---
p_id:	.asciiz "\nIntroduza N. Mec: "
p_fnam:	.asciiz "Introduza Primeiro Nome: "
p_lnam:	.asciiz "Introduza Ultimo Nome: "
p_grad:	.asciiz "Introduza Nota: "

# --- TEXTOS PARA MOSTRAR RESULTADOS (OUTPUT) ---
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
comma:	.asciiz ","

	.text
	.globl main

main:
	# 1. Cargar la dirección base de la estructura en $t0
	la	$t0, stg

	# =================================================
	# PARTE 1: LECTURA DE DATOS (INPUT)
	# =================================================

	# --- A) Leer ID (int) ---
	la	$a0, p_id
	li	$v0, 4		# print_string
	syscall

	li	$v0, 5		# read_int
	syscall
	sw	$v0, 0($t0) # Guardar en offset 0

	# --- B) Leer Primer Nombre (String) ---
	la	$a0, p_fnam
	li	$v0, 4		# print_string
	syscall

	addiu	$a0, $t0, 4 # Dirección destino (stg + 4)
	li	$a1, 18		    # Tamaño máximo (18 bytes)
	li	$v0, 8		    # read_string
	syscall

	# --- C) Leer Último Nombre (String) ---
	la	$a0, p_lnam
	li	$v0, 4		# print_string
	syscall

	addiu	$a0, $t0, 22 # Dirección destino (stg + 22)
	li	$a1, 15		    # Tamaño máximo (15 bytes)
	li	$v0, 8		    # read_string
	syscall

	# --- D) Leer Nota (Float) ---
	la	$a0, p_grad
	li	$v0, 4		# print_string
	syscall

	li	$v0, 6		# read_float  $f0
	syscall
	s.s	$f0, 40($t0) # Guardar en offset 40 (¡Cuidado! offset 40, no 37)

	# =================================================
	# PARTE 2: IMPRESIÓN DE DATOS (OUTPUT)
	# =================================================

	# --- Imprimir ID ---
	la	$a0, str1	# "N. Mec: "
	li	$v0, 4
	syscall

	lw	$a0, 0($t0) # Cargar entero desde offset 0
	li	$v0, 36		 # print_intu10 (unsigned)
	syscall

	# --- Imprimir Nombre Completo (Apellido, Nombre) ---
	la	$a0, str2	# "\nNome: "
	li	$v0, 4
	syscall

	addiu	$a0, $t0, 22 # Dirección del apellido (Offset 22)
	li	$v0, 4
	syscall

	la	$a0, comma	# ","
	li	$v0, 4
	syscall

	addiu	$a0, $t0, 4 # Dirección del nombre (Offset 4)
	li	$v0, 4
	syscall

	# --- Imprimir Nota ---
	la	$a0, str3	# "\nNota: "
	li	$v0, 4
	syscall

	l.s	$f12, 40($t0) # Cargar float desde offset 40
	li	$v0, 2		     # print_float
	syscall

	# --- FIN ---
	li	$v0, 0
	jr	$ra