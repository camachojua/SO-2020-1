.global _start
.text
_start:
        mov $7, %rax
        mov $3, %rbx
        mul %rbx                # El resultado se almacena en %rdx:%rax

## Despues de multiplicar utilizaremos la llamada al sistema exit() para
## notificar al sistema operativo el resultado de la operacion
        mov %rax, %rbx          # Movemos el resultado de mul a %rbx
        mov $60, %rax           # Llamada al sistema exit()
        mov %rbx, %rdi          # Establecemos el valor de salida
        syscall                 # La llamada al sistema exit utiliza un byte
                                # para reportar el codigo de salida
