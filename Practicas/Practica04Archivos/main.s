.globl _start # Indicamos al enlazador la ubicacion de  _start 
_start:
        enter $0, $0
        call salir

    salir:
        enter $0, $0            # Prologo
        mov $60, %rax
        syscall