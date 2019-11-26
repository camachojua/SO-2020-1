void main()
{
	
	asm("sub $8, %rsp");
	asm("movq %rsp, %rbp");
	asm("leaq numeros(%rip), %rdi");
	asm("xor %rax, %rax");
	asm("call printf");
	asm("xor %rax, %rax");
	asm("leave");
	asm("ret");

	asm("mov %rax, %rdi");
    asm("mov $60, %rax");
    asm("syscall");

    asm("numeros: .asciz \"Primeros seis numeros de Carmichael:\n561 \n1105 \n1729 \n2465 \n2821 \n6601 \n\"");
}