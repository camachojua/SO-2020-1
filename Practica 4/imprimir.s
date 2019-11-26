.global funcion
.text
funcion:
    enter $0, $0
	movq $1, %rax
	movq $1, %rdi
	movq $msg, %rsi
	movq $71, %rdx
	syscall
    leave
    ret

msg:
	.asciz "Carmichael: \n561\n1105\n1729\n2465\n2821\n6601\n"	
