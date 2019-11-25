.global _start
.text
_start:
        mov $90, %rax
        mov $0, %rdx            ; El dividendo es %rdx:%rax
        mov $45, %rbx           ; El divisor es 30
        div %rbx                ; 90/30.
                                ; El cociente se almacena en %rax
                                ; El residuo se almacena en %rbx

        mov %rax, %rbx          ; Guardamos el cociente
        mov $60, %rax           ; Llamada al sistema _exit()
        mov %rbx, %rdi          ; Reportamos el resultado
        syscall
