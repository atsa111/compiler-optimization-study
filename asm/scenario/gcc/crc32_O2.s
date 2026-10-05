	.file	"crc32.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC11:
	.string	"%u\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4104
	orq	$0, (%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 4128
	movdqa	.LC0(%rip), %xmm1
	movdqa	.LC1(%rip), %xmm11
	movdqa	.LC5(%rip), %xmm7
	movdqa	.LC6(%rip), %xmm6
	movdqa	.LC7(%rip), %xmm5
	movdqa	.LC8(%rip), %xmm4
	movdqa	.LC9(%rip), %xmm2
	movdqa	.LC10(%rip), %xmm3
	movdqa	.LC2(%rip), %xmm10
	movdqa	.LC3(%rip), %xmm9
	movdqa	.LC4(%rip), %xmm8
	movq	%fs:40, %rax
	movq	%rax, 4104(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r10
	leaq	4096(%rsp), %rdi
	movq	%r10, %rax
.L2:
	movdqa	%xmm1, %xmm0
	addq	$16, %rax
	paddq	%xmm11, %xmm1
	movdqa	%xmm0, %xmm12
	movdqa	%xmm0, %xmm13
	movdqa	%xmm0, %xmm14
	paddq	%xmm10, %xmm12
	paddq	%xmm8, %xmm14
	shufps	$136, %xmm12, %xmm13
	movdqa	%xmm0, %xmm12
	paddq	%xmm9, %xmm12
	shufps	$136, %xmm14, %xmm12
	movdqa	%xmm13, %xmm14
	punpcklwd	%xmm12, %xmm13
	punpckhwd	%xmm12, %xmm14
	movdqa	%xmm13, %xmm12
	punpckhwd	%xmm14, %xmm12
	punpcklwd	%xmm14, %xmm13
	movdqa	%xmm0, %xmm14
	punpcklwd	%xmm12, %xmm13
	movdqa	%xmm0, %xmm12
	paddq	%xmm6, %xmm14
	paddq	%xmm7, %xmm12
	pand	%xmm2, %xmm13
	shufps	$136, %xmm14, %xmm12
	movdqa	%xmm0, %xmm14
	paddq	%xmm4, %xmm0
	movdqa	%xmm12, %xmm15
	paddq	%xmm5, %xmm14
	shufps	$136, %xmm0, %xmm14
	movdqa	%xmm12, %xmm0
	punpckhwd	%xmm14, %xmm15
	punpcklwd	%xmm14, %xmm0
	movdqa	%xmm0, %xmm12
	punpcklwd	%xmm15, %xmm0
	punpckhwd	%xmm15, %xmm12
	punpcklwd	%xmm12, %xmm0
	movdqa	%xmm13, %xmm12
	pand	%xmm2, %xmm0
	packuswb	%xmm0, %xmm12
	movdqa	%xmm12, %xmm0
	paddb	%xmm12, %xmm0
	paddb	%xmm0, %xmm0
	paddb	%xmm0, %xmm0
	paddb	%xmm12, %xmm0
	paddb	%xmm0, %xmm0
	paddb	%xmm0, %xmm0
	paddb	%xmm12, %xmm0
	paddb	%xmm3, %xmm0
	movaps	%xmm0, -16(%rax)
	cmpq	%rdi, %rax
	jne	.L2
	movl	$2000, %r8d
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r10, %rsi
	movl	$-1, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movzbl	(%rsi), %edx
	xorl	%edx, %eax
	movl	$8, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%eax, %ecx
	andl	$1, %eax
	negl	%eax
	shrl	%ecx
	andl	$-306674912, %eax
	xorl	%ecx, %eax
	subl	$1, %edx
	jne	.L4
	addq	$1, %rsi
	cmpq	%rdi, %rsi
	jne	.L5
	xorl	%eax, %r9d
	notl	%r9d
	subl	$1, %r8d
	jne	.L3
	xorl	%eax, %eax
	movl	%r9d, %edx
	movl	$2, %edi
	leaq	.LC11(%rip), %rsi
	call	__printf_chk@PLT
	movq	4104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L13
	xorl	%eax, %eax
	addq	$4120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	0
	.quad	1
	.align 16
.LC1:
	.quad	16
	.quad	16
	.align 16
.LC2:
	.quad	2
	.quad	2
	.align 16
.LC3:
	.quad	4
	.quad	4
	.align 16
.LC4:
	.quad	6
	.quad	6
	.align 16
.LC5:
	.quad	8
	.quad	8
	.align 16
.LC6:
	.quad	10
	.quad	10
	.align 16
.LC7:
	.quad	12
	.quad	12
	.align 16
.LC8:
	.quad	14
	.quad	14
	.align 16
.LC9:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.align 16
.LC10:
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
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
