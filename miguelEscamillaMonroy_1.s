.globl main
.text
main:
        sub $8, %rsp
        movq %rsp, %rbp          # Prologo

        call imprime

        mov %rax, %rdi
        mov $60, %rax
        syscall

imprime:
        leaq numeros(%rip), %rdi # Insertamos el apuntador de la cadena
        xor %rax, %rax           # No hay argumentos de punto flotante
        call printf

        xor %rax, %rax           # Limpiamos %rax

        leave                    # Epilogo
        ret
        
numeros: .asciz "Primeros seis numeros de Carmichael:\n561 \n1105 \n1729 \n2465 \n2821 \n6601 \n"

