	.text
	.file	"bitmask.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	movl	$305419896, %eax                # imm = 0x12345678
	xorl	%ecx, %ecx
	movl	$10000000, %edx                 # imm = 0x989680
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	andl	$-3881, %eax                    # imm = 0xF0D7
	movl	%ecx, %edi
	andl	$3584, %edi                     # imm = 0xE00
	leal	(%rdi,%rax), %r8d
	xorl	%esi, %r8d
	addl	%edi, %eax
	addl	$264, %eax                      # imm = 0x108
	xorl	%eax, %r8d
	movl	%r8d, %esi
	xorl	$136, %esi
	addl	$512, %ecx                      # imm = 0x200
	addl	$-2, %edx
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
	.asciz	"%u\n"
	.size	.L.str, 4

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
