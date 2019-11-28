        .global Carmichael
        .text
Carmichael: 
        movq $1, %rax     # Llamada al sistema write
        movq $1, %rdi     # Archivo a escribir STDOUT
        movq $msg, %rsi   # Cadena a escribir
        movq $36, %rdx    # sizeof(cadena)
        syscall

msg:        
        .ascii "561, 1105, 1729, 2465, 2821, 6601 \n"
