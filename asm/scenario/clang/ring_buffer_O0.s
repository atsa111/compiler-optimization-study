	.text
	.file	"ring_buffer.c"
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
	subq	$1072, %rsp                     # imm = 0x430
	movl	$0, -4(%rbp)
	leaq	-1040(%rbp), %rdi
	xorl	%esi, %esi
	movl	$1036, %edx                     # imm = 0x40C
	callq	memset@PLT
	movl	$0, -1044(%rbp)
	movq	$0, -1056(%rbp)
	movl	$0, -1060(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5000000, -1060(%rbp)           # imm = 0x4C4B40
	jae	.LBB0_7
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-1060(%rbp), %esi
	leaq	-1040(%rbp), %rdi
	callq	push
	movl	-1060(%rbp), %eax
	andl	$1, %eax
	cmpl	$0, %eax
	je	.LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	leaq	-1040(%rbp), %rdi
	leaq	-1044(%rbp), %rsi
	callq	pop
	cmpl	$0, %eax
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-1044(%rbp), %eax
                                        # kill: def $rax killed $eax
	addq	-1056(%rbp), %rax
	movq	%rax, -1056(%rbp)
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_6
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-1060(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1060(%rbp)
	jmp	.LBB0_1
.LBB0_7:
	jmp	.LBB0_8
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	leaq	-1040(%rbp), %rdi
	leaq	-1044(%rbp), %rsi
	callq	pop
	cmpl	$0, %eax
	je	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	movl	-1044(%rbp), %eax
                                        # kill: def $rax killed $eax
	addq	-1056(%rbp), %rax
	movq	%rax, -1056(%rbp)
	jmp	.LBB0_8
.LBB0_10:
	movq	-1056(%rbp), %rsi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$1072, %rsp                     # imm = 0x430
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function push
	.type	push,@function
push:                                   # @push
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rax
	cmpl	$256, 1032(%rax)                # imm = 0x100
	jne	.LBB1_2
# %bb.1:
	movl	$0, -4(%rbp)
	jmp	.LBB1_3
.LBB1_2:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	1024(%rcx), %ecx
                                        # kill: def $rcx killed $ecx
	movl	%edx, (%rax,%rcx,4)
	movq	-16(%rbp), %rax
	movl	1024(%rax), %ecx
	addl	$1, %ecx
	andl	$255, %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, 1024(%rax)
	movq	-16(%rbp), %rax
	movl	1032(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 1032(%rax)
	movl	$1, -4(%rbp)
.LBB1_3:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	push, .Lfunc_end1-push
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function pop
	.type	pop,@function
pop:                                    # @pop
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rax
	cmpl	$0, 1032(%rax)
	jne	.LBB2_2
# %bb.1:
	movl	$0, -4(%rbp)
	jmp	.LBB2_3
.LBB2_2:
	movq	-16(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	1028(%rcx), %ecx
                                        # kill: def $rcx killed $ecx
	movl	(%rax,%rcx,4), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, (%rax)
	movq	-16(%rbp), %rax
	movl	1028(%rax), %ecx
	addl	$1, %ecx
	andl	$255, %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, 1028(%rax)
	movq	-16(%rbp), %rax
	movl	1032(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 1032(%rax)
	movl	$1, -4(%rbp)
.LBB2_3:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	pop, .Lfunc_end2-pop
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
	.addrsig_sym push
	.addrsig_sym pop
	.addrsig_sym printf
