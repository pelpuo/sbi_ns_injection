; ModuleID = './bin/oobw_off_by_one'
source_filename = "./bin/oobw_off_by_one"

@rodata_15 = private unnamed_addr constant [93 x i8] c"\01\00\02\00%d \00Test Failed: Off by one in integer matrix manipulation leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %RDX-SKT-LOC = alloca i32, align 4
  %EDX-SKT-LOC = alloca i64, align 8
  %stktop_8 = alloca i8, i32 88, align 1
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.68 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.64 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.60 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.56 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.52 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.48 = bitcast i8* %5 to i64*
  %6 = getelementptr i8, i8* %stktop_8, i64 84
  %RBP_N.4 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %7 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %8 = bitcast i64* %RBP_N.48 to i8*
  %9 = zext i32 36 to i64
  %10 = call i8* @memset(i8* %8, i32 0, i64 %9)
  %RAX = ptrtoint i8* %10 to i64
  store i32 0, i32* %RBP_N.52, align 1
  store i32 0, i32* %RBP_N.56, align 1
  %11 = zext i32 36 to i64
  store i64 %11, i64* %EDX-SKT-LOC, align 1
  store i32 36, i32* %RDX-SKT-LOC, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.11
  %12 = load i32, i32* %RBP_N.56, align 1
  %13 = zext i32 %12 to i64
  %14 = zext i32 3 to i64
  %15 = sub i64 %13, %14
  %16 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %13, i64 %14)
  %CF = extractvalue { i64, i1 } %16, 1
  %ZF = icmp eq i64 %15, 0
  %highbit = and i64 -9223372036854775808, %15
  %SF = icmp ne i64 %highbit, 0
  %17 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %13, i64 %14)
  %OF = extractvalue { i64, i1 } %17, 1
  %18 = and i64 %15, 255
  %19 = call i64 @llvm.ctpop.i64(i64 %18)
  %20 = and i64 %19, 1
  %PF = icmp eq i64 %20, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.12, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %RBP_N.60, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.9
  %21 = load i32, i32* %RBP_N.60, align 1
  %22 = zext i32 %21 to i64
  %23 = zext i32 3 to i64
  %24 = sub i64 %22, %23
  %25 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %22, i64 %23)
  %CF1 = extractvalue { i64, i1 } %25, 1
  %ZF2 = icmp eq i64 %24, 0
  %highbit3 = and i64 -9223372036854775808, %24
  %SF4 = icmp ne i64 %highbit3, 0
  %26 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %22, i64 %23)
  %OF5 = extractvalue { i64, i1 } %26, 1
  %27 = and i64 %24, 255
  %28 = call i64 @llvm.ctpop.i64(i64 %27)
  %29 = and i64 %28, 1
  %PF6 = icmp eq i64 %29, 0
  %ZFCmp_JG138 = icmp eq i1 %ZF2, false
  %SFOFCmp_JG139 = icmp eq i1 %SF4, %OF5
  %ZFAndSFOF_JG140 = and i1 %ZFCmp_JG138, %SFOFCmp_JG139
  br i1 %ZFAndSFOF_JG140, label %bb.10, label %bb.4

bb.4:                                             ; preds = %bb.3
  %30 = load i64, i64* %EDX-SKT-LOC, align 1
  %EDX = trunc i64 %30 to i32
  %memload = load i32, i32* %RBP_N.56, align 1
  %EDX7 = mul i32 3, %memload
  %memload8 = load i32, i32* %RBP_N.60, align 1
  %EDX10 = add i32 %EDX7, %memload8
  %31 = and i32 %EDX10, 255
  %32 = call i32 @llvm.ctpop.i32(i32 %31)
  %33 = and i32 %32, 1
  %PF9 = icmp eq i32 %33, 0
  %EDX17 = add i32 %EDX10, 1
  %34 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %EDX10, i32 1)
  %CF11 = extractvalue { i32, i1 } %34, 1
  %35 = and i32 %EDX17, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %35)
  %37 = and i32 %36, 1
  %PF12 = icmp eq i32 %37, 0
  %ZF13 = icmp eq i32 %EDX17, 0
  %highbit14 = and i32 -2147483648, %EDX17
  %SF15 = icmp ne i32 %highbit14, 0
  %38 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %EDX10, i32 1)
  %OF16 = extractvalue { i32, i1 } %38, 1
  %39 = bitcast i32* %RBP_N.56 to i64*
  %memload18 = load i64, i64* %39, align 1
  %40 = trunc i64 %memload18 to i32
  %RCX = sext i32 %40 to i64
  %RAX19 = ptrtoint i64* %RBP_N.48 to i64
  %RCX21 = mul i64 %RCX, 12
  %41 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 12)
  %OF20 = extractvalue { i64, i1 } %41, 1
  %RAX25 = add nsw i64 %RAX19, %RCX21
  %highbit22 = and i64 -9223372036854775808, %RAX25
  %SF23 = icmp ne i64 %highbit22, 0
  %ZF24 = icmp eq i64 %RAX25, 0
  %42 = bitcast i32* %RBP_N.60 to i64*
  %memload26 = load i64, i64* %42, align 1
  %43 = trunc i64 %memload26 to i32
  %RCX27 = sext i32 %43 to i64
  %memref-idxreg = mul i64 4, %RCX27
  %memref-basereg = add i64 %RAX25, %memref-idxreg
  %44 = inttoptr i64 %memref-basereg to i32*
  store i32 %EDX17, i32* %44, align 1
  %45 = load i32, i32* %RBP_N.56, align 1
  %46 = zext i32 %45 to i64
  %47 = zext i32 2 to i64
  %48 = sub i64 %46, %47
  %49 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %46, i64 %47)
  %CF28 = extractvalue { i64, i1 } %49, 1
  %ZF29 = icmp eq i64 %48, 0
  %highbit30 = and i64 -9223372036854775808, %48
  %SF31 = icmp ne i64 %highbit30, 0
  %50 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %46, i64 %47)
  %OF32 = extractvalue { i64, i1 } %50, 1
  %51 = and i64 %48, 255
  %52 = call i64 @llvm.ctpop.i64(i64 %51)
  %53 = and i64 %52, 1
  %PF33 = icmp eq i64 %53, 0
  store i32 %EDX17, i32* %RDX-SKT-LOC, align 1
  %ZFCmp_JG141 = icmp eq i1 %ZF29, false
  %SFOFCmp_JG142 = icmp eq i1 %SF31, %OF32
  %ZFAndSFOF_JG143 = and i1 %ZFCmp_JG141, %SFOFCmp_JG142
  %54 = zext i32 %EDX17 to i64
  store i64 %54, i64* %EDX-SKT-LOC, align 1
  br i1 %ZFAndSFOF_JG143, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %55 = load i32, i32* %RBP_N.60, align 1
  %56 = zext i32 %55 to i64
  %57 = zext i32 2 to i64
  %58 = sub i64 %56, %57
  %59 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %56, i64 %57)
  %CF34 = extractvalue { i64, i1 } %59, 1
  %ZF35 = icmp eq i64 %58, 0
  %highbit36 = and i64 -9223372036854775808, %58
  %SF37 = icmp ne i64 %highbit36, 0
  %60 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %56, i64 %57)
  %OF38 = extractvalue { i64, i1 } %60, 1
  %61 = and i64 %58, 255
  %62 = call i64 @llvm.ctpop.i64(i64 %61)
  %63 = and i64 %62, 1
  %PF39 = icmp eq i64 %63, 0
  %CmpZF_JLE = icmp eq i1 %ZF35, true
  %CmpOF_JLE = icmp ne i1 %SF37, %OF38
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.8, label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %64 = bitcast i32* %RBP_N.56 to i64*
  %memload40 = load i64, i64* %64, align 1
  %65 = trunc i64 %memload40 to i32
  %RCX41 = sext i32 %65 to i64
  %RAX42 = ptrtoint i64* %RBP_N.48 to i64
  %RCX44 = mul i64 %RCX41, 12
  %66 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX41, i64 12)
  %OF43 = extractvalue { i64, i1 } %66, 1
  %RAX48 = add nsw i64 %RAX42, %RCX44
  %highbit45 = and i64 -9223372036854775808, %RAX48
  %SF46 = icmp ne i64 %highbit45, 0
  %ZF47 = icmp eq i64 %RAX48, 0
  %67 = bitcast i32* %RBP_N.60 to i64*
  %memload49 = load i64, i64* %67, align 1
  %68 = trunc i64 %memload49 to i32
  %RCX50 = sext i32 %68 to i64
  %memref-idxreg51 = mul i64 4, %RCX50
  %memref-basereg52 = add i64 %RAX48, %memref-idxreg51
  %69 = inttoptr i64 %memref-basereg52 to i32*
  %memload53 = load i32, i32* %69, align 1
  %memload54 = load i32, i32* %RBP_N.56, align 1
  %70 = trunc i64 %RCX50 to i32
  %ECX = mul i32 3, %memload54
  %memload55 = load i32, i32* %RBP_N.60, align 1
  %ECX57 = add i32 %ECX, %memload55
  %71 = and i32 %ECX57, 255
  %72 = call i32 @llvm.ctpop.i32(i32 %71)
  %73 = and i32 %72, 1
  %PF56 = icmp eq i32 %73, 0
  %ECX64 = add i32 %ECX57, 1
  %74 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %ECX57, i32 1)
  %CF58 = extractvalue { i32, i1 } %74, 1
  %75 = and i32 %ECX64, 255
  %76 = call i32 @llvm.ctpop.i32(i32 %75)
  %77 = and i32 %76, 1
  %PF59 = icmp eq i32 %77, 0
  %ZF60 = icmp eq i32 %ECX64, 0
  %highbit61 = and i32 -2147483648, %ECX64
  %SF62 = icmp ne i32 %highbit61, 0
  %78 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %ECX57, i32 1)
  %OF63 = extractvalue { i32, i1 } %78, 1
  %79 = sub i32 %memload53, %ECX64
  %80 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload53, i32 %ECX64)
  %CF65 = extractvalue { i32, i1 } %80, 1
  %ZF66 = icmp eq i32 %79, 0
  %highbit67 = and i32 -2147483648, %79
  %SF68 = icmp ne i32 %highbit67, 0
  %81 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload53, i32 %ECX64)
  %OF69 = extractvalue { i32, i1 } %81, 1
  %82 = and i32 %79, 255
  %83 = call i32 @llvm.ctpop.i32(i32 %82)
  %84 = and i32 %83, 1
  %PF70 = icmp eq i32 %84, 0
  %CmpZF_JNE = icmp eq i1 %ZF66, false
  br i1 %CmpZF_JNE, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  store i32 1, i32* %RBP_N.52, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6, %bb.5
  br label %bb.9

bb.9:                                             ; preds = %bb.8
  %memload71 = load i32, i32* %RBP_N.60, align 1
  %EAX = add i32 %memload71, 1
  %85 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload71, i32 1)
  %CF72 = extractvalue { i32, i1 } %85, 1
  %86 = and i32 %EAX, 255
  %87 = call i32 @llvm.ctpop.i32(i32 %86)
  %88 = and i32 %87, 1
  %PF73 = icmp eq i32 %88, 0
  %ZF74 = icmp eq i32 %EAX, 0
  %highbit75 = and i32 -2147483648, %EAX
  %SF76 = icmp ne i32 %highbit75, 0
  %89 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload71, i32 1)
  %OF77 = extractvalue { i32, i1 } %89, 1
  store i32 %EAX, i32* %RBP_N.60, align 1
  br label %bb.3

bb.10:                                            ; preds = %bb.3
  br label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload78 = load i32, i32* %RBP_N.56, align 1
  %EAX85 = add i32 %memload78, 1
  %90 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload78, i32 1)
  %CF79 = extractvalue { i32, i1 } %90, 1
  %91 = and i32 %EAX85, 255
  %92 = call i32 @llvm.ctpop.i32(i32 %91)
  %93 = and i32 %92, 1
  %PF80 = icmp eq i32 %93, 0
  %ZF81 = icmp eq i32 %EAX85, 0
  %highbit82 = and i32 -2147483648, %EAX85
  %SF83 = icmp ne i32 %highbit82, 0
  %94 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload78, i32 1)
  %OF84 = extractvalue { i32, i1 } %94, 1
  store i32 %EAX85, i32* %RBP_N.56, align 1
  br label %bb.1

bb.12:                                            ; preds = %bb.1
  store i32 0, i32* %RBP_N.64, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.12, %bb.17
  %95 = load i32, i32* %RBP_N.64, align 1
  %96 = zext i32 %95 to i64
  %97 = zext i32 3 to i64
  %98 = sub i64 %96, %97
  %99 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %96, i64 %97)
  %CF86 = extractvalue { i64, i1 } %99, 1
  %ZF87 = icmp eq i64 %98, 0
  %highbit88 = and i64 -9223372036854775808, %98
  %SF89 = icmp ne i64 %highbit88, 0
  %100 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %96, i64 %97)
  %OF90 = extractvalue { i64, i1 } %100, 1
  %101 = and i64 %98, 255
  %102 = call i64 @llvm.ctpop.i64(i64 %101)
  %103 = and i64 %102, 1
  %PF91 = icmp eq i64 %103, 0
  %ZFCmp_JG144 = icmp eq i1 %ZF87, false
  %SFOFCmp_JG145 = icmp eq i1 %SF89, %OF90
  %ZFAndSFOF_JG146 = and i1 %ZFCmp_JG144, %SFOFCmp_JG145
  br i1 %ZFAndSFOF_JG146, label %bb.18, label %bb.14

bb.14:                                            ; preds = %bb.13
  store i32 0, i32* %RBP_N.68, align 1
  br label %bb.15

bb.15:                                            ; preds = %bb.14, %bb.16
  %104 = load i32, i32* %RBP_N.68, align 1
  %105 = zext i32 %104 to i64
  %106 = zext i32 3 to i64
  %107 = sub i64 %105, %106
  %108 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %105, i64 %106)
  %CF92 = extractvalue { i64, i1 } %108, 1
  %ZF93 = icmp eq i64 %107, 0
  %highbit94 = and i64 -9223372036854775808, %107
  %SF95 = icmp ne i64 %highbit94, 0
  %109 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %105, i64 %106)
  %OF96 = extractvalue { i64, i1 } %109, 1
  %110 = and i64 %107, 255
  %111 = call i64 @llvm.ctpop.i64(i64 %110)
  %112 = and i64 %111, 1
  %PF97 = icmp eq i64 %112, 0
  %ZFCmp_JG147 = icmp eq i1 %ZF93, false
  %SFOFCmp_JG148 = icmp eq i1 %SF95, %OF96
  %ZFAndSFOF_JG149 = and i1 %ZFCmp_JG147, %SFOFCmp_JG148
  br i1 %ZFAndSFOF_JG149, label %bb.17, label %bb.16

bb.16:                                            ; preds = %bb.15
  %113 = bitcast i32* %RBP_N.64 to i64*
  %memload98 = load i64, i64* %113, align 1
  %114 = trunc i64 %memload98 to i32
  %RCX99 = sext i32 %114 to i64
  %RAX100 = ptrtoint i64* %RBP_N.48 to i64
  %RCX102 = mul i64 %RCX99, 12
  %115 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX99, i64 12)
  %OF101 = extractvalue { i64, i1 } %115, 1
  %RAX106 = add nsw i64 %RAX100, %RCX102
  %highbit103 = and i64 -9223372036854775808, %RAX106
  %SF104 = icmp ne i64 %highbit103, 0
  %ZF105 = icmp eq i64 %RAX106, 0
  %116 = bitcast i32* %RBP_N.68 to i64*
  %memload107 = load i64, i64* %116, align 1
  %117 = trunc i64 %memload107 to i32
  %RCX108 = sext i32 %117 to i64
  %memref-idxreg109 = mul i64 4, %RCX108
  %memref-basereg110 = add i64 %RAX106, %memref-idxreg109
  %118 = inttoptr i64 %memref-basereg110 to i32*
  %memload111 = load i32, i32* %118, align 1
  %119 = load i32, i32* %RDX-SKT-LOC, align 1
  %RDX = zext i32 %119 to i64
  %EAX112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([93 x i8], [93 x i8]* @rodata_15, i32 0, i32 4), i32 %memload111, i64 %RDX, i64 %RCX108)
  %memload113 = load i32, i32* %RBP_N.68, align 1
  %EAX120 = add i32 %memload113, 1
  %120 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload113, i32 1)
  %CF114 = extractvalue { i32, i1 } %120, 1
  %121 = and i32 %EAX120, 255
  %122 = call i32 @llvm.ctpop.i32(i32 %121)
  %123 = and i32 %122, 1
  %PF115 = icmp eq i32 %123, 0
  %ZF116 = icmp eq i32 %EAX120, 0
  %highbit117 = and i32 -2147483648, %EAX120
  %SF118 = icmp ne i32 %highbit117, 0
  %124 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload113, i32 1)
  %OF119 = extractvalue { i32, i1 } %124, 1
  store i32 %EAX120, i32* %RBP_N.68, align 1
  br label %bb.15

bb.17:                                            ; preds = %bb.15
  %EAX121 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([93 x i8], [93 x i8]* @rodata_15, i32 0, i32 91))
  %memload122 = load i32, i32* %RBP_N.64, align 1
  %EAX129 = add i32 %memload122, 1
  %125 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload122, i32 1)
  %CF123 = extractvalue { i32, i1 } %125, 1
  %126 = and i32 %EAX129, 255
  %127 = call i32 @llvm.ctpop.i32(i32 %126)
  %128 = and i32 %127, 1
  %PF124 = icmp eq i32 %128, 0
  %ZF125 = icmp eq i32 %EAX129, 0
  %highbit126 = and i32 -2147483648, %EAX129
  %SF127 = icmp ne i32 %highbit126, 0
  %129 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload122, i32 1)
  %OF128 = extractvalue { i32, i1 } %129, 1
  store i32 %EAX129, i32* %RBP_N.64, align 1
  br label %bb.13

bb.18:                                            ; preds = %bb.13
  %130 = load i32, i32* %RBP_N.52, align 1
  %131 = zext i32 %130 to i64
  %132 = zext i32 1 to i64
  %133 = sub i64 %131, %132
  %134 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %131, i64 %132)
  %CF130 = extractvalue { i64, i1 } %134, 1
  %ZF131 = icmp eq i64 %133, 0
  %highbit132 = and i64 -9223372036854775808, %133
  %SF133 = icmp ne i64 %highbit132, 0
  %135 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %131, i64 %132)
  %OF134 = extractvalue { i64, i1 } %135, 1
  %136 = and i64 %133, 255
  %137 = call i64 @llvm.ctpop.i64(i64 %136)
  %138 = and i64 %137, 1
  %PF135 = icmp eq i64 %138, 0
  %CmpZF_JNE150 = icmp eq i1 %ZF131, false
  br i1 %CmpZF_JNE150, label %bb.20, label %bb.19

bb.19:                                            ; preds = %bb.18
  %EAX136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([93 x i8], [93 x i8]* @rodata_15, i32 0, i32 8))
  br label %bb.20

bb.20:                                            ; preds = %bb.19, %bb.18
  %memload137 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload137
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
