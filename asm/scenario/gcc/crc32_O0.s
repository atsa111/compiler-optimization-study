	.file	"crc32.c"
	.text
	.type	crc32, @function
crc32:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$-1, -20(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L2
.L5:
	movq	-40(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	xorl	%eax, -20(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L3
.L4:
	movl	-20(%rbp), %eax
	andl	$1, %eax
	negl	%eax
	movl	%eax, -12(%rbp)
	movl	-20(%rbp), %eax
	shrl	%eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	andl	$-306674912, %eax
	xorl	%edx, %eax
	movl	%eax, -20(%rbp)
	addl	$1, -16(%rbp)
.L3:
	cmpl	$7, -16(%rbp)
	jbe	.L4
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jb	.L5
	movl	-20(%rbp), %eax
	notl	%eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	crc32, .-crc32
	.section	.rodata
.LC0:
	.string	"%u\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -4120(%rbp)
	jmp	.L8
.L9:
	movq	-4120(%rbp), %rax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	11(%rax), %edx
	leaq	-4112(%rbp), %rcx
	movq	-4120(%rbp), %rax
	addq	%rcx, %rax
	movb	%dl, (%rax)
	addq	$1, -4120(%rbp)
.L8:
	cmpq	$4095, -4120(%rbp)
	jbe	.L9
	movl	$0, -4128(%rbp)
	movl	$0, -4124(%rbp)
	jmp	.L10
.L11:
	leaq	-4112(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	crc32
	xorl	%eax, -4128(%rbp)
	addl	$1, -4124(%rbp)
.L10:
	cmpl	$1999, -4124(%rbp)
	jbe	.L11
	movl	-4128(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
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
