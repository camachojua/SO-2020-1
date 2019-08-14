.global _start
.text
_start:
        mov $9, %rax
        call resta
        mov %rax, %rdi
        mov $60, %rax
        syscall

resta:
        sub $3, %rax
        ret
