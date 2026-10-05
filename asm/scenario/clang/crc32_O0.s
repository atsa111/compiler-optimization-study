	.text
	.file	"crc32.c"
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
	subq	$4128, %rsp                     # imm = 0x1020
	movl	$0, -4(%rbp)
	movq	$0, -4120(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpq	$4096, -4120(%rbp)              # imm = 0x1000
	jae	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	imulq	$37, -4120(%rbp), %rax
	addq	$11, %rax
	andq	$255, %rax
	movb	%al, %cl
	movq	-4120(%rbp), %rax
	movb	%cl, -4112(%rbp,%rax)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-4120(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -4120(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movl	$0, -4124(%rbp)
	movl	$0, -4128(%rbp)
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$2000, -4128(%rbp)              # imm = 0x7D0
	jae	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	leaq	-4112(%rbp), %rdi
	movl	$4096, %esi                     # imm = 0x1000
	callq	crc32
	xorl	-4124(%rbp), %eax
	movl	%eax, -4124(%rbp)
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=1
	movl	-4128(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4128(%rbp)
	jmp	.LBB0_5
.LBB0_8:
	movl	-4124(%rbp), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$4128, %rsp                     # imm = 0x1020
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function crc32
	.type	crc32,@function
crc32:                                  # @crc32
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$-1, -20(%rbp)
	movq	$0, -32(%rbp)
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jae	.LBB1_8
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	xorl	-20(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	$0, -36(%rbp)
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$8, -36(%rbp)
	jae	.LBB1_6
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
	movl	-20(%rbp), %ecx
	andl	$1, %ecx
	xorl	%eax, %eax
	subl	%ecx, %eax
	movl	%eax, -40(%rbp)
	movl	-20(%rbp), %eax
	shrl	%eax
	movl	-40(%rbp), %ecx
	andl	$3988292384, %ecx               # imm = 0xEDB88320
	xorl	%ecx, %eax
	movl	%eax, -20(%rbp)
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=2
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB1_3
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB1_1
.LBB1_8:
	movl	-20(%rbp), %eax
	xorl	$-1, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	crc32, .Lfunc_end1-crc32
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
	.addrsig_sym crc32
	.addrsig_sym printf
