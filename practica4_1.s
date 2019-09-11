        .global funcion
        .text
funcion:
        enter $0, $0

        mov $2, %rax
        mov $0, %rdx
        mul %rdi

        leave
        ret
