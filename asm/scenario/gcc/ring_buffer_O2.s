	.file	"ring_buffer.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%llu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	subq	$1064, %rsp
	.cfi_def_cfa_offset 1072
	movl	$129, %ecx
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	movq	%fs:40, %rax
	movq	%rax, 1048(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	rep stosq
	movl	$0, (%rdi)
	xorl	%edi, %edi
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L22:
	testl	%r8d, %r8d
	je	.L19
.L3:
	movl	%edi, %esi
	addl	$1, %edi
	movl	(%rsp,%rsi,4), %esi
	movzbl	%dil, %edi
	addq	%rsi, %r9
.L4:
	addl	$1, %eax
	cmpl	$5000000, %eax
	je	.L20
.L5:
	movl	%eax, %esi
	andl	$1, %esi
	cmpl	$256, %ecx
	je	.L21
	movl	%edx, %r8d
	addl	$1, %edx
	movl	%eax, (%rsp,%r8,4)
	movzbl	%dl, %edx
	leal	1(%rcx), %r8d
	testl	%esi, %esi
	jne	.L22
	addl	$1, %eax
	movl	%r8d, %ecx
	cmpl	$5000000, %eax
	jne	.L5
.L20:
	testl	%ecx, %ecx
	je	.L6
.L7:
	movl	%edi, %eax
	addl	$1, %edi
	movl	(%rsp,%rax,4), %eax
	movzbl	%dil, %edi
	addq	%rax, %r9
	subl	$1, %ecx
	jne	.L7
.L6:
	xorl	%eax, %eax
	movq	%r9, %rdx
	movl	$2, %edi
	leaq	.LC0(%rip), %rsi
	call	__printf_chk@PLT
	movq	1048(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L23
	xorl	%eax, %eax
	addq	$1064, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	testl	%esi, %esi
	je	.L4
	movl	$255, %ecx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L19:
	xorl	%ecx, %ecx
	jmp	.L4
.L23:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE25:
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
