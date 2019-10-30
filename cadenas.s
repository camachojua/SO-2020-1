	.global _start
        .global arreglo

        .data
arreglo:                        # Declaramos un arreglo de 3 elementos
        .byte 1
        .byte 3
        .byte 4
suma:
        .byte 0

        .text
_start:
        mov $3, %eax             # Longitud del arreglo
        mov $0, %ebx             # %ebx almacenara el valor de la suma
        mov $arreglo, %ecx       # %ecx apuntara al elemento que se sumara

recorreCadena:
        add (%ecx), %ebx
        add $1, %ecx            # Apuntamos al siguiente elemento
        dec %eax                # Decrementamos el contador
        jnz recorreCadena       # Volvemos a ejecutar el ciclo

fin:
        add $'\0', %ebx
        mov %ebx, (suma)        # Guardamos el resultado en suma

muestra:
	mov $1, %rax            # Llamada al sistema sys_write
        mov $1, %rdi            # Descriptor de archivo
        mov $suma, %rsi          # Cadena a imprimir
        mov $1, %rdx            # Bytes a imprimir
        syscall

        mov $60, %rax
        mov $0, %rdi
        syscall
