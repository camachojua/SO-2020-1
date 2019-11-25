.global _start
.text

_start:
	mov $2366, %rax 
	mov $273, %rbx
	div %rbx
	cmp $0, %rdx
	je salir

while:
	mov %rbx, %rax
	mov %rdx, %rbx
	mov $0, %rdx
	div %rbx
	cmp $0, %rdx
	jne while

salir:
	mov %rbx, %rax
	mov $60, %rax
	mov %rbx, %rdi
	syscall
