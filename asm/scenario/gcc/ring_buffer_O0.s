	.file	"ring_buffer.c"
	.text
	.type	push, @function
push:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	1032(%rax), %eax
	cmpl	$256, %eax
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movl	1024(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %ecx
	movl	-12(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	1024(%rax), %eax
	addl	$1, %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 1024(%rax)
	movq	-8(%rbp), %rax
	movl	1032(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 1032(%rax)
	movl	$1, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	push, .-push
	.type	pop, @function
pop:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	1032(%rax), %eax
	testl	%eax, %eax
	jne	.L5
	movl	$0, %eax
	jmp	.L6
.L5:
	movq	-8(%rbp), %rax
	movl	1028(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %edx
	movl	(%rax,%rdx,4), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	1028(%rax), %eax
	addl	$1, %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 1028(%rax)
	movq	-8(%rbp), %rax
	movl	1032(%rax), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 1032(%rax)
	movl	$1, %eax
.L6:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	pop, .-pop
	.section	.rodata
.LC0:
	.string	"%llu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1072, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-1056(%rbp), %rdx
	movl	$0, %eax
	movl	$129, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	movl	$0, -1072(%rbp)
	movq	$0, -1064(%rbp)
	movl	$0, -1068(%rbp)
	jmp	.L8
.L10:
	movl	-1068(%rbp), %edx
	leaq	-1056(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	push
	movl	-1068(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L9
	leaq	-1072(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	pop
	testl	%eax, %eax
	je	.L9
	movl	-1072(%rbp), %eax
	movl	%eax, %eax
	addq	%rax, -1064(%rbp)
.L9:
	addl	$1, -1068(%rbp)
.L8:
	cmpl	$4999999, -1068(%rbp)
	jbe	.L10
	jmp	.L11
.L12:
	movl	-1072(%rbp), %eax
	movl	%eax, %eax
	addq	%rax, -1064(%rbp)
.L11:
	leaq	-1072(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	pop
	testl	%eax, %eax
	jne	.L12
	movq	-1064(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
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
