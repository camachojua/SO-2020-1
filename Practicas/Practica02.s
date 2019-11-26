.globl _start # Indicamos al enlazador la ubicacion de  _start 
_start:
        mov $112, %rdi  #guardamos el valor de a
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
        movq $1, %rax     # Llamada al sistema write
        movq $1, %rdi     # Archivo a escribir STDOUT
        cmp  $1, %rsi
        jg primos

        movq $msga, %rsi   # Cadena a escribir
        jmp noprimos
      
      primos:
        movq $msg, %rsi   # Cadena a escribir
      
      noprimos:
        movq $25, %rdx    # sizeof(cadena)
        syscall

        movq $60, %rax    # Llamada al systema exit
        movq $0, %rdi     # Estado de finalizacion
        syscall

msg:
.ascii "Son primos relativos"
msga:
.ascii "No son primos relativos"
