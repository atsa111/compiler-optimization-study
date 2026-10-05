	.text
	.file	"low_pass_filter.c"
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	%edx, %edi
	shrl	$3, %edi
	addl	%eax, %edi
	andl	$4095, %edi                     # imm = 0xFFF
	subl	%ecx, %edi
	addl	$-2048, %edi                    # imm = 0xF800
	sarl	$3, %edi
	addl	%edi, %ecx
	movslq	%ecx, %rdi
	addq	%rdi, %rsi
	incl	%edx
	addl	$37, %eax
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
