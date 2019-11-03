    .code16
    .global _start
    .text

_start:
    jmp prev

prev:
     mov $'/', %al
    mov $0x0e, %ah
    int $0x10

    mov $'S', %al
    mov $0x0e, %ah
    int $0x10

    mov $'O', %al
    mov $0x0e, %ah
    int $0x10

    mov $'$', %al
    mov $0x0e, %ah
    int $0x10

    mov $' ', %al
    mov $0x0e, %ah
    int $0x10

    jmp boot

lee_tecla:
    mov $0x00,%ah
    int $0x16
    cmp $0x0d, %al
    je enter

imprime_tecla:
    mov $0x0e, %ah
    int $0x10   
    jmp lee_tecla

enter:
    mov $0x0d, %al 
    mov $0x0e, %ah
    int $0x10

    mov $0x0a, %al  
    mov $0x0e, %ah
    int $0x10

    mov $'p', %al
    mov $0x0e, %ah
    int $0x10

    mov $'r', %al
    mov $0x0e, %ah
    int $0x10

    mov $'u', %al
    mov $0x0e, %ah
    int $0x10

    mov $'e', %al
    mov $0x0e, %ah
    int $0x10

    mov $'b', %al
    mov $0x0e, %ah
    int $0x10

    mov $'a', %al
    mov $0x0e, %ah
    int $0x10

    mov $0x0d, %al 
    mov $0x0e, %ah
    int $0x10

    mov $0x0a, %al  
    mov $0x0e, %ah
    int $0x10

    jmp prev

boot:
    jmp lee_tecla
    .= _start +510
    .byte 0x55
    .byte 0xaa
