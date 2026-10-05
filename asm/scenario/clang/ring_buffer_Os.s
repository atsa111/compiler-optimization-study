	.text
	.file	"ring_buffer.c"
	.globl	main                            # -- Begin function main
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
	je	.LBB0_11
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%edx, %edx
	je	.LBB0_5
# %bb.10:                               #   in Loop: Header=BB0_1 Depth=1
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
	jmp	.LBB0_11
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	xorl	%edx, %edx
	xorl	%edi, %edi
.LBB0_11:                               #   in Loop: Header=BB0_1 Depth=1
	incl	%eax
	cmpl	$5000000, %eax                  # imm = 0x4C4B40
	jne	.LBB0_1
# %bb.6:
	testl	%ebx, %ebx
	je	.LBB0_9
# %bb.7:
	movl	1032(%rsp), %eax
	decl	%ebx
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	movl	4(%rsp,%rcx,4), %ecx
	addq	%rcx, %rsi
	incl	%eax
	movzbl	%al, %eax
	movl	%eax, 1032(%rsp)
	movl	%ebx, 1036(%rsp)
	addl	$-1, %ebx
	jb	.LBB0_8
.LBB0_9:
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
