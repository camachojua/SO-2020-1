.global _start # Indicamos al enlazador la ubicacion de  _start 
.text
_start:

	mov $245, %rax 	#numero A, supongamos que A es mayor
	mov $0, %rdx ; 
	mov $35, %rbx	#numero B

	while:
		mov %rbx, %r8
		div %rbx
		mov %r8, %rax
		mov %rdx, %rbx
		mov $0, %rdx
		cmp $0, %rbx	#(b == 0)?
		jne while		#jump if not equal

	
	mov %rax, %rdi


	movq $60, %rax
	syscall
