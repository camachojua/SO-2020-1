.globl _start # Indicamos al enlazador la ubicacion de  _start 
_start:
        mov $10, %rdi  
        mov $12, %rsi  
      while:
        cmp $0, %rdi   
        jg cierto     
        jmp fin       
      cierto:
        mov %rdi, %rcx 
        mov %rdi, %rax 
        mov $0,   %rdx 
        mov %rdi, %rbx 
        div %rbx     
        mov %rdx, %rdi 
        mov %rcx, %rsi 
        jmp while     
      fin:
        movq %rsi, %rax # Se guarda en rax el valor del gcd de a y b