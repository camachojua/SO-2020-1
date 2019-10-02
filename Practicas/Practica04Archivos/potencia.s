.global potencia
.text
#funcion que eleva a una potencia, recive la potencia y el numero a elevar
potencia:
        enter $0, $0    #preludio
        mov $1, %r8 #inicio del contador
        mov %rsi, %r9 #movemos a un registro temporal
        #divicion de n/2 para optimizar operaciones
        dec %rdi #se toma n-1 para que en la congruencia sea conguente 1 mod n
        mov %rdi, %rax
        mov $0, %rdx # El dividendo es 0:n
        mov $2, %rbx # El divisor es 2
        div %rbx # n/2. El cociente se almacena en %rax
        # El residuo se almacena en %rdx
        mov %rdx, %r11 #alamezamos el residuo para proxima referencia

        mov %rax %r10 #movemos el cociente(piso) para referencia de tope de ciclo
      whilePotencia:
        cmp %r8, %r10 #mientras el contador sea menor al limite
        jg ciertoPotenia #nos vamos al caso verdadero
        jmp finPotencia #sino al final de ciclo

      ciertoPotenia:
        #multiplicacion temporal * temporal
        mov $%r9, %rax
        mov $%r9, %rbx
        mul %rax
        # fin de la multiplicacion
        mov %rax, %r9 #almacenamos el valor de la multiplicacion de nuevo en el temporal
        #procedemos a hacer el modulo n
        mov %r9, %rax
        mov $0, %rdx # El dividendo es 0:temp
        mov %rdi, %rbx # El divisor es n
        div %rbx # temp/n. El cociente se almacena en %rax
        # El residuo se almacena en %rdx el cual es lo que nos intereza
        mov %rdx, %r9 #alamcenamos el residuo modulo n en r9
        inc %r8 #incrementamos
        jmp whilePotencia #regresamos al ciclo

      finPotencia:
        cmp $0, %r11 #vemos si n es impar tenemos que volver a multiplicar
        jg ifimpar
        jmp finfunc
      ifimpar:
        #multiplicacion temporal * x
        mov $%r9, %rax
        mov $%rsi, %rbx
        mul %rax
        #pprocedemos a hacer el modulo
        mov $0, %rdx # El dividendo es 0:temp * x
        mov %rdi, %rbx # El divisor es n
        div %rbx # temp/n. El cociente se almacena en %rax 
        # El residuo se almacena en %rdx que es el valor final

      finfunc:
        mov %rdx, %rax #movemos para el retorno de la funcion
        leave
        ret
