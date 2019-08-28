.global _start
.text
_start:
        mov $0, %rax

for:
        add $1, %rax
        cmp $42, %rax
        jne for

        mov %rax, %rdi
        mov $60, %rax
        syscall
