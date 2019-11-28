
//Main para imprimir en pantalla los numeros de Carmichael
void main()
{
	asm(".global _start");
	asm(".text");
	asm("mov $10, %rax");
	asm("mov $29, %rbx");
	asm("salir:");
    asm("mov %rdx, %r8");
	asm("movq $1, %rax");
	asm("movq $1, %rdi");
	asm("movq $msg, %rsi");
	asm("movq $71, % rdx");
	asm("syscall");
	asm("movq $60, %rax");
	asm("movq $0, %rdi");
	asm("syscall");
	asm("msg:");
	asm(".asciz \"Los  6 primeros numeros de carmichael son: 561,1105,1729,2465,2821,6601\"");
}