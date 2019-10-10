.code16                         # Indicamos al ensamblador que se generara un codigo de 16 bits
.globl main                     # Exportamos el simbolo de la fuccion main
.text                           # Declaramos el inicio de la seccion de texto

main:                           # main: Su objetivo es rellenar espacio en memoria (crear un floppy a mano) y declarar variables
        jmp _start              # Salta a la funcion _start que recorre una cadena
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

_start:                         # Recorre el conenido de una cadena para imprimirlo despues
        movw $0, %ax
        movw %ax, %ss
        movw %ax, %ds
        movw %ax, %es
        movw $cadena, %si

ciclo:                          # Utiliza la interrupcion 0x10 y la funcion 0xe para imprimir un caracter en pantalla
        movb $0xe, %ah
        movb (%si), %al
        cmpb $0, %al
        je infinito
        int $0x10
        addw $1, %si
        jmp ciclo

infinito:                       # Cicla el programa para mostrar una cadena
        jmp infinito

cadena:
        .ascii "Mi primer Sistema Operativo"
        .byte 0
        .fill 0x1fe - (. - main), 1, 0
        .word 0xaa55
