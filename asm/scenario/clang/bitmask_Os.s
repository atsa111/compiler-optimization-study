	.text
	.file	"bitmask.c"
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	movl	$305419896, %edx                # imm = 0x12345678
	movl	$10000000, %eax                 # imm = 0x989680
	xorl	%ecx, %ecx
	xorl	%esi, %esi
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	andl	$-3881, %edx                    # imm = 0xF0D7
	movl	%ecx, %edi
	andl	$3840, %edi                     # imm = 0xF00
	orl	%edx, %edi
	xorl	$136, %edi
	xorl	%edi, %esi
	addl	$256, %ecx                      # imm = 0x100
	movl	%edi, %edx
	decl	%eax
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
