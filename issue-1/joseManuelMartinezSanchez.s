#Implementacion del Algoritmo de Euclides
                         # Especificamos al enlazador la ubicacion de  _start 
    .global _start
    .text               #Iniciamos las instrucciones para el ejecutable
	_start:
    movq $30, %rax
	                      #Definimos nuestros primer y segundo numero respectivamente.
    movq $10, %rdx
    movq $29, %rbx

	while:
    div %rbx            #Ejecutamos division de los numeros
    mov %rdx, %r8       #Almacenamos el residuo de la division en r8
    mov %rbx, %rax      #Renombramos al segundo numero por el primero
    mov %rax, %rcx
    mov $0, %rdx        #rdx vuelve a ser 0
    mov %r8, %rbx       #Almacenamos nuestro residuo en rbx
    cmp $0, %r8         #Comparamos si el residuo es igual a 0
    jne while

    mov $60, %rax	      #Actualizamos
    mov %rcx, %rdi      #Regresamos el ultimo residuo
    syscall
