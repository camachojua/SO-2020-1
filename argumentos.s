.globl main
.text
main:
        sub $8, %rsp
        movq %rsp, %rbp          # Prologo

        leaq formato(%rip), %rdi # Insertamos el apuntador de la cadena
        movq 8(%rsi), %rsi       # Segundo argumento. Obtenemos argv[1]
        leaq formato(%rip), %rdx # Insertamos el tercer argumento
        xor %rax, %rax           # No hay argumentos de punto flotante
        call printf

        xor %rax, %rax           # Limpiamos %rax

        leave                    # Epilogo
        ret

.data
formato: .asciz "Valor: %s\nDireccion: 0x%08xd\n"
