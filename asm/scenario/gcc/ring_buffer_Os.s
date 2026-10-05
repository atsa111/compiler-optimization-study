	.file	"ring_buffer.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%llu\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	endbr64
	subq	$1064, %rsp
	.cfi_def_cfa_offset 1072
	movl	$259, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%fs:40, %rax
	movq	%rax, 1048(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rdi
	rep stosl
	xorl	%edi, %edi
.L4:
	cmpl	$256, %edx
	je	.L2
	movl	%edi, %r8d
	incl	%edi
	incl	%edx
	movl	%esi, 12(%rsp,%r8,4)
	movzbl	%dil, %edi
.L2:
	testl	$1, %esi
	je	.L3
	testl	%edx, %edx
	je	.L3
	movl	%eax, %r8d
	incl	%eax
	decl	%edx
	movl	12(%rsp,%r8,4), %r8d
	movzbl	%al, %eax
	addq	%r8, %rcx
.L3:
	incl	%esi
	cmpl	$5000000, %esi
	jne	.L4
.L6:
	testl	%edx, %edx
	je	.L5
	movl	%eax, %esi
	incl	%eax
	decl	%edx
	movl	12(%rsp,%rsi,4), %esi
	movzbl	%al, %eax
	addq	%rsi, %rcx
	jmp	.L6
.L5:
	xorl	%eax, %eax
	movq	%rcx, %rdx
	movl	$2, %edi
	leaq	.LC0(%rip), %rsi
	call	__printf_chk@PLT
	movq	1048(%rsp), %rax
	subq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	xorl	%eax, %eax
	addq	$1064, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
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
