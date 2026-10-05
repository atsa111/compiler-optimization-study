	.file	"low_pass_filter.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	endbr64
	xorl	%edx, %edx
	pushq	%rcx
	.cfi_def_cfa_offset 16
	xorl	%esi, %esi
	xorl	%ecx, %ecx
.L2:
	imull	$37, %edx, %edi
	movl	%edx, %eax
	incl	%edx
	shrl	$3, %eax
	addl	%edi, %eax
	andl	$4095, %eax
	subl	$2048, %eax
	subl	%ecx, %eax
	sarl	$3, %eax
	addl	%eax, %ecx
	movslq	%ecx, %rax
	addq	%rax, %rsi
	cmpl	$5000000, %edx
	jne	.L2
	movq	%rsi, %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	popq	%rdx
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
