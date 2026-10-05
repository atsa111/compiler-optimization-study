	.file	"low_pass_filter.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%ecx, %eax
	addl	$1, %ecx
	shrl	$3, %eax
	addl	%esi, %eax
	addl	$37, %esi
	andl	$4095, %eax
	subl	$2048, %eax
	subl	%edx, %eax
	sarl	$3, %eax
	addl	%eax, %edx
	movslq	%edx, %rax
	addq	%rax, %rdi
	cmpl	$5000000, %ecx
	jne	.L2
	movq	%rdi, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
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
