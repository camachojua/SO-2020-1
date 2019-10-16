__asm__(".code16\n");
__asm__("jmpl $0x0000, $main\n");

void imprimeCadena(const char *cadena)
{
  while(*cadena) {
    __asm__ __volatile__("int $0x10" : : "a"(0x0e00 | *cadena), "b"(0x0007));
    ++cadena;
  }
}

void main()
{
  imprimeCadena("Hola mundo");
}
