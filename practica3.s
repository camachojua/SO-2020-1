#Programa que regresa los primeros 6 numeros de Carmichael
        .global _start 
        .text
_start: 
        movq $1, %rax     # Llamada al sistema write
        movq $1, %rdi     # Archivo a escribir STDOUT
        movq $msg, %rsi   # Cadena a escribir
        movq $36, %rdx    # sizeof(cadena)
        syscall
        
        movq $60, %rax    # Llamada al systema exit
        movq $0, %rdi     # Estado de finalizacion
        syscall
        
msg:        
        .ascii "561, 1105, 1729, 2465, 2821, 6601 \n"
