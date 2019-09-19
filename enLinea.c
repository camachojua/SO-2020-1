void main()
{
  asm("mov $60, %rax");
  asm("mov $42, %rdi");
  asm("syscall");
}
