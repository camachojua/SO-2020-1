        .code16
	.globl _start
        .text
_start:
        jmp boot

prompt: .asciz "> "
        .macro imprimePrompt cadena
        leaw \cadena, %si
        call imprimeCadena
        .endm

limpiaPantalla:         # Se limpia la pantalla antes de iniciar
	mov $0x03, %al  # Modo texto 80x25
        mov $0x00, %ah
        int $0x10

        imprimePrompt prompt

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

        cmp $0x4b, %ah # Es cursor izquierdo?
        je izquierda

imprimeTecla:
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

        imprimePrompt prompt    # Imprimimos el prompt

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

        mov $0x03, %ah
        int $0x10

        mov $0x02, %ah
        dec %dl
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

boot:
        jmp limpiaPantalla

        . = _start + 510
        .byte 0x55
        .byte 0xaa
