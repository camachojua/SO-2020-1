.global imprime
.text
imprime:
	movq $1, %rax
	movq $1, %rdi
	movq $numeros, %rsi
	movq $72, %rdx
	syscall

numeros: .asciz "Primeros seis numeros de Carmichael:\n 561\n 1105\n 1729\n 2465\n 2821\n 6601\n"
