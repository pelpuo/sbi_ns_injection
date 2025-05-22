; ModuleID = './protected_bc/oobw_off_by_one.bc'
source_filename = "./bin/oobw_off_by_one"

@rodata_15 = private unnamed_addr constant [93 x i8] c"\01\00\02\00%d \00Test Failed: Off by one in integer matrix manipulation leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %RDX-SKT-LOC = alloca i32, align 4
  %EDX-SKT-LOC = alloca i64, align 8
  %stktop_8 = alloca i8, i32 88, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 84
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i64* %ns_ptr6 to i8*
  %1 = zext i32 36 to i64
  %2 = call i8* @memset(i8* %0, i32 0, i64 %1)
  %RAX = ptrtoint i8* %2 to i64
  store i32 0, i32* %ns_ptr9, align 1
  store i32 0, i32* %ns_ptr12, align 1
  %3 = zext i32 36 to i64
  store i64 %3, i64* %EDX-SKT-LOC, align 1
  store i32 36, i32* %RDX-SKT-LOC, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.11, %entry
  %4 = load i32, i32* %ns_ptr12, align 1
  %5 = zext i32 %4 to i64
  %6 = zext i32 3 to i64
  %7 = sub i64 %5, %6
  %8 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %5, i64 %6)
  %CF = extractvalue { i64, i1 } %8, 1
  %ZF = icmp eq i64 %7, 0
  %highbit = and i64 -9223372036854775808, %7
  %SF = icmp ne i64 %highbit, 0
  %9 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %5, i64 %6)
  %OF = extractvalue { i64, i1 } %9, 1
  %10 = and i64 %7, 255
  %11 = call i64 @llvm.ctpop.i64(i64 %10)
  %12 = and i64 %11, 1
  %PF = icmp eq i64 %12, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.12, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %ns_ptr15, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.9, %bb.2
  %13 = load i32, i32* %ns_ptr15, align 1
  %14 = zext i32 %13 to i64
  %15 = zext i32 3 to i64
  %16 = sub i64 %14, %15
  %17 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %14, i64 %15)
  %CF1 = extractvalue { i64, i1 } %17, 1
  %ZF2 = icmp eq i64 %16, 0
  %highbit3 = and i64 -9223372036854775808, %16
  %SF4 = icmp ne i64 %highbit3, 0
  %18 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %14, i64 %15)
  %OF5 = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %16, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF6 = icmp eq i64 %21, 0
  %ZFCmp_JG138 = icmp eq i1 %ZF2, false
  %SFOFCmp_JG139 = icmp eq i1 %SF4, %OF5
  %ZFAndSFOF_JG140 = and i1 %ZFCmp_JG138, %SFOFCmp_JG139
  br i1 %ZFAndSFOF_JG140, label %bb.10, label %bb.4

bb.4:                                             ; preds = %bb.3
  %22 = load i64, i64* %EDX-SKT-LOC, align 1
  %EDX = trunc i64 %22 to i32
  %memload = load i32, i32* %ns_ptr12, align 1
  %EDX7 = mul i32 3, %memload
  %memload8 = load i32, i32* %ns_ptr15, align 1
  %EDX10 = add i32 %EDX7, %memload8
  %23 = and i32 %EDX10, 255
  %24 = call i32 @llvm.ctpop.i32(i32 %23)
  %25 = and i32 %24, 1
  %PF9 = icmp eq i32 %25, 0
  %EDX17 = add i32 %EDX10, 1
  %26 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %EDX10, i32 1)
  %CF11 = extractvalue { i32, i1 } %26, 1
  %27 = and i32 %EDX17, 255
  %28 = call i32 @llvm.ctpop.i32(i32 %27)
  %29 = and i32 %28, 1
  %PF12 = icmp eq i32 %29, 0
  %ZF13 = icmp eq i32 %EDX17, 0
  %highbit14 = and i32 -2147483648, %EDX17
  %SF15 = icmp ne i32 %highbit14, 0
  %30 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %EDX10, i32 1)
  %OF16 = extractvalue { i32, i1 } %30, 1
  %31 = bitcast i32* %ns_ptr12 to i64*
  %memload18 = load i64, i64* %31, align 1
  %32 = trunc i64 %memload18 to i32
  %RCX = sext i32 %32 to i64
  %RAX19 = ptrtoint i64* %ns_ptr6 to i64
  %RCX21 = mul i64 %RCX, 12
  %33 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 12)
  %OF20 = extractvalue { i64, i1 } %33, 1
  %RAX25 = add nsw i64 %RAX19, %RCX21
  %highbit22 = and i64 -9223372036854775808, %RAX25
  %SF23 = icmp ne i64 %highbit22, 0
  %ZF24 = icmp eq i64 %RAX25, 0
  %34 = bitcast i32* %ns_ptr15 to i64*
  %memload26 = load i64, i64* %34, align 1
  %35 = trunc i64 %memload26 to i32
  %RCX27 = sext i32 %35 to i64
  %memref-idxreg = mul i64 4, %RCX27
  %memref-basereg = add i64 %RAX25, %memref-idxreg
  %36 = inttoptr i64 %memref-basereg to i32*
  store i32 %EDX17, i32* %36, align 1
  %37 = load i32, i32* %ns_ptr12, align 1
  %38 = zext i32 %37 to i64
  %39 = zext i32 2 to i64
  %40 = sub i64 %38, %39
  %41 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %38, i64 %39)
  %CF28 = extractvalue { i64, i1 } %41, 1
  %ZF29 = icmp eq i64 %40, 0
  %highbit30 = and i64 -9223372036854775808, %40
  %SF31 = icmp ne i64 %highbit30, 0
  %42 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %38, i64 %39)
  %OF32 = extractvalue { i64, i1 } %42, 1
  %43 = and i64 %40, 255
  %44 = call i64 @llvm.ctpop.i64(i64 %43)
  %45 = and i64 %44, 1
  %PF33 = icmp eq i64 %45, 0
  store i32 %EDX17, i32* %RDX-SKT-LOC, align 1
  %ZFCmp_JG141 = icmp eq i1 %ZF29, false
  %SFOFCmp_JG142 = icmp eq i1 %SF31, %OF32
  %ZFAndSFOF_JG143 = and i1 %ZFCmp_JG141, %SFOFCmp_JG142
  %46 = zext i32 %EDX17 to i64
  store i64 %46, i64* %EDX-SKT-LOC, align 1
  br i1 %ZFAndSFOF_JG143, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %47 = load i32, i32* %ns_ptr15, align 1
  %48 = zext i32 %47 to i64
  %49 = zext i32 2 to i64
  %50 = sub i64 %48, %49
  %51 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %48, i64 %49)
  %CF34 = extractvalue { i64, i1 } %51, 1
  %ZF35 = icmp eq i64 %50, 0
  %highbit36 = and i64 -9223372036854775808, %50
  %SF37 = icmp ne i64 %highbit36, 0
  %52 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %48, i64 %49)
  %OF38 = extractvalue { i64, i1 } %52, 1
  %53 = and i64 %50, 255
  %54 = call i64 @llvm.ctpop.i64(i64 %53)
  %55 = and i64 %54, 1
  %PF39 = icmp eq i64 %55, 0
  %CmpZF_JLE = icmp eq i1 %ZF35, true
  %CmpOF_JLE = icmp ne i1 %SF37, %OF38
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.8, label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %56 = bitcast i32* %ns_ptr12 to i64*
  %memload40 = load i64, i64* %56, align 1
  %57 = trunc i64 %memload40 to i32
  %RCX41 = sext i32 %57 to i64
  %RAX42 = ptrtoint i64* %ns_ptr6 to i64
  %RCX44 = mul i64 %RCX41, 12
  %58 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX41, i64 12)
  %OF43 = extractvalue { i64, i1 } %58, 1
  %RAX48 = add nsw i64 %RAX42, %RCX44
  %highbit45 = and i64 -9223372036854775808, %RAX48
  %SF46 = icmp ne i64 %highbit45, 0
  %ZF47 = icmp eq i64 %RAX48, 0
  %59 = bitcast i32* %ns_ptr15 to i64*
  %memload49 = load i64, i64* %59, align 1
  %60 = trunc i64 %memload49 to i32
  %RCX50 = sext i32 %60 to i64
  %memref-idxreg51 = mul i64 4, %RCX50
  %memref-basereg52 = add i64 %RAX48, %memref-idxreg51
  %61 = inttoptr i64 %memref-basereg52 to i32*
  %memload53 = load i32, i32* %61, align 1
  %memload54 = load i32, i32* %ns_ptr12, align 1
  %62 = trunc i64 %RCX50 to i32
  %ECX = mul i32 3, %memload54
  %memload55 = load i32, i32* %ns_ptr15, align 1
  %ECX57 = add i32 %ECX, %memload55
  %63 = and i32 %ECX57, 255
  %64 = call i32 @llvm.ctpop.i32(i32 %63)
  %65 = and i32 %64, 1
  %PF56 = icmp eq i32 %65, 0
  %ECX64 = add i32 %ECX57, 1
  %66 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %ECX57, i32 1)
  %CF58 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %ECX64, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF59 = icmp eq i32 %69, 0
  %ZF60 = icmp eq i32 %ECX64, 0
  %highbit61 = and i32 -2147483648, %ECX64
  %SF62 = icmp ne i32 %highbit61, 0
  %70 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %ECX57, i32 1)
  %OF63 = extractvalue { i32, i1 } %70, 1
  %71 = sub i32 %memload53, %ECX64
  %72 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload53, i32 %ECX64)
  %CF65 = extractvalue { i32, i1 } %72, 1
  %ZF66 = icmp eq i32 %71, 0
  %highbit67 = and i32 -2147483648, %71
  %SF68 = icmp ne i32 %highbit67, 0
  %73 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload53, i32 %ECX64)
  %OF69 = extractvalue { i32, i1 } %73, 1
  %74 = and i32 %71, 255
  %75 = call i32 @llvm.ctpop.i32(i32 %74)
  %76 = and i32 %75, 1
  %PF70 = icmp eq i32 %76, 0
  %CmpZF_JNE = icmp eq i1 %ZF66, false
  br i1 %CmpZF_JNE, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  store i32 1, i32* %ns_ptr9, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6, %bb.5
  br label %bb.9

bb.9:                                             ; preds = %bb.8
  %memload71 = load i32, i32* %ns_ptr15, align 1
  %EAX = add i32 %memload71, 1
  %77 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload71, i32 1)
  %CF72 = extractvalue { i32, i1 } %77, 1
  %78 = and i32 %EAX, 255
  %79 = call i32 @llvm.ctpop.i32(i32 %78)
  %80 = and i32 %79, 1
  %PF73 = icmp eq i32 %80, 0
  %ZF74 = icmp eq i32 %EAX, 0
  %highbit75 = and i32 -2147483648, %EAX
  %SF76 = icmp ne i32 %highbit75, 0
  %81 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload71, i32 1)
  %OF77 = extractvalue { i32, i1 } %81, 1
  store i32 %EAX, i32* %ns_ptr15, align 1
  br label %bb.3

bb.10:                                            ; preds = %bb.3
  br label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload78 = load i32, i32* %ns_ptr12, align 1
  %EAX85 = add i32 %memload78, 1
  %82 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload78, i32 1)
  %CF79 = extractvalue { i32, i1 } %82, 1
  %83 = and i32 %EAX85, 255
  %84 = call i32 @llvm.ctpop.i32(i32 %83)
  %85 = and i32 %84, 1
  %PF80 = icmp eq i32 %85, 0
  %ZF81 = icmp eq i32 %EAX85, 0
  %highbit82 = and i32 -2147483648, %EAX85
  %SF83 = icmp ne i32 %highbit82, 0
  %86 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload78, i32 1)
  %OF84 = extractvalue { i32, i1 } %86, 1
  store i32 %EAX85, i32* %ns_ptr12, align 1
  br label %bb.1

bb.12:                                            ; preds = %bb.1
  store i32 0, i32* %ns_ptr18, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.17, %bb.12
  %87 = load i32, i32* %ns_ptr18, align 1
  %88 = zext i32 %87 to i64
  %89 = zext i32 3 to i64
  %90 = sub i64 %88, %89
  %91 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %88, i64 %89)
  %CF86 = extractvalue { i64, i1 } %91, 1
  %ZF87 = icmp eq i64 %90, 0
  %highbit88 = and i64 -9223372036854775808, %90
  %SF89 = icmp ne i64 %highbit88, 0
  %92 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %88, i64 %89)
  %OF90 = extractvalue { i64, i1 } %92, 1
  %93 = and i64 %90, 255
  %94 = call i64 @llvm.ctpop.i64(i64 %93)
  %95 = and i64 %94, 1
  %PF91 = icmp eq i64 %95, 0
  %ZFCmp_JG144 = icmp eq i1 %ZF87, false
  %SFOFCmp_JG145 = icmp eq i1 %SF89, %OF90
  %ZFAndSFOF_JG146 = and i1 %ZFCmp_JG144, %SFOFCmp_JG145
  br i1 %ZFAndSFOF_JG146, label %bb.18, label %bb.14

bb.14:                                            ; preds = %bb.13
  store i32 0, i32* %ns_ptr21, align 1
  br label %bb.15

bb.15:                                            ; preds = %bb.16, %bb.14
  %96 = load i32, i32* %ns_ptr21, align 1
  %97 = zext i32 %96 to i64
  %98 = zext i32 3 to i64
  %99 = sub i64 %97, %98
  %100 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %97, i64 %98)
  %CF92 = extractvalue { i64, i1 } %100, 1
  %ZF93 = icmp eq i64 %99, 0
  %highbit94 = and i64 -9223372036854775808, %99
  %SF95 = icmp ne i64 %highbit94, 0
  %101 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %97, i64 %98)
  %OF96 = extractvalue { i64, i1 } %101, 1
  %102 = and i64 %99, 255
  %103 = call i64 @llvm.ctpop.i64(i64 %102)
  %104 = and i64 %103, 1
  %PF97 = icmp eq i64 %104, 0
  %ZFCmp_JG147 = icmp eq i1 %ZF93, false
  %SFOFCmp_JG148 = icmp eq i1 %SF95, %OF96
  %ZFAndSFOF_JG149 = and i1 %ZFCmp_JG147, %SFOFCmp_JG148
  br i1 %ZFAndSFOF_JG149, label %bb.17, label %bb.16

bb.16:                                            ; preds = %bb.15
  %105 = bitcast i32* %ns_ptr18 to i64*
  %memload98 = load i64, i64* %105, align 1
  %106 = trunc i64 %memload98 to i32
  %RCX99 = sext i32 %106 to i64
  %RAX100 = ptrtoint i64* %ns_ptr6 to i64
  %RCX102 = mul i64 %RCX99, 12
  %107 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX99, i64 12)
  %OF101 = extractvalue { i64, i1 } %107, 1
  %RAX106 = add nsw i64 %RAX100, %RCX102
  %highbit103 = and i64 -9223372036854775808, %RAX106
  %SF104 = icmp ne i64 %highbit103, 0
  %ZF105 = icmp eq i64 %RAX106, 0
  %108 = bitcast i32* %ns_ptr21 to i64*
  %memload107 = load i64, i64* %108, align 1
  %109 = trunc i64 %memload107 to i32
  %RCX108 = sext i32 %109 to i64
  %memref-idxreg109 = mul i64 4, %RCX108
  %memref-basereg110 = add i64 %RAX106, %memref-idxreg109
  %110 = inttoptr i64 %memref-basereg110 to i32*
  %memload111 = load i32, i32* %110, align 1
  %111 = load i32, i32* %RDX-SKT-LOC, align 1
  %RDX = zext i32 %111 to i64
  %EAX112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([93 x i8], [93 x i8]* @rodata_15, i32 0, i32 4), i32 %memload111, i64 %RDX, i64 %RCX108)
  %memload113 = load i32, i32* %ns_ptr21, align 1
  %EAX120 = add i32 %memload113, 1
  %112 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload113, i32 1)
  %CF114 = extractvalue { i32, i1 } %112, 1
  %113 = and i32 %EAX120, 255
  %114 = call i32 @llvm.ctpop.i32(i32 %113)
  %115 = and i32 %114, 1
  %PF115 = icmp eq i32 %115, 0
  %ZF116 = icmp eq i32 %EAX120, 0
  %highbit117 = and i32 -2147483648, %EAX120
  %SF118 = icmp ne i32 %highbit117, 0
  %116 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload113, i32 1)
  %OF119 = extractvalue { i32, i1 } %116, 1
  store i32 %EAX120, i32* %ns_ptr21, align 1
  br label %bb.15

bb.17:                                            ; preds = %bb.15
  %EAX121 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([93 x i8], [93 x i8]* @rodata_15, i32 0, i32 91))
  %memload122 = load i32, i32* %ns_ptr18, align 1
  %EAX129 = add i32 %memload122, 1
  %117 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload122, i32 1)
  %CF123 = extractvalue { i32, i1 } %117, 1
  %118 = and i32 %EAX129, 255
  %119 = call i32 @llvm.ctpop.i32(i32 %118)
  %120 = and i32 %119, 1
  %PF124 = icmp eq i32 %120, 0
  %ZF125 = icmp eq i32 %EAX129, 0
  %highbit126 = and i32 -2147483648, %EAX129
  %SF127 = icmp ne i32 %highbit126, 0
  %121 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload122, i32 1)
  %OF128 = extractvalue { i32, i1 } %121, 1
  store i32 %EAX129, i32* %ns_ptr18, align 1
  br label %bb.13

bb.18:                                            ; preds = %bb.13
  %122 = load i32, i32* %ns_ptr9, align 1
  %123 = zext i32 %122 to i64
  %124 = zext i32 1 to i64
  %125 = sub i64 %123, %124
  %126 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %123, i64 %124)
  %CF130 = extractvalue { i64, i1 } %126, 1
  %ZF131 = icmp eq i64 %125, 0
  %highbit132 = and i64 -9223372036854775808, %125
  %SF133 = icmp ne i64 %highbit132, 0
  %127 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %123, i64 %124)
  %OF134 = extractvalue { i64, i1 } %127, 1
  %128 = and i64 %125, 255
  %129 = call i64 @llvm.ctpop.i64(i64 %128)
  %130 = and i64 %129, 1
  %PF135 = icmp eq i64 %130, 0
  %CmpZF_JNE150 = icmp eq i1 %ZF131, false
  br i1 %CmpZF_JNE150, label %bb.20, label %bb.19

bb.19:                                            ; preds = %bb.18
  %EAX136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([93 x i8], [93 x i8]* @rodata_15, i32 0, i32 8))
  br label %bb.20

bb.20:                                            ; preds = %bb.19, %bb.18
  %memload137 = load i32, i32* %ns_ptr3, align 1
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

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
