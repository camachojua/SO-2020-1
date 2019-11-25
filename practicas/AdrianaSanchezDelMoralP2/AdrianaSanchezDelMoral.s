.global _start # Indicamos al enlazador la ubicacion de  _start 
.text
_start:
	
	mov $231, %rax 	#numero A, supongamos que A es mayor
	mov $0, %rdx ; 
	mov $11, %rbx	#numero B

	while:
		mov %rbx, %r8
		div %rbx
		mov %r8, %rax
		mov %rdx, %rbx
		mov $0, %rdx
		cmp $0, %rbx	#(b == 0)?
		jne while		#jump if not equal

		#Para primera prueba vamos a imprimir 1 si son primos relativos, 0 si no son primos relativos
			#solo es cambiar el valor del registro del cociente si no es cero, cambiar a 0.

	mov %rax, %rdi		#movemos el cociente al registo para la llamada a funcion noprimo
    cmp $1, %rax		#comparamos si son primos relativos
    jne noprimo			#Si no son primos relativos entonces saltamos/llamamos a no primo
    mov $1, %rdi		#movemos el resultado de "PRIMOS" al registro de salida
	
	movq $60, %rax		#llamada a exit
	syscall


noprimo:
    mov $0, %rdi		#movemos el resultado de "NO PRIMOS" al registro de salida
    movq $60, %rax		#llamada a exit
	syscall  


