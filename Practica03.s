.global _start
.text

_start:
	enter $0, $0
	enter $1, $0
	                #Definimos nuestros numeros de entrada
	movq $10, %rdx  
	movq $29, %rbx  


salir:
	div %rbx 
	mov %rdx, %r8
	mov %rbx, %rax
	mov %rax, %rcx
	movq $1, %rax
	movq $1, %rdi
	movq $msg, %rsi
	movq $71, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall

msg:
	.asciz "Los primeros 6 numeros de Carmichael son:561,1105,1729,2465,2821,6601"

