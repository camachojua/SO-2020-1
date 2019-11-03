.code16
.globl main
.text                           # Inicio de la seccion de texto

main:                           # main
        jmp _start
        .byte 144
        .ascii "WebOS"
        .word 512
        .byte 1
        .word 1
        .byte 2
        .word 224
        .word 2880
        .byte 0xf0
        .word 9
        .word 18
        .word 2
        .long 0
        .byte 0
        .byte 0
        .byte 0x29
        .long 0x12345678
        .ascii "WebOS Disk"
        .ascii "FAT12   "

_start:
        movw $0, %ax
        movw %ax, %ss
        movw %ax, %ds
        movw %ax, %es
        movw $cadena, %si
        jmp init
        cadenasalida: .asciz "\n\rEsta es una prueba\n \r>_    "  # Cadena de salida
        welcome: .asciz "\n Mi primer sistema operativo"
        .macro imprimeCadena str               # Llamada a la funcion imprimeCadena
        leaw  \str, %si
        call pintaCadena
        .endm
pintaCadena:
        lodsb
        orb  %al, %al
        jnz   imprimeTecla
        jmp infinito
imprimeTecla:
        movb $0x0e, %ah
        int  $0x10
        jmp  pintaCadena
init:
        imprimeCadena welcome
infinito:                                       # Muestra la entrada del teclado del usuario.
        mov $0x00, %ah
        int $0x16
        mov $0x0e, %ah
        int $0x10
        addw $1, %si
        cmp $0x0D,%al
        je  comando
        jmp infinito
comando:
        imprimeCadena cadenasalida
cadena:
        .ascii "Mi primer Sistema Operativo\n"
        .byte 0
        .fill 0x1fe - (. - main), 1, 0
        .word 0xaa55
