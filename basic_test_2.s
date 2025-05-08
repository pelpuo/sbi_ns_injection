	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_zzeno0p1"
	.file	"basic_test.c"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	addi	sp, sp, -48
	esd	ra, 32(sp)
	ese	e1, 40(sp)
	esd	s0, 16(sp)
	ese	e8, 24(sp)
	addi	s0, sp, 48
	moveee	e8, e2
	mv	a0, zero
	esw	a0, -36(s0)
	addi	a0, zero, 35
	eld	s0, 16(sp)
	ele	e8, 24(sp)
	eld	ra, 32(sp)
	ele	e1, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.ident	"clang version 13.0.0 (http://gitlab.ascslab-members.org/bgas-zeno/zeno-llvm.git 3fac6b4a2d59f6454bdce7e9b75f593e8347af5b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
