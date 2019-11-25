.global _start
.text
_start:
        mov $7, %rdi
        call multiplica
        mov %rax, %rdi
        call salir

multiplica:
        mov %rdi, %rax
        mov $4, %r8
        mov $0, %rdx
        mul %r8
        ret

salir:
        mov $60, %rax
        syscall
