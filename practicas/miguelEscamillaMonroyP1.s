.global main
.text
main:
	enter $0, $0

	mov $6, %r8 # Números de Charmicael a buscar.
	mov $3, %r9 # Número en el cual empezaremos la busqueda.
	jmp inicio


	inicio:
		cmp $0, %r8
		je salir

		inc %r9
		mov $2, %r10 # Número pivote.

		jmp while

	while:
		mov %r9, %rsi # Asignamos el dividendo.
		mov %r10, %rdi #Asignamos el divisor.

		call euclides

		mov %r9, %r14
		dec %r14

		cmp $1, %rax
		call preliminar

		inc %r10

		cmp %r10, %r9
		jb while

		dec %r8
		jmp imprime


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

	preliminar:
		call potencia

		cmp $1, %rax
		jne inicio

		ret

	potencia:
		mov %r14, %rax

		cmp $0, %rax
		jne pow

		mov $1, %rax

		ret

	pow:
		mov $2, %r13

		mov %r14, %rax
		div %r13

		call potencia

		div %r9		# Dividimos rax entre r9 para obtener el mod 
					# a traves del residuo almacenado en rdx.

		mov %rdx, %rax 
		mul %rax 	# rax = rax*rax
		div %r9
		mov %rdx, %rdi

		mov %r14, %rax
		div %r13
		cmp $1, %rax
		je pwr

		ret

	pwr:
		mov %rdi, %rax
		mul %r10
		div %r9

		mov %rdx, %rax

		ret

	imprime:
		mov %r8, %rax

		#push %rax
		#push $numero
		#call printf

		lea numero(%rip), %rdi
		mov 9(%rsi), %rsi
		call printf

		jmp inicio

	salir:
		movq $60, %rax    # Llamada al systema exit
    	movq $0, %rdi     # Estado de finalizacion
    	syscall

.data
	numero: .asciz "Numero: %d\n"
	