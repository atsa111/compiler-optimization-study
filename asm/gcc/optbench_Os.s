	.file	"optbench.c"
	.text
	.globl	dead_code
	.type	dead_code, @function
dead_code:
.LFB28:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE28:
	.size	dead_code, .-dead_code
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.globl	unnecessary_loop
	.type	unnecessary_loop, @function
unnecessary_loop:
.LFB29:
	.cfi_startproc
	endbr64
	movl	j5(%rip), %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	movl	$5, i(%rip)
	movl	%edx, k5(%rip)
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE29:
	.size	unnecessary_loop, .-unnecessary_loop
	.globl	loop_jamming
	.type	loop_jamming, @function
loop_jamming:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	pushq	%rdx
	.cfi_def_cfa_offset 32
	xorl	%edx, %edx
.L4:
	movl	%edx, i(%rip)
	cmpl	$4, %edx
	jg	.L10
	imull	j5(%rip), %edx
	movq	%rbp, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addl	%ebx, %edx
	movl	%edx, k5(%rip)
	call	__printf_chk@PLT
	movl	i(%rip), %eax
	leal	1(%rax), %edx
	jmp	.L4
.L10:
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rbp
.L6:
	movl	%eax, i(%rip)
	cmpl	$4, %eax
	jg	.L11
	movl	k5(%rip), %ecx
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	%ecx, %edx
	imull	%ebx, %edx
	imull	%edx, %eax
	movl	%ecx, %edx
	movl	%eax, i5(%rip)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	i(%rip), %eax
	incl	%eax
	jmp	.L6
.L11:
	popq	%rax
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	loop_jamming, .-loop_jamming
	.globl	loop_unrolling
	.type	loop_unrolling, @function
loop_unrolling:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	leaq	ivector4(%rip), %rbx
.L13:
	movl	%eax, i(%rip)
	cmpl	$5, %eax
	jg	.L16
	cltq
	xorl	%edx, %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movw	$0, (%rbx,%rax,2)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	i(%rip), %eax
	incl	%eax
	jmp	.L13
.L16:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.size	loop_unrolling, .-loop_unrolling
	.globl	jump_compression
	.type	jump_compression, @function
jump_compression:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	pushq	%r9
	.cfi_def_cfa_offset 64
.L18:
	cmpl	%ebx, %ebp
	jle	.L19
	cmpl	%r13d, %ebp
	jge	.L20
	cmpl	%r12d, %r13d
	jge	.L21
	cmpl	%r14d, %r12d
	jge	.L18
	addl	%r14d, %r12d
	jmp	.L23
.L21:
	addl	%r12d, %r13d
	jmp	.L23
.L20:
	addl	%r13d, %ebp
	movq	%r15, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	movl	%ebp, %edx
	call	__printf_chk@PLT
	jmp	.L18
.L19:
	addl	%ebp, %ebx
.L23:
	leal	(%rbx,%rbp), %eax
	popq	%rdx
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	addl	%r13d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 40
	addl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	addl	%r14d, %eax
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE32:
	.size	jump_compression, .-jump_compression
	.section	.rodata.str1.1
.LC2:
	.string	"This compiler handles divide-by-zero as                     an error"
.LC6:
	.string	"Common subexpression elimination"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	movl	$2, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC0(%rip), %rbx
	pushq	%rdi
	.cfi_def_cfa_offset 32
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$2, j4(%rip)
	call	__printf_chk@PLT
	movl	j4(%rip), %eax
	cmpl	%eax, i2(%rip)
	jge	.L26
	cmpl	i4(%rip), %eax
	jle	.L26
	movl	$2, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	movl	$2, i2(%rip)
	call	__printf_chk@PLT
.L26:
	movl	k5(%rip), %edx
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	%edx, j4(%rip)
	call	__printf_chk@PLT
	movl	j4(%rip), %eax
	cmpl	%eax, i2(%rip)
	jge	.L27
	cmpl	i4(%rip), %eax
	jle	.L27
	movl	$3, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	movl	$3, i5(%rip)
	call	__printf_chk@PLT
.L27:
	movq	.LC1(%rip), %rax
	xorl	%ecx, %ecx
	leaq	.LC2(%rip), %rdi
	movl	$3, i3(%rip)
	movl	%ecx, i5(%rip)
	movq	%rax, flt_1(%rip)
	movl	i(%rip), %eax
	movl	$5, i2(%rip)
	movl	%eax, j2(%rip)
	movl	%eax, k2(%rip)
	movl	%eax, i4(%rip)
	call	puts@PLT
	movq	.LC4(%rip), %rax
	xorl	%esi, %esi
	xorl	%edx, %edx
	movsd	.LC3(%rip), %xmm0
	xorps	%xmm1, %xmm1
	movl	$1, k3(%rip)
	mulsd	flt_6(%rip), %xmm1
	movq	%rax, flt_4(%rip)
	movsd	%xmm0, flt_3(%rip)
	movl	j5(%rip), %eax
	mulsd	flt_2(%rip), %xmm0
	movl	$655368, 8+ivector4(%rip)
	sall	$2, %eax
	movl	%esi, i5(%rip)
	movl	%eax, k2(%rip)
	movabsq	$1688867040264192, %rax
	movl	$10000, j5(%rip)
	movl	%esi, i(%rip)
	movq	%rax, ivector4(%rip)
	leaq	ivector5(%rip), %rax
	movsd	%xmm1, flt_5(%rip)
	leaq	808(%rax), %rcx
	movsd	%xmm0, flt_6(%rip)
.L28:
	addq	$8, %rax
	cmpq	%rcx, %rax
	je	.L39
	movl	$5, 4(%rax)
	movb	$1, %dl
	jmp	.L28
.L39:
	testb	%dl, %dl
	je	.L30
	movl	$100, i(%rip)
.L30:
	movl	i2(%rip), %eax
	movl	$1, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$1, ivector(%rip)
	leaq	ivector(%rip), %rbp
	movl	%eax, k5(%rip)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movslq	i2(%rip), %rax
	movl	$2, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$2, 0(%rbp,%rax,4)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movslq	i2(%rip), %rax
	movl	$2, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$2, 0(%rbp,%rax,4)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$3, %edx
	movq	%rbx, %rsi
	xorl	%eax, %eax
	movl	$3, 8+ivector(%rip)
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	k3(%rip), %eax
	addl	h3(%rip), %eax
	cmpl	$5, %eax
	jbe	.L31
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	jmp	.L32
.L31:
	cltd
	movq	%rbx, %rsi
	movl	$2, %edi
	idivl	i3(%rip)
	movl	%eax, %edx
	movl	%eax, m3(%rip)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	k3(%rip), %edx
	movq	%rbx, %rsi
	xorl	%eax, %eax
	addl	h3(%rip), %edx
	movl	$2, %edi
	addl	i3(%rip), %edx
	movl	%edx, g3(%rip)
	call	__printf_chk@PLT
.L32:
	xorl	%ecx, %ecx
	leaq	ivector2(%rip), %rbp
.L33:
	movl	%ecx, i4(%rip)
	cmpl	$2, %ecx
	jg	.L40
	movb	j(%rip), %al
	movslq	%ecx, %rcx
	movq	%rbx, %rsi
	movl	$2, %edi
	imull	k(%rip), %eax
	movb	%al, 0(%rbp,%rcx)
	movzbl	%al, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	i4(%rip), %eax
	leal	1(%rax), %ecx
	jmp	.L33
.L40:
	call	unnecessary_loop
	movl	$7, %edi
	call	loop_jamming
	movl	$7, %edi
	call	loop_unrolling
	movl	$3, %edx
	movl	$5, %r8d
	movl	$4, %ecx
	movl	$2, %esi
	movl	$1, %edi
	call	jump_compression
	popq	%rdx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	main, .-main
	.globl	ivector5
	.bss
	.align 32
	.type	ivector5, @object
	.size	ivector5, 400
ivector5:
	.zero	400
	.globl	ivector4
	.align 8
	.type	ivector4, @object
	.size	ivector4, 12
ivector4:
	.zero	12
	.globl	ivector2
	.type	ivector2, @object
	.size	ivector2, 3
ivector2:
	.zero	3
	.globl	ivector
	.align 8
	.type	ivector, @object
	.size	ivector, 12
ivector:
	.zero	12
	.globl	flt_6
	.align 8
	.type	flt_6, @object
	.size	flt_6, 8
flt_6:
	.zero	8
	.globl	flt_5
	.align 8
	.type	flt_5, @object
	.size	flt_5, 8
flt_5:
	.zero	8
	.globl	flt_4
	.align 8
	.type	flt_4, @object
	.size	flt_4, 8
flt_4:
	.zero	8
	.globl	flt_3
	.align 8
	.type	flt_3, @object
	.size	flt_3, 8
flt_3:
	.zero	8
	.globl	flt_2
	.align 8
	.type	flt_2, @object
	.size	flt_2, 8
flt_2:
	.zero	8
	.globl	flt_1
	.align 8
	.type	flt_1, @object
	.size	flt_1, 8
flt_1:
	.zero	8
	.globl	k5
	.align 4
	.type	k5, @object
	.size	k5, 4
k5:
	.zero	4
	.globl	j5
	.align 4
	.type	j5, @object
	.size	j5, 4
j5:
	.zero	4
	.globl	i5
	.align 4
	.type	i5, @object
	.size	i5, 4
i5:
	.zero	4
	.globl	j4
	.align 4
	.type	j4, @object
	.size	j4, 4
j4:
	.zero	4
	.globl	i4
	.align 4
	.type	i4, @object
	.size	i4, 4
i4:
	.zero	4
	.globl	m3
	.align 4
	.type	m3, @object
	.size	m3, 4
m3:
	.zero	4
	.globl	k3
	.align 4
	.type	k3, @object
	.size	k3, 4
k3:
	.zero	4
	.globl	i3
	.align 4
	.type	i3, @object
	.size	i3, 4
i3:
	.zero	4
	.globl	h3
	.align 4
	.type	h3, @object
	.size	h3, 4
h3:
	.zero	4
	.globl	g3
	.align 4
	.type	g3, @object
	.size	g3, 4
g3:
	.zero	4
	.globl	k2
	.align 4
	.type	k2, @object
	.size	k2, 4
k2:
	.zero	4
	.globl	j2
	.align 4
	.type	j2, @object
	.size	j2, 4
j2:
	.zero	4
	.globl	i2
	.align 4
	.type	i2, @object
	.size	i2, 4
i2:
	.zero	4
	.globl	m
	.align 4
	.type	m, @object
	.size	m, 4
m:
	.zero	4
	.globl	l
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.zero	4
	.globl	k
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	1717986918
	.long	1075930726
	.align 8
.LC3:
	.long	858993459
	.long	1073951539
	.align 8
.LC4:
	.long	450359963
	.long	1072693248
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
