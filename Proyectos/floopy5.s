.code16                         # Indicamos al ensamblador que se generara un codigo de 16 bits
.globl main                     # Exportamos el simbolo de la fuccion main
.text                           # Declaramos el inicio de la seccion de texto

main:                           # main: Su objetivo es rellenar espacio en memoria (crear un floppy a mano) y declarar variables
        jmp _start              # Salta a la funcion _start que recorre una cadena
        .byte 144
        .ascii "WebOS"
        .word 512
        .byte 1
        .word 1
        .byte 2
        .word 224
        .word 2880
        .byte 0xf0
        .word 9
        .word 18
        .word 2
        .long 0
        .byte 0
        .byte 0
        .byte 0x29
        .long 0x12345678
        .ascii "WebOS Disk"
        .ascii "FAT12   "

_start:                         # Recorre el conenido de una cadena para imprimirlo despues
        movw $0, %ax
        movw %ax, %ss
        movw %ax, %ds
        movw %ax, %es
        movw $cadena, %si
        jmp init
	response: .asciz "\n\rHolo, desde vim\n\r(uwu)_/p    "  # Definimos la cadena a escribir
        welcome: .asciz "\n\r PiedraOS mk291019.\n\r Please be aware that this is pretty much a dummy code \n\r (uwu)_/p    "  # Definimos la cadena a escribir
        
	.macro imprimeCadena str               # macro que llama a una funcion para imprimir una cadena
            leaw  \str, %si
            call pintaCadena
        .endm
pintaCadena:
        lodsb
        orb  %al, %al
        jnz   loQueSigue
	jmp infinito
loQueSigue:
        movb $0x0e, %ah
        int  $0x10
        jmp  pintaCadena
init:
	imprimeCadena welcome
infinito:                       # Cicla el programa para mostrar el input del teclado del usuario.
	mov $0x00, %ah
	int $0x16
	mov $0x0e, %ah
	int $0x10
	addw $1, %si		#Incrementa si.
	cmp $0x0D,%al		#Mientras que no detecte un enter en el al (tras recibir entrada por la interrupcion) va a seguir aqui, imprimiendo nada mas lo que salga.
	je  addCommand		
	jmp infinito
addCommand:
	imprimeCadena response
cadena:
        .ascii "xwx"
        .byte 0
        .fill 0x1fe - (. - main), 1, 0
        .word 0xaa55
