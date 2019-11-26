.global compuesto
.text
compuesto:
        enter $0, $0 #preludio
        mov $2, %r8 #inicio del contador
        mov %rdi, %r9 #guardamos el parametro en otro registro
      whileCom:
        cmp %r9, %r8 # iteramos mientras el contador sea menor a el parametro
        jg finalFalse
        #inicio de la divicion
        mov %r9, %rax 
        mov $0, %rdx # El dividendo es el parametro
        mov %r8, %rbx # El divisor es el contador
        div %rbx # paramtro/contador. El cociente se almacena en %rax
        # El residuo, que es el que nos importa, se almacena en %rdx
        cmp %rdx, $0 #si la divicion fue entera
        jg finalTrue #el numero es compuesto
        inc %r8 #el numero no es compuesto(aun) asi que se incrementa el contador 
        jmp whileCom # se regresa a las operaciones
      finalTrue:
        mov $1, %rax #es un numero compuesto asi que se devuelve verdadero(1)
        leave
        ret
      finalTrue:
        mov $0, %rax #es un numero primo asi que se devuelve falso(0)
        leave
        ret  
