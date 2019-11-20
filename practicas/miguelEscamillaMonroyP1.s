	.global _start
	.text
_start:
	mov $273, %rdi 	# Asignamos el divisor.
	mov $2366, %r8 	# Asignamos el dividendo.
	call euclides	# Llamamos a la funcion.
	mov %r8, %rdi	
	mov $60, %rax
	syscall

euclides:
	mov %r8, %rax	# Movemos el dividendo en %rax.

	div %rdi 		# Efectuamos la divicion dividendo/divisor.
	mul %rdi 		# Efectuamos el producto (divisor*cociente).

	mov %rax, %rcx 	
	mov %r8, %rax

	sub %rcx, %rax 	# Obtenemos el residuo mediante r = dividendo - (divisor*cociente)

	mov %rdi, %r8
	mov %rax, %rdi

	cmp $0, %rax  	# Verificamos si el residuo es 0 (caso base).
	jne euclides

	ret
