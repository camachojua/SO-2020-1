.globl _start # Indicamos al enlazador la ubicacion de  _start 
_start:
        mov $10, %rdi  #guardamos el valor de a
        mov $12, %rsi  #guardamos el valor de b
      while:
        cmp $0, %rdi   #mientras a != 0
        jg cierto     #si es cierto
        jmp fin       #entonces se encontro el gcd
      cierto:
        mov %rdi, %rcx #guardamos el valor de a en un auxiliar
        mov %rdi, %rax #se asigna a "b" como el dividendo
        mov $0,   %rdx #el residuo
        mov %rdi, %rbx #se asigna a "a" como el divisor
        div %rbx     #se hace la divicion
        mov %rdx, %rdi #el residuo se almacena en "a"
        mov %rcx, %rsi #el antiguo valor de "a" pasa a ser el de "b"
        jmp while     #regresamos al ciclo
      fin:
        movq %rsi, %rax # Se guarda en rax el valor del gcd de a y b


