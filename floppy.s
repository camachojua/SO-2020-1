        .code16
        .globl _start
        .text
_start:
        . = _start + 510
        .byte 0x55
        .byte 0xaa
