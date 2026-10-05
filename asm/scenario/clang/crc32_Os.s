	.text
	.file	"crc32.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function main
.LCPI0_0:
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	4                               # 0x4
	.byte	5                               # 0x5
	.byte	6                               # 0x6
	.byte	7                               # 0x7
	.byte	8                               # 0x8
	.byte	9                               # 0x9
	.byte	10                              # 0xa
	.byte	11                              # 0xb
	.byte	12                              # 0xc
	.byte	13                              # 0xd
	.byte	14                              # 0xe
	.byte	15                              # 0xf
.LCPI0_1:
	.short	37                              # 0x25
	.short	37                              # 0x25
	.short	37                              # 0x25
	.short	37                              # 0x25
	.short	37                              # 0x25
	.short	37                              # 0x25
	.short	37                              # 0x25
	.short	37                              # 0x25
.LCPI0_2:
	.short	255                             # 0xff
	.short	255                             # 0xff
	.short	255                             # 0xff
	.short	255                             # 0xff
	.short	255                             # 0xff
	.short	255                             # 0xff
	.short	255                             # 0xff
	.short	255                             # 0xff
.LCPI0_3:
	.zero	16,11
.LCPI0_4:
	.zero	16,16
	.text
	.globl	main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$4104, %rsp                     # imm = 0x1008
	.cfi_def_cfa_offset 4112
	movdqa	.LCPI0_0(%rip), %xmm0           # xmm0 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	xorl	%eax, %eax
	movdqa	.LCPI0_1(%rip), %xmm1           # xmm1 = [37,37,37,37,37,37,37,37]
	movdqa	.LCPI0_2(%rip), %xmm2           # xmm2 = [255,255,255,255,255,255,255,255]
	movdqa	.LCPI0_3(%rip), %xmm3           # xmm3 = [11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11]
	movdqa	.LCPI0_4(%rip), %xmm4           # xmm4 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm5
	punpckhbw	%xmm5, %xmm5            # xmm5 = xmm5[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	pmullw	%xmm1, %xmm5
	pand	%xmm2, %xmm5
	movdqa	%xmm0, %xmm6
	punpcklbw	%xmm6, %xmm6            # xmm6 = xmm6[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	pmullw	%xmm1, %xmm6
	pand	%xmm2, %xmm6
	packuswb	%xmm5, %xmm6
	paddb	%xmm3, %xmm6
	movdqa	%xmm6, (%rsp,%rax)
	addq	$16, %rax
	paddb	%xmm4, %xmm0
	cmpq	$4096, %rax                     # imm = 0x1000
	jne	.LBB0_1
# %bb.2:
	xorl	%eax, %eax
	xorl	%esi, %esi
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #       Child Loop BB0_5 Depth 3
	movl	$-1, %edx
	xorl	%ecx, %ecx
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
	movzbl	(%rsp,%rcx), %edi
	xorl	%edi, %edx
	movl	$8, %edi
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%edx, %r8d
	andl	$1, %edx
	negl	%edx
	shrl	%r8d
	andl	$-306674912, %edx               # imm = 0xEDB88320
	xorl	%r8d, %edx
	decl	%edi
	jne	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=2
	incq	%rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jne	.LBB0_4
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	xorl	%edx, %esi
	notl	%esi
	incl	%eax
	cmpl	$2000, %eax                     # imm = 0x7D0
	jne	.LBB0_3
# %bb.8:
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$4104, %rsp                     # imm = 0x1008
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
