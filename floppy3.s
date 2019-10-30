        .code16
        .globl _start
        .text
_start:
        mov $'H', %al
        mov $0x0e, %ah
        int $0x10

        mov $'o', %al
        mov $0x0e, %ah
        int $0x10

        mov $'l', %al
        mov $0x0e, %ah
        int $0x10

        mov $'a', %al
        mov $0x0e, %ah
        int $0x10

        mov $',', %al
        mov $0x0e, %ah
        int $0x10

        mov $' ', %al
        mov $0x0e, %ah
        int $0x10

        mov $'q', %al
        mov $0x0e, %ah
        int $0x10

        mov $'u', %al
        mov $0x0e, %ah
        int $0x10

        mov $'e', %al
        mov $0x0e, %ah
        int $0x10

        mov $'h', %al
        mov $0x0e, %ah
        int $0x10

        mov $'a', %al
        mov $0x0e, %ah
        int $0x10

        mov $'c', %al
        mov $0x0e, %ah
        int $0x10

        mov $'e', %al
        mov $0x0e, %ah
        int $0x10

        mov $'?', %al
        mov $0x0e, %ah
        int $0x10

        . = _start + 510
        .byte 0x55
        .byte 0xaa
