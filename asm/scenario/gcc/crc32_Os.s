	.file	"crc32.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%u\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	endbr64
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4104
	orq	$0, (%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 4128
	xorl	%edx, %edx
	movb	$37, %cl
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %r8
.L2:
	movl	%edx, %eax
	incq	%rdx
	imull	%ecx, %eax
	addl	$11, %eax
	movb	%al, -1(%rdx,%r8)
	cmpq	$4096, %rdx
	jne	.L2
	movl	$2000, %esi
	xorl	%ecx, %ecx
.L3:
	orl	$-1, %eax
	xorl	%edx, %edx
.L5:
	movzbl	(%r8,%rdx), %edi
	xorl	%edi, %eax
	movl	$8, %edi
.L4:
	movl	%eax, %r9d
	andl	$1, %eax
	negl	%eax
	shrl	%r9d
	andl	$-306674912, %eax
	xorl	%r9d, %eax
	decl	%edi
	jne	.L4
	incq	%rdx
	cmpq	$4096, %rdx
	jne	.L5
	xorl	%eax, %ecx
	notl	%ecx
	decl	%esi
	jne	.L3
	xorl	%eax, %eax
	movl	%ecx, %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	4104(%rsp), %rax
	subq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	xorl	%eax, %eax
	addq	$4120, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
