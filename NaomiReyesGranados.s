	.global _start
	.text
_start:
	movq $30, %rax
	movq $0, %rdx #Definimos nuestro primer numero

	movq $9, %rbx #Definimos nuestro segundo numero

while:
	div %rbx #Dividimos nuestros numeros
	cmp $0, %rdx #Vemos si el residuo es 0
	mov %rdx, %r8 #Guardamos el residuo en r8
	mov %rbx, %rax #renombramos al segundo numero por el primero
	mov $0, %rdx #renombramos para que rdx vuelva a ser 0
	mov %r8, %rbx #ponemos nuestro residuo como segundo numero en la div
	jne while

	mov $60, %rax
	mov %rdx, %rdi #devolvemos el ultimo residuo diferente de 0
	syscall
	
