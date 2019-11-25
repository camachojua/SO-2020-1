	.code16
     	.code16
        .text
        .globl _start;
_start:
        jmp _boot                             # Saltamos al código del cargador de arranque
        welcome: .asciz " \n\r"  # Definimos la cadena a escribir

        .macro imprimeCadena str               # macro que llama a una funcion para imprimir una cadena
            leaw  \str, %si
            call pintaCadena
        .endm

pintaCadena:
        lodsb
        orb  %al, %al
        jz   salir
        movb $0x0e, %ah
        int  $0x10
        jmp  pintaCadena
salir:
        ret

_boot:
        imprimeCadena welcome
        #leemos la entrada del teclado:
        mov $0x00,%ah    
        int $0x16
        mov $0x0e,%ah
        int $0x10

        jmp _boot
     #move to 510th byte from the start and append boot signature
     . = _start + 510
     .byte 0x55
     .byte 0xaa
