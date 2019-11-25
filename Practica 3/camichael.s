.global _start
.text

_start:
	enter $0, $0 #Guardamos marco de ejecucion
	mov $0, %rax #recibe primer numero
	mov $0, %rbx #recibe segundo numero
	call imprimir 
    call salir

imprimir:
	enter $0, $0   	#Guardamos marco de ejecucion
	movq $1, %rax	# Llamada al sistema write
	movq $1, %rdi	# Archivo a escribir STDOUT
	movq $msg, %rsi	# Cadena a escribir
	movq $71, %rdx	 # sizeof(cadena)
	syscall
	leave                   # Epilogo
    ret


salir:
	movq $60, %rax
	movq $0, %rdi
	syscall

msg:
	.asciz "Carmichael: \n561\n1105\n1729\n2465\n2821\n6601\n"
