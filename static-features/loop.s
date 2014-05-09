	.file	"loop.bc"
	.text
	.globl	testLoop
	.align	16, 0x90
	.type	testLoop,@function
testLoop:                               # @testLoop
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$1, -16(%ebp)
	movl	$21, -24(%ebp)
	movl	$0, -20(%ebp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_4:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	-20(%ebp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.L.str, (%esp)
	calll	printf
	movl	$3, -16(%ebp)
	movl	-8(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jge	.LBB0_3
# BB#2:                                 # %b3
                                        #   in Loop: Header=BB0_1 Depth=1
	addl	$2, -4(%ebp)
.LBB0_3:                                # %b4
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%ebp), %eax
	incl	%eax
	movl	%eax, -4(%ebp)
	cmpl	%eax, -20(%ebp)
	jge	.LBB0_4
# BB#5:                                 # %for.end
	addl	$1221, -24(%ebp)        # imm = 0x4C5
	addl	$40, %esp
	popl	%ebp
	ret
.Ltmp0:
	.size	testLoop, .Ltmp0-testLoop

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3


	.ident	"clang version 3.4 (tags/RELEASE_34/final)"
	.section	".note.GNU-stack","",@progbits
