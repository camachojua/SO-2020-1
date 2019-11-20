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
	cmp $1, %rbx
	je salir
	cmp $1, %rbx
	jne exit

salir:
	movq $1, %rax
	movq $1, %rdi
	movq $msg, %rsi
	movq $21, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall

msg:
	.asciz "Son primos relativos\n"


exit:
	movq $1, %rax
	movq $1, %rdi
	movq $msg2, %rsi
	movq $24, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall

msg2:
	.asciz "No son primos relativos\n"


