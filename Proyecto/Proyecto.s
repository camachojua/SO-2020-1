#Juan Daniel Cortez Rojas
        .code16
	.globl _start
        .text
_start:
        jmp boot

prompt: .asciz ">"        
        .macro imprimePrompt cadena
        leaw \cadena, %si
        call imprimeCadena
        .endm

limpiaPantalla:         # Se limpia la pantalla antes de iniciar
        mov $0x03, %al  # Modo texto 80x25
        mov $0x00, %ah
        int $0x10
        imprimePrompt prompt

imprimeCadena:
        #aqui esta el problema, se cicla imprimiendo
        # Recorremos la cadena del prompt
        movl %esi, %esp #temporal donde guardamos el limite de la cadena que leimos
        dec %esp        # decrementamos ya que se apuntaba a la siguiente direccion a escribir
        movl $0, %esi   #iteramos desde cero
        # asignamos el primer indice
        movl (%edi, %esi, 1), %ebp  #checamos si el caracter esta vacio
        cmp $0x00, %ebp
        je imprimeProm # si es asi imprime el prompt
        mov (%edi, %esi, 1), %al #asignamos el caracter a imprimir
        #interrupcion para imprimir
        mov $0x0e, %ah
        int $0x10
        jmp imprimeCadena
imprimeProm:
        mov $'\n', %al #imprimirmos salto de linea
        mov $0x0e, %ah
        int $0x10
        mov $'>', %al #imprimimos el prompt
        mov $0x0e, %ah
        int $0x10
        
asignaBuffer:
        movl $0, %esi   #asignamos un buffer, el buffer esta en rdi
        mov $' ', %edi #movemos un caracter a rdi para que jamas este vacio
        # asignamos el primer indice
        #movl (%edi, %esi, 4), %rdx
        movl $0, %esi   #asignamos un buffer, el buffer esta en rdi
tecla:
	      mov $0x00, %ah  # Obten tecla presionada.
        int $0x16       # Interrupcion de teclado.


detectaTecla:
        cmp $0x0d, %al  # Es enter?
        je enter

        cmp $0x08, %al  # Es backspace?
        je backspace

        mov %al, (%edi, %esi, 1) #si no es un enter o backspace la guardamos en buffer
        #(base o arreglo, posicion, tamaño de dato)
        inc %esi #asignammos sigueinte posicion en el buffer

imprimeTecla:
        # Aqui el caracter que se puso esta en %al.
        mov $0x0e, %ah  # Imprimir caracter almacenado en %al.
        int $0x10

repite:
        jmp tecla       # Repite por siempre

enter:
        mov $0x0d, %al  # Imprimimos un retorno de carro
        mov $0x0e, %ah
        int $0x10

        mov $0x0a, %al  # Imprimimos un salto de linea.
        mov $0x0e, %ah
        int $0x10

        imprimePrompt prompt    # Imprimimos el prompt

backspace:

	mov $0x08, %al  # Nos movemos para atras
        mov $0x0e, %ah  # Movemos el cursor
        int $0x10

        mov $0x20, %al  # Espacio en blanco
        mov $0x0e, %ah  # Imprimimos el espacio en blanco
        int $0x10

        mov $0x08, %al  # Nos movemos para atras
        mov $0x0e, %ah  # Movemos el cursor
        int $0x10

        dec %esi #regresamos una posicion del buffer

        jmp tecla

shutdown:
        mov $0x5301, %ax
        xor %bx, %bx
        int $0x15

        mov $0x530e, %ax
        xor %bx, %bx
        mov $0x0102, %cx
        int $0x15

        mov $0x5307, %ax
        mov $0x0001, %bx
        mov $0x0003, %cx
        int $0x15

boot:
        jmp limpiaPantalla

        . = _start + 510
        .byte 0x55
        .byte 0xaa
