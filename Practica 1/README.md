# Práctica 1

### Vargas Aldaco Alejandro Emmanuel

Para compilar el programa se requiere make. En el path donde se encuentra el archivo mcd.s

```bash 
  $ make
```

Para ejecutar el programa por ejemplo

```bash
  $ ./gcd 3 2
  ...
  El MCD de 3 y 12 es 3
  ...
```

Para resolver el problema se verifico si b es igual a cero entonces el resultado es a (a%b) en otro caso gcd(b, a % b);
