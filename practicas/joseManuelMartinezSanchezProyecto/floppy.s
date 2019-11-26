.code16
        .globl _start
        .text
_start:                         # Punto de entrada
        . = _start + 510        # Nos movemos al byte 510 desde el inicio
        .byte 0x55              # Agregamos el primer byte magico (byte 511)
        .byte 0xaa              # Agregamos el segundo byte magico (byte 512)