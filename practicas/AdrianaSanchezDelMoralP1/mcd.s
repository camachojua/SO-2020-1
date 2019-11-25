.text
.globl	gcd
.type	gcd, @function
gcd:
.LFB6:
.cfi_startproc
pushq	%rbp
.cfi_def_cfa_offset 16
.cfi_offset 6, -16
movq	%rsp, %rbp
.cfi_def_cfa_register 6
subq	$16, %rsp
movl	%edi, -4(%rbp)
movl	%esi, -8(%rbp)
cmpl	$0, -8(%rbp)
jne	.L2
movl	-4(%rbp), %eax
jmp	.L3
.L2:
movl	-4(%rbp), %eax
cltd
idivl	-8(%rbp)
movl	-8(%rbp), %eax
movl	%edx, %esi
movl	%eax, %edi
call	gcd
.L3:
leave
.cfi_def_cfa 7, 8
ret
.cfi_endproc
.LFE6:
.size	gcd, .-gcd
.section	.rodata
.LC0:
.string	"El MCD de %d y %d es %d \n"
.text
.globl	main
.type	main, @function
main:
.LFB7:
.cfi_startproc
pushq	%rbp
.cfi_def_cfa_offset 16
.cfi_offset 6, -16
movq	%rsp, %rbp
.cfi_def_cfa_register 6
subq	$32, %rsp
movl	%edi, -20(%rbp)
movq	%rsi, -32(%rbp)
movq	-32(%rbp), %rax
addq	$8, %rax
movq	(%rax), %rax
movq	%rax, %rdi
call	atoi@PLT
movl	%eax, -4(%rbp)
movq	-32(%rbp), %rax
addq	$16, %rax
movq	(%rax), %rax
movq	%rax, %rdi
call	atoi@PLT
movl	%eax, -8(%rbp)
movl	-8(%rbp), %edx
movl	-4(%rbp), %eax
movl	%edx, %esi
movl	%eax, %edi
call	gcd
movl	%eax, %ecx
movl	-8(%rbp), %edx
movl	-4(%rbp), %eax
movl	%eax, %esi
leaq	.LC0(%rip), %rdi
movl	$0, %eax
call	printf@PLT
movl	$0, %eax
leave
.cfi_def_cfa 7, 8
ret
.cfi_endproc
.LFE7:
.size	main, .-main
