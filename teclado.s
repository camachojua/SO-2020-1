        .code16
	.globl _start
        .text
_start:
        jmp boot

limpiaPantalla:         # Se limpia la pantalla antes de iniciar

	mov $0x03, %al  # Modo texto 80x25
        mov $0x00, %ah
        int $0x10

tecla:

	mov $0x00, %ah  # Obten tecla presionada.
        int $0x16       # Interrupcion de teclado.

        cmp $0x0d, %al
        je enter

        cmp $0x08, %al
        je backspace

        # Aqui el caracter que se puso esta en %al.
        mov $0x0e, %ah  # Imprimir caracter almacenado en %al.
        int $0x10

repite:
        jmp tecla       # Repite por siempre

enter:
        mov $0x0d, %al  # Imprimimos un retorno de carro
        mov $0x0e, %ah
        int $0x10

        mov $0x0a, %al  # Imprimimos un salto de linea.
        mov $0x0e, %ah
        int $0x10

        jmp tecla       # Regresamos a leer lo que se tenga que leer.

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

        jmp tecla       # Regresamos a leer lo que se tenga que leer.

boot:
        jmp limpiaPantalla

        . = _start + 510
        .byte 0x55
        .byte 0xaa
