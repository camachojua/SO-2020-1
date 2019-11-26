void main()
{
  asm(".global _start");  
  asm(".text"); 

  asm("enter $0, $0");
  asm("mov $0, %rax");  
  asm("mov $0, %rbx");
  asm("call imprimir");  
  asm("call salir");

  asm("imprimir:");  
  asm("enter $0, $0");
  asm("movq $1, %rax");  
  asm("movq $1, %rdi");
  asm("movq $msg, %rsi");  
  asm("movq $71, %rdx");
  asm("syscall");  
  asm("leave");
  asm("ret");  

  asm("salir:");
  asm("movq $60, %rax");  
  asm("movq $0, %rdi");
  asm("syscall");  
  
  asm("msg:");
  asm(".asciz \"Los  6 primeros numeros de carmichael son: 561,1105,1729,2465,2821,6601\"");  
}