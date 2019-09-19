        .global _start
        .text
_start:
        mov $8, %rdi
        call funcion

        mov %rax, %rdi
        mov $60, %rax
        syscall
