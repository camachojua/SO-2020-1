.global main
.extern funcion                 # Esto es opcional cuando usamos gcc
.text
main:
        enter $0, $0
        mov $21, %rdi
        call funcion
        mov %rax, %rdi
        mov $60, %rdi
        syscall
