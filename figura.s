        .global _start
        .code16
_start:
        jmp boot

modo:
        mov $0x13, %al
        mov $0x00, %ah
        int 0x10

salir:
        ret
boot:
        jmp modo

        .= _start + 510
        .byte 0x55
        .byte 0xaa
