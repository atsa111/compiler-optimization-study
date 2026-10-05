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
.LCPI0_5:
	.long	4                               # 0x4
	.long	8                               # 0x8
	.long	16                              # 0x10
	.long	32                              # 0x20
.LCPI0_6:
	.long	124634137                       # 0x76dc419
	.long	249268274                       # 0xedb8832
	.long	498536548                       # 0x1db71064
	.long	997073096                       # 0x3b6e20c8
	.text
	.globl	main
	.p2align	4, 0x90
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
	.p2align	4, 0x90
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
	movdqa	.LCPI0_5(%rip), %xmm0           # xmm0 = [4,8,16,32]
	movdqa	.LCPI0_6(%rip), %xmm1           # xmm1 = [124634137,249268274,498536548,997073096]
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movl	$-1, %edi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rsp,%rcx), %edx
	xorl	%edi, %edx
	movl	%edx, %edi
	andl	$1, %edi
	negl	%edi
	movl	%edx, %r8d
	shrl	%r8d
	andl	$-306674912, %edi               # imm = 0xEDB88320
	xorl	%r8d, %edi
	movl	%edi, %r8d
	shrl	%r8d
	movd	%edx, %xmm2
	shll	$30, %edx
	sarl	$31, %edx
	andl	$-306674912, %edx               # imm = 0xEDB88320
	xorl	%r8d, %edx
	movl	%edx, %r8d
	shrl	$6, %r8d
	pshufd	$0, %xmm2, %xmm2                # xmm2 = xmm2[0,0,0,0]
	pand	%xmm0, %xmm2
	pcmpeqd	%xmm0, %xmm2
	pand	%xmm1, %xmm2
	shll	$26, %edi
	sarl	$31, %edi
	andl	$1994146192, %edi               # imm = 0x76DC4190
	shll	$26, %edx
	sarl	$31, %edx
	andl	$-306674912, %edx               # imm = 0xEDB88320
	xorl	%r8d, %edx
	xorl	%edi, %edx
	pshufd	$238, %xmm2, %xmm3              # xmm3 = xmm2[2,3,2,3]
	pxor	%xmm2, %xmm3
	pshufd	$85, %xmm3, %xmm2               # xmm2 = xmm3[1,1,1,1]
	pxor	%xmm3, %xmm2
	movd	%xmm2, %edi
	xorl	%edx, %edi
	incq	%rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jne	.LBB0_4
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	xorl	%edi, %esi
	notl	%esi
	incl	%eax
	cmpl	$2000, %eax                     # imm = 0x7D0
	jne	.LBB0_3
# %bb.6:
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
