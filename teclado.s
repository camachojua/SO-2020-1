        .code16
	.globl _start
        .text
_start:
        jmp boot

tecla:
	mov $0x00, %ah  # Obten tecla presionada
        int $0x16       # Interrupcion de teclado

        cmp $0x36, %al
        je enter

        # Aqui el caracter que se puso esta en %al
        mov $0x0e, %ah  # Imprimir caracter almacenado en %al
        int $0x10

repite:
        jmp tecla       # Repite por siempre

        # TODO: Implementar salto de linea "\n"
        #       "\lf" se realiza cuando apretamos enter

enter:
        mov $'\n', %al  # TODO: Imprimimos un salto de linea
        mov $0x0e, %ah
        int $0x10
        jmp tecla       # Regresamos a leer

boot:
        jmp tecla

        . = _start + 510
        .byte 0x55
        .byte 0xaa
