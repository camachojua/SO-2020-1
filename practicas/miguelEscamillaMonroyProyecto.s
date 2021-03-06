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

_start:                        
        jmp limpiaPantalla

        .macro imprimePrompt cadena
                leaw \cadena, %si
                call imprimeCadena
        .endm
        
limpiaPantalla:
        mov $0x03, %al  # Modo texto 80x25
        mov $0x00, %ah
        int $0x10

        jmp infinito

        #movw $0, %ax # Recorre el conenido de una cadena para imprimirlo despues
        #movw %ax, %ss
        #movw %ax, %ds
        #movw %ax, %es
        #movw $cadena, %si

#ciclo:                          # Utiliza la interrupcion 0x10 y la funcion 0xe para imprimir un caracter en pantalla
        #movb $0xe, %ah
        #movb (%si), %al
        #cmpb $0, %al
        #je infinito
        #int $0x10
        #addw $1, %si
        #jmp ciclo

imprimeCadena:          # Recorremos la cadena del prompt
        lodsb
        orb %al, %al
        jz tecla
        mov $0x0e, %ah
        int $0x10
        jmp imprimeCadena

tecla:
        mov $0x00, %ah  # Obten tecla presionada.
        int $0x16       # Interrupcion de teclado.

detectaTecla:
        cmp $0x0d, %al  # Es enter?
        je enter

        cmp $0x08, %al  # Es backspace?
        je backspace

        cmp $0x4b, %ah # Es flecha izquierda?
        je izquierda

        cmp $0x4d, %ah # Es flecha derecha?
        je derecha

imprimeTecla:
        # Aqui el caracter que se puso esta en %al.

        mov $0x0e, %ah  # Imprimir caracter almacenado en %al.
        int $0x10

repite:
        jmp tecla

enter:
        mov $0x0d, %al  # Imprimimos un retorno de carro
        mov $0x0e, %ah
        int $0x10

        mov $0x0a, %al  # Imprimimos un salto de linea.
        mov $0x0e, %ah
        int $0x10

        jmp infinito

backspace:

        mov $0x08, %al  # Nos movemos para atras
        mov $0x0e, %ah  # Movemos el cursor
        int $0x10

        mov $0x20, %al  # Espacio en blanco
        mov $0x0e, %ah  # Imprimimos el espacio en blanco
        int $0x10

        mov $0x08, %al  # Nos movemos para atras
        mov $0x0e, %ah  # Movemos el cursor
        int $0x10

        jmp tecla


izquierda:
        mov $0x03, %ah  # Se pide la posicion actual del cursor
        int $0x10

        mov $0x02, %ah  # Se cambia la posicion actual del cursor
        dec %dl
        int $0x10

        jmp tecla

derecha:
        mov $0x03, %ah
        int $0x10

        mov $0x02, %ah
        inc %dl
        int $0x10

        jmp tecla

shutdown:
        mov $0x5301, %ax
        xor %bx, %bx
        int $0x15

        mov $0x530e, %ax
        xor %bx, %bx
        mov $0x0102, %cx
        int $0x15

        mov $0x5307, %ax
        mov $0x0001, %bx
        mov $0x0003, %cx
        int $0x15



infinito:                       # Cicla el programa para mostrar una cadena
        imprimePrompt cadena

cadena:
        .ascii "[Mi primer Sistema Operativo]$ "
        .byte 0
        .fill 0x1fe - (. - main), 1, 0
        .word 0xaa55