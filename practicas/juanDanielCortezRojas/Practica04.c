#include <stdio.h>
int main()
{
   

        asm("enter $0, $0    ")//preludio
        //asignacion de parametros n y k para los numeros de Carmichael. 
        asm("mov $112, %rdi  ")//guardamos el valor de a
        asm("mov $12, %rsi  ")//guardamos el valor de b
        asm("call carmichael")
        asm("call salir")

asm("carmichael:")
        asm("enter $0, $0    ") //preludio
        //asignacion de parametros n y k para los numeros de Carmichael.
        asm("mov $6, %r8 ")//la cantidad de numeros de carmichael que queremos encontrar 
        asm("mov $4, %r9 ")//el indice o numero en que empezamos a buscar
      asm("whileC: ")//primer ciclo
        asm("cmp $1, %r8 ")//comparacion para el ciclo while, se rompe cuando encontremos 6 numeros de carmichael
        asm("jg busqueda ")//salta a la rutina de busqueda---->checar direccionamiento
        asm("jmp finC ")//se encontraron ya 6 numeros.
      
      asm("busqueda:")
        asm("mov %r9 %rdi ")//se pasa el parametro a la funcion compuesto
        asm("call compuesto ")//llamada a funcion
        asm("cmp $1, %rax ")//si es un nuemro compuesto
        asm("jg whileC2 ")//salta a buscar los primos relativos
        asm("jmp aumento")
      
      asm("whileC2:")
        asm("mov $2, %r10 ")//inicio del contador para primos relativos
        asm("jmp whileC3 ")//el verdadero while
      
      asm("whileC3:")
        asm("cmp %r9, %r10 ")//itera hasta que ya reviso todos los numeros anteriores al contador
        asm("jg ifgcd ")//si aun no lo es va a el if
        asm("jmp aumentoEncontrado")

      asm("ifgcd: ")//se checa si son primos relativos
        asm("mov %r9, %rdi ")// se pone como parametro para gcd
        asm("mov %r10 %rsi ")//segundo parametro para gcd
        asm("call gcd")
        asm("cmp $1, %rax ")//si son primos relativos
        asm("jg congruencia ")//se va a checar si son congruentes a^n-1 cong 1 mod n
        asm("jmp aumentoP ")// sino nos vamos al siguiente numero 

      asm("congruencia:")
        asm("mov %r10, %rdi ")//se lleva como parametro para elevar tantas veces como sea necesario
        asm("mov %r9, %rsi ")//el numero de veces a multiplicar
        asm("call potencia ")//llamada a funcion que eleva a una cierta potencia mod n
        //inicia comparacion 1 modulo n
        asm("cmp %rax, %1 ")//se compara si la potencia es congruente 1 modulo n
        asm("jg aumentoP ")//sigue siendoun posible candidato asi que seguimos iterando
        asm("jmp aumento ")//No es un numero de carmichael asi que se descarta

      asm("aumentoP: ")//no son primos relativos
        asm("inc %r10 ")//incremento al contador y regreso al ciclo
        asm("jmp whileC3")

      asm("aumento: ")//el numero no es un numero de carmichael
        asm("inc %r9 ")//incremento al contador y regreso al ciclo
        asm("jmp whileC")

      asm("aumentoEncontrado: ")//es un numero de carmicael
        asm("inc %r8 ")//hemos encontrado uno
        asm("inc %r9 ")//seguimos con un nuevo posible candidato
        asm("jmp whileC")


      asm("finC:")
        asm("movq $rsi, %rax")//Asignamos el valor de retorno que es el gdc        
        asm("leave")
        asm("ret")
//funcion
asm("compuesto:")
        asm("enter $0, $0 ")//preludio
        asm("mov $2, %r8 ")//inicio del contador
        asm("mov %rdi, %r9 ")//guardamos el parametro en otro registro
      asm("whileCom:")
        asm("cmp %r9, %r8 ")// iteramos mientras el contador sea menor a el parametro
        asm("jg finalFalse")
        //inicio de la divicion
        asm("mov %r9, %rax")
        asm("mov $0, %rdx ")// El dividendo es el parametro
        asm("mov %r8, %rbx ")// El divisor es el contador
        asm("div %rbx ")// paramtro/contador. El cociente se almacena en %rax
        // El residuo, que es el que nos importa, se almacena en %rdx
        asm("cmp %rdx, $0 ")//si la divicion fue entera
        asm("jg finalTrue ")//el numero es compuesto
        asm("inc %r8 ")//el numero no es compuesto("aun") asi que se incrementa el contador 
        asm("jmp whileCom ")// se regresa a las operaciones
      asm("finalTrue:")
        asm("mov $1, %rax ")//es un numero compuesto asi que se devuelve verdadero("1")
        asm("leave")
        asm("ret")
      asm("finalTrue:")
        asm("mov $0, %rax ")//es un numero primo asi que se devuelve falso("0")
        asm("leave")
        asm("ret  ")
//Funcion
asm("mcd:")
        asm("enter $0, $0    ")//preludio

      asm("while:")
        asm("cmp $0, %rdi   ")//mientras a != 0 ("Checar si esta bien el direccionamiento")
        asm("jg cierto     ")//si es cierto
        asm("jmp fin       ")//entonces se encontro el gcd
      asm("cierto:")
        asm("mov %rdi, %rcx ")//guardamos el valor de a en un auxiliar
        asm("mov %rdi, %rax ")//se asigna a "b" como el dividendo
        asm("mov $0,   %rdx ")//el residuo
        asm("mov %rdi, %rbx ")//se asigna a "a" como el divisor
        asm("div %rbx     ")//se hace la divicion
        asm("mov %rdx, %rdi ")//el residuo se almacena en "a"
        asm("mov %rcx, %rsi ")//el antiguo valor de "a" pasa a ser el de "b"
        asm("jmp while     ")//regresamos al ciclo
      asm("fin:")
        asm("movq $rsi, %rax     ")//Asignamos el valor de retorno que es el gdc        
        asm("leave")
        asm("ret")

//funcion que eleva a una potencia, recive la potencia y el numero a elevar
asm("potencia:")
        asm("enter $0, $0 ")//preludio
        asm("mov $1, %r8 ")//inicio del contador
        asm("mov %rsi, %r9 ")//movemos a un registro temporal
        //divicion de n/2 para optimizar operaciones
        asm("dec %rdi ")//se toma n-1 para que en la congruencia sea conguente 1 mod n
        asm("mov %rdi, %rax")
        asm("mov $0, %rdx ")// El dividendo es 0:n
        asm("mov $2, %rbx ")// El divisor es 2
        asm("div %rbx ")// n/2. El cociente se almacena en %rax
        // El residuo se almacena en %rdx
        asm("mov %rdx, %r11 ")//alamezamos el residuo para proxima referencia

        asm("mov %rax %r10 ")//movemos el cociente("piso") para referencia de tope de ciclo
      asm("whilePotencia:")
        asm("cmp %r8, %r10 ")//mientras el contador sea menor al limite
        asm("jg ciertoPotenia ")//nos vamos al caso verdadero
        asm("jmp finPotencia ")//sino al final de ciclo

      asm("ciertoPotenia:")
        //multiplicacion temporal * temporal
        asm("mov $%r9, %rax")
        asm("mov $%r9, %rbx")
        asm("mul %rax")
        // fin de la multiplicacion
        asm("mov %rax, %r9 ")//almacenamos el valor de la multiplicacion de nuevo en el temporal
        //procedemos a hacer el modulo n
        asm("mov %r9, %rax")
        asm("mov $0, %rdx ")// El dividendo es 0:temp
        asm("mov %rdi, %rbx ")// El divisor es n
        asm("div %rbx ")// temp/n. El cociente se almacena en %rax
        // El residuo se almacena en %rdx el cual es lo que nos intereza
        asm("mov %rdx, %r9 ")//alamcenamos el residuo modulo n en r9
        asm("inc %r8 ")//incrementamos
        asm("jmp whilePotencia ")//regresamos al ciclo

      asm("finPotencia:")
        asm("cmp $0, %r11 ")//vemos si n es impar tenemos que volver a multiplicar
        asm("jg ifimpar")
        asm("jmp finfunc")
      asm("ifimpar:")
        //multiplicacion temporal * x
        asm("mov $%r9, %rax")
        asm("mov $%rsi, %rbx")
        asm("mul %rax")
        //pprocedemos a hacer el modulo
        asm("mov $0, %rdx ")// El dividendo es 0:temp * x
        asm("mov %rdi, %rbx ")// El divisor es n
        asm("div %rbx ")// temp/n. El cociente se almacena en %rax 
        // El residuo se almacena en %rdx que es el valor final

      asm("finfunc:")
        asm("mov %rdx, %rax ")//movemos para el retorno de la funcion
        asm("leave")
        asm("ret")

asm("salir:")
        asm("enter $0, $0 ")// Prologo
        asm("mov $60, %rax")
        asm("syscall")


   return 0;
}

