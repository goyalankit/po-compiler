	.file	"prog5.o"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -32(%rbp)
	cmpl	$2, -8(%rbp)
	jne	.LBB0_3
# BB#1:                                 # %land.lhs.true
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	$.L.str, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB0_3
# BB#2:                                 # %if.then
	movl	$1, -32(%rbp)
.LBB0_3:                                # %if.end
	callq	platform_main_begin
	callq	crc32_gentab
	callq	func_1
	movl	-32(%rbp), %edx
	movslq	g_2(%rip), %rdi
	movl	$.L.str1, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movslq	g_5(%rip), %rdi
	movl	$.L.str2, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movq	g_18(%rip), %rdi
	movl	$.L.str3, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movzwl	g_23(%rip), %edi
	movl	$.L.str4, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movzwl	g_47(%rip), %edi
	movl	$.L.str5, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movswq	g_51(%rip), %rdi
	movl	$.L.str6, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movswq	g_54(%rip), %rdi
	movl	$.L.str7, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movswq	g_105(%rip), %rdi
	movl	$.L.str8, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movzbl	g_109(%rip), %edi
	movl	$.L.str9, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_4
	.align	16, 0x90
.LBB0_10:                               # %for.inc22
                                        #   in Loop: Header=BB0_4 Depth=1
	incl	-20(%rbp)
.LBB0_4:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	cmpl	$0, -20(%rbp)
	jg	.LBB0_11
# BB#5:                                 # %for.body
                                        #   in Loop: Header=BB0_4 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_6
	.align	16, 0x90
.LBB0_9:                                # %for.inc
                                        #   in Loop: Header=BB0_6 Depth=2
	incl	-24(%rbp)
.LBB0_6:                                # %for.cond12
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$7, -24(%rbp)
	jg	.LBB0_10
# BB#7:                                 # %for.body15
                                        #   in Loop: Header=BB0_6 Depth=2
	movslq	-20(%rbp), %rax
	shlq	$6, %rax
	movslq	-24(%rbp), %rcx
	movq	g_115(%rax,%rcx,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str10, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_9
# BB#8:                                 # %if.then19
                                        #   in Loop: Header=BB0_6 Depth=2
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str11, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_9
.LBB0_11:                               # %for.end24
	movl	-32(%rbp), %edx
	movslq	g_128(%rip), %rdi
	movl	$.L.str12, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	g_137(%rip), %edi
	movl	$.L.str13, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_12
	.align	16, 0x90
.LBB0_15:                               # %for.inc38
                                        #   in Loop: Header=BB0_12 Depth=1
	incl	-20(%rbp)
.LBB0_12:                               # %for.cond27
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$1, -20(%rbp)
	jg	.LBB0_16
# BB#13:                                # %for.body30
                                        #   in Loop: Header=BB0_12 Depth=1
	movslq	-20(%rbp), %rax
	movzbl	g_144(%rax), %edi
	movl	-32(%rbp), %edx
	movl	$.L.str14, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_15
# BB#14:                                # %if.then35
                                        #   in Loop: Header=BB0_12 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_15
.LBB0_16:                               # %for.end40
	movl	-32(%rbp), %edx
	movl	g_148(%rip), %edi
	movl	$.L.str16, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movq	g_156(%rip), %rdi
	movl	$.L.str17, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	g_166(%rip), %edi
	movl	$.L.str18, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movsbq	g_182(%rip), %rdi
	movl	$.L.str19, %esi
	callq	transparent_crc
	movsbq	g_247(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str20, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_17
	.align	16, 0x90
.LBB0_23:                               # %for.inc64
                                        #   in Loop: Header=BB0_17 Depth=1
	incl	-20(%rbp)
.LBB0_17:                               # %for.cond45
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	cmpl	$1, -20(%rbp)
	jg	.LBB0_24
# BB#18:                                # %for.body48
                                        #   in Loop: Header=BB0_17 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_19
	.align	16, 0x90
.LBB0_22:                               # %for.inc61
                                        #   in Loop: Header=BB0_19 Depth=2
	incl	-24(%rbp)
.LBB0_19:                               # %for.cond49
                                        #   Parent Loop BB0_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$4, -24(%rbp)
	jg	.LBB0_23
# BB#20:                                # %for.body52
                                        #   in Loop: Header=BB0_19 Depth=2
	movslq	-20(%rbp), %rax
	leaq	(%rax,%rax,4), %rax
	movslq	-24(%rbp), %rcx
	shlq	$3, %rcx
	movq	g_251(%rcx,%rax,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str21, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_22
# BB#21:                                # %if.then58
                                        #   in Loop: Header=BB0_19 Depth=2
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str11, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_22
.LBB0_24:                               # %for.end66
	movsbq	g_252(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str22, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	g_253(%rip), %edi
	movl	$.L.str23, %esi
	callq	transparent_crc
	movslq	g_256(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str24, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	g_345(%rip), %edi
	movl	$.L.str25, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movzwl	g_381(%rip), %edi
	movl	$.L.str26, %esi
	callq	transparent_crc
	movswq	g_449(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str27, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movsbq	g_472(%rip), %rdi
	movl	$.L.str28, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_25
	.align	16, 0x90
.LBB0_28:                               # %for.inc85
                                        #   in Loop: Header=BB0_25 Depth=1
	incl	-20(%rbp)
.LBB0_25:                               # %for.cond74
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$2, -20(%rbp)
	jg	.LBB0_29
# BB#26:                                # %for.body77
                                        #   in Loop: Header=BB0_25 Depth=1
	movslq	-20(%rbp), %rax
	movslq	g_480(,%rax,4), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str29, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_28
# BB#27:                                # %if.then82
                                        #   in Loop: Header=BB0_25 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_28
.LBB0_29:                               # %for.end87
	movl	-32(%rbp), %edx
	movswq	g_481(%rip), %rdi
	movl	$.L.str30, %esi
	callq	transparent_crc
	movslq	g_484(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str31, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movq	g_486(%rip), %rdi
	movl	$.L.str32, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_30
	.align	16, 0x90
.LBB0_33:                               # %for.inc101
                                        #   in Loop: Header=BB0_30 Depth=1
	incl	-20(%rbp)
.LBB0_30:                               # %for.cond90
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5, -20(%rbp)
	jg	.LBB0_34
# BB#31:                                # %for.body93
                                        #   in Loop: Header=BB0_30 Depth=1
	movslq	-20(%rbp), %rax
	movswq	g_495(%rax,%rax), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str33, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_33
# BB#32:                                # %if.then98
                                        #   in Loop: Header=BB0_30 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_33
.LBB0_34:                               # %for.end103
	movl	$0, -20(%rbp)
	jmp	.LBB0_35
	.align	16, 0x90
.LBB0_38:                               # %for.inc115
                                        #   in Loop: Header=BB0_35 Depth=1
	incl	-20(%rbp)
.LBB0_35:                               # %for.cond104
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$2, -20(%rbp)
	jg	.LBB0_39
# BB#36:                                # %for.body107
                                        #   in Loop: Header=BB0_35 Depth=1
	movslq	-20(%rbp), %rax
	movl	g_521(,%rax,4), %edi
	movl	-32(%rbp), %edx
	movl	$.L.str34, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_38
# BB#37:                                # %if.then112
                                        #   in Loop: Header=BB0_35 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_38
.LBB0_39:                               # %for.end117
	movl	-32(%rbp), %edx
	movq	$-191010422, %rdi       # imm = 0xFFFFFFFFF49D698A
	movl	$.L.str35, %esi
	callq	transparent_crc
	movswq	g_694(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str36, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movzwl	g_715(%rip), %edi
	movl	$.L.str37, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_40
	.align	16, 0x90
.LBB0_49:                               # %for.inc148
                                        #   in Loop: Header=BB0_40 Depth=1
	incl	-20(%rbp)
.LBB0_40:                               # %for.cond120
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_42 Depth 2
                                        #       Child Loop BB0_44 Depth 3
	cmpl	$4, -20(%rbp)
	jg	.LBB0_50
# BB#41:                                # %for.body123
                                        #   in Loop: Header=BB0_40 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_42
	.align	16, 0x90
.LBB0_48:                               # %for.inc145
                                        #   in Loop: Header=BB0_42 Depth=2
	incl	-24(%rbp)
.LBB0_42:                               # %for.cond124
                                        #   Parent Loop BB0_40 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_44 Depth 3
	cmpl	$3, -24(%rbp)
	jg	.LBB0_49
# BB#43:                                # %for.body127
                                        #   in Loop: Header=BB0_42 Depth=2
	movl	$0, -28(%rbp)
	jmp	.LBB0_44
	.align	16, 0x90
.LBB0_47:                               # %for.inc142
                                        #   in Loop: Header=BB0_44 Depth=3
	incl	-28(%rbp)
.LBB0_44:                               # %for.cond128
                                        #   Parent Loop BB0_40 Depth=1
                                        #     Parent Loop BB0_42 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -28(%rbp)
	jg	.LBB0_48
# BB#45:                                # %for.body131
                                        #   in Loop: Header=BB0_44 Depth=3
	movslq	-20(%rbp), %rax
	shlq	$5, %rax
	movslq	-24(%rbp), %rcx
	leaq	g_750(%rax,%rcx,8), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str38, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_47
# BB#46:                                # %if.then139
                                        #   in Loop: Header=BB0_44 Depth=3
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str39, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_47
.LBB0_50:                               # %for.end150
	movq	g_751(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str40, %esi
	callq	transparent_crc
	movq	g_752(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str41, %esi
	callq	transparent_crc
	movq	g_753(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str42, %esi
	callq	transparent_crc
	movq	g_754(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str43, %esi
	callq	transparent_crc
	movq	g_755(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str44, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_51
	.align	16, 0x90
.LBB0_57:                               # %for.inc170
                                        #   in Loop: Header=BB0_51 Depth=1
	incl	-20(%rbp)
.LBB0_51:                               # %for.cond151
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_53 Depth 2
	cmpl	$4, -20(%rbp)
	jg	.LBB0_58
# BB#52:                                # %for.body154
                                        #   in Loop: Header=BB0_51 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_53
	.align	16, 0x90
.LBB0_56:                               # %for.inc167
                                        #   in Loop: Header=BB0_53 Depth=2
	incl	-24(%rbp)
.LBB0_53:                               # %for.cond155
                                        #   Parent Loop BB0_51 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$4, -24(%rbp)
	jg	.LBB0_57
# BB#54:                                # %for.body158
                                        #   in Loop: Header=BB0_53 Depth=2
	movslq	-20(%rbp), %rax
	leaq	(%rax,%rax,4), %rax
	movslq	-24(%rbp), %rcx
	shlq	$3, %rcx
	movq	g_756(%rcx,%rax,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str45, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_56
# BB#55:                                # %if.then164
                                        #   in Loop: Header=BB0_53 Depth=2
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str11, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_56
.LBB0_58:                               # %for.end172
	movl	$0, -20(%rbp)
	jmp	.LBB0_59
	.align	16, 0x90
.LBB0_62:                               # %for.inc183
                                        #   in Loop: Header=BB0_59 Depth=1
	incl	-20(%rbp)
.LBB0_59:                               # %for.cond173
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -20(%rbp)
	jg	.LBB0_63
# BB#60:                                # %for.body176
                                        #   in Loop: Header=BB0_59 Depth=1
	movslq	-20(%rbp), %rax
	movq	g_757(,%rax,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str46, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_62
# BB#61:                                # %if.then180
                                        #   in Loop: Header=BB0_59 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_62
.LBB0_63:                               # %for.end185
	movq	g_758(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str47, %esi
	callq	transparent_crc
	movq	g_759(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str48, %esi
	callq	transparent_crc
	movq	g_760(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str49, %esi
	callq	transparent_crc
	movq	g_761(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str50, %esi
	callq	transparent_crc
	movq	g_762(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str51, %esi
	callq	transparent_crc
	movq	g_763(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str52, %esi
	callq	transparent_crc
	movq	g_764(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str53, %esi
	callq	transparent_crc
	movq	g_765(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str54, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_64
	.align	16, 0x90
.LBB0_73:                               # %for.inc214
                                        #   in Loop: Header=BB0_64 Depth=1
	incl	-20(%rbp)
.LBB0_64:                               # %for.cond186
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_66 Depth 2
                                        #       Child Loop BB0_68 Depth 3
	cmpl	$8, -20(%rbp)
	jg	.LBB0_74
# BB#65:                                # %for.body189
                                        #   in Loop: Header=BB0_64 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_66
	.align	16, 0x90
.LBB0_72:                               # %for.inc211
                                        #   in Loop: Header=BB0_66 Depth=2
	incl	-24(%rbp)
.LBB0_66:                               # %for.cond190
                                        #   Parent Loop BB0_64 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_68 Depth 3
	cmpl	$8, -24(%rbp)
	jg	.LBB0_73
# BB#67:                                # %for.body193
                                        #   in Loop: Header=BB0_66 Depth=2
	movl	$0, -28(%rbp)
	jmp	.LBB0_68
	.align	16, 0x90
.LBB0_71:                               # %for.inc208
                                        #   in Loop: Header=BB0_68 Depth=3
	incl	-28(%rbp)
.LBB0_68:                               # %for.cond194
                                        #   Parent Loop BB0_64 Depth=1
                                        #     Parent Loop BB0_66 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$2, -28(%rbp)
	jg	.LBB0_72
# BB#69:                                # %for.body197
                                        #   in Loop: Header=BB0_68 Depth=3
	movslq	-24(%rbp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	-20(%rbp), %rcx
	imulq	$216, %rcx, %rcx
	leaq	g_766(%rcx,%rax,8), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str55, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_71
# BB#70:                                # %if.then205
                                        #   in Loop: Header=BB0_68 Depth=3
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str39, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_71
.LBB0_74:                               # %for.end216
	movq	g_767(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str56, %esi
	callq	transparent_crc
	movq	g_768(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str57, %esi
	callq	transparent_crc
	movq	g_769(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str58, %esi
	callq	transparent_crc
	movq	g_770(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str59, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_75
	.align	16, 0x90
.LBB0_78:                               # %for.inc227
                                        #   in Loop: Header=BB0_75 Depth=1
	incl	-20(%rbp)
.LBB0_75:                               # %for.cond217
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5, -20(%rbp)
	jg	.LBB0_79
# BB#76:                                # %for.body220
                                        #   in Loop: Header=BB0_75 Depth=1
	movslq	-20(%rbp), %rax
	movq	g_771(,%rax,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str60, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_78
# BB#77:                                # %if.then224
                                        #   in Loop: Header=BB0_75 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_78
.LBB0_79:                               # %for.end229
	movq	g_772(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str61, %esi
	callq	transparent_crc
	movq	g_773(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str62, %esi
	callq	transparent_crc
	movq	g_774(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str63, %esi
	callq	transparent_crc
	movq	g_775(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str64, %esi
	callq	transparent_crc
	movq	g_776(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str65, %esi
	callq	transparent_crc
	movq	g_777(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str66, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_80
	.align	16, 0x90
.LBB0_89:                               # %for.inc258
                                        #   in Loop: Header=BB0_80 Depth=1
	incl	-20(%rbp)
.LBB0_80:                               # %for.cond230
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_82 Depth 2
                                        #       Child Loop BB0_84 Depth 3
	cmpl	$3, -20(%rbp)
	jg	.LBB0_90
# BB#81:                                # %for.body233
                                        #   in Loop: Header=BB0_80 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_82
	.align	16, 0x90
.LBB0_88:                               # %for.inc255
                                        #   in Loop: Header=BB0_82 Depth=2
	incl	-24(%rbp)
.LBB0_82:                               # %for.cond234
                                        #   Parent Loop BB0_80 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_84 Depth 3
	cmpl	$4, -24(%rbp)
	jg	.LBB0_89
# BB#83:                                # %for.body237
                                        #   in Loop: Header=BB0_82 Depth=2
	movl	$0, -28(%rbp)
	jmp	.LBB0_84
	.align	16, 0x90
.LBB0_87:                               # %for.inc252
                                        #   in Loop: Header=BB0_84 Depth=3
	incl	-28(%rbp)
.LBB0_84:                               # %for.cond238
                                        #   Parent Loop BB0_80 Depth=1
                                        #     Parent Loop BB0_82 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$4, -28(%rbp)
	jg	.LBB0_88
# BB#85:                                # %for.body241
                                        #   in Loop: Header=BB0_84 Depth=3
	movslq	-24(%rbp), %rax
	leaq	(%rax,%rax,4), %rax
	movslq	-20(%rbp), %rcx
	imulq	$200, %rcx, %rcx
	leaq	g_778(%rcx,%rax,8), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str67, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_87
# BB#86:                                # %if.then249
                                        #   in Loop: Header=BB0_84 Depth=3
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str39, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_87
.LBB0_90:                               # %for.end260
	movq	g_779(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str68, %esi
	callq	transparent_crc
	movq	g_780(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str69, %esi
	callq	transparent_crc
	movq	g_781(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str70, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_91
	.align	16, 0x90
.LBB0_97:                               # %for.inc280
                                        #   in Loop: Header=BB0_91 Depth=1
	incl	-20(%rbp)
.LBB0_91:                               # %for.cond261
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_93 Depth 2
	cmpl	$4, -20(%rbp)
	jg	.LBB0_98
# BB#92:                                # %for.body264
                                        #   in Loop: Header=BB0_91 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_93
	.align	16, 0x90
.LBB0_96:                               # %for.inc277
                                        #   in Loop: Header=BB0_93 Depth=2
	incl	-24(%rbp)
.LBB0_93:                               # %for.cond265
                                        #   Parent Loop BB0_91 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$1, -24(%rbp)
	jg	.LBB0_97
# BB#94:                                # %for.body268
                                        #   in Loop: Header=BB0_93 Depth=2
	movslq	-20(%rbp), %rax
	shlq	$4, %rax
	movslq	-24(%rbp), %rcx
	movq	g_782(%rax,%rcx,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str71, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_96
# BB#95:                                # %if.then274
                                        #   in Loop: Header=BB0_93 Depth=2
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str11, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_96
.LBB0_98:                               # %for.end282
	movq	g_783(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str72, %esi
	callq	transparent_crc
	movq	g_784(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str73, %esi
	callq	transparent_crc
	movq	g_785(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str74, %esi
	callq	transparent_crc
	movq	g_786(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str75, %esi
	callq	transparent_crc
	movq	g_787(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str76, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_99
	.align	16, 0x90
.LBB0_108:                              # %for.inc311
                                        #   in Loop: Header=BB0_99 Depth=1
	incl	-20(%rbp)
.LBB0_99:                               # %for.cond283
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_101 Depth 2
                                        #       Child Loop BB0_103 Depth 3
	cmpl	$7, -20(%rbp)
	jg	.LBB0_109
# BB#100:                               # %for.body286
                                        #   in Loop: Header=BB0_99 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_101
	.align	16, 0x90
.LBB0_107:                              # %for.inc308
                                        #   in Loop: Header=BB0_101 Depth=2
	incl	-24(%rbp)
.LBB0_101:                              # %for.cond287
                                        #   Parent Loop BB0_99 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_103 Depth 3
	cmpl	$7, -24(%rbp)
	jg	.LBB0_108
# BB#102:                               # %for.body290
                                        #   in Loop: Header=BB0_101 Depth=2
	movl	$0, -28(%rbp)
	jmp	.LBB0_103
	.align	16, 0x90
.LBB0_106:                              # %for.inc305
                                        #   in Loop: Header=BB0_103 Depth=3
	incl	-28(%rbp)
.LBB0_103:                              # %for.cond291
                                        #   Parent Loop BB0_99 Depth=1
                                        #     Parent Loop BB0_101 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -28(%rbp)
	jg	.LBB0_107
# BB#104:                               # %for.body294
                                        #   in Loop: Header=BB0_103 Depth=3
	movslq	-20(%rbp), %rax
	shlq	$6, %rax
	movslq	-24(%rbp), %rcx
	leaq	g_788(%rax,%rcx,8), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str77, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_106
# BB#105:                               # %if.then302
                                        #   in Loop: Header=BB0_103 Depth=3
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str39, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_106
.LBB0_109:                              # %for.end313
	movq	g_816(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str78, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movswq	g_921(%rip), %rdi
	movl	$.L.str79, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movq	g_922(%rip), %rdi
	movl	$.L.str80, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	g_923(%rip), %edi
	movl	$.L.str81, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_110
	.align	16, 0x90
.LBB0_119:                              # %for.inc345
                                        #   in Loop: Header=BB0_110 Depth=1
	incl	-20(%rbp)
.LBB0_110:                              # %for.cond316
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_112 Depth 2
                                        #       Child Loop BB0_114 Depth 3
	cmpl	$9, -20(%rbp)
	jg	.LBB0_120
# BB#111:                               # %for.body319
                                        #   in Loop: Header=BB0_110 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB0_112
	.align	16, 0x90
.LBB0_118:                              # %for.inc342
                                        #   in Loop: Header=BB0_112 Depth=2
	incl	-24(%rbp)
.LBB0_112:                              # %for.cond320
                                        #   Parent Loop BB0_110 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_114 Depth 3
	cmpl	$4, -24(%rbp)
	jg	.LBB0_119
# BB#113:                               # %for.body323
                                        #   in Loop: Header=BB0_112 Depth=2
	movl	$0, -28(%rbp)
	jmp	.LBB0_114
	.align	16, 0x90
.LBB0_117:                              # %for.inc339
                                        #   in Loop: Header=BB0_114 Depth=3
	incl	-28(%rbp)
.LBB0_114:                              # %for.cond324
                                        #   Parent Loop BB0_110 Depth=1
                                        #     Parent Loop BB0_112 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$4, -28(%rbp)
	jg	.LBB0_118
# BB#115:                               # %for.body327
                                        #   in Loop: Header=BB0_114 Depth=3
	movslq	-24(%rbp), %rax
	leaq	(%rax,%rax,4), %rax
	movslq	-20(%rbp), %rcx
	imulq	$100, %rcx, %rcx
	leaq	g_932(%rcx,%rax,4), %rax
	movslq	-28(%rbp), %rcx
	movl	(%rax,%rcx,4), %edi
	movl	-32(%rbp), %edx
	movl	$.L.str82, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_117
# BB#116:                               # %if.then336
                                        #   in Loop: Header=BB0_114 Depth=3
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str39, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_117
.LBB0_120:                              # %for.end347
	movl	$0, -20(%rbp)
	jmp	.LBB0_121
	.align	16, 0x90
.LBB0_124:                              # %for.inc358
                                        #   in Loop: Header=BB0_121 Depth=1
	incl	-20(%rbp)
.LBB0_121:                              # %for.cond348
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5, -20(%rbp)
	jg	.LBB0_125
# BB#122:                               # %for.body351
                                        #   in Loop: Header=BB0_121 Depth=1
	movslq	-20(%rbp), %rax
	movq	g_942(,%rax,8), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str83, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_124
# BB#123:                               # %if.then355
                                        #   in Loop: Header=BB0_121 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_124
.LBB0_125:                              # %for.end360
	movq	g_954(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str84, %esi
	callq	transparent_crc
	movzbl	g_956(%rip), %edi
	movl	-32(%rbp), %edx
	movl	$.L.str85, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_126
	.align	16, 0x90
.LBB0_129:                              # %for.inc373
                                        #   in Loop: Header=BB0_126 Depth=1
	incl	-20(%rbp)
.LBB0_126:                              # %for.cond362
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$9, -20(%rbp)
	jg	.LBB0_130
# BB#127:                               # %for.body365
                                        #   in Loop: Header=BB0_126 Depth=1
	movslq	-20(%rbp), %rax
	movl	g_1012(,%rax,4), %edi
	movl	-32(%rbp), %edx
	movl	$.L.str86, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_129
# BB#128:                               # %if.then370
                                        #   in Loop: Header=BB0_126 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_129
.LBB0_130:                              # %for.end375
	movzwl	g_1051(%rip), %edi
	movl	-32(%rbp), %edx
	movl	$.L.str87, %esi
	callq	transparent_crc
	movl	$0, -20(%rbp)
	jmp	.LBB0_131
	.align	16, 0x90
.LBB0_134:                              # %for.inc388
                                        #   in Loop: Header=BB0_131 Depth=1
	incl	-20(%rbp)
.LBB0_131:                              # %for.cond377
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -20(%rbp)
	jg	.LBB0_135
# BB#132:                               # %for.body380
                                        #   in Loop: Header=BB0_131 Depth=1
	movslq	-20(%rbp), %rax
	movslq	g_1069(,%rax,4), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str88, %esi
	callq	transparent_crc
	cmpl	$0, -32(%rbp)
	je	.LBB0_134
# BB#133:                               # %if.then385
                                        #   in Loop: Header=BB0_131 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str15, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_134
.LBB0_135:                              # %for.end390
	movslq	g_1121(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str89, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movslq	g_1281(%rip), %rdi
	movl	$.L.str90, %esi
	callq	transparent_crc
	movl	g_1435(%rip), %edi
	movl	-32(%rbp), %edx
	movl	$.L.str91, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movslq	g_1501(%rip), %rdi
	movl	$.L.str92, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movslq	g_1502(%rip), %rdi
	movl	$.L.str93, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movslq	g_1503(%rip), %rdi
	movl	$.L.str94, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movslq	g_1504(%rip), %rdi
	movl	$.L.str95, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	g_1619(%rip), %edi
	movl	$.L.str96, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movslq	g_1703(%rip), %rdi
	movl	$.L.str97, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	$4294967286, %edi       # imm = 0xFFFFFFF6
	movl	$.L.str98, %esi
	callq	transparent_crc
	movl	-32(%rbp), %edx
	movl	$9, %edi
	movl	$.L.str99, %esi
	callq	transparent_crc
	movslq	g_1899(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str100, %esi
	callq	transparent_crc
	movl	-32(%rbp), %esi
	movl	crc32_context(%rip), %edi
	notl	%edi
	callq	platform_main_end
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.align	16, 0x90
	.type	platform_main_begin,@function
platform_main_begin:                    # @platform_main_begin
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	popq	%rbp
	ret
.Ltmp11:
	.size	platform_main_begin, .Ltmp11-platform_main_begin
	.cfi_endproc

	.align	16, 0x90
	.type	crc32_gentab,@function
crc32_gentab:                           # @crc32_gentab
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp14:
	.cfi_def_cfa_offset 16
.Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp16:
	.cfi_def_cfa_register %rbp
	movl	$-306674912, -8(%rbp)   # imm = 0xFFFFFFFFEDB88320
	movl	$0, -12(%rbp)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_7:                                # %for.inc5
                                        #   in Loop: Header=BB2_1 Depth=1
	movslq	-12(%rbp), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, crc32_tab(,%rax,4)
	incl	-12(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	cmpl	$255, -12(%rbp)
	jg	.LBB2_8
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$8, -16(%rbp)
	jmp	.LBB2_3
	.align	16, 0x90
.LBB2_5:                                # %if.then
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	-4(%rbp), %eax
	shrl	%eax
	xorl	$-306674912, %eax       # imm = 0xFFFFFFFFEDB88320
	movl	%eax, -4(%rbp)
	decl	-16(%rbp)
.LBB2_3:                                # %for.cond1
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -16(%rbp)
	jle	.LBB2_7
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB2_3 Depth=2
	testb	$1, -4(%rbp)
	jne	.LBB2_5
# BB#6:                                 # %if.else
                                        #   in Loop: Header=BB2_3 Depth=2
	shrl	-4(%rbp)
	decl	-16(%rbp)
	jmp	.LBB2_3
.LBB2_8:                                # %for.end6
	popq	%rbp
	ret
.Ltmp17:
	.size	crc32_gentab, .Ltmp17-crc32_gentab
	.cfi_endproc

	.align	16, 0x90
	.type	func_1,@function
func_1:                                 # @func_1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp21:
	.cfi_def_cfa_offset 16
.Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp23:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$3480, %rsp             # imm = 0xD98
.Ltmp24:
	.cfi_offset %rbx, -56
.Ltmp25:
	.cfi_offset %r12, -48
.Ltmp26:
	.cfi_offset %r13, -40
.Ltmp27:
	.cfi_offset %r14, -32
.Ltmp28:
	.cfi_offset %r15, -24
	movq	.Lfunc_1.l_16+16(%rip), %rax
	movq	%rax, -64(%rbp)
	vmovaps	.Lfunc_1.l_16(%rip), %xmm0
	vmovaps	%xmm0, -80(%rbp)
	movl	$-1, -84(%rbp)
	movl	$8, -88(%rbp)
	movl	$-8, -92(%rbp)
	leaq	-496(%rbp), %rdi
	movl	$.Lfunc_1.l_1917, %esi
	movl	$392, %edx              # imm = 0x188
	callq	memcpy
	movl	$-1229399943, -500(%rbp) # imm = 0xFFFFFFFFB6B8D879
	movq	$g_1247, -512(%rbp)
	movl	$2, g_2(%rip)
	leaq	-536(%rbp), %r14
	leaq	-784(%rbp), %rbx
	movabsq	$654492177407134055, %r15 # imm = 0x915392AEE9FC967
	movabsq	$-3112712909392964095, %r12 # imm = 0xD4CD6C19CBDC1601
	leaq	-72(%rbp), %r13
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_12:                               # %for.inc347
                                        #   in Loop: Header=BB3_1 Depth=1
	decb	-657(%rbp)
	movswl	g_2(%rip), %edi
	movl	$5, %esi
	callq	safe_add_func_int16_t_s_s
	movswl	%ax, %eax
	movl	%eax, g_2(%rip)
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_8 Depth 4
	cmpl	$2, g_2(%rip)
	jne	.LBB3_13
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	$g_47, -536(%rbp)
	movl	$-5, -540(%rbp)
	movl	$1360339157, -544(%rbp) # imm = 0x511520D5
	movl	$0, -548(%rbp)
	movl	$-1807507320, -552(%rbp) # imm = 0xFFFFFFFF9443A088
	movl	$-10, -556(%rbp)
	movq	$g_472, -568(%rbp)
	movq	$0, -576(%rbp)
	movq	$g_533, -584(%rbp)
	movq	$g_533, -592(%rbp)
	vmovaps	.Lfunc_1.l_2000+16(%rip), %xmm0
	vmovaps	%xmm0, -640(%rbp)
	vmovaps	.Lfunc_1.l_2000(%rip), %xmm0
	vmovaps	%xmm0, -656(%rbp)
	vmovups	.Lfunc_1.l_2000+44(%rip), %xmm0
	vmovups	%xmm0, -612(%rbp)
	vmovups	.Lfunc_1.l_2000+28(%rip), %xmm0
	vmovups	%xmm0, -628(%rbp)
	movb	$-1, -657(%rbp)
	cmpl	$0, g_2(%rip)
	jne	.LBB3_13
# BB#3:                                 # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, g_5(%rip)
	jmp	.LBB3_4
	.align	16, 0x90
.LBB3_11:                               # %for.inc344
                                        #   in Loop: Header=BB3_4 Depth=2
	movzbl	g_5(%rip), %edi
	movl	$2, %esi
	callq	safe_sub_func_uint8_t_u_u
	movzbl	%al, %eax
	movl	%eax, g_5(%rip)
.LBB3_4:                                # %for.cond3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_8 Depth 4
	cmpl	$-18, g_5(%rip)
	jne	.LBB3_12
# BB#5:                                 # %for.body5
                                        #   in Loop: Header=BB3_4 Depth=2
	movq	$g_18, -680(%rbp)
	movq	$g_23, -688(%rbp)
	movq	$g_51, -696(%rbp)
	movq	$0, -704(%rbp)
	vmovaps	.Lfunc_1.l_53+16(%rip), %xmm0
	vmovaps	%xmm0, -736(%rbp)
	vmovaps	.Lfunc_1.l_53(%rip), %xmm0
	vmovaps	%xmm0, -752(%rbp)
	movq	.Lfunc_1.l_53+32(%rip), %rax
	movq	%rax, -720(%rbp)
	movq	%r14, -760(%rbp)
	movl	$-1325428330, -764(%rbp) # imm = 0xFFFFFFFFB0FF9196
	movq	%r15, -776(%rbp)
	movq	$g_936, -784(%rbp)
	movq	%rbx, -2800(%rbp)
	movq	%rbx, -2792(%rbp)
	movq	%rbx, -2784(%rbp)
	movq	$0, -2776(%rbp)
	movq	%rbx, -2768(%rbp)
	movq	%rbx, -2760(%rbp)
	movq	$0, -2752(%rbp)
	movq	$0, -2744(%rbp)
	movq	$0, -2736(%rbp)
	movq	%rbx, -2728(%rbp)
	movq	%rbx, -2720(%rbp)
	movq	$0, -2712(%rbp)
	movq	%rbx, -2704(%rbp)
	movq	%rbx, -2696(%rbp)
	movq	$0, -2688(%rbp)
	movq	$0, -2680(%rbp)
	movq	$0, -2672(%rbp)
	movq	%rbx, -2664(%rbp)
	movq	%rbx, -2656(%rbp)
	movq	%rbx, -2648(%rbp)
	movq	%rbx, -2640(%rbp)
	movq	%rbx, -2632(%rbp)
	movq	%rbx, -2624(%rbp)
	movq	%rbx, -2616(%rbp)
	movq	%rbx, -2608(%rbp)
	movq	%rbx, -2600(%rbp)
	movq	%rbx, -2592(%rbp)
	movq	%rbx, -2584(%rbp)
	movq	$0, -2576(%rbp)
	movq	%rbx, -2568(%rbp)
	movq	$0, -2560(%rbp)
	movq	%rbx, -2552(%rbp)
	movq	$0, -2544(%rbp)
	movq	%rbx, -2536(%rbp)
	movq	%rbx, -2528(%rbp)
	movq	%rbx, -2520(%rbp)
	movq	$0, -2512(%rbp)
	movq	%rbx, -2504(%rbp)
	movq	%rbx, -2496(%rbp)
	movq	%rbx, -2488(%rbp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -2464(%rbp)
	vmovaps	%xmm0, -2480(%rbp)
	movq	%rbx, -2456(%rbp)
	movq	$0, -2448(%rbp)
	movq	%rbx, -2440(%rbp)
	movq	%rbx, -2432(%rbp)
	movq	%rbx, -2424(%rbp)
	movq	%rbx, -2416(%rbp)
	movq	%rbx, -2408(%rbp)
	movq	%rbx, -2400(%rbp)
	movq	%rbx, -2392(%rbp)
	movq	%rbx, -2384(%rbp)
	movq	%rbx, -2376(%rbp)
	movq	%rbx, -2368(%rbp)
	movq	%rbx, -2360(%rbp)
	vmovaps	%xmm0, -2336(%rbp)
	vmovaps	%xmm0, -2352(%rbp)
	movq	%rbx, -2328(%rbp)
	movq	%rbx, -2320(%rbp)
	movq	$0, -2312(%rbp)
	movq	%rbx, -2304(%rbp)
	movq	%rbx, -2296(%rbp)
	movq	$0, -2288(%rbp)
	movq	%rbx, -2280(%rbp)
	movq	$0, -2272(%rbp)
	movq	%rbx, -2264(%rbp)
	movq	%rbx, -2256(%rbp)
	movq	$0, -2248(%rbp)
	movq	%rbx, -2240(%rbp)
	movq	%rbx, -2232(%rbp)
	movq	%rbx, -2224(%rbp)
	movq	$0, -2216(%rbp)
	movq	%rbx, -2208(%rbp)
	movq	%rbx, -2200(%rbp)
	movq	%rbx, -2192(%rbp)
	movq	%rbx, -2184(%rbp)
	movq	%rbx, -2176(%rbp)
	movq	%rbx, -2168(%rbp)
	movq	$0, -2160(%rbp)
	movq	%rbx, -2152(%rbp)
	movq	%rbx, -2144(%rbp)
	movq	%rbx, -2136(%rbp)
	movq	%rbx, -2128(%rbp)
	movq	%rbx, -2120(%rbp)
	movq	%rbx, -2112(%rbp)
	movq	%rbx, -2104(%rbp)
	movq	%rbx, -2096(%rbp)
	movq	$0, -2088(%rbp)
	movq	%rbx, -2080(%rbp)
	movq	%rbx, -2072(%rbp)
	movq	$0, -2064(%rbp)
	movq	%rbx, -2056(%rbp)
	movq	%rbx, -2048(%rbp)
	movq	%rbx, -2040(%rbp)
	movq	$0, -2032(%rbp)
	movq	%rbx, -2024(%rbp)
	movq	%rbx, -2016(%rbp)
	movq	%rbx, -2008(%rbp)
	movq	%rbx, -2000(%rbp)
	movq	%rbx, -1992(%rbp)
	movq	%rbx, -1984(%rbp)
	movq	%rbx, -1976(%rbp)
	movq	$0, -1968(%rbp)
	movq	%rbx, -1960(%rbp)
	movq	%rbx, -1952(%rbp)
	movq	%rbx, -1944(%rbp)
	vmovaps	%xmm0, -1920(%rbp)
	vmovaps	%xmm0, -1936(%rbp)
	movq	%rbx, -1904(%rbp)
	movq	%rbx, -1896(%rbp)
	movq	$0, -1888(%rbp)
	movq	%rbx, -1880(%rbp)
	movq	%rbx, -1872(%rbp)
	movq	%rbx, -1864(%rbp)
	movq	%rbx, -1856(%rbp)
	movq	$0, -1848(%rbp)
	movq	$0, -1840(%rbp)
	movq	%rbx, -1832(%rbp)
	movq	$0, -1824(%rbp)
	movq	%rbx, -1816(%rbp)
	movq	%rbx, -1808(%rbp)
	movq	%rbx, -1800(%rbp)
	movq	%rbx, -1792(%rbp)
	movq	$0, -1784(%rbp)
	movq	%rbx, -1776(%rbp)
	movq	%rbx, -1768(%rbp)
	movq	%rbx, -1760(%rbp)
	movq	%rbx, -1752(%rbp)
	movq	%rbx, -1744(%rbp)
	movq	%rbx, -1736(%rbp)
	movq	%rbx, -1728(%rbp)
	movq	$0, -1720(%rbp)
	movq	%rbx, -1712(%rbp)
	movq	$0, -1704(%rbp)
	movq	%rbx, -1696(%rbp)
	movq	%rbx, -1688(%rbp)
	movq	%rbx, -1680(%rbp)
	movq	%rbx, -1672(%rbp)
	movq	%rbx, -1664(%rbp)
	movq	%rbx, -1656(%rbp)
	movq	%rbx, -1648(%rbp)
	movq	%rbx, -1640(%rbp)
	movq	$0, -1632(%rbp)
	movq	%rbx, -1624(%rbp)
	movq	$0, -1616(%rbp)
	movq	%rbx, -1608(%rbp)
	movq	%rbx, -1600(%rbp)
	movq	%rbx, -1592(%rbp)
	movq	%rbx, -1584(%rbp)
	movq	%rbx, -1576(%rbp)
	movq	%rbx, -1568(%rbp)
	movq	%rbx, -1560(%rbp)
	movq	$0, -1552(%rbp)
	movq	%rbx, -1544(%rbp)
	movq	$0, -1536(%rbp)
	movq	%rbx, -1528(%rbp)
	movq	%rbx, -1520(%rbp)
	movq	%rbx, -1512(%rbp)
	movq	%rbx, -1504(%rbp)
	movq	%rbx, -1496(%rbp)
	movq	%rbx, -1488(%rbp)
	movq	%rbx, -1480(%rbp)
	movq	%rbx, -1472(%rbp)
	movq	$0, -1464(%rbp)
	movq	%rbx, -1456(%rbp)
	movq	%rbx, -1448(%rbp)
	movq	%rbx, -1440(%rbp)
	movq	$0, -1432(%rbp)
	movq	%rbx, -1424(%rbp)
	movq	$0, -1416(%rbp)
	movq	%rbx, -1408(%rbp)
	movq	%rbx, -1400(%rbp)
	movq	%rbx, -1392(%rbp)
	movq	%rbx, -1384(%rbp)
	movq	%rbx, -1376(%rbp)
	movq	%rbx, -1368(%rbp)
	movq	%rbx, -1360(%rbp)
	movq	%rbx, -1352(%rbp)
	movq	$0, -1344(%rbp)
	movq	%rbx, -1336(%rbp)
	movq	$0, -1328(%rbp)
	movq	%rbx, -1320(%rbp)
	movq	%rbx, -1312(%rbp)
	movq	%rbx, -1304(%rbp)
	vmovaps	%xmm0, -1280(%rbp)
	vmovaps	%xmm0, -1296(%rbp)
	movq	%rbx, -1296(%rbp)
	movq	%rbx, -1264(%rbp)
	movq	%rbx, -1256(%rbp)
	movq	$0, -1248(%rbp)
	movq	$0, -1240(%rbp)
	movq	$0, -1232(%rbp)
	movq	%rbx, -1224(%rbp)
	movq	%rbx, -1216(%rbp)
	movq	%rbx, -1208(%rbp)
	movq	$0, -1200(%rbp)
	movq	%rbx, -1192(%rbp)
	movq	%rbx, -1184(%rbp)
	movq	%rbx, -1176(%rbp)
	movq	%rbx, -1168(%rbp)
	movq	%rbx, -1160(%rbp)
	movq	%rbx, -1152(%rbp)
	movq	%rbx, -1144(%rbp)
	movq	$0, -1136(%rbp)
	movq	%rbx, -1128(%rbp)
	movq	%rbx, -1120(%rbp)
	movq	%rbx, -1112(%rbp)
	movq	$0, -1104(%rbp)
	movq	%rbx, -1096(%rbp)
	movq	%rbx, -1088(%rbp)
	movq	%rbx, -1080(%rbp)
	movq	%rbx, -1072(%rbp)
	movq	%rbx, -1064(%rbp)
	movq	%rbx, -1056(%rbp)
	movq	%rbx, -1048(%rbp)
	movq	$0, -1040(%rbp)
	movq	%rbx, -1032(%rbp)
	movq	%rbx, -1024(%rbp)
	movq	%rbx, -1016(%rbp)
	vmovaps	%xmm0, -992(%rbp)
	vmovaps	%xmm0, -1008(%rbp)
	movq	%rbx, -976(%rbp)
	movq	%rbx, -968(%rbp)
	movq	$0, -960(%rbp)
	movq	%rbx, -952(%rbp)
	movq	%rbx, -944(%rbp)
	movq	%rbx, -936(%rbp)
	movq	%rbx, -928(%rbp)
	movq	$0, -920(%rbp)
	movq	$0, -912(%rbp)
	movq	%rbx, -904(%rbp)
	movq	$0, -896(%rbp)
	movq	%rbx, -888(%rbp)
	movq	%rbx, -880(%rbp)
	movq	%rbx, -872(%rbp)
	movq	%rbx, -864(%rbp)
	movq	$0, -856(%rbp)
	movq	%rbx, -848(%rbp)
	movq	%rbx, -840(%rbp)
	movq	%rbx, -832(%rbp)
	movq	%rbx, -824(%rbp)
	movq	%rbx, -816(%rbp)
	movq	%rbx, -808(%rbp)
	movq	%rbx, -800(%rbp)
	movq	$0, -792(%rbp)
	movq	%r12, -2808(%rbp)
	movl	$0, -3204(%rbp)
	jmp	.LBB3_6
	.align	16, 0x90
.LBB3_10:                               # %for.inc341
                                        #   in Loop: Header=BB3_6 Depth=3
	incl	-3204(%rbp)
.LBB3_6:                                # %for.cond331
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_8 Depth 4
	cmpl	$6, -3204(%rbp)
	jg	.LBB3_11
# BB#7:                                 # %for.body333
                                        #   in Loop: Header=BB3_6 Depth=3
	movl	$0, -3208(%rbp)
	jmp	.LBB3_8
	.align	16, 0x90
.LBB3_9:                                # %for.inc
                                        #   in Loop: Header=BB3_8 Depth=4
	movslq	-3204(%rbp), %rax
	imulq	$56, %rax, %rax
	leaq	-3200(%rbp,%rax), %rax
	movslq	-3208(%rbp), %rcx
	movq	%r13, (%rax,%rcx,8)
	incl	-3208(%rbp)
.LBB3_8:                                # %for.cond334
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	cmpl	$6, -3208(%rbp)
	jg	.LBB3_10
	jmp	.LBB3_9
.LBB3_13:                               # %for.end351
	movw	$-1, g_54(%rip)
	leaq	-3224(%rbp), %r14
	leaq	-3240(%rbp), %rbx
	movb	$1, %r12b
	jmp	.LBB3_14
	.align	16, 0x90
.LBB3_23:                               # %for.inc463
                                        #   in Loop: Header=BB3_14 Depth=1
	movzbl	%al, %edi
	movl	$7, %esi
	callq	safe_rshift_func_int8_t_s_s
	movsbl	%al, %esi
	movl	$-16743, %edi           # imm = 0xFFFFFFFFFFFFBE99
	callq	safe_lshift_func_int16_t_s_s
	movswl	%ax, %eax
	xorl	%eax, -92(%rbp)
	cmpl	$10, %r15d
	sbbl	%eax, %eax
	movq	g_533(%rip), %rcx
	movq	(%rcx), %rcx
	movl	$0, (%rcx)
	movq	-3496(%rbp), %rcx
	movl	$0, (%rcx)
	andl	g_1504(%rip), %eax
	andl	$1, %eax
	movl	%eax, g_1504(%rip)
	movzbl	g_54(%rip), %edi
	movl	$9, %esi
	callq	safe_sub_func_uint8_t_u_u
	movzbl	%al, %eax
	movw	%ax, g_54(%rip)
.LBB3_14:                               # %for.cond352
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_16 Depth 2
                                        #       Child Loop BB3_18 Depth 3
	movswl	g_54(%rip), %eax
	cmpl	$-2, %eax
	jl	.LBB3_24
# BB#15:                                # %for.body356
                                        #   in Loop: Header=BB3_14 Depth=1
	movl	$5, -3216(%rbp)
	movq	$g_572, -3224(%rbp)
	movq	%r14, -3232(%rbp)
	movq	$0, -3240(%rbp)
	movq	%rbx, -3440(%rbp)
	movq	%rbx, -3432(%rbp)
	movq	%rbx, -3424(%rbp)
	movq	%rbx, -3416(%rbp)
	movq	%rbx, -3408(%rbp)
	movq	%rbx, -3400(%rbp)
	movq	%rbx, -3392(%rbp)
	movq	%rbx, -3384(%rbp)
	movq	%rbx, -3376(%rbp)
	movq	%rbx, -3368(%rbp)
	movq	%rbx, -3360(%rbp)
	movq	%rbx, -3352(%rbp)
	movq	%rbx, -3344(%rbp)
	movq	%rbx, -3336(%rbp)
	movq	%rbx, -3328(%rbp)
	movq	%rbx, -3320(%rbp)
	movq	%rbx, -3312(%rbp)
	movq	%rbx, -3304(%rbp)
	movq	%rbx, -3296(%rbp)
	movq	%rbx, -3288(%rbp)
	movq	%rbx, -3280(%rbp)
	movq	%rbx, -3272(%rbp)
	movq	%rbx, -3264(%rbp)
	movq	%rbx, -3256(%rbp)
	movq	$g_1502, -3496(%rbp)
	movl	$0, -3500(%rbp)
	jmp	.LBB3_16
	.align	16, 0x90
.LBB3_20:                               # %for.inc429
                                        #   in Loop: Header=BB3_16 Depth=2
	incl	-3500(%rbp)
.LBB3_16:                               # %for.cond414
                                        #   Parent Loop BB3_14 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_18 Depth 3
	cmpl	$5, -3500(%rbp)
	jg	.LBB3_21
# BB#17:                                # %for.body417
                                        #   in Loop: Header=BB3_16 Depth=2
	movl	$0, -3504(%rbp)
	jmp	.LBB3_18
	.align	16, 0x90
.LBB3_19:                               # %for.inc426
                                        #   in Loop: Header=BB3_18 Depth=3
	movslq	-3500(%rbp), %rax
	leaq	-3488(%rbp,%rax,8), %rax
	movslq	-3504(%rbp), %rcx
	movq	$g_942+8, (%rax,%rcx,8)
	incl	-3504(%rbp)
.LBB3_18:                               # %for.cond418
                                        #   Parent Loop BB3_14 Depth=1
                                        #     Parent Loop BB3_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, -3504(%rbp)
	jg	.LBB3_20
	jmp	.LBB3_19
	.align	16, 0x90
.LBB3_21:                               # %for.end431
                                        #   in Loop: Header=BB3_14 Depth=1
	movzwl	-3216(%rbp), %esi
	xorl	%edi, %edi
	callq	safe_div_func_uint16_t_u_u
	movw	%ax, %r15w
	movq	g_937(%rip), %rax
	movw	$-16743, (%rax)         # imm = 0xFFFFFFFFFFFFBE99
	movq	g_467(%rip), %rax
	movslq	-3216(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	-3232(%rbp), %rax
	movq	$g_572, (%rax)
	movq	$g_572, g_2028(%rip)
	movsbl	-57(%rbp), %eax
	cmpl	-3216(%rbp), %eax
	setg	%al
	movzbl	%al, %edi
	movl	%edi, -88(%rbp)
	movl	$7, %esi
	callq	safe_rshift_func_int8_t_s_u
	movzwl	%r15w, %r15d
	xorb	%al, %al
	testb	%r12b, %r12b
	jne	.LBB3_23
# BB#22:                                # %land.rhs
                                        #   in Loop: Header=BB3_14 Depth=1
	movq	g_1228(%rip), %rax
	cmpl	$0, (%rax)
	setne	%al
	jmp	.LBB3_23
.LBB3_24:                               # %for.cond468
	movq	$0, g_486(%rip)
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB3_26
# BB#25:                                # %for.body471
	movl	g_1012(%rip), %eax
	jmp	.LBB3_27
.LBB3_26:                               # %for.end473
	movq	g_536(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, (%rax)
	movl	-92(%rbp), %eax
.LBB3_27:                               # %for.end473
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	addq	$3480, %rsp             # imm = 0xD98
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp29:
	.size	func_1, .Ltmp29-func_1
	.cfi_endproc

	.align	16, 0x90
	.type	transparent_crc,@function
transparent_crc:                        # @transparent_crc
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp34:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rdi
	callq	crc32_8bytes
	cmpl	$0, -20(%rbp)
	je	.LBB4_2
# BB#1:                                 # %if.then
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	movl	crc32_context(%rip), %edx
	xorq	%rax, %rdx
	movq	-16(%rbp), %rsi
	movl	$.L.str102, %edi
	xorb	%al, %al
	callq	printf
.LBB4_2:                                # %if.end
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp35:
	.size	transparent_crc, .Ltmp35-transparent_crc
	.cfi_endproc

	.align	16, 0x90
	.type	platform_main_end,@function
platform_main_end:                      # @platform_main_end
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp38:
	.cfi_def_cfa_offset 16
.Ltmp39:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp40:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %esi
	movl	$.L.str101, %edi
	xorb	%al, %al
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp41:
	.size	platform_main_end, .Ltmp41-platform_main_end
	.cfi_endproc

	.align	16, 0x90
	.type	crc32_8bytes,@function
crc32_8bytes:                           # @crc32_8bytes
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp46:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movzbl	%dil, %edi
	callq	crc32_byte
	movl	-8(%rbp), %eax
	movzbl	%ah, %edi
	callq	crc32_byte
	movzwl	-6(%rbp), %eax
	movzbl	%al, %edi
	callq	crc32_byte
	movzbl	-5(%rbp), %edi
	callq	crc32_byte
	movl	$255, %edi
	andl	-4(%rbp), %edi
	callq	crc32_byte
	movq	-8(%rbp), %rax
	shrq	$40, %rax
	movzbl	%al, %edi
	callq	crc32_byte
	movzwl	-2(%rbp), %eax
	movzbl	%al, %edi
	callq	crc32_byte
	movzbl	-1(%rbp), %edi
                                        # kill: EDI<def> EDI<kill> RDI<kill>
	callq	crc32_byte
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp47:
	.size	crc32_8bytes, .Ltmp47-crc32_8bytes
	.cfi_endproc

	.align	16, 0x90
	.type	crc32_byte,@function
crc32_byte:                             # @crc32_byte
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp50:
	.cfi_def_cfa_offset 16
.Ltmp51:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp52:
	.cfi_def_cfa_register %rbp
	movb	%dil, -1(%rbp)
	movzbl	-1(%rbp), %ecx
	movl	crc32_context(%rip), %eax
	xorl	%eax, %ecx
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	crc32_tab(,%rcx,4), %eax
	movl	%eax, crc32_context(%rip)
	popq	%rbp
	ret
.Ltmp53:
	.size	crc32_byte, .Ltmp53-crc32_byte
	.cfi_endproc

	.align	16, 0x90
	.type	safe_sub_func_uint8_t_u_u,@function
safe_sub_func_uint8_t_u_u:              # @safe_sub_func_uint8_t_u_u
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp56:
	.cfi_def_cfa_offset 16
.Ltmp57:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp58:
	.cfi_def_cfa_register %rbp
	movb	%dil, -1(%rbp)
	movb	%sil, -2(%rbp)
	movzbl	-2(%rbp), %ecx
	movzbl	-1(%rbp), %eax
	subl	%ecx, %eax
	movzbl	%al, %eax
	popq	%rbp
	ret
.Ltmp59:
	.size	safe_sub_func_uint8_t_u_u, .Ltmp59-safe_sub_func_uint8_t_u_u
	.cfi_endproc

	.align	16, 0x90
	.type	safe_add_func_int16_t_s_s,@function
safe_add_func_int16_t_s_s:              # @safe_add_func_int16_t_s_s
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp62:
	.cfi_def_cfa_offset 16
.Ltmp63:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp64:
	.cfi_def_cfa_register %rbp
	movw	%di, -2(%rbp)
	movw	%si, -4(%rbp)
	movzwl	-4(%rbp), %ecx
	movzwl	-2(%rbp), %eax
	addl	%ecx, %eax
	movswl	%ax, %eax
	popq	%rbp
	ret
.Ltmp65:
	.size	safe_add_func_int16_t_s_s, .Ltmp65-safe_add_func_int16_t_s_s
	.cfi_endproc

	.align	16, 0x90
	.type	safe_div_func_uint16_t_u_u,@function
safe_div_func_uint16_t_u_u:             # @safe_div_func_uint16_t_u_u
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp68:
	.cfi_def_cfa_offset 16
.Ltmp69:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp70:
	.cfi_def_cfa_register %rbp
	movw	%di, -2(%rbp)
	movw	%si, -4(%rbp)
	movzwl	-4(%rbp), %eax
	testl	%eax, %eax
	je	.LBB10_1
# BB#2:                                 # %cond.false
	movzwl	-2(%rbp), %eax
	movzwl	-4(%rbp), %ecx
	xorl	%edx, %edx
	divl	%ecx
	jmp	.LBB10_3
.LBB10_1:                               # %cond.true
	movzwl	-2(%rbp), %eax
.LBB10_3:                               # %cond.end
	movzwl	%ax, %eax
	popq	%rbp
	ret
.Ltmp71:
	.size	safe_div_func_uint16_t_u_u, .Ltmp71-safe_div_func_uint16_t_u_u
	.cfi_endproc

	.align	16, 0x90
	.type	safe_lshift_func_int16_t_s_s,@function
safe_lshift_func_int16_t_s_s:           # @safe_lshift_func_int16_t_s_s
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp74:
	.cfi_def_cfa_offset 16
.Ltmp75:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp76:
	.cfi_def_cfa_register %rbp
	movw	%di, -2(%rbp)
	movl	%esi, -8(%rbp)
	movswl	-2(%rbp), %eax
	testl	%eax, %eax
	js	.LBB11_4
# BB#1:                                 # %lor.lhs.false
	cmpl	$0, -8(%rbp)
	js	.LBB11_4
# BB#2:                                 # %lor.lhs.false4
	cmpl	$31, -8(%rbp)
	jg	.LBB11_4
# BB#3:                                 # %lor.lhs.false7
	movb	-8(%rbp), %cl
	movl	$32767, %eax            # imm = 0x7FFF
	shrl	%cl, %eax
	movswl	-2(%rbp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB11_5
.LBB11_4:                               # %cond.true
	movswl	-2(%rbp), %eax
.LBB11_6:                               # %cond.end
	movswl	%ax, %eax
	popq	%rbp
	ret
.LBB11_5:                               # %cond.false
	movb	-8(%rbp), %cl
	movswl	-2(%rbp), %eax
	shll	%cl, %eax
	jmp	.LBB11_6
.Ltmp77:
	.size	safe_lshift_func_int16_t_s_s, .Ltmp77-safe_lshift_func_int16_t_s_s
	.cfi_endproc

	.align	16, 0x90
	.type	safe_rshift_func_int8_t_s_s,@function
safe_rshift_func_int8_t_s_s:            # @safe_rshift_func_int8_t_s_s
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp80:
	.cfi_def_cfa_offset 16
.Ltmp81:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp82:
	.cfi_def_cfa_register %rbp
	movb	%dil, -1(%rbp)
	movl	%esi, -8(%rbp)
	movsbl	-1(%rbp), %eax
	testl	%eax, %eax
	js	.LBB12_3
# BB#1:                                 # %lor.lhs.false
	cmpl	$0, -8(%rbp)
	js	.LBB12_3
# BB#2:                                 # %lor.lhs.false4
	cmpl	$32, -8(%rbp)
	jl	.LBB12_4
.LBB12_3:                               # %cond.true
	movsbl	-1(%rbp), %eax
	popq	%rbp
	ret
.LBB12_4:                               # %cond.false
	movb	-8(%rbp), %cl
	movsbl	-1(%rbp), %eax
	sarl	%cl, %eax
	popq	%rbp
	ret
.Ltmp83:
	.size	safe_rshift_func_int8_t_s_s, .Ltmp83-safe_rshift_func_int8_t_s_s
	.cfi_endproc

	.align	16, 0x90
	.type	safe_rshift_func_int8_t_s_u,@function
safe_rshift_func_int8_t_s_u:            # @safe_rshift_func_int8_t_s_u
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp86:
	.cfi_def_cfa_offset 16
.Ltmp87:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp88:
	.cfi_def_cfa_register %rbp
	movb	%dil, -1(%rbp)
	movl	%esi, -8(%rbp)
	movsbl	-1(%rbp), %eax
	testl	%eax, %eax
	js	.LBB13_2
# BB#1:                                 # %lor.lhs.false
	cmpl	$32, -8(%rbp)
	jb	.LBB13_3
.LBB13_2:                               # %cond.true
	movsbl	-1(%rbp), %eax
	popq	%rbp
	ret
.LBB13_3:                               # %cond.false
	movb	-8(%rbp), %cl
	movsbl	-1(%rbp), %eax
	sarl	%cl, %eax
	popq	%rbp
	ret
.Ltmp89:
	.size	safe_rshift_func_int8_t_s_u, .Ltmp89-safe_rshift_func_int8_t_s_u
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "1"
	.size	.L.str, 2

	.type	g_2,@object             # @g_2
	.data
	.align	4
g_2:
	.long	4294967294              # 0xfffffffe
	.size	g_2, 4

	.type	.L.str1,@object         # @.str1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str1:
	.asciz	 "g_2"
	.size	.L.str1, 4

	.type	g_5,@object             # @g_5
	.data
	.align	4
g_5:
	.long	4294967287              # 0xfffffff7
	.size	g_5, 4

	.type	.L.str2,@object         # @.str2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str2:
	.asciz	 "g_5"
	.size	.L.str2, 4

	.type	g_18,@object            # @g_18
	.data
	.align	8
g_18:
	.quad	-6476243495245046361    # 0xa61fc2da8afc1da7
	.size	g_18, 8

	.type	.L.str3,@object         # @.str3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str3:
	.asciz	 "g_18"
	.size	.L.str3, 5

	.type	g_23,@object            # @g_23
	.data
	.align	2
g_23:
	.short	13142                   # 0x3356
	.size	g_23, 2

	.type	.L.str4,@object         # @.str4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str4:
	.asciz	 "g_23"
	.size	.L.str4, 5

	.type	g_47,@object            # @g_47
	.data
	.align	2
g_47:
	.short	65532                   # 0xfffc
	.size	g_47, 2

	.type	.L.str5,@object         # @.str5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str5:
	.asciz	 "g_47"
	.size	.L.str5, 5

	.type	g_51,@object            # @g_51
	.data
	.align	2
g_51:
	.short	1                       # 0x1
	.size	g_51, 2

	.type	.L.str6,@object         # @.str6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str6:
	.asciz	 "g_51"
	.size	.L.str6, 5

	.type	g_54,@object            # @g_54
	.data
	.align	2
g_54:
	.short	47156                   # 0xb834
	.size	g_54, 2

	.type	.L.str7,@object         # @.str7
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str7:
	.asciz	 "g_54"
	.size	.L.str7, 5

	.type	g_105,@object           # @g_105
	.data
	.align	2
g_105:
	.short	11593                   # 0x2d49
	.size	g_105, 2

	.type	.L.str8,@object         # @.str8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str8:
	.asciz	 "g_105"
	.size	.L.str8, 6

	.type	g_109,@object           # @g_109
	.data
g_109:
	.byte	253                     # 0xfd
	.size	g_109, 1

	.type	.L.str9,@object         # @.str9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str9:
	.asciz	 "g_109"
	.size	.L.str9, 6

	.type	g_115,@object           # @g_115
	.data
	.align	16
g_115:
	.quad	4                       # 0x4
	.quad	0                       # 0x0
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	0                       # 0x0
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	0                       # 0x0
	.size	g_115, 64

	.type	.L.str10,@object        # @.str10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str10:
	.asciz	 "g_115[i][j]"
	.size	.L.str10, 12

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	 "index = [%d][%d]\n"
	.size	.L.str11, 18

	.type	g_128,@object           # @g_128
	.data
	.align	4
g_128:
	.long	3876189741              # 0xe709f62d
	.size	g_128, 4

	.type	.L.str12,@object        # @.str12
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str12:
	.asciz	 "g_128"
	.size	.L.str12, 6

	.type	g_137,@object           # @g_137
	.data
	.align	4
g_137:
	.long	2793592894              # 0xa682d83e
	.size	g_137, 4

	.type	.L.str13,@object        # @.str13
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str13:
	.asciz	 "g_137"
	.size	.L.str13, 6

	.type	g_144,@object           # @g_144
	.data
g_144:
	.zero	2,1
	.size	g_144, 2

	.type	.L.str14,@object        # @.str14
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str14:
	.asciz	 "g_144[i]"
	.size	.L.str14, 9

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	 "index = [%d]\n"
	.size	.L.str15, 14

	.type	g_148,@object           # @g_148
	.data
	.align	4
g_148:
	.long	769004935               # 0x2dd61587
	.size	g_148, 4

	.type	.L.str16,@object        # @.str16
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str16:
	.asciz	 "g_148"
	.size	.L.str16, 6

	.type	g_156,@object           # @g_156
	.data
	.align	8
g_156:
	.quad	-634620289554702485     # 0xf731603581d61f6b
	.size	g_156, 8

	.type	.L.str17,@object        # @.str17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str17:
	.asciz	 "g_156"
	.size	.L.str17, 6

	.type	g_166,@object           # @g_166
	.data
	.align	4
g_166:
	.long	2490314440              # 0x946f2ec8
	.size	g_166, 4

	.type	.L.str18,@object        # @.str18
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str18:
	.asciz	 "g_166"
	.size	.L.str18, 6

	.type	g_182,@object           # @g_182
	.data
g_182:
	.byte	250                     # 0xfa
	.size	g_182, 1

	.type	.L.str19,@object        # @.str19
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str19:
	.asciz	 "g_182"
	.size	.L.str19, 6

	.type	g_247,@object           # @g_247
	.data
g_247:
	.byte	1                       # 0x1
	.size	g_247, 1

	.type	.L.str20,@object        # @.str20
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str20:
	.asciz	 "g_247"
	.size	.L.str20, 6

	.type	g_251,@object           # @g_251
	.data
	.align	16
g_251:
	.quad	-2614997994048444719    # 0xdbb5a92de46226d1
	.quad	-2614997994048444719    # 0xdbb5a92de46226d1
	.quad	-517706366463331744     # 0xf8d0bccd78feb260
	.quad	0                       # 0x0
	.quad	-517706366463331744     # 0xf8d0bccd78feb260
	.quad	-2614997994048444719    # 0xdbb5a92de46226d1
	.quad	-2614997994048444719    # 0xdbb5a92de46226d1
	.quad	-517706366463331744     # 0xf8d0bccd78feb260
	.quad	0                       # 0x0
	.quad	-517706366463331744     # 0xf8d0bccd78feb260
	.size	g_251, 80

	.type	.L.str21,@object        # @.str21
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str21:
	.asciz	 "g_251[i][j]"
	.size	.L.str21, 12

	.type	g_252,@object           # @g_252
	.data
g_252:
	.byte	61                      # 0x3d
	.size	g_252, 1

	.type	.L.str22,@object        # @.str22
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str22:
	.asciz	 "g_252"
	.size	.L.str22, 6

	.type	g_253,@object           # @g_253
	.data
	.align	4
g_253:
	.long	2680584340              # 0x9fc67894
	.size	g_253, 4

	.type	.L.str23,@object        # @.str23
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str23:
	.asciz	 "g_253"
	.size	.L.str23, 6

	.type	g_256,@object           # @g_256
	.data
	.align	4
g_256:
	.long	761214948               # 0x2d5f37e4
	.size	g_256, 4

	.type	.L.str24,@object        # @.str24
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str24:
	.asciz	 "g_256"
	.size	.L.str24, 6

	.type	g_345,@object           # @g_345
	.data
	.align	4
g_345:
	.long	4128872015              # 0xf619964f
	.size	g_345, 4

	.type	.L.str25,@object        # @.str25
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str25:
	.asciz	 "g_345"
	.size	.L.str25, 6

	.type	g_381,@object           # @g_381
	.data
	.align	2
g_381:
	.short	20098                   # 0x4e82
	.size	g_381, 2

	.type	.L.str26,@object        # @.str26
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str26:
	.asciz	 "g_381"
	.size	.L.str26, 6

	.type	g_449,@object           # @g_449
	.data
	.align	2
g_449:
	.short	1                       # 0x1
	.size	g_449, 2

	.type	.L.str27,@object        # @.str27
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str27:
	.asciz	 "g_449"
	.size	.L.str27, 6

	.type	g_472,@object           # @g_472
	.data
g_472:
	.byte	84                      # 0x54
	.size	g_472, 1

	.type	.L.str28,@object        # @.str28
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str28:
	.asciz	 "g_472"
	.size	.L.str28, 6

	.type	g_480,@object           # @g_480
	.data
	.align	4
g_480:
	.long	980658737               # 0x3a73aa31
	.long	980658737               # 0x3a73aa31
	.long	980658737               # 0x3a73aa31
	.size	g_480, 12

	.type	.L.str29,@object        # @.str29
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str29:
	.asciz	 "g_480[i]"
	.size	.L.str29, 9

	.type	g_481,@object           # @g_481
	.data
	.align	2
g_481:
	.short	65534                   # 0xfffe
	.size	g_481, 2

	.type	.L.str30,@object        # @.str30
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str30:
	.asciz	 "g_481"
	.size	.L.str30, 6

	.type	g_484,@object           # @g_484
	.data
	.align	4
g_484:
	.long	1518798528              # 0x5a8706c0
	.size	g_484, 4

	.type	.L.str31,@object        # @.str31
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str31:
	.asciz	 "g_484"
	.size	.L.str31, 6

	.type	g_486,@object           # @g_486
	.data
	.align	8
g_486:
	.quad	4                       # 0x4
	.size	g_486, 8

	.type	.L.str32,@object        # @.str32
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str32:
	.asciz	 "g_486"
	.size	.L.str32, 6

	.type	g_495,@object           # @g_495
	.data
	.align	2
g_495:
	.short	8                       # 0x8
	.short	8                       # 0x8
	.short	43977                   # 0xabc9
	.short	8                       # 0x8
	.short	8                       # 0x8
	.short	43977                   # 0xabc9
	.size	g_495, 12

	.type	.L.str33,@object        # @.str33
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str33:
	.asciz	 "g_495[i]"
	.size	.L.str33, 9

	.type	g_521,@object           # @g_521
	.data
	.align	4
g_521:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.size	g_521, 12

	.type	.L.str34,@object        # @.str34
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str34:
	.asciz	 "g_521[i]"
	.size	.L.str34, 9

	.type	.L.str35,@object        # @.str35
.L.str35:
	.asciz	 "g_538"
	.size	.L.str35, 6

	.type	g_694,@object           # @g_694
	.data
	.align	2
g_694:
	.short	1                       # 0x1
	.size	g_694, 2

	.type	.L.str36,@object        # @.str36
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str36:
	.asciz	 "g_694"
	.size	.L.str36, 6

	.type	g_715,@object           # @g_715
	.data
	.align	2
g_715:
	.short	45570                   # 0xb202
	.size	g_715, 2

	.type	.L.str37,@object        # @.str37
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str37:
	.asciz	 "g_715"
	.size	.L.str37, 6

	.type	g_750,@object           # @g_750
	.data
	.align	16
g_750:
	.zero	160,255
	.size	g_750, 160

	.type	.L.str38,@object        # @.str38
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str38:
	.asciz	 "g_750[i][j][k]"
	.size	.L.str38, 15

	.type	.L.str39,@object        # @.str39
.L.str39:
	.asciz	 "index = [%d][%d][%d]\n"
	.size	.L.str39, 22

	.type	g_751,@object           # @g_751
	.local	g_751
	.comm	g_751,8,8
	.type	.L.str40,@object        # @.str40
.L.str40:
	.asciz	 "g_751"
	.size	.L.str40, 6

	.type	g_752,@object           # @g_752
	.data
	.align	8
g_752:
	.quad	-1                      # 0xffffffffffffffff
	.size	g_752, 8

	.type	.L.str41,@object        # @.str41
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str41:
	.asciz	 "g_752"
	.size	.L.str41, 6

	.type	g_753,@object           # @g_753
	.data
	.align	8
g_753:
	.quad	-1                      # 0xffffffffffffffff
	.size	g_753, 8

	.type	.L.str42,@object        # @.str42
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str42:
	.asciz	 "g_753"
	.size	.L.str42, 6

	.type	g_754,@object           # @g_754
	.data
	.align	8
g_754:
	.quad	-10                     # 0xfffffffffffffff6
	.size	g_754, 8

	.type	.L.str43,@object        # @.str43
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str43:
	.asciz	 "g_754"
	.size	.L.str43, 6

	.type	g_755,@object           # @g_755
	.data
	.align	8
g_755:
	.quad	7574251456638663862     # 0x691d2591d86ebcb6
	.size	g_755, 8

	.type	.L.str44,@object        # @.str44
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str44:
	.asciz	 "g_755"
	.size	.L.str44, 6

	.type	g_756,@object           # @g_756
	.data
	.align	16
g_756:
	.quad	-3511314460624481282    # 0xcf454e1a0fc913fe
	.quad	1                       # 0x1
	.quad	-3511314460624481282    # 0xcf454e1a0fc913fe
	.quad	-3511314460624481282    # 0xcf454e1a0fc913fe
	.quad	1                       # 0x1
	.quad	-1                      # 0xffffffffffffffff
	.quad	5558519789579486816     # 0x4d23d44c5edd4660
	.quad	5558519789579486816     # 0x4d23d44c5edd4660
	.quad	-1                      # 0xffffffffffffffff
	.quad	5558519789579486816     # 0x4d23d44c5edd4660
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	5558519789579486816     # 0x4d23d44c5edd4660
	.quad	-1                      # 0xffffffffffffffff
	.quad	5558519789579486816     # 0x4d23d44c5edd4660
	.quad	5558519789579486816     # 0x4d23d44c5edd4660
	.quad	-1                      # 0xffffffffffffffff
	.quad	1                       # 0x1
	.quad	-3511314460624481282    # 0xcf454e1a0fc913fe
	.quad	-3511314460624481282    # 0xcf454e1a0fc913fe
	.quad	1                       # 0x1
	.quad	-3511314460624481282    # 0xcf454e1a0fc913fe
	.size	g_756, 200

	.type	.L.str45,@object        # @.str45
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str45:
	.asciz	 "g_756[i][j]"
	.size	.L.str45, 12

	.type	g_757,@object           # @g_757
	.local	g_757
	.comm	g_757,8,8
	.type	.L.str46,@object        # @.str46
.L.str46:
	.asciz	 "g_757[i]"
	.size	.L.str46, 9

	.type	g_758,@object           # @g_758
	.data
	.align	8
g_758:
	.quad	6722396981229820992     # 0x5d4ac070095c9c40
	.size	g_758, 8

	.type	.L.str47,@object        # @.str47
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str47:
	.asciz	 "g_758"
	.size	.L.str47, 6

	.type	g_759,@object           # @g_759
	.data
	.align	8
g_759:
	.quad	1                       # 0x1
	.size	g_759, 8

	.type	.L.str48,@object        # @.str48
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str48:
	.asciz	 "g_759"
	.size	.L.str48, 6

	.type	g_760,@object           # @g_760
	.data
	.align	8
g_760:
	.quad	-7                      # 0xfffffffffffffff9
	.size	g_760, 8

	.type	.L.str49,@object        # @.str49
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str49:
	.asciz	 "g_760"
	.size	.L.str49, 6

	.type	g_761,@object           # @g_761
	.data
	.align	8
g_761:
	.quad	-8                      # 0xfffffffffffffff8
	.size	g_761, 8

	.type	.L.str50,@object        # @.str50
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str50:
	.asciz	 "g_761"
	.size	.L.str50, 6

	.type	g_762,@object           # @g_762
	.data
	.align	8
g_762:
	.quad	5                       # 0x5
	.size	g_762, 8

	.type	.L.str51,@object        # @.str51
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str51:
	.asciz	 "g_762"
	.size	.L.str51, 6

	.type	g_763,@object           # @g_763
	.data
	.align	8
g_763:
	.quad	-10                     # 0xfffffffffffffff6
	.size	g_763, 8

	.type	.L.str52,@object        # @.str52
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str52:
	.asciz	 "g_763"
	.size	.L.str52, 6

	.type	g_764,@object           # @g_764
	.data
	.align	8
g_764:
	.quad	-8941798641767980640    # 0x83e85982d05961a0
	.size	g_764, 8

	.type	.L.str53,@object        # @.str53
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str53:
	.asciz	 "g_764"
	.size	.L.str53, 6

	.type	g_765,@object           # @g_765
	.data
	.align	8
g_765:
	.quad	-1                      # 0xffffffffffffffff
	.size	g_765, 8

	.type	.L.str54,@object        # @.str54
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str54:
	.asciz	 "g_765"
	.size	.L.str54, 6

	.type	g_766,@object           # @g_766
	.data
	.align	16
g_766:
	.quad	2645078542625680504     # 0x24b534eb98362c78
	.quad	-9                      # 0xfffffffffffffff7
	.quad	3057184904099379319     # 0x2a6d4d78fd87b877
	.quad	7696329268811128159     # 0x6acedab16deddd5f
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	6639438937942654122     # 0x5c2406896bf7fcaa
	.quad	588150469638725069      # 0x82987bc694b9dcd
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-7432262184466566948    # 0x98db4cebc94d30dc
	.quad	-6985300374604053843    # 0x9f0f3a51aa5282ad
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	-1                      # 0xffffffffffffffff
	.quad	5                       # 0x5
	.quad	-9                      # 0xfffffffffffffff7
	.quad	-9                      # 0xfffffffffffffff7
	.quad	2650727729947446008     # 0x24c946d383cb8af8
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	2                       # 0x2
	.quad	2645078542625680504     # 0x24b534eb98362c78
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	3057184904099379319     # 0x2a6d4d78fd87b877
	.quad	-1                      # 0xffffffffffffffff
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	4967381711668055071     # 0x44efaf5933bf0c1f
	.quad	588150469638725069      # 0x82987bc694b9dcd
	.quad	-9                      # 0xfffffffffffffff7
	.quad	-7432262184466566948    # 0x98db4cebc94d30dc
	.quad	5071702430090921193     # 0x46624e7d380e04e9
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	-1                      # 0xffffffffffffffff
	.quad	5                       # 0x5
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-9                      # 0xfffffffffffffff7
	.quad	7457986355088270746     # 0x678017136abf259a
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	8061742169846850917     # 0x6fe10fca60822565
	.quad	2645078542625680504     # 0x24b534eb98362c78
	.quad	-9                      # 0xfffffffffffffff7
	.quad	3057184904099379319     # 0x2a6d4d78fd87b877
	.quad	7696329268811128159     # 0x6acedab16deddd5f
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	6639438937942654122     # 0x5c2406896bf7fcaa
	.quad	588150469638725069      # 0x82987bc694b9dcd
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-7432262184466566948    # 0x98db4cebc94d30dc
	.quad	-6985300374604053843    # 0x9f0f3a51aa5282ad
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	-1                      # 0xffffffffffffffff
	.quad	5                       # 0x5
	.quad	-9                      # 0xfffffffffffffff7
	.quad	-9                      # 0xfffffffffffffff7
	.quad	2650727729947446008     # 0x24c946d383cb8af8
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	2                       # 0x2
	.quad	2645078542625680504     # 0x24b534eb98362c78
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	3057184904099379319     # 0x2a6d4d78fd87b877
	.quad	-1                      # 0xffffffffffffffff
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	4967381711668055071     # 0x44efaf5933bf0c1f
	.quad	588150469638725069      # 0x82987bc694b9dcd
	.quad	-9                      # 0xfffffffffffffff7
	.quad	-7432262184466566948    # 0x98db4cebc94d30dc
	.quad	5071702430090921193     # 0x46624e7d380e04e9
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	-1                      # 0xffffffffffffffff
	.quad	5                       # 0x5
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-9                      # 0xfffffffffffffff7
	.quad	7457986355088270746     # 0x678017136abf259a
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	8061742169846850917     # 0x6fe10fca60822565
	.quad	2645078542625680504     # 0x24b534eb98362c78
	.quad	-9                      # 0xfffffffffffffff7
	.quad	3057184904099379319     # 0x2a6d4d78fd87b877
	.quad	7696329268811128159     # 0x6acedab16deddd5f
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	6639438937942654122     # 0x5c2406896bf7fcaa
	.quad	588150469638725069      # 0x82987bc694b9dcd
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-7432262184466566948    # 0x98db4cebc94d30dc
	.quad	-6985300374604053843    # 0x9f0f3a51aa5282ad
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	-1                      # 0xffffffffffffffff
	.quad	5                       # 0x5
	.quad	-9                      # 0xfffffffffffffff7
	.quad	-9                      # 0xfffffffffffffff7
	.quad	2650727729947446008     # 0x24c946d383cb8af8
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	2                       # 0x2
	.quad	2645078542625680504     # 0x24b534eb98362c78
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	3057184904099379319     # 0x2a6d4d78fd87b877
	.quad	-1                      # 0xffffffffffffffff
	.quad	6507554746383141549     # 0x5a4f7a9036930aad
	.quad	4967381711668055071     # 0x44efaf5933bf0c1f
	.quad	588150469638725069      # 0x82987bc694b9dcd
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	2                       # 0x2
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	0                       # 0x0
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-1                      # 0xffffffffffffffff
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	7789191806386346113     # 0x6c18c4add30a9881
	.quad	2                       # 0x2
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	6639438937942654122     # 0x5c2406896bf7fcaa
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	8061742169846850917     # 0x6fe10fca60822565
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	-1                      # 0xffffffffffffffff
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	4967381711668055071     # 0x44efaf5933bf0c1f
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	-1                      # 0xffffffffffffffff
	.quad	0                       # 0x0
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	2                       # 0x2
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	0                       # 0x0
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-1                      # 0xffffffffffffffff
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	7789191806386346113     # 0x6c18c4add30a9881
	.quad	2                       # 0x2
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	6639438937942654122     # 0x5c2406896bf7fcaa
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	8061742169846850917     # 0x6fe10fca60822565
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	-1                      # 0xffffffffffffffff
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	4967381711668055071     # 0x44efaf5933bf0c1f
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	-1                      # 0xffffffffffffffff
	.quad	0                       # 0x0
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	2                       # 0x2
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	0                       # 0x0
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-1                      # 0xffffffffffffffff
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	7789191806386346113     # 0x6c18c4add30a9881
	.quad	2                       # 0x2
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	6639438937942654122     # 0x5c2406896bf7fcaa
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	8061742169846850917     # 0x6fe10fca60822565
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	-1                      # 0xffffffffffffffff
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	4967381711668055071     # 0x44efaf5933bf0c1f
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	-1                      # 0xffffffffffffffff
	.quad	0                       # 0x0
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	2                       # 0x2
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	0                       # 0x0
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-1                      # 0xffffffffffffffff
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	7789191806386346113     # 0x6c18c4add30a9881
	.quad	2                       # 0x2
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	6639438937942654122     # 0x5c2406896bf7fcaa
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.quad	8061742169846850917     # 0x6fe10fca60822565
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	-7960770166935365585    # 0x9185a9b60d4a582f
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	-1                      # 0xffffffffffffffff
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	-1                      # 0xffffffffffffffff
	.quad	-872637802076688201     # 0xf3e3c48adda430b7
	.quad	4967381711668055071     # 0x44efaf5933bf0c1f
	.quad	4609964070193757537     # 0x3ff9e1e5af367d61
	.quad	-1                      # 0xffffffffffffffff
	.quad	0                       # 0x0
	.quad	-4908184724927615030    # 0xbbe29fff52b0efca
	.quad	4655770690144364357     # 0x409c9ec67dbae745
	.size	g_766, 1944

	.type	.L.str55,@object        # @.str55
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str55:
	.asciz	 "g_766[i][j][k]"
	.size	.L.str55, 15

	.type	g_767,@object           # @g_767
	.data
	.align	8
g_767:
	.quad	2465757645363147751     # 0x22382183aa12f3e7
	.size	g_767, 8

	.type	.L.str56,@object        # @.str56
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str56:
	.asciz	 "g_767"
	.size	.L.str56, 6

	.type	g_768,@object           # @g_768
	.local	g_768
	.comm	g_768,8,8
	.type	.L.str57,@object        # @.str57
.L.str57:
	.asciz	 "g_768"
	.size	.L.str57, 6

	.type	g_769,@object           # @g_769
	.data
	.align	8
g_769:
	.quad	6                       # 0x6
	.size	g_769, 8

	.type	.L.str58,@object        # @.str58
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str58:
	.asciz	 "g_769"
	.size	.L.str58, 6

	.type	g_770,@object           # @g_770
	.data
	.align	8
g_770:
	.quad	-1159587573413269205    # 0xefe8513ee8beb12b
	.size	g_770, 8

	.type	.L.str59,@object        # @.str59
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str59:
	.asciz	 "g_770"
	.size	.L.str59, 6

	.type	g_771,@object           # @g_771
	.data
	.align	16
g_771:
	.zero	48,255
	.size	g_771, 48

	.type	.L.str60,@object        # @.str60
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str60:
	.asciz	 "g_771[i]"
	.size	.L.str60, 9

	.type	g_772,@object           # @g_772
	.local	g_772
	.comm	g_772,8,8
	.type	.L.str61,@object        # @.str61
.L.str61:
	.asciz	 "g_772"
	.size	.L.str61, 6

	.type	g_773,@object           # @g_773
	.data
	.align	8
g_773:
	.quad	-4032878596014474035    # 0xc8085648b647fccd
	.size	g_773, 8

	.type	.L.str62,@object        # @.str62
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str62:
	.asciz	 "g_773"
	.size	.L.str62, 6

	.type	g_774,@object           # @g_774
	.data
	.align	8
g_774:
	.quad	1212090583074684510     # 0x10d235f69fc33e5e
	.size	g_774, 8

	.type	.L.str63,@object        # @.str63
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str63:
	.asciz	 "g_774"
	.size	.L.str63, 6

	.type	g_775,@object           # @g_775
	.data
	.align	8
g_775:
	.quad	-1015765755755817382    # 0xf1e7466d492b165a
	.size	g_775, 8

	.type	.L.str64,@object        # @.str64
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str64:
	.asciz	 "g_775"
	.size	.L.str64, 6

	.type	g_776,@object           # @g_776
	.data
	.align	8
g_776:
	.quad	2422314324553942735     # 0x219dca0b5160c6cf
	.size	g_776, 8

	.type	.L.str65,@object        # @.str65
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str65:
	.asciz	 "g_776"
	.size	.L.str65, 6

	.type	g_777,@object           # @g_777
	.data
	.align	8
g_777:
	.quad	-1640301706833071939    # 0xe93c7a49cfbf70bd
	.size	g_777, 8

	.type	.L.str66,@object        # @.str66
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str66:
	.asciz	 "g_777"
	.size	.L.str66, 6

	.type	g_778,@object           # @g_778
	.data
	.align	16
g_778:
	.quad	-10                     # 0xfffffffffffffff6
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	-8254598135808915602    # 0x8d71c6baef82076e
	.quad	-10                     # 0xfffffffffffffff6
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	1143406365693409373     # 0xfde32081513785d
	.quad	6782118404809959851     # 0x5e1eecc1875629ab
	.quad	0                       # 0x0
	.quad	6782118404809959851     # 0x5e1eecc1875629ab
	.quad	1143406365693409373     # 0xfde32081513785d
	.quad	-8254598135808915602    # 0x8d71c6baef82076e
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	1143406365693409373     # 0xfde32081513785d
	.quad	-1                      # 0xffffffffffffffff
	.quad	-1                      # 0xffffffffffffffff
	.quad	1143406365693409373     # 0xfde32081513785d
	.quad	0                       # 0x0
	.quad	-10                     # 0xfffffffffffffff6
	.quad	0                       # 0x0
	.quad	-5                      # 0xfffffffffffffffb
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	1143406365693409373     # 0xfde32081513785d
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	0                       # 0x0
	.quad	1143406365693409373     # 0xfde32081513785d
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	7122565410217755680     # 0x62d86f80ed838420
	.quad	7122565410217755680     # 0x62d86f80ed838420
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	0                       # 0x0
	.quad	5300995978446238788     # 0x4990ebc1ab0ff444
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	6183123563532036435     # 0x55cede1f16aca953
	.quad	6183123563532036435     # 0x55cede1f16aca953
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	0                       # 0x0
	.quad	0                       # 0x0
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	1                       # 0x1
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	-5                      # 0xfffffffffffffffb
	.quad	-5                      # 0xfffffffffffffffb
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	6183123563532036435     # 0x55cede1f16aca953
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	7122565410217755680     # 0x62d86f80ed838420
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	5300995978446238788     # 0x4990ebc1ab0ff444
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	5300995978446238788     # 0x4990ebc1ab0ff444
	.quad	6183123563532036435     # 0x55cede1f16aca953
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	-581666867114788004     # 0xf7ed8110f0023b5c
	.quad	-1                      # 0xffffffffffffffff
	.quad	-8254598135808915602    # 0x8d71c6baef82076e
	.quad	-8254598135808915602    # 0x8d71c6baef82076e
	.quad	1358638588644308859     # 0x12dada991648377b
	.quad	617350117098271220      # 0x89144a91fb031f4
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.quad	-1                      # 0xffffffffffffffff
	.quad	0                       # 0x0
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	-5                      # 0xfffffffffffffffb
	.quad	5300995978446238788     # 0x4990ebc1ab0ff444
	.quad	-2561224805338312674    # 0xdc74b39c07e4101e
	.quad	6183123563532036435     # 0x55cede1f16aca953
	.quad	-1                      # 0xffffffffffffffff
	.quad	0                       # 0x0
	.quad	7122565410217755680     # 0x62d86f80ed838420
	.quad	0                       # 0x0
	.quad	-1                      # 0xffffffffffffffff
	.size	g_778, 800

	.type	.L.str67,@object        # @.str67
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str67:
	.asciz	 "g_778[i][j][k]"
	.size	.L.str67, 15

	.type	g_779,@object           # @g_779
	.data
	.align	8
g_779:
	.quad	-5                      # 0xfffffffffffffffb
	.size	g_779, 8

	.type	.L.str68,@object        # @.str68
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str68:
	.asciz	 "g_779"
	.size	.L.str68, 6

	.type	g_780,@object           # @g_780
	.data
	.align	8
g_780:
	.quad	-1                      # 0xffffffffffffffff
	.size	g_780, 8

	.type	.L.str69,@object        # @.str69
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str69:
	.asciz	 "g_780"
	.size	.L.str69, 6

	.type	g_781,@object           # @g_781
	.data
	.align	8
g_781:
	.quad	7640539881462701843     # 0x6a08a68a76ca1f13
	.size	g_781, 8

	.type	.L.str70,@object        # @.str70
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str70:
	.asciz	 "g_781"
	.size	.L.str70, 6

	.type	g_782,@object           # @g_782
	.data
	.align	16
g_782:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.quad	4                       # 0x4
	.size	g_782, 80

	.type	.L.str71,@object        # @.str71
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str71:
	.asciz	 "g_782[i][j]"
	.size	.L.str71, 12

	.type	g_783,@object           # @g_783
	.data
	.align	8
g_783:
	.quad	4544543905570645905     # 0x3f11769aa5b46791
	.size	g_783, 8

	.type	.L.str72,@object        # @.str72
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str72:
	.asciz	 "g_783"
	.size	.L.str72, 6

	.type	g_784,@object           # @g_784
	.data
	.align	8
g_784:
	.quad	-4744785289392166776    # 0xbe2722eb1247e888
	.size	g_784, 8

	.type	.L.str73,@object        # @.str73
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str73:
	.asciz	 "g_784"
	.size	.L.str73, 6

	.type	g_785,@object           # @g_785
	.data
	.align	8
g_785:
	.quad	7702304918013719043     # 0x6ae41583adf3b203
	.size	g_785, 8

	.type	.L.str74,@object        # @.str74
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str74:
	.asciz	 "g_785"
	.size	.L.str74, 6

	.type	g_786,@object           # @g_786
	.data
	.align	8
g_786:
	.quad	1                       # 0x1
	.size	g_786, 8

	.type	.L.str75,@object        # @.str75
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str75:
	.asciz	 "g_786"
	.size	.L.str75, 6

	.type	g_787,@object           # @g_787
	.data
	.align	8
g_787:
	.quad	-497623535011002197     # 0xf91816080bcb88ab
	.size	g_787, 8

	.type	.L.str76,@object        # @.str76
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str76:
	.asciz	 "g_787"
	.size	.L.str76, 6

	.type	g_788,@object           # @g_788
	.data
	.align	16
g_788:
	.quad	1                       # 0x1
	.quad	-5                      # 0xfffffffffffffffb
	.quad	1                       # 0x1
	.quad	-2                      # 0xfffffffffffffffe
	.quad	7                       # 0x7
	.zero	8,255
	.quad	302464018161004608      # 0x432916c07d2f040
	.zero	8,255
	.zero	8,255
	.quad	-2                      # 0xfffffffffffffffe
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	-2                      # 0xfffffffffffffffe
	.zero	8,255
	.zero	8,255
	.quad	302464018161004608      # 0x432916c07d2f040
	.zero	8,255
	.quad	7                       # 0x7
	.quad	-2                      # 0xfffffffffffffffe
	.quad	1                       # 0x1
	.quad	-5                      # 0xfffffffffffffffb
	.quad	1                       # 0x1
	.quad	5595160569652166811     # 0x4da600e4c763c09b
	.quad	7                       # 0x7
	.zero	8,255
	.quad	6                       # 0x6
	.zero	8,255
	.quad	7                       # 0x7
	.quad	5595160569652166811     # 0x4da600e4c763c09b
	.quad	1                       # 0x1
	.quad	-5                      # 0xfffffffffffffffb
	.quad	1                       # 0x1
	.quad	-2                      # 0xfffffffffffffffe
	.quad	7                       # 0x7
	.zero	8,255
	.quad	302464018161004608      # 0x432916c07d2f040
	.zero	8,255
	.zero	8,255
	.quad	-2                      # 0xfffffffffffffffe
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	-2                      # 0xfffffffffffffffe
	.zero	8,255
	.zero	8,255
	.quad	302464018161004608      # 0x432916c07d2f040
	.zero	8,255
	.quad	7                       # 0x7
	.quad	-2                      # 0xfffffffffffffffe
	.quad	1                       # 0x1
	.quad	-5                      # 0xfffffffffffffffb
	.quad	1                       # 0x1
	.quad	5595160569652166811     # 0x4da600e4c763c09b
	.quad	7                       # 0x7
	.zero	8,255
	.quad	6                       # 0x6
	.zero	8,255
	.quad	7                       # 0x7
	.quad	5595160569652166811     # 0x4da600e4c763c09b
	.quad	1                       # 0x1
	.quad	-5                      # 0xfffffffffffffffb
	.quad	1                       # 0x1
	.quad	-2                      # 0xfffffffffffffffe
	.size	g_788, 512

	.type	.L.str77,@object        # @.str77
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str77:
	.asciz	 "g_788[i][j][k]"
	.size	.L.str77, 15

	.type	g_816,@object           # @g_816
	.data
	.align	8
g_816:
	.quad	-7225274146323736339    # 0x9bbaab71ef8f58ed
	.size	g_816, 8

	.type	.L.str78,@object        # @.str78
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str78:
	.asciz	 "g_816"
	.size	.L.str78, 6

	.type	g_921,@object           # @g_921
	.local	g_921
	.comm	g_921,2,2
	.type	.L.str79,@object        # @.str79
.L.str79:
	.asciz	 "g_921"
	.size	.L.str79, 6

	.type	g_922,@object           # @g_922
	.data
	.align	8
g_922:
	.quad	-7010665156039076840    # 0x9eb51d2f47151418
	.size	g_922, 8

	.type	.L.str80,@object        # @.str80
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str80:
	.asciz	 "g_922"
	.size	.L.str80, 6

	.type	g_923,@object           # @g_923
	.data
	.align	4
g_923:
	.long	1800276779              # 0x6b4e0b2b
	.size	g_923, 4

	.type	.L.str81,@object        # @.str81
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str81:
	.asciz	 "g_923"
	.size	.L.str81, 6

	.type	g_932,@object           # @g_932
	.data
	.align	16
g_932:
	.long	1                       # 0x1
	.long	4                       # 0x4
	.long	2624040338              # 0x9c67ad92
	.long	2729275314              # 0xa2ad6fb2
	.long	2                       # 0x2
	.long	732661264               # 0x2bab8610
	.long	9                       # 0x9
	.long	8                       # 0x8
	.long	3081305103              # 0xb7a8fc0f
	.long	4227371110              # 0xfbf89066
	.long	1120574577              # 0x42ca9c71
	.long	27875789                # 0x1a959cd
	.long	2335171652              # 0x8b2fe444
	.long	2876821802              # 0xab78d12a
	.long	0                       # 0x0
	.long	1283180255              # 0x4c7bc6df
	.long	4294967288              # 0xfffffff8
	.long	2624040338              # 0x9c67ad92
	.long	394926832               # 0x178a1af0
	.long	0                       # 0x0
	.long	27875789                # 0x1a959cd
	.long	0                       # 0x0
	.long	1203004718              # 0x47b4652e
	.long	4294967286              # 0xfffffff6
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	4294967288              # 0xfffffff8
	.long	3                       # 0x3
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	2751359090              # 0xa3fe6872
	.long	4294967288              # 0xfffffff8
	.long	0                       # 0x0
	.long	4294967288              # 0xfffffff8
	.long	4294967295              # 0xffffffff
	.long	1283180255              # 0x4c7bc6df
	.long	0                       # 0x0
	.long	972262401               # 0x39f38c01
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	756216137               # 0x2d12f149
	.long	0                       # 0x0
	.long	2876821802              # 0xab78d12a
	.long	115437362               # 0x6e16f32
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	1120574577              # 0x42ca9c71
	.long	4294967291              # 0xfffffffb
	.long	2                       # 0x2
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	2335171652              # 0x8b2fe444
	.long	0                       # 0x0
	.long	4294967289              # 0xfffffff9
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	259610991               # 0xf79596f
	.long	3361900340              # 0xc8628734
	.long	1855391184              # 0x6e9705d0
	.long	4294967287              # 0xfffffff7
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	3658829037              # 0xda154ced
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	1559060795              # 0x5ced613b
	.long	4                       # 0x4
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	4294967293              # 0xfffffffd
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	2624040338              # 0x9c67ad92
	.long	75882077                # 0x485de5d
	.long	1273464470              # 0x4be78696
	.long	2312931980              # 0x89dc8a8c
	.long	3361900340              # 0xc8628734
	.long	1041095896              # 0x3e0ddcd8
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
	.long	3103852399              # 0xb901076f
	.long	115437362               # 0x6e16f32
	.long	4294967288              # 0xfffffff8
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	3504366485              # 0xd0e06395
	.long	1855391184              # 0x6e9705d0
	.long	4294967288              # 0xfffffff8
	.long	3658829037              # 0xda154ced
	.long	115437362               # 0x6e16f32
	.long	1041095896              # 0x3e0ddcd8
	.long	1559060795              # 0x5ced613b
	.long	4294967288              # 0xfffffff8
	.long	3361900340              # 0xc8628734
	.long	1850874854              # 0x6e521be6
	.long	3103852399              # 0xb901076f
	.long	0                       # 0x0
	.long	1850874854              # 0x6e521be6
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	6                       # 0x6
	.long	2335171652              # 0x8b2fe444
	.long	0                       # 0x0
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	4294967287              # 0xfffffff7
	.long	4271285329              # 0xfe96a451
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	4                       # 0x4
	.long	2400199301              # 0x8f102285
	.long	1559060795              # 0x5ced613b
	.long	756216137               # 0x2d12f149
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	2624040338              # 0x9c67ad92
	.long	4294967288              # 0xfffffff8
	.long	1283180255              # 0x4c7bc6df
	.long	0                       # 0x0
	.long	4294967288              # 0xfffffff8
	.long	6                       # 0x6
	.long	4                       # 0x4
	.long	2751359090              # 0xa3fe6872
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	4294967291              # 0xfffffffb
	.long	3504366485              # 0xd0e06395
	.long	0                       # 0x0
	.long	4                       # 0x4
	.long	3446034448              # 0xcd665010
	.long	3103852399              # 0xb901076f
	.long	2624040338              # 0x9c67ad92
	.long	4294967289              # 0xfffffff9
	.long	4294967295              # 0xffffffff
	.long	4294967291              # 0xfffffffb
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	1203004718              # 0x47b4652e
	.long	1850874854              # 0x6e521be6
	.long	2876821802              # 0xab78d12a
	.long	2312931980              # 0x89dc8a8c
	.long	4                       # 0x4
	.long	4294967287              # 0xfffffff7
	.long	115437362               # 0x6e16f32
	.long	0                       # 0x0
	.long	2624040338              # 0x9c67ad92
	.long	0                       # 0x0
	.long	950640192               # 0x38a99e40
	.long	0                       # 0x0
	.long	2624040338              # 0x9c67ad92
	.long	3406324069              # 0xcb086165
	.long	4294967293              # 0xfffffffd
	.long	1203004718              # 0x47b4652e
	.long	0                       # 0x0
	.long	4294967288              # 0xfffffff8
	.long	0                       # 0x0
	.long	8                       # 0x8
	.long	4294967290              # 0xfffffffa
	.long	1273464470              # 0x4be78696
	.long	3361900340              # 0xc8628734
	.long	2335171652              # 0x8b2fe444
	.long	4294967291              # 0xfffffffb
	.long	1                       # 0x1
	.long	4294967293              # 0xfffffffd
	.long	4294967288              # 0xfffffff8
	.long	4294967289              # 0xfffffff9
	.long	1273464470              # 0x4be78696
	.long	2751359090              # 0xa3fe6872
	.long	1559060795              # 0x5ced613b
	.long	2624040338              # 0x9c67ad92
	.long	4294967288              # 0xfffffff8
	.long	756216137               # 0x2d12f149
	.long	3446034448              # 0xcd665010
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	1855391184              # 0x6e9705d0
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	1855391184              # 0x6e9705d0
	.long	2876821802              # 0xab78d12a
	.long	1203004718              # 0x47b4652e
	.long	1273464470              # 0x4be78696
	.long	0                       # 0x0
	.long	4294967289              # 0xfffffff9
	.long	4294967291              # 0xfffffffb
	.long	1120574577              # 0x42ca9c71
	.long	0                       # 0x0
	.long	4271285329              # 0xfe96a451
	.long	0                       # 0x0
	.long	3446034448              # 0xcd665010
	.long	0                       # 0x0
	.long	2335171652              # 0x8b2fe444
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	756216137               # 0x2d12f149
	.long	4294967293              # 0xfffffffd
	.long	3361900340              # 0xc8628734
	.long	0                       # 0x0
	.long	4294967288              # 0xfffffff8
	.long	1                       # 0x1
	.long	4271285329              # 0xfe96a451
	.long	3504366485              # 0xd0e06395
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	4294967286              # 0xfffffff6
	.long	4294967288              # 0xfffffff8
	.long	4                       # 0x4
	.long	756216137               # 0x2d12f149
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	514682050               # 0x1ead6cc2
	.long	0                       # 0x0
	.long	1850874854              # 0x6e521be6
	.long	3208702660              # 0xbf40eac4
	.long	4294967286              # 0xfffffff6
	.long	0                       # 0x0
	.long	2364581754              # 0x8cf0a77a
	.long	0                       # 0x0
	.long	2751359090              # 0xa3fe6872
	.long	1855391184              # 0x6e9705d0
	.long	0                       # 0x0
	.long	6                       # 0x6
	.long	4294967289              # 0xfffffff9
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	732661264               # 0x2bab8610
	.long	2751359090              # 0xa3fe6872
	.long	3504366485              # 0xd0e06395
	.long	1710276947              # 0x65f0c153
	.long	3                       # 0x3
	.long	4294967290              # 0xfffffffa
	.long	3                       # 0x3
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	2624040338              # 0x9c67ad92
	.long	8                       # 0x8
	.long	6                       # 0x6
	.size	g_932, 1000

	.type	.L.str82,@object        # @.str82
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str82:
	.asciz	 "g_932[i][j][k]"
	.size	.L.str82, 15

	.type	g_942,@object           # @g_942
	.data
	.align	16
g_942:
	.quad	-7353599280640869544    # 0x99f2c46a50d53b58
	.quad	-7353599280640869544    # 0x99f2c46a50d53b58
	.quad	-7353599280640869544    # 0x99f2c46a50d53b58
	.quad	-7353599280640869544    # 0x99f2c46a50d53b58
	.quad	-7353599280640869544    # 0x99f2c46a50d53b58
	.quad	-7353599280640869544    # 0x99f2c46a50d53b58
	.size	g_942, 48

	.type	.L.str83,@object        # @.str83
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str83:
	.asciz	 "g_942[i]"
	.size	.L.str83, 9

	.type	g_954,@object           # @g_954
	.data
	.align	8
g_954:
	.quad	3813426231840243265     # 0x34ec02f415fe7e41
	.size	g_954, 8

	.type	.L.str84,@object        # @.str84
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str84:
	.asciz	 "g_954"
	.size	.L.str84, 6

	.type	g_956,@object           # @g_956
	.data
g_956:
	.byte	53                      # 0x35
	.size	g_956, 1

	.type	.L.str85,@object        # @.str85
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str85:
	.asciz	 "g_956"
	.size	.L.str85, 6

	.type	g_1012,@object          # @g_1012
	.local	g_1012
	.comm	g_1012,40,16
	.type	.L.str86,@object        # @.str86
.L.str86:
	.asciz	 "g_1012[i]"
	.size	.L.str86, 10

	.type	g_1051,@object          # @g_1051
	.data
	.align	2
g_1051:
	.short	57722                   # 0xe17a
	.size	g_1051, 2

	.type	.L.str87,@object        # @.str87
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str87:
	.asciz	 "g_1051"
	.size	.L.str87, 7

	.type	g_1069,@object          # @g_1069
	.data
	.align	4
g_1069:
	.long	4294967287              # 0xfffffff7
	.size	g_1069, 4

	.type	.L.str88,@object        # @.str88
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str88:
	.asciz	 "g_1069[i]"
	.size	.L.str88, 10

	.type	g_1121,@object          # @g_1121
	.data
	.align	4
g_1121:
	.long	1                       # 0x1
	.size	g_1121, 4

	.type	.L.str89,@object        # @.str89
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str89:
	.asciz	 "g_1121"
	.size	.L.str89, 7

	.type	g_1281,@object          # @g_1281
	.data
	.align	4
g_1281:
	.long	4294967295              # 0xffffffff
	.size	g_1281, 4

	.type	.L.str90,@object        # @.str90
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str90:
	.asciz	 "g_1281"
	.size	.L.str90, 7

	.type	g_1435,@object          # @g_1435
	.data
	.align	4
g_1435:
	.long	1088679419              # 0x40e3edfb
	.size	g_1435, 4

	.type	.L.str91,@object        # @.str91
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str91:
	.asciz	 "g_1435"
	.size	.L.str91, 7

	.type	g_1501,@object          # @g_1501
	.data
	.align	4
g_1501:
	.long	983371182               # 0x3a9d0dae
	.size	g_1501, 4

	.type	.L.str92,@object        # @.str92
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str92:
	.asciz	 "g_1501"
	.size	.L.str92, 7

	.type	g_1502,@object          # @g_1502
	.data
	.align	4
g_1502:
	.long	1735652284              # 0x6773f3bc
	.size	g_1502, 4

	.type	.L.str93,@object        # @.str93
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str93:
	.asciz	 "g_1502"
	.size	.L.str93, 7

	.type	g_1503,@object          # @g_1503
	.data
	.align	4
g_1503:
	.long	4294967292              # 0xfffffffc
	.size	g_1503, 4

	.type	.L.str94,@object        # @.str94
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str94:
	.asciz	 "g_1503"
	.size	.L.str94, 7

	.type	g_1504,@object          # @g_1504
	.local	g_1504
	.comm	g_1504,4,4
	.type	.L.str95,@object        # @.str95
.L.str95:
	.asciz	 "g_1504"
	.size	.L.str95, 7

	.type	g_1619,@object          # @g_1619
	.data
	.align	4
g_1619:
	.long	682634623               # 0x28b02d7f
	.size	g_1619, 4

	.type	.L.str96,@object        # @.str96
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str96:
	.asciz	 "g_1619"
	.size	.L.str96, 7

	.type	g_1703,@object          # @g_1703
	.data
	.align	4
g_1703:
	.long	4294967295              # 0xffffffff
	.size	g_1703, 4

	.type	.L.str97,@object        # @.str97
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str97:
	.asciz	 "g_1703"
	.size	.L.str97, 7

	.type	.L.str98,@object        # @.str98
.L.str98:
	.asciz	 "g_1727"
	.size	.L.str98, 7

	.type	.L.str99,@object        # @.str99
.L.str99:
	.asciz	 "g_1825"
	.size	.L.str99, 7

	.type	g_1899,@object          # @g_1899
	.data
	.align	4
g_1899:
	.long	4294967295              # 0xffffffff
	.size	g_1899, 4

	.type	.L.str100,@object       # @.str100
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str100:
	.asciz	 "g_1899"
	.size	.L.str100, 7

	.type	crc32_context,@object   # @crc32_context
	.data
	.align	4
crc32_context:
	.long	4294967295              # 0xffffffff
	.size	crc32_context, 4

	.type	.L.str101,@object       # @.str101
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str101:
	.asciz	 "checksum = %X\n"
	.size	.L.str101, 15

	.type	.L.str102,@object       # @.str102
.L.str102:
	.asciz	 "...checksum after hashing %s : %lX\n"
	.size	.L.str102, 36

	.type	crc32_tab,@object       # @crc32_tab
	.local	crc32_tab
	.comm	crc32_tab,1024,16
	.type	.Lfunc_1.l_16,@object   # @func_1.l_16
	.section	.rodata,"a",@progbits
	.align	16
.Lfunc_1.l_16:
	.ascii	 "\001\377\001\377\001\377\001\377"
	.ascii	 "\001\377\001\377\001\377\001\377"
	.ascii	 "\001\377\001\377\001\377\001\377"
	.size	.Lfunc_1.l_16, 24

	.type	func_1.l_1881,@object   # @func_1.l_1881
	.align	16
func_1.l_1881:
	.quad	g_115
	.quad	0
	.quad	0
	.quad	g_115
	.quad	0
	.quad	0
	.quad	g_115
	.quad	0
	.size	func_1.l_1881, 64

	.type	.Lfunc_1.l_1917,@object # @func_1.l_1917
	.align	16
.Lfunc_1.l_1917:
	.long	6                       # 0x6
	.long	4294967295              # 0xffffffff
	.long	621523413               # 0x250bb1d5
	.long	1                       # 0x1
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	621523413               # 0x250bb1d5
	.long	4294967295              # 0xffffffff
	.long	6                       # 0x6
	.long	4294967295              # 0xffffffff
	.long	3528890961              # 0xd2569a51
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	79493103                # 0x4bcf7ef
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	4294967295              # 0xffffffff
	.long	3528890961              # 0xd2569a51
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	496313534               # 0x1d9524be
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	4294967295              # 0xffffffff
	.long	496313534               # 0x1d9524be
	.long	1                       # 0x1
	.zero	8,255
	.long	79493103                # 0x4bcf7ef
	.long	1                       # 0x1
	.zero	8,255
	.long	621523413               # 0x250bb1d5
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	79493103                # 0x4bcf7ef
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	496313534               # 0x1d9524be
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	4294967295              # 0xffffffff
	.long	496313534               # 0x1d9524be
	.long	1                       # 0x1
	.zero	8,255
	.long	79493103                # 0x4bcf7ef
	.long	1                       # 0x1
	.zero	8,255
	.long	621523413               # 0x250bb1d5
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	79493103                # 0x4bcf7ef
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	496313534               # 0x1d9524be
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	4294967295              # 0xffffffff
	.long	496313534               # 0x1d9524be
	.long	1                       # 0x1
	.zero	8,255
	.long	79493103                # 0x4bcf7ef
	.long	1                       # 0x1
	.zero	8,255
	.long	621523413               # 0x250bb1d5
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	79493103                # 0x4bcf7ef
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	496313534               # 0x1d9524be
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.long	4294967295              # 0xffffffff
	.long	496313534               # 0x1d9524be
	.long	1                       # 0x1
	.zero	8,255
	.long	79493103                # 0x4bcf7ef
	.long	1                       # 0x1
	.zero	8,255
	.long	621523413               # 0x250bb1d5
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	1                       # 0x1
	.size	.Lfunc_1.l_1917, 392

	.type	g_1247,@object          # @g_1247
	.local	g_1247
	.comm	g_1247,8,8
	.type	g_533,@object           # @g_533
	.data
	.align	8
g_533:
	.quad	g_96
	.size	g_533, 8

	.type	.Lfunc_1.l_2000,@object # @func_1.l_2000
	.section	.rodata,"a",@progbits
	.align	16
.Lfunc_1.l_2000:
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.long	2500009144              # 0x95031cb8
	.long	2500009144              # 0x95031cb8
	.long	2500009144              # 0x95031cb8
	.long	2500009144              # 0x95031cb8
	.long	2500009144              # 0x95031cb8
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.long	2161320822              # 0x80d32376
	.size	.Lfunc_1.l_2000, 60

	.type	.Lfunc_1.l_53,@object   # @func_1.l_53
	.align	16
.Lfunc_1.l_53:
	.quad	g_54
	.quad	g_54
	.quad	g_54
	.quad	g_54
	.quad	g_54
	.size	.Lfunc_1.l_53, 40

	.type	g_936,@object           # @g_936
	.data
	.align	8
g_936:
	.quad	g_937
	.size	g_936, 8

	.type	g_572,@object           # @g_572
	.align	8
g_572:
	.quad	g_472
	.size	g_572, 8

	.type	g_1669,@object          # @g_1669
	.align	8
g_1669:
	.quad	g_148
	.size	g_1669, 8

	.type	g_937,@object           # @g_937
	.align	8
g_937:
	.quad	g_51
	.size	g_937, 8

	.type	g_467,@object           # @g_467
	.section	.rodata,"a",@progbits
	.align	8
g_467:
	.quad	g_251+64
	.size	g_467, 8

	.type	g_2028,@object          # @g_2028
	.data
	.align	8
g_2028:
	.quad	g_572
	.size	g_2028, 8

	.type	g_1228,@object          # @g_1228
	.align	8
g_1228:
	.quad	g_128
	.size	g_1228, 8

	.type	g_536,@object           # @g_536
	.align	8
g_536:
	.quad	g_537
	.size	g_536, 8

	.type	g_537,@object           # @g_537
	.align	8
g_537:
	.quad	g_538
	.size	g_537, 8

	.type	g_538,@object           # @g_538
	.section	.rodata,"a",@progbits
	.align	4
g_538:
	.long	4103956874              # 0xf49d698a
	.size	g_538, 4

	.type	g_96,@object            # @g_96
	.data
	.align	8
g_96:
	.quad	g_5
	.size	g_96, 8


	.section	".note.GNU-stack","",@progbits
