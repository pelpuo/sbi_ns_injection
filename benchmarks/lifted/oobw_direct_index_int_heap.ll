; ModuleID = './bin/oobw_direct_index_int_heap'
source_filename = "./bin/oobw_direct_index_int_heap"

@rodata_15 = private unnamed_addr constant [76 x i8] c"\01\00\02\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Direct int array on heap Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.40 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.36 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.32 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.28 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.24 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.16 = bitcast i8* %5 to i64*
  %6 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.4 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %7 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %8 = zext i32 32 to i64
  %9 = call i8* @malloc(i64 %8)
  %RAX = ptrtoint i8* %9 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %10 = zext i32 32 to i64
  %11 = call i8* @malloc(i64 %10)
  %RAX1 = ptrtoint i8* %11 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  store i32 0, i32* %RBP_N.28, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %12 = load i32, i32* %RBP_N.28, align 1
  %13 = zext i32 %12 to i64
  %14 = zext i32 5 to i64
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
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload = load i32, i32* %RBP_N.28, align 1
  %EDX = add i32 %memload, 1
  %21 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload, i32 1)
  %CF2 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %EDX, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF3 = icmp eq i32 %24, 0
  %ZF4 = icmp eq i32 %EDX, 0
  %highbit5 = and i32 -2147483648, %EDX
  %SF6 = icmp ne i32 %highbit5, 0
  %25 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload, i32 1)
  %OF7 = extractvalue { i32, i1 } %25, 1
  %EDX11 = shl i32 %EDX, 1
  %ZF8 = icmp eq i32 %EDX11, 0
  %highbit9 = and i32 -2147483648, %EDX11
  %SF10 = icmp ne i32 %highbit9, 0
  %memload12 = load i64, i64* %RBP_N.16, align 1
  %26 = bitcast i32* %RBP_N.28 to i64*
  %memload13 = load i64, i64* %26, align 1
  %27 = trunc i64 %memload13 to i32
  %RCX = sext i32 %27 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload12, %memref-idxreg
  %28 = inttoptr i64 %memref-basereg to i32*
  store i32 %EDX11, i32* %28, align 1
  %memload14 = load i32, i32* %RBP_N.28, align 1
  %EAX = add i32 %memload14, 1
  %29 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload14, i32 1)
  %CF15 = extractvalue { i32, i1 } %29, 1
  %30 = and i32 %EAX, 255
  %31 = call i32 @llvm.ctpop.i32(i32 %30)
  %32 = and i32 %31, 1
  %PF16 = icmp eq i32 %32, 0
  %ZF17 = icmp eq i32 %EAX, 0
  %highbit18 = and i32 -2147483648, %EAX
  %SF19 = icmp ne i32 %highbit18, 0
  %33 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload14, i32 1)
  %OF20 = extractvalue { i32, i1 } %33, 1
  store i32 %EAX, i32* %RBP_N.28, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  store i32 0, i32* %RBP_N.32, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.5
  %34 = load i32, i32* %RBP_N.32, align 1
  %35 = zext i32 %34 to i64
  %36 = zext i32 5 to i64
  %37 = sub i64 %35, %36
  %38 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %35, i64 %36)
  %CF21 = extractvalue { i64, i1 } %38, 1
  %ZF22 = icmp eq i64 %37, 0
  %highbit23 = and i64 -9223372036854775808, %37
  %SF24 = icmp ne i64 %highbit23, 0
  %39 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %35, i64 %36)
  %OF25 = extractvalue { i64, i1 } %39, 1
  %40 = and i64 %37, 255
  %41 = call i64 @llvm.ctpop.i64(i64 %40)
  %42 = and i64 %41, 1
  %PF26 = icmp eq i64 %42, 0
  %CmpSFOF_JGE101 = icmp eq i1 %SF24, %OF25
  br i1 %CmpSFOF_JGE101, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload27 = load i32, i32* %RBP_N.32, align 1
  %EDX34 = add i32 %memload27, 1
  %43 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload27, i32 1)
  %CF28 = extractvalue { i32, i1 } %43, 1
  %44 = and i32 %EDX34, 255
  %45 = call i32 @llvm.ctpop.i32(i32 %44)
  %46 = and i32 %45, 1
  %PF29 = icmp eq i32 %46, 0
  %ZF30 = icmp eq i32 %EDX34, 0
  %highbit31 = and i32 -2147483648, %EDX34
  %SF32 = icmp ne i32 %highbit31, 0
  %47 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload27, i32 1)
  %OF33 = extractvalue { i32, i1 } %47, 1
  %memload35 = load i64, i64* %RBP_N.24, align 1
  %48 = bitcast i32* %RBP_N.32 to i64*
  %memload36 = load i64, i64* %48, align 1
  %49 = trunc i64 %memload36 to i32
  %RCX37 = sext i32 %49 to i64
  %memref-idxreg38 = mul i64 4, %RCX37
  %memref-basereg39 = add i64 %memload35, %memref-idxreg38
  %50 = inttoptr i64 %memref-basereg39 to i32*
  store i32 %EDX34, i32* %50, align 1
  %memload40 = load i32, i32* %RBP_N.32, align 1
  %EAX47 = add i32 %memload40, 1
  %51 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload40, i32 1)
  %CF41 = extractvalue { i32, i1 } %51, 1
  %52 = and i32 %EAX47, 255
  %53 = call i32 @llvm.ctpop.i32(i32 %52)
  %54 = and i32 %53, 1
  %PF42 = icmp eq i32 %54, 0
  %ZF43 = icmp eq i32 %EAX47, 0
  %highbit44 = and i32 -2147483648, %EAX47
  %SF45 = icmp ne i32 %highbit44, 0
  %55 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload40, i32 1)
  %OF46 = extractvalue { i32, i1 } %55, 1
  store i32 %EAX47, i32* %RBP_N.32, align 1
  br label %bb.4

bb.6:                                             ; preds = %bb.4
  %memload48 = load i64, i64* %RBP_N.16, align 1
  %EAX49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 4), i64 %memload48)
  %memload50 = load i64, i64* %RBP_N.24, align 1
  %EAX51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 8), i64 %memload50)
  %memload52 = load i64, i64* %RBP_N.16, align 1
  %memref-disp = add i64 %memload52, 48
  %56 = inttoptr i64 %memref-disp to i32*
  store i32 420, i32* %56, align 1
  store i32 0, i32* %RBP_N.36, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.8
  %57 = load i32, i32* %RBP_N.36, align 1
  %58 = zext i32 %57 to i64
  %59 = zext i32 5 to i64
  %60 = sub i64 %58, %59
  %61 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %58, i64 %59)
  %CF53 = extractvalue { i64, i1 } %61, 1
  %ZF54 = icmp eq i64 %60, 0
  %highbit55 = and i64 -9223372036854775808, %60
  %SF56 = icmp ne i64 %highbit55, 0
  %62 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %58, i64 %59)
  %OF57 = extractvalue { i64, i1 } %62, 1
  %63 = and i64 %60, 255
  %64 = call i64 @llvm.ctpop.i64(i64 %63)
  %65 = and i64 %64, 1
  %PF58 = icmp eq i64 %65, 0
  %CmpSFOF_JGE102 = icmp eq i1 %SF56, %OF57
  br i1 %CmpSFOF_JGE102, label %bb.9, label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload59 = load i64, i64* %RBP_N.24, align 1
  %66 = bitcast i32* %RBP_N.36 to i64*
  %memload60 = load i64, i64* %66, align 1
  %67 = trunc i64 %memload60 to i32
  %RCX61 = sext i32 %67 to i64
  %memref-idxreg62 = mul i64 4, %RCX61
  %memref-basereg63 = add i64 %memload59, %memref-idxreg62
  %68 = inttoptr i64 %memref-basereg63 to i32*
  %memload64 = load i32, i32* %68, align 1
  %EAX65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 13), i32 %memload64)
  %memload66 = load i32, i32* %RBP_N.36, align 1
  %EAX73 = add i32 %memload66, 1
  %69 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload66, i32 1)
  %CF67 = extractvalue { i32, i1 } %69, 1
  %70 = and i32 %EAX73, 255
  %71 = call i32 @llvm.ctpop.i32(i32 %70)
  %72 = and i32 %71, 1
  %PF68 = icmp eq i32 %72, 0
  %ZF69 = icmp eq i32 %EAX73, 0
  %highbit70 = and i32 -2147483648, %EAX73
  %SF71 = icmp ne i32 %highbit70, 0
  %73 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload66, i32 1)
  %OF72 = extractvalue { i32, i1 } %73, 1
  store i32 %EAX73, i32* %RBP_N.36, align 1
  br label %bb.7

bb.9:                                             ; preds = %bb.7
  %EAX74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 11))
  store i32 0, i32* %RBP_N.40, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.14
  %74 = load i32, i32* %RBP_N.40, align 1
  %75 = zext i32 %74 to i64
  %76 = zext i32 5 to i64
  %77 = sub i64 %75, %76
  %78 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %75, i64 %76)
  %CF75 = extractvalue { i64, i1 } %78, 1
  %ZF76 = icmp eq i64 %77, 0
  %highbit77 = and i64 -9223372036854775808, %77
  %SF78 = icmp ne i64 %highbit77, 0
  %79 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %75, i64 %76)
  %OF79 = extractvalue { i64, i1 } %79, 1
  %80 = and i64 %77, 255
  %81 = call i64 @llvm.ctpop.i64(i64 %80)
  %82 = and i64 %81, 1
  %PF80 = icmp eq i64 %82, 0
  %CmpSFOF_JGE103 = icmp eq i1 %SF78, %OF79
  br i1 %CmpSFOF_JGE103, label %bb.15, label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload81 = load i64, i64* %RBP_N.24, align 1
  %83 = bitcast i32* %RBP_N.40 to i64*
  %memload82 = load i64, i64* %83, align 1
  %84 = trunc i64 %memload82 to i32
  %RCX83 = sext i32 %84 to i64
  %memref-idxreg84 = mul i64 4, %RCX83
  %memref-basereg85 = add i64 %memload81, %memref-idxreg84
  %85 = inttoptr i64 %memref-basereg85 to i32*
  %86 = load i32, i32* %85, align 1
  %87 = zext i32 %86 to i64
  %88 = zext i32 9 to i64
  %89 = sub i64 %87, %88
  %90 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %87, i64 %88)
  %CF86 = extractvalue { i64, i1 } %90, 1
  %ZF87 = icmp eq i64 %89, 0
  %highbit88 = and i64 -9223372036854775808, %89
  %SF89 = icmp ne i64 %highbit88, 0
  %91 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %87, i64 %88)
  %OF90 = extractvalue { i64, i1 } %91, 1
  %92 = and i64 %89, 255
  %93 = call i64 @llvm.ctpop.i64(i64 %92)
  %94 = and i64 %93, 1
  %PF91 = icmp eq i64 %94, 0
  %CmpZF_JLE = icmp eq i1 %ZF87, true
  %CmpOF_JLE = icmp ne i1 %SF89, %OF90
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.13, label %bb.12

bb.12:                                            ; preds = %bb.11
  %EAX92 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 17))
  br label %bb.15

bb.13:                                            ; preds = %bb.11
  br label %bb.14

bb.14:                                            ; preds = %bb.13
  %memload93 = load i32, i32* %RBP_N.40, align 1
  %EAX100 = add i32 %memload93, 1
  %95 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload93, i32 1)
  %CF94 = extractvalue { i32, i1 } %95, 1
  %96 = and i32 %EAX100, 255
  %97 = call i32 @llvm.ctpop.i32(i32 %96)
  %98 = and i32 %97, 1
  %PF95 = icmp eq i32 %98, 0
  %ZF96 = icmp eq i32 %EAX100, 0
  %highbit97 = and i32 -2147483648, %EAX100
  %SF98 = icmp ne i32 %highbit97, 0
  %99 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload93, i32 1)
  %OF99 = extractvalue { i32, i1 } %99, 1
  store i32 %EAX100, i32* %RBP_N.40, align 1
  br label %bb.10

bb.15:                                            ; preds = %bb.12, %bb.10
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
