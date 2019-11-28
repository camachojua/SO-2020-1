        .global _start 
        .text
_start:
        call Carmichael
        
        movq $60, %rax    # Llamada al systema exit
        movq $0, %rdi     # Estado de finalizacion
        syscall   
