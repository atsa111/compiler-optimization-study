	.text
	.file	"bitmask.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$305419896, -8(%rbp)            # imm = 0x12345678
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$10000000, -16(%rbp)            # imm = 0x989680
	jae	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	update_register
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movl	-12(%rbp), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function update_register
	.type	update_register,@function
update_register:                        # @update_register
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	orl	$8, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	andl	$-33, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	xorl	$128, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	andl	$-3841, %eax                    # imm = 0xF0FF
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	andl	$15, %eax
	shll	$8, %eax
	orl	-4(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	update_register, .Lfunc_end1-update_register
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
	.addrsig_sym update_register
	.addrsig_sym printf
