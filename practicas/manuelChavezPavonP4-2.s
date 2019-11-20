.global main
.text

main:
	mov $8, %rdi
	call _start

	mov %rax, %rdi
    mov $60, %rax
    syscall
    