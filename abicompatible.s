.global _start
.text
_start:
        enter $0, $0              # Preludio

        # Inicio de la funcion
        mov $4, %rdi
        call multiplica
        mov %rax, %rdi
        call salir

multiplica:
        enter $0, $0              # Preludio

        # Inicio de la funcion
        mov %rdi, %rax
        mov $4, %r8
        mov $0, %rdx
        mul %r8
        
        leave                   # Epilogo
        ret
        
salir:
        enter $0, $0            # Prologo
        mov $60, %rax
        syscall
