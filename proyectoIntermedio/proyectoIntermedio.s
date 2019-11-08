.code16                         
.globl _boot                     
.text                           

_boot:                         
        movw $cadena, %si
        jmp init
        start: .asciz "[arch@arch-pc proyectoIntermedio]$ "  
        salto: .asciz "\n\r"

        .macro pintaCadena str
                leaw \str, %si
                call pintaCadena
        .endm

pintaCadena:          
        lodsb
        orb  %al, %al
        jz   salir
        mov $0x0e, %ah  
        int $0x10
        jmp pintaCadena
        je imprimir
        jmp ciclo

salir:
        ret

init:
        pintaCadena start


ciclo:                    
        mov $0x00, %ah  
        int $0x16       
        mov $0x0e, %ah
        int $0x10
        cmp $0x0d, %al  
        je imprimir       
        jmp ciclo

imprimir:
        pintaCadena salto
        jmp _boot


cadena:
        .ascii "aoeuidrtns"
        .byte 0
        .fill 0x1fe - (. - _boot), 1, 0
        .word 0xaa55