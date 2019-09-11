.global _start
.text

_start:
	enter $0, $0
	enter $1, $0
	mov $0, %rax 
	mov $0, %rbx


salir:
	movq $1, %rax
	movq $1, %rdi
	movq $msg, %rsi
	movq $71, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall

msg:
	.asciz "Los primeros 6 numeros de carmichael son: 561,1105,1729,2465,2821,6601\n"
