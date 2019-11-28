
    
    .global _start
    .text           #Iniciamos instrucciones para el ejecutable.
_start:
	movq $30, %rax

                  #Definimos nuestro primer y segundo numero respectivamente
	movq $10, %rdx  
	movq $29, %rbx  

while:
	div %rbx        #Ejecutamos division de lo numeros
	mov %rdx, %r8   #Almacenamos el residuo de la division en r8
	mov %rbx, %rax  #Renombramos al segundo numero por el primero
	mov %rax, %rcx
	mov $0, %rdx    #rdx vuelve a ser 0
	mov %r8, %rbx   #Almacenamos nuestro residuo en rbx
	cmp $0, %r8     #Comparamos si el residuo es igual a 0
	jne while

	cmp $1, %rcx    #Comparamos si son primos relativos
	je primosRelativos
	mov $0, %rdi    #Movemos el resultado al registro de salida
	mov $60, %rax
	syscall


primosRelativos:
	mov $60, %rax 	 #Actualizamos
	mov %rcx, %rdi   #Regresamos el ultimo residuo
	syscall