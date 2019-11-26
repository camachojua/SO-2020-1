
      .global _start
      .text
_start:
	mov $0, %rax #recibe primer numero
	mov $0, %rbx #recibe segundo numero
	call funcion

	movq $60, %rax
	movq $0, %rdi
	syscall


