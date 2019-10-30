        .globl _start
        .code16
        .text
_start:
        jmp boot
modo:
        mov $0x13, %al
        mov $0x00, %ah
        int $0x10


dibuja
	mov $159, %cx
        mov %bx, %dx
        mov $0x02, %al
        mov $0x0c, %ah
        int $0x10
        jz salir
        call dibuja

salir:
        ret

boot:
        jmp modo
        .= _start + 510
        .byte 0x55
        .byte 0xaa
