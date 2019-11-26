.globl _start # Indicamos al enlazador la ubicacion de  _start 
_start:


        enter $0, $0    #preludio
        #asignacion de parametros n y k para los numeros de Carmichael. 
        mov $112, %rdi  #guardamos el valor de a
        mov $12, %rsi  #guardamos el valor de b
        call carmichael

carmichael:
        enter $0, $0    #preludio
        #asignacion de parametros n y k para los numeros de Carmichael.
        mov $6, %r8 #la cantidad de numeros de carmichael que queremos encontrar 
        mov $4, %r9 #el indice o numero en que empezamos a buscar
      whileC: #primer ciclo
        cmp $1, %r8 #comparacion para el ciclo while, se rompe cuando encontremos 6 numeros de carmichael
        jg busqueda #salta a la rutina de busqueda---->checar direccionamiento
        jmp finC #se encontraron ya 6 numeros.
      
      busqueda:
        mov %r9 %rdi #se pasa el parametro a la funcion compuesto
        call compuesto #llamada a funcion
        cmp $1, %rax #si es un nuemro compuesto
        jg whileC2 #salta a buscar los primos relativos
        jmp aumento
      
      whileC2:
        mov $2, %r10 #inicio del contador para primos relativos
        jmp whileC3 #el verdadero while
      
      whileC3:
        cmp %r9, %r10 #itera hasta que ya reviso todos los numeros anteriores al contador
        jg ifgcd #si aun no lo es va a el if
        jmp aumentoEncontrado

      ifgcd: #se checa si son primos relativos
        mov %r9, %rdi # se pone como parametro para gcd
        mov %r10 %rsi #segundo parametro para gcd
        call gcd
        cmp $1, %rax #si son primos relativos
        jg congruencia #se va a checar si son congruentes a^n-1 cong 1 mod n
        jmp aumentoP # sino nos vamos al siguiente numero 

      congruencia:
        mov %r10, %rdi #se lleva como parametro para elevar tantas veces como sea necesario
        mov %r9, %rsi #el numero de veces a multiplicar
        call potencia #llamada a funcion que eleva a una cierta potencia mod n
        #inicia comparacion 1 modulo n
        cmp %rax, %1 #se compara si la potencia es congruente 1 modulo n
        jg aumentoP #sigue siendoun posible candidato asi que seguimos iterando
        jmp aumento #No es un numero de carmichael asi que se descarta

      aumentoP: #no son primos relativos
        inc %r10 #incremento al contador y regreso al ciclo
        jmp whileC3

      aumento: #el numero no es un numero de carmichael
        inc %r9 #incremento al contador y regreso al ciclo
        jmp whileC

      aumentoEncontrado: #es un numero de carmicael
        inc %r8 #hemos encontrado uno
        inc %r9 #seguimos con un nuevo posible candidato
        jmp whileC


      finC:
        movq $rsi, %rax     #Asignamos el valor de retorno que es el gdc        
        leave
        ret
#funcion
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
#Funcion
mcd:
        enter $0, $0    #preludio

      while:
        cmp $0, %rdi   #mientras a != 0 (Checar si esta bien el direccionamiento)
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
        movq $rsi, %rax     #Asignamos el valor de retorno que es el gdc        
        leave
        ret

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

salir:
        enter $0, $0            # Prologo
        mov $60, %rax
        syscall
