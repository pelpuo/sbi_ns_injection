; ModuleID = './bin/oobw_off_by_one'
source_filename = "./bin/oobw_off_by_one"

@rodata_15 = private unnamed_addr constant [93 x i8] c"\01\00\02\00%d \00Test Failed: Off by one in integer matrix manipulation leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %RDX-SKT-LOC = alloca i32, align 4
  %EDX-SKT-LOC = alloca i64, align 8
  %stktop_8 = alloca i8, i32 88, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.68 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.64 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 28
  %RBP_N.60 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.56 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 36
  %RBP_N.52 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 40
  %6 = inttoptr i64 %5 to ptr
  %7 = add i64 %tos, 84
  %RBP_N.4 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %8 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %9 = zext i32 36 to i64
  %10 = call ptr @memset(ptr %6, i32 0, i64 %9)
  %RAX = ptrtoint ptr %10 to i64
  store i32 0, ptr %RBP_N.52, align 1
  store i32 0, ptr %RBP_N.56, align 1
  %11 = zext i32 36 to i64
  store i64 %11, ptr %EDX-SKT-LOC, align 1
  store i32 36, ptr %RDX-SKT-LOC, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.11
  %12 = load i32, ptr %RBP_N.56, align 1
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
  store i32 0, ptr %RBP_N.60, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.9
  %21 = load i32, ptr %RBP_N.60, align 1
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
  %30 = load i64, ptr %EDX-SKT-LOC, align 1
  %EDX = trunc i64 %30 to i32
  %memload = load i32, ptr %RBP_N.56, align 1
  %EDX7 = mul i32 3, %memload
  %memload8 = load i32, ptr %RBP_N.60, align 1
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
  %memload18 = load i64, ptr %RBP_N.56, align 1
  %39 = trunc i64 %memload18 to i32
  %RCX = sext i32 %39 to i64
  %RAX19 = ptrtoint ptr %6 to i64
  %RCX21 = mul i64 %RCX, 12
  %40 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 12)
  %OF20 = extractvalue { i64, i1 } %40, 1
  %RAX25 = add nsw i64 %RAX19, %RCX21
  %highbit22 = and i64 -9223372036854775808, %RAX25
  %SF23 = icmp ne i64 %highbit22, 0
  %ZF24 = icmp eq i64 %RAX25, 0
  %memload26 = load i64, ptr %RBP_N.60, align 1
  %41 = trunc i64 %memload26 to i32
  %RCX27 = sext i32 %41 to i64
  %memref-idxreg = mul i64 4, %RCX27
  %memref-basereg = add i64 %RAX25, %memref-idxreg
  %42 = inttoptr i64 %memref-basereg to ptr
  store i32 %EDX17, ptr %42, align 1
  %43 = load i32, ptr %RBP_N.56, align 1
  %44 = zext i32 %43 to i64
  %45 = zext i32 2 to i64
  %46 = sub i64 %44, %45
  %47 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %44, i64 %45)
  %CF28 = extractvalue { i64, i1 } %47, 1
  %ZF29 = icmp eq i64 %46, 0
  %highbit30 = and i64 -9223372036854775808, %46
  %SF31 = icmp ne i64 %highbit30, 0
  %48 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %44, i64 %45)
  %OF32 = extractvalue { i64, i1 } %48, 1
  %49 = and i64 %46, 255
  %50 = call i64 @llvm.ctpop.i64(i64 %49)
  %51 = and i64 %50, 1
  %PF33 = icmp eq i64 %51, 0
  store i32 %EDX17, ptr %RDX-SKT-LOC, align 1
  %ZFCmp_JG141 = icmp eq i1 %ZF29, false
  %SFOFCmp_JG142 = icmp eq i1 %SF31, %OF32
  %ZFAndSFOF_JG143 = and i1 %ZFCmp_JG141, %SFOFCmp_JG142
  %52 = zext i32 %EDX17 to i64
  store i64 %52, ptr %EDX-SKT-LOC, align 1
  br i1 %ZFAndSFOF_JG143, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %53 = load i32, ptr %RBP_N.60, align 1
  %54 = zext i32 %53 to i64
  %55 = zext i32 2 to i64
  %56 = sub i64 %54, %55
  %57 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %54, i64 %55)
  %CF34 = extractvalue { i64, i1 } %57, 1
  %ZF35 = icmp eq i64 %56, 0
  %highbit36 = and i64 -9223372036854775808, %56
  %SF37 = icmp ne i64 %highbit36, 0
  %58 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %54, i64 %55)
  %OF38 = extractvalue { i64, i1 } %58, 1
  %59 = and i64 %56, 255
  %60 = call i64 @llvm.ctpop.i64(i64 %59)
  %61 = and i64 %60, 1
  %PF39 = icmp eq i64 %61, 0
  %CmpZF_JLE = icmp eq i1 %ZF35, true
  %CmpOF_JLE = icmp ne i1 %SF37, %OF38
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.8, label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %memload40 = load i64, ptr %RBP_N.56, align 1
  %62 = trunc i64 %memload40 to i32
  %RCX41 = sext i32 %62 to i64
  %RAX42 = ptrtoint ptr %6 to i64
  %RCX44 = mul i64 %RCX41, 12
  %63 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX41, i64 12)
  %OF43 = extractvalue { i64, i1 } %63, 1
  %RAX48 = add nsw i64 %RAX42, %RCX44
  %highbit45 = and i64 -9223372036854775808, %RAX48
  %SF46 = icmp ne i64 %highbit45, 0
  %ZF47 = icmp eq i64 %RAX48, 0
  %memload49 = load i64, ptr %RBP_N.60, align 1
  %64 = trunc i64 %memload49 to i32
  %RCX50 = sext i32 %64 to i64
  %memref-idxreg51 = mul i64 4, %RCX50
  %memref-basereg52 = add i64 %RAX48, %memref-idxreg51
  %65 = inttoptr i64 %memref-basereg52 to ptr
  %memload53 = load i32, ptr %65, align 1
  %memload54 = load i32, ptr %RBP_N.56, align 1
  %66 = trunc i64 %RCX50 to i32
  %ECX = mul i32 3, %memload54
  %memload55 = load i32, ptr %RBP_N.60, align 1
  %ECX57 = add i32 %ECX, %memload55
  %67 = and i32 %ECX57, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF56 = icmp eq i32 %69, 0
  %ECX64 = add i32 %ECX57, 1
  %70 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %ECX57, i32 1)
  %CF58 = extractvalue { i32, i1 } %70, 1
  %71 = and i32 %ECX64, 255
  %72 = call i32 @llvm.ctpop.i32(i32 %71)
  %73 = and i32 %72, 1
  %PF59 = icmp eq i32 %73, 0
  %ZF60 = icmp eq i32 %ECX64, 0
  %highbit61 = and i32 -2147483648, %ECX64
  %SF62 = icmp ne i32 %highbit61, 0
  %74 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %ECX57, i32 1)
  %OF63 = extractvalue { i32, i1 } %74, 1
  %75 = sub i32 %memload53, %ECX64
  %76 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload53, i32 %ECX64)
  %CF65 = extractvalue { i32, i1 } %76, 1
  %ZF66 = icmp eq i32 %75, 0
  %highbit67 = and i32 -2147483648, %75
  %SF68 = icmp ne i32 %highbit67, 0
  %77 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload53, i32 %ECX64)
  %OF69 = extractvalue { i32, i1 } %77, 1
  %78 = and i32 %75, 255
  %79 = call i32 @llvm.ctpop.i32(i32 %78)
  %80 = and i32 %79, 1
  %PF70 = icmp eq i32 %80, 0
  %CmpZF_JNE = icmp eq i1 %ZF66, false
  br i1 %CmpZF_JNE, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  store i32 1, ptr %RBP_N.52, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6, %bb.5
  br label %bb.9

bb.9:                                             ; preds = %bb.8
  %memload71 = load i32, ptr %RBP_N.60, align 1
  %EAX = add i32 %memload71, 1
  %81 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload71, i32 1)
  %CF72 = extractvalue { i32, i1 } %81, 1
  %82 = and i32 %EAX, 255
  %83 = call i32 @llvm.ctpop.i32(i32 %82)
  %84 = and i32 %83, 1
  %PF73 = icmp eq i32 %84, 0
  %ZF74 = icmp eq i32 %EAX, 0
  %highbit75 = and i32 -2147483648, %EAX
  %SF76 = icmp ne i32 %highbit75, 0
  %85 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload71, i32 1)
  %OF77 = extractvalue { i32, i1 } %85, 1
  store i32 %EAX, ptr %RBP_N.60, align 1
  br label %bb.3

bb.10:                                            ; preds = %bb.3
  br label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload78 = load i32, ptr %RBP_N.56, align 1
  %EAX85 = add i32 %memload78, 1
  %86 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload78, i32 1)
  %CF79 = extractvalue { i32, i1 } %86, 1
  %87 = and i32 %EAX85, 255
  %88 = call i32 @llvm.ctpop.i32(i32 %87)
  %89 = and i32 %88, 1
  %PF80 = icmp eq i32 %89, 0
  %ZF81 = icmp eq i32 %EAX85, 0
  %highbit82 = and i32 -2147483648, %EAX85
  %SF83 = icmp ne i32 %highbit82, 0
  %90 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload78, i32 1)
  %OF84 = extractvalue { i32, i1 } %90, 1
  store i32 %EAX85, ptr %RBP_N.56, align 1
  br label %bb.1

bb.12:                                            ; preds = %bb.1
  store i32 0, ptr %RBP_N.64, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.12, %bb.17
  %91 = load i32, ptr %RBP_N.64, align 1
  %92 = zext i32 %91 to i64
  %93 = zext i32 3 to i64
  %94 = sub i64 %92, %93
  %95 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %92, i64 %93)
  %CF86 = extractvalue { i64, i1 } %95, 1
  %ZF87 = icmp eq i64 %94, 0
  %highbit88 = and i64 -9223372036854775808, %94
  %SF89 = icmp ne i64 %highbit88, 0
  %96 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %92, i64 %93)
  %OF90 = extractvalue { i64, i1 } %96, 1
  %97 = and i64 %94, 255
  %98 = call i64 @llvm.ctpop.i64(i64 %97)
  %99 = and i64 %98, 1
  %PF91 = icmp eq i64 %99, 0
  %ZFCmp_JG144 = icmp eq i1 %ZF87, false
  %SFOFCmp_JG145 = icmp eq i1 %SF89, %OF90
  %ZFAndSFOF_JG146 = and i1 %ZFCmp_JG144, %SFOFCmp_JG145
  br i1 %ZFAndSFOF_JG146, label %bb.18, label %bb.14

bb.14:                                            ; preds = %bb.13
  store i32 0, ptr %RBP_N.68, align 1
  br label %bb.15

bb.15:                                            ; preds = %bb.14, %bb.16
  %100 = load i32, ptr %RBP_N.68, align 1
  %101 = zext i32 %100 to i64
  %102 = zext i32 3 to i64
  %103 = sub i64 %101, %102
  %104 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %101, i64 %102)
  %CF92 = extractvalue { i64, i1 } %104, 1
  %ZF93 = icmp eq i64 %103, 0
  %highbit94 = and i64 -9223372036854775808, %103
  %SF95 = icmp ne i64 %highbit94, 0
  %105 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %101, i64 %102)
  %OF96 = extractvalue { i64, i1 } %105, 1
  %106 = and i64 %103, 255
  %107 = call i64 @llvm.ctpop.i64(i64 %106)
  %108 = and i64 %107, 1
  %PF97 = icmp eq i64 %108, 0
  %ZFCmp_JG147 = icmp eq i1 %ZF93, false
  %SFOFCmp_JG148 = icmp eq i1 %SF95, %OF96
  %ZFAndSFOF_JG149 = and i1 %ZFCmp_JG147, %SFOFCmp_JG148
  br i1 %ZFAndSFOF_JG149, label %bb.17, label %bb.16

bb.16:                                            ; preds = %bb.15
  %memload98 = load i64, ptr %RBP_N.64, align 1
  %109 = trunc i64 %memload98 to i32
  %RCX99 = sext i32 %109 to i64
  %RAX100 = ptrtoint ptr %6 to i64
  %RCX102 = mul i64 %RCX99, 12
  %110 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX99, i64 12)
  %OF101 = extractvalue { i64, i1 } %110, 1
  %RAX106 = add nsw i64 %RAX100, %RCX102
  %highbit103 = and i64 -9223372036854775808, %RAX106
  %SF104 = icmp ne i64 %highbit103, 0
  %ZF105 = icmp eq i64 %RAX106, 0
  %memload107 = load i64, ptr %RBP_N.68, align 1
  %111 = trunc i64 %memload107 to i32
  %RCX108 = sext i32 %111 to i64
  %memref-idxreg109 = mul i64 4, %RCX108
  %memref-basereg110 = add i64 %RAX106, %memref-idxreg109
  %112 = inttoptr i64 %memref-basereg110 to ptr
  %memload111 = load i32, ptr %112, align 1
  %113 = load i32, ptr %RDX-SKT-LOC, align 1
  %RDX = zext i32 %113 to i64
  %EAX112 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([93 x i8], ptr @rodata_15, i32 0, i32 4), i32 %memload111, i64 %RDX, i64 %RCX108)
  %memload113 = load i32, ptr %RBP_N.68, align 1
  %EAX120 = add i32 %memload113, 1
  %114 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload113, i32 1)
  %CF114 = extractvalue { i32, i1 } %114, 1
  %115 = and i32 %EAX120, 255
  %116 = call i32 @llvm.ctpop.i32(i32 %115)
  %117 = and i32 %116, 1
  %PF115 = icmp eq i32 %117, 0
  %ZF116 = icmp eq i32 %EAX120, 0
  %highbit117 = and i32 -2147483648, %EAX120
  %SF118 = icmp ne i32 %highbit117, 0
  %118 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload113, i32 1)
  %OF119 = extractvalue { i32, i1 } %118, 1
  store i32 %EAX120, ptr %RBP_N.68, align 1
  br label %bb.15

bb.17:                                            ; preds = %bb.15
  %EAX121 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([93 x i8], ptr @rodata_15, i32 0, i32 91))
  %memload122 = load i32, ptr %RBP_N.64, align 1
  %EAX129 = add i32 %memload122, 1
  %119 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload122, i32 1)
  %CF123 = extractvalue { i32, i1 } %119, 1
  %120 = and i32 %EAX129, 255
  %121 = call i32 @llvm.ctpop.i32(i32 %120)
  %122 = and i32 %121, 1
  %PF124 = icmp eq i32 %122, 0
  %ZF125 = icmp eq i32 %EAX129, 0
  %highbit126 = and i32 -2147483648, %EAX129
  %SF127 = icmp ne i32 %highbit126, 0
  %123 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload122, i32 1)
  %OF128 = extractvalue { i32, i1 } %123, 1
  store i32 %EAX129, ptr %RBP_N.64, align 1
  br label %bb.13

bb.18:                                            ; preds = %bb.13
  %124 = load i32, ptr %RBP_N.52, align 1
  %125 = zext i32 %124 to i64
  %126 = zext i32 1 to i64
  %127 = sub i64 %125, %126
  %128 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %125, i64 %126)
  %CF130 = extractvalue { i64, i1 } %128, 1
  %ZF131 = icmp eq i64 %127, 0
  %highbit132 = and i64 -9223372036854775808, %127
  %SF133 = icmp ne i64 %highbit132, 0
  %129 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %125, i64 %126)
  %OF134 = extractvalue { i64, i1 } %129, 1
  %130 = and i64 %127, 255
  %131 = call i64 @llvm.ctpop.i64(i64 %130)
  %132 = and i64 %131, 1
  %PF135 = icmp eq i64 %132, 0
  %CmpZF_JNE150 = icmp eq i1 %ZF131, false
  br i1 %CmpZF_JNE150, label %bb.20, label %bb.19

bb.19:                                            ; preds = %bb.18
  %EAX136 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([93 x i8], ptr @rodata_15, i32 0, i32 8))
  br label %bb.20

bb.20:                                            ; preds = %bb.19, %bb.18
  %memload137 = load i32, ptr %RBP_N.4, align 1
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
