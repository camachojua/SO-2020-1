#main(){
#int res=mcd(666,33);
#if(res==1) return 1;
#return 0;
#}
#int mcd(int a,int b){
#	if(b==0){
#		return a;
#	}
#	return mcd(b,a%b);
#}
#Codigo de esto (mas o menos...)en C.
#Regresa un 1 en rdi si son primos relativos. 0 en rdi en otro caso.
.globl _start
_start:
		mov $666, %rax	# Inserta valor de a
		mov $33, %rdi #Inserta valor de b
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
		mov %rax,%rdi #Mueve el mcd a rdi.
		cmp $1,%rdi #Checa si el resultado fue 1.Es decir primos relativos
		jne noPrimos #Si no fueron primos relativos, salta a
		call morir
	noPrimos:
		mov $0,%rdi
	morir:
		mov $60,%rax #calls exit
		syscall
		
