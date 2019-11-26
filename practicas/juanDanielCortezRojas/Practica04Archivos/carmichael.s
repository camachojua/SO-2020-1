.global carmichael
.text
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