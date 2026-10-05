	.text
	.file	"ring_buffer.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$1040, %rsp                     # imm = 0x410
	.cfi_def_cfa_offset 1056
	.cfi_offset %rbx, -16
	leaq	4(%rsp), %rdi
	xorl	%ebx, %ebx
	movl	$1036, %edx                     # imm = 0x40C
	xorl	%esi, %esi
	callq	memset@PLT
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_1 Depth=1
	movl	1032(%rsp), %edi
	movl	4(%rsp,%rdi,4), %r8d
	incl	%edi
	movzbl	%dil, %edi
	movl	%edi, 1032(%rsp)
	decl	%edx
	movl	%edx, 1036(%rsp)
	addq	%r8, %rsi
	movl	%edx, %ebx
	movl	%edx, %edi
.LBB0_15:                               #   in Loop: Header=BB0_1 Depth=1
	incl	%eax
	cmpl	$5000000, %eax                  # imm = 0x4C4B40
	je	.LBB0_6
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	%edi, %r8d
	movl	$256, %edi                      # imm = 0x100
	cmpl	$256, %r8d                      # imm = 0x100
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	%ecx, %ecx
	movl	%eax, 4(%rsp,%rcx,4)
	movl	1028(%rsp), %ecx
	movl	1036(%rsp), %ebx
	incl	%ecx
	movzbl	%cl, %ecx
	movl	%ecx, 1028(%rsp)
	incl	%ebx
	movl	%ebx, 1036(%rsp)
	movl	%ebx, %edx
	movl	%ebx, %edi
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	testb	$1, %al
	je	.LBB0_15
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%edx, %edx
	jne	.LBB0_14
# %bb.5:                                #   in Loop: Header=BB0_1 Depth=1
	xorl	%edx, %edx
	xorl	%edi, %edi
	jmp	.LBB0_15
.LBB0_6:
	testl	%ebx, %ebx
	je	.LBB0_13
# %bb.7:
	movl	1032(%rsp), %eax
	testb	$1, %bl
	jne	.LBB0_9
# %bb.8:
	movl	%ebx, %ecx
	cmpl	$1, %ebx
	jne	.LBB0_11
	jmp	.LBB0_13
.LBB0_9:
	movl	4(%rsp,%rax,4), %edx
	incl	%eax
	movzbl	%al, %eax
	movl	%eax, 1032(%rsp)
	leal	-1(%rbx), %ecx
	movl	%ecx, 1036(%rsp)
	addq	%rdx, %rsi
	cmpl	$1, %ebx
	je	.LBB0_13
.LBB0_11:
	decl	%ecx
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, %edx
	movl	4(%rsp,%rdx,4), %edx
	addq	%rsi, %rdx
	leal	1(%rax), %esi
	movzbl	%sil, %esi
	movl	%esi, 1032(%rsp)
	movl	%ecx, 1036(%rsp)
	movl	4(%rsp,%rsi,4), %esi
	addq	%rdx, %rsi
	addl	$2, %eax
	movzbl	%al, %eax
	movl	%eax, 1032(%rsp)
	leal	-1(%rcx), %edx
	movl	%edx, 1036(%rsp)
	addl	$-2, %ecx
	cmpl	$-1, %ecx
	jne	.LBB0_12
.LBB0_13:
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$1040, %rsp                     # imm = 0x410
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%llu\n"
	.size	.L.str, 6

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
