#int mcd(int a,int b){
#	if(b==0){
#		return a;
#	}
#	return mcd(b,a%b);
#}Codigo de esto en la zona marginada de C.
.globl _start
_start:
		mov $666, %rax	# Inserta valor
		mov $33, %rdi #Inserta valor
		call euclides
		call getOut
	euclides:
		cmp $0,%rdi	#Resta rdi a 0 y altera la bandera
		jne recursa			#Si no es 0.
		jmp getOut
	recursa:
		mov $0,%rdx
		div %rdi #Divide lo que este en rax entre lo que este en rdi
		mov %rdi,%rax #Llegados a este punto ya tenemos que hacer recursion, asi que movemos b a el lugar de a... que ya ni esta, pero no nos importa el cociente
		mov %rdx,%rdi #Movemos el residuo a el lugar donde estaba b.
		call euclides #Vuelve a llamarse.
	getOut:
		mov %rax,%rdi #Mueve a rdi
		mov $60,%rax #calls exit
		syscall
