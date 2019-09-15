void main()
{
	asm("_start:");
	asm("mov $0, %rax");
	asm("mov $0, %rbx");
	asm("salir:");
	asm("movq $1, %rax");
	asm("movq $1, %rdi");
	asm("movq $msg, %rsi");
	asm("movq $71, % rdx");
	asm("syscall");
	asm("movq $60, %rax");
	asm("movq $0, %rdi");
	asm("syscall");
	asm("msg:");
	asm(".asciz \"Los primero 6 numeros de carmichael son: 561,1105,1729,2465,2821,6601\"");
}