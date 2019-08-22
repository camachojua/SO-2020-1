	.global _start
	.text
_start:
	
	movq $5, %rax
	movq $0, %rdx #Definimos nuestro primer numero

	movq $9, %rbx #Definimos nuestro segundo numero

while:
	
	div %rbx #Dividimos nuestros numeros
	mov %rdx, %r8 #Guardamos el residuo en r8
	mov %rbx, %rax #renombramos al segundo numero por el primero
	mov %rax, %rcx
	mov $0, %rdx #renombramos para que rdx vuelva a ser 0
	mov %r8, %rbx #ponemos nuestro residuo como segundo numero en la div
	cmp $0, %r8 #Vemos si el residuo es 0
	jne while

	cmp $1, %rcx
	je primoRelativo
	mov $0, %rdi
	mov $60, %rax
	syscall
	
primoRelativo:	
	mov $60, %rax
	mov %rcx, %rdi #devolvemos el ultimo residuo diferente de 0
	syscall

	
