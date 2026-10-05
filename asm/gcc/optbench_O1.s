	.file	"optbench.c"
	.text
	.globl	dead_code
	.type	dead_code, @function
dead_code:
.LFB38:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE38:
	.size	dead_code, .-dead_code
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.globl	unnecessary_loop
	.type	unnecessary_loop, @function
unnecessary_loop:
.LFB39:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	j5(%rip), %edx
	movl	%edx, k5(%rip)
	movl	$5, i(%rip)
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	unnecessary_loop, .-unnecessary_loop
	.globl	loop_jamming
	.type	loop_jamming, @function
loop_jamming:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %ebx
	movl	$0, i(%rip)
	movl	$0, %edx
	leaq	.LC0(%rip), %rbp
.L5:
	imull	j5(%rip), %edx
	addl	%ebx, %edx
	movl	%edx, k5(%rip)
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	i(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, i(%rip)
	cmpl	$4, %edx
	jle	.L5
	movl	$0, i(%rip)
	movl	$0, %eax
	leaq	.LC0(%rip), %rbp
.L6:
	movl	k5(%rip), %ecx
	movl	%ecx, %edx
	imull	%ebx, %edx
	imull	%edx, %eax
	movl	%eax, i5(%rip)
	movl	%ecx, %edx
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
	cmpl	$4, %eax
	jle	.L6
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	loop_jamming, .-loop_jamming
	.globl	loop_unrolling
	.type	loop_unrolling, @function
loop_unrolling:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, i(%rip)
	movl	$0, %eax
	leaq	ivector4(%rip), %rbp
	leaq	.LC0(%rip), %rbx
.L11:
	cltq
	movw	$0, 0(%rbp,%rax,2)
	movl	$0, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
	cmpl	$5, %eax
	jle	.L11
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	loop_unrolling, .-loop_unrolling
	.globl	jump_compression
	.type	jump_compression, @function
jump_compression:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, %r12d
	movl	%esi, %ebx
	movl	%edx, %ebp
	movl	%ecx, %r14d
	movl	%r8d, %r13d
	leaq	.LC0(%rip), %r15
	cmpl	%edi, %esi
	jg	.L15
.L16:
	addl	%ebx, %r12d
.L20:
	leal	(%r12,%rbx), %eax
	addl	%ebp, %eax
	addl	%r14d, %eax
	addl	%r13d, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	addl	%r14d, %ebp
	jmp	.L20
.L17:
	addl	%ebp, %ebx
	movl	%ebx, %edx
	movq	%r15, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.L19:
	cmpl	%r12d, %ebx
	jle	.L16
.L15:
	cmpl	%ebx, %ebp
	jle	.L17
	cmpl	%r14d, %ebp
	jge	.L18
	cmpl	%r13d, %r14d
	jge	.L19
	addl	%r13d, %r14d
	jmp	.L20
	.cfi_endproc
.LFE42:
	.size	jump_compression, .-jump_compression
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"This compiler handles divide-by-zero as                     an error"
	.align 8
.LC6:
	.string	"Common subexpression elimination"
	.text
	.globl	main
	.type	main, @function
main:
.LFB37:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$2, j4(%rip)
	movl	$2, %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	j4(%rip), %eax
	cmpl	%eax, i2(%rip)
	jge	.L24
	cmpl	i4(%rip), %eax
	jg	.L35
.L24:
	movl	k5(%rip), %edx
	movl	%edx, j4(%rip)
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	j4(%rip), %eax
	cmpl	%eax, i2(%rip)
	jge	.L25
	cmpl	i4(%rip), %eax
	jg	.L36
.L25:
	movl	$3, i3(%rip)
	movq	.LC1(%rip), %rax
	movq	%rax, flt_1(%rip)
	movl	$5, i2(%rip)
	movl	i(%rip), %eax
	movl	%eax, j2(%rip)
	movl	%eax, k2(%rip)
	movl	%eax, i4(%rip)
	movl	$0, i5(%rip)
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, flt_3(%rip)
	movq	.LC4(%rip), %rax
	movq	%rax, flt_4(%rip)
	pxor	%xmm1, %xmm1
	mulsd	flt_6(%rip), %xmm1
	movsd	%xmm1, flt_5(%rip)
	mulsd	flt_2(%rip), %xmm0
	movsd	%xmm0, flt_6(%rip)
	movl	$1, k3(%rip)
	movl	j5(%rip), %eax
	sall	$2, %eax
	movl	%eax, k2(%rip)
	movw	$0, ivector4(%rip)
	movw	$2, 2+ivector4(%rip)
	movw	$4, 4+ivector4(%rip)
	movw	$6, 6+ivector4(%rip)
	movw	$8, 8+ivector4(%rip)
	movw	$10, 10+ivector4(%rip)
	movl	$10000, %eax
.L26:
	subl	$1, %eax
	testl	%eax, %eax
	jg	.L26
	movl	$10000, %ecx
	subl	%eax, %ecx
	leal	(%rax,%rax,2), %eax
	leal	(%rcx,%rcx,4), %esi
	cltd
	idivl	%esi
	movl	%ecx, j5(%rip)
	movl	%eax, i5(%rip)
	leaq	12+ivector5(%rip), %rdx
	leaq	800(%rdx), %rcx
.L27:
	movl	$5, (%rdx)
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.L27
	movl	$100, i(%rip)
	addl	i2(%rip), %eax
	movl	%eax, k5(%rip)
	leaq	ivector(%rip), %rbp
	movl	$1, ivector(%rip)
	movl	$1, %edx
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movslq	i2(%rip), %rax
	movl	$2, 0(%rbp,%rax,4)
	movl	$2, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movslq	i2(%rip), %rax
	movl	$2, 0(%rbp,%rax,4)
	movl	$2, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$3, 8+ivector(%rip)
	movl	$3, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	k3(%rip), %eax
	addl	h3(%rip), %eax
	cmpl	$5, %eax
	jbe	.L28
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
.L29:
	movl	$0, i4(%rip)
	movl	$0, %ecx
	leaq	ivector2(%rip), %rbp
	leaq	.LC0(%rip), %rbx
.L30:
	movzbl	j(%rip), %eax
	mulb	k(%rip)
	movslq	%ecx, %rcx
	movb	%al, 0(%rbp,%rcx)
	movzbl	%al, %edx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	i4(%rip), %eax
	leal	1(%rax), %ecx
	movl	%ecx, i4(%rip)
	cmpl	$2, %ecx
	jle	.L30
	call	unnecessary_loop
	movl	$7, %edi
	call	loop_jamming
	movl	$7, %edi
	call	loop_unrolling
	movl	$5, %r8d
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	jump_compression
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L35:
	.cfi_restore_state
	movl	$2, i2(%rip)
	movl	$2, %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L24
.L36:
	movl	$3, i5(%rip)
	movl	$3, %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L25
.L28:
	cltd
	idivl	i3(%rip)
	movl	%eax, m3(%rip)
	movl	%eax, %edx
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	k3(%rip), %edx
	addl	h3(%rip), %edx
	addl	i3(%rip), %edx
	movl	%edx, g3(%rip)
	movq	%rbx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L29
	.cfi_endproc
.LFE37:
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
