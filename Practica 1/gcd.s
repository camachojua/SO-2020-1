#                                      ;ax, bx contain the two numbers
.global _start # Indicamos al enlazador la ubicacion de  _start 
.text
_start:

gcd0:   xor     %rdx,%rdx                   #divide
        div     %rbx
        mov     %rax,%rbx                   #ax = new dividend = old divisor
        mov     %rbx,%rdx                   #bx = new remainder
        test    %rbx,%rbx                   #loop if remainder != 0
        jnz     gcd0
#                                       ;ax = gcd
