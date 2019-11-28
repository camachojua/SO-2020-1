void main()
{
  #asm(".text");
  asm("movq $1, %rax");
  asm("movq $1, %rdi");     
  asm("movq $msg, %rsi");
  asm("movq $36, %rdx");
  asm("syscall");
        
  asm("movq $60, %rax");
  asm("movq $0, %rdi");     
  asm("syscall");
        
  asm("msg: .ascii \"561, 1105, 1729, 2465, 2821, 6601 \n\"");
  }
