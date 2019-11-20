.global _start
.text
_start:
	pushq %rbp
    movq %rsp, %rbp

	mov $435265432117, %rdi 	# Asignamos el divisor.
	mov $9284415459, %rsi 	# Asignamos el dividendo.
	call euclides	# Llamamos a la funcion.
	mov %rsi, %rdi

	cmp $1, %rax
	je coprimos
	
	jmp nocoprimos

euclides:

	mov %rsi, %rax	# Movemos el dividendo en %rax.

	div %rdi 		# Efectuamos la divicion dividendo/divisor.
	mul %rdi 		# Efectuamos el producto (divisor*cociente).

	mov %rax, %rcx 	
	mov %rsi, %rax

	sub %rcx, %rax 	# Obtenemos el residuo mediante r = dividendo - (divisor*cociente)

	mov %rdi, %rsi
	mov %rax, %rdi

	cmp $0, %rax  	# Verificamos si el residuo es 0 (caso base).
	jne euclides

	mov %rsi, %rax
	
	ret

coprimos:
	pushq %rbp
    movq %rsp, %rbp

	movq $1, %rax     # Llamada al sistema write
    movq $1, %rdi     # Archivo a escribir STDOUT
    movq $msg1, %rsi   # Cadena a escribir
    movq $21, %rdx    # sizeof(cadena)
    syscall

    jmp salir

msg1:
.ascii "Son primos relativos."

nocoprimos:
	pushq %rbp
    movq %rsp, %rbp

	movq $1, %rax     # Llamada al sistema write
    movq $1, %rdi     # Archivo a escribir STDOUT
    movq $msg2, %rsi   # Cadena a escribir
    movq $24, %rdx    # sizeof(cadena)
    syscall

    jmp salir

msg2:
.ascii "No son primos relativos."

salir:
	pushq %rbp
    movq %rsp, %rbp

	movq $60, %rax    # Llamada al systema exit
    movq $0, %rdi     # Estado de finalizacion
    syscall
