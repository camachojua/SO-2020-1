	.file	"yaMeDoy.c"
	.text
	.globl	mcd
	.type	mcd, @function
mcd:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	cmpl	$0, -24(%rbp)
	jne	.L2
	movl	-20(%rbp), %eax
	jmp	.L3
.L2:
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	div@PLT
	movq	%rax, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	mcd
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mcd, .-mcd
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
