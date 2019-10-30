        .global _start
        .code16
        .text
_start:
        jmp boot

modo:
        mov $0x13, %al          # Cambio el modo del video
        mov $0x00, %ah
        int $0x10

dibuja:
        dec %bx                 # Decremento el contador
        add %bx, %cx            # Nos desplazamos en X
        mov $0x02, %al          # Indicamos el color
        mov $0x0c, %ah          # Modo de video a color
        int $0x10
        jnz dibuja

salir:
        ret

boot:
        mov $5, %bx             # Longitud de la linea
        mov $160, %cx           # Coordenada X inicial
        mov $100, %dx           # Coordenada Y inicial
        jmp modo

        .= _start + 510
        .byte 0x55
        .byte 0xaa
