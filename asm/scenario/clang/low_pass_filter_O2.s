	.text
	.file	"low_pass_filter.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	movl	$37, %eax
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	%edx, %r9d
	shrl	$3, %r9d
	leal	(%rax,%r9), %edi
	addl	%ecx, %r9d
	andl	$4095, %r9d                     # imm = 0xFFF
	subl	%r8d, %r9d
	addl	$-2048, %r9d                    # imm = 0xF800
	sarl	$3, %r9d
	addl	%r8d, %r9d
	movslq	%r9d, %r8
	movq	%rsi, %r9
	addq	%r8, %r9
	andl	$4095, %edi                     # imm = 0xFFF
	subl	%r8d, %edi
	addl	$-2048, %edi                    # imm = 0xF800
	sarl	$3, %edi
	addl	%r8d, %edi
	movslq	%edi, %rsi
	addq	%r9, %rsi
	addl	$2, %edx
	addl	$74, %eax
	addl	$74, %ecx
	movl	%edi, %r8d
	cmpl	$5000000, %edx                  # imm = 0x4C4B40
	jne	.LBB0_1
# %bb.2:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld\n"
	.size	.L.str, 6

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
