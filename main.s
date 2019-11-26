#extern imprime
	.global _start
	.text

	_start:
		enter $0, $0

		call imprime

        mov $60, %rax
        syscall
