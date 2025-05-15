	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_zzeno0p1"
	.file	"basic_test.c"
	.globl	fib
	.p2align	2
	.type	fib,@function
fib:
	addi	sp, sp, -48
	esd	ra, 32(sp)
	ese	e1, 40(sp)
	esd	s0, 16(sp)
	ese	e8, 24(sp)
	addi	s0, sp, 48
	moveee	e8, e2
	esw	a0, -40(s0)
	elw	a1, -40(s0)
	addi	a0, zero, 1
	blt	a0, a1, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	elw	a0, -40(s0)
	esw	a0, -36(s0)
	j	.LBB0_3
.LBB0_2:
	elw	a0, -40(s0)
	addiw	a0, a0, -1
	call	fib
	esd	a0, -48(s0)
	ese	e10, -40(s0)
	elw	a0, -40(s0)
	addiw	a0, a0, -2
	call	fib
	mv	a1, a0
	eld	a0, -48(s0)
	ele	e10, -40(s0)
	add	a0, a0, a1
	esw	a0, -36(s0)
	j	.LBB0_3
.LBB0_3:
	elw	a0, -36(s0)
	eld	s0, 16(sp)
	ele	e8, 24(sp)
	eld	ra, 32(sp)
	ele	e1, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	fib, .Lfunc_end0-fib

	.globl	main
	.p2align	2
	.type	main,@function
main:
	addi	sp, sp, -64
	esd	ra, 48(sp)
	ese	e1, 56(sp)
	esd	s0, 32(sp)
	ese	e8, 40(sp)
	addi	s0, sp, 64
	moveee	e8, e2
	mv	a0, zero
	esd	a0, -48(s0)
	ese	e10, -40(s0)
	esw	a0, -36(s0)
	addi	a0, zero, 10
	esw	a0, -40(s0)
	elw	a0, -40(s0)
	esd	a0, -56(s0)
	ese	e10, -48(s0)
	call	fib
	eld	a1, -56(s0)
	ele	e11, -48(s0)
	mv	a2, a0
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	moveee	e10, e0
	call	printf
	eld	a0, -48(s0)
	ele	e10, -40(s0)
	eld	s0, 32(sp)
	ele	e8, 40(sp)
	eld	ra, 48(sp)
	ele	e1, 56(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main

	.type	.L.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Fibonacci number at position %d is %d\n"
	.size	.L.str, 39

	.ident	"clang version 13.0.0 (http://gitlab.ascslab-members.org/bgas-zeno/zeno-llvm.git 3fac6b4a2d59f6454bdce7e9b75f593e8347af5b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym fib
	.addrsig_sym printf
