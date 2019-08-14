.global _start
.text
_start:
        // Guardamos el marco de ejecucion anterior
        pushq %rbp
        movq %rsp, %rbp
        // Inicio de programa
        mov $7, %rdi
        call multiplica
        mov %rax, %rdi
        call salir

multiplica:
        // Guardamos el marco de ejecucion anterior
        pushq %rbp
        movq %rsp, %rbp
        // Inicio de la funcion
        mov %rdi, %rax
        mov $4, %r8
        mov $0, %rdx
        mul %r8
        leave
        ret

salir:
        // Guardamos el marco de ejecucion anterior
        pushq %rbp
        movq %rsp, %rbp
        //Inicio de la funcion
        mov $60, %rax
        syscall
