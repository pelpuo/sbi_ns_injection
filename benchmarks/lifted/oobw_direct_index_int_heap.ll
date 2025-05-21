; ModuleID = './bin/oobw_direct_index_int_heap'
source_filename = "./bin/oobw_direct_index_int_heap"

@rodata_15 = private unnamed_addr constant [76 x i8] c"\01\00\02\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Direct int array on heap Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.40 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.36 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.32 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 28
  %RBP_N.28 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 32
  %RBP_N.24 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 40
  %RBP_N.16 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %7 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %8 = zext i32 32 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX = ptrtoint ptr %9 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %10 = zext i32 32 to i64
  %11 = call ptr @malloc(i64 %10)
  %RAX1 = ptrtoint ptr %11 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  store i32 0, ptr %RBP_N.28, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %12 = load i32, ptr %RBP_N.28, align 1
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
  %memload = load i32, ptr %RBP_N.28, align 1
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
  %memload12 = load i64, ptr %RBP_N.16, align 1
  %memload13 = load i64, ptr %RBP_N.28, align 1
  %26 = trunc i64 %memload13 to i32
  %RCX = sext i32 %26 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload12, %memref-idxreg
  %27 = inttoptr i64 %memref-basereg to ptr
  store i32 %EDX11, ptr %27, align 1
  %memload14 = load i32, ptr %RBP_N.28, align 1
  %EAX = add i32 %memload14, 1
  %28 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload14, i32 1)
  %CF15 = extractvalue { i32, i1 } %28, 1
  %29 = and i32 %EAX, 255
  %30 = call i32 @llvm.ctpop.i32(i32 %29)
  %31 = and i32 %30, 1
  %PF16 = icmp eq i32 %31, 0
  %ZF17 = icmp eq i32 %EAX, 0
  %highbit18 = and i32 -2147483648, %EAX
  %SF19 = icmp ne i32 %highbit18, 0
  %32 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload14, i32 1)
  %OF20 = extractvalue { i32, i1 } %32, 1
  store i32 %EAX, ptr %RBP_N.28, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  store i32 0, ptr %RBP_N.32, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.5
  %33 = load i32, ptr %RBP_N.32, align 1
  %34 = zext i32 %33 to i64
  %35 = zext i32 5 to i64
  %36 = sub i64 %34, %35
  %37 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %34, i64 %35)
  %CF21 = extractvalue { i64, i1 } %37, 1
  %ZF22 = icmp eq i64 %36, 0
  %highbit23 = and i64 -9223372036854775808, %36
  %SF24 = icmp ne i64 %highbit23, 0
  %38 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %34, i64 %35)
  %OF25 = extractvalue { i64, i1 } %38, 1
  %39 = and i64 %36, 255
  %40 = call i64 @llvm.ctpop.i64(i64 %39)
  %41 = and i64 %40, 1
  %PF26 = icmp eq i64 %41, 0
  %CmpSFOF_JGE101 = icmp eq i1 %SF24, %OF25
  br i1 %CmpSFOF_JGE101, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload27 = load i32, ptr %RBP_N.32, align 1
  %EDX34 = add i32 %memload27, 1
  %42 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload27, i32 1)
  %CF28 = extractvalue { i32, i1 } %42, 1
  %43 = and i32 %EDX34, 255
  %44 = call i32 @llvm.ctpop.i32(i32 %43)
  %45 = and i32 %44, 1
  %PF29 = icmp eq i32 %45, 0
  %ZF30 = icmp eq i32 %EDX34, 0
  %highbit31 = and i32 -2147483648, %EDX34
  %SF32 = icmp ne i32 %highbit31, 0
  %46 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload27, i32 1)
  %OF33 = extractvalue { i32, i1 } %46, 1
  %memload35 = load i64, ptr %RBP_N.24, align 1
  %memload36 = load i64, ptr %RBP_N.32, align 1
  %47 = trunc i64 %memload36 to i32
  %RCX37 = sext i32 %47 to i64
  %memref-idxreg38 = mul i64 4, %RCX37
  %memref-basereg39 = add i64 %memload35, %memref-idxreg38
  %48 = inttoptr i64 %memref-basereg39 to ptr
  store i32 %EDX34, ptr %48, align 1
  %memload40 = load i32, ptr %RBP_N.32, align 1
  %EAX47 = add i32 %memload40, 1
  %49 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload40, i32 1)
  %CF41 = extractvalue { i32, i1 } %49, 1
  %50 = and i32 %EAX47, 255
  %51 = call i32 @llvm.ctpop.i32(i32 %50)
  %52 = and i32 %51, 1
  %PF42 = icmp eq i32 %52, 0
  %ZF43 = icmp eq i32 %EAX47, 0
  %highbit44 = and i32 -2147483648, %EAX47
  %SF45 = icmp ne i32 %highbit44, 0
  %53 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload40, i32 1)
  %OF46 = extractvalue { i32, i1 } %53, 1
  store i32 %EAX47, ptr %RBP_N.32, align 1
  br label %bb.4

bb.6:                                             ; preds = %bb.4
  %memload48 = load i64, ptr %RBP_N.16, align 1
  %EAX49 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([76 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload48)
  %memload50 = load i64, ptr %RBP_N.24, align 1
  %EAX51 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([76 x i8], ptr @rodata_15, i32 0, i32 8), i64 %memload50)
  %memload52 = load i64, ptr %RBP_N.16, align 1
  %memref-disp = add i64 %memload52, 48
  %54 = inttoptr i64 %memref-disp to ptr
  store i32 420, ptr %54, align 1
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.8
  %55 = load i32, ptr %RBP_N.36, align 1
  %56 = zext i32 %55 to i64
  %57 = zext i32 5 to i64
  %58 = sub i64 %56, %57
  %59 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %56, i64 %57)
  %CF53 = extractvalue { i64, i1 } %59, 1
  %ZF54 = icmp eq i64 %58, 0
  %highbit55 = and i64 -9223372036854775808, %58
  %SF56 = icmp ne i64 %highbit55, 0
  %60 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %56, i64 %57)
  %OF57 = extractvalue { i64, i1 } %60, 1
  %61 = and i64 %58, 255
  %62 = call i64 @llvm.ctpop.i64(i64 %61)
  %63 = and i64 %62, 1
  %PF58 = icmp eq i64 %63, 0
  %CmpSFOF_JGE102 = icmp eq i1 %SF56, %OF57
  br i1 %CmpSFOF_JGE102, label %bb.9, label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload59 = load i64, ptr %RBP_N.24, align 1
  %memload60 = load i64, ptr %RBP_N.36, align 1
  %64 = trunc i64 %memload60 to i32
  %RCX61 = sext i32 %64 to i64
  %memref-idxreg62 = mul i64 4, %RCX61
  %memref-basereg63 = add i64 %memload59, %memref-idxreg62
  %65 = inttoptr i64 %memref-basereg63 to ptr
  %memload64 = load i32, ptr %65, align 1
  %EAX65 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([76 x i8], ptr @rodata_15, i32 0, i32 13), i32 %memload64)
  %memload66 = load i32, ptr %RBP_N.36, align 1
  %EAX73 = add i32 %memload66, 1
  %66 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload66, i32 1)
  %CF67 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %EAX73, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF68 = icmp eq i32 %69, 0
  %ZF69 = icmp eq i32 %EAX73, 0
  %highbit70 = and i32 -2147483648, %EAX73
  %SF71 = icmp ne i32 %highbit70, 0
  %70 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload66, i32 1)
  %OF72 = extractvalue { i32, i1 } %70, 1
  store i32 %EAX73, ptr %RBP_N.36, align 1
  br label %bb.7

bb.9:                                             ; preds = %bb.7
  %EAX74 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([76 x i8], ptr @rodata_15, i32 0, i32 11))
  store i32 0, ptr %RBP_N.40, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.14
  %71 = load i32, ptr %RBP_N.40, align 1
  %72 = zext i32 %71 to i64
  %73 = zext i32 5 to i64
  %74 = sub i64 %72, %73
  %75 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %72, i64 %73)
  %CF75 = extractvalue { i64, i1 } %75, 1
  %ZF76 = icmp eq i64 %74, 0
  %highbit77 = and i64 -9223372036854775808, %74
  %SF78 = icmp ne i64 %highbit77, 0
  %76 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %72, i64 %73)
  %OF79 = extractvalue { i64, i1 } %76, 1
  %77 = and i64 %74, 255
  %78 = call i64 @llvm.ctpop.i64(i64 %77)
  %79 = and i64 %78, 1
  %PF80 = icmp eq i64 %79, 0
  %CmpSFOF_JGE103 = icmp eq i1 %SF78, %OF79
  br i1 %CmpSFOF_JGE103, label %bb.15, label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload81 = load i64, ptr %RBP_N.24, align 1
  %memload82 = load i64, ptr %RBP_N.40, align 1
  %80 = trunc i64 %memload82 to i32
  %RCX83 = sext i32 %80 to i64
  %memref-idxreg84 = mul i64 4, %RCX83
  %memref-basereg85 = add i64 %memload81, %memref-idxreg84
  %81 = inttoptr i64 %memref-basereg85 to ptr
  %82 = load i32, ptr %81, align 1
  %83 = zext i32 %82 to i64
  %84 = zext i32 9 to i64
  %85 = sub i64 %83, %84
  %86 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %83, i64 %84)
  %CF86 = extractvalue { i64, i1 } %86, 1
  %ZF87 = icmp eq i64 %85, 0
  %highbit88 = and i64 -9223372036854775808, %85
  %SF89 = icmp ne i64 %highbit88, 0
  %87 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %83, i64 %84)
  %OF90 = extractvalue { i64, i1 } %87, 1
  %88 = and i64 %85, 255
  %89 = call i64 @llvm.ctpop.i64(i64 %88)
  %90 = and i64 %89, 1
  %PF91 = icmp eq i64 %90, 0
  %CmpZF_JLE = icmp eq i1 %ZF87, true
  %CmpOF_JLE = icmp ne i1 %SF89, %OF90
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.13, label %bb.12

bb.12:                                            ; preds = %bb.11
  %EAX92 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([76 x i8], ptr @rodata_15, i32 0, i32 17))
  br label %bb.15

bb.13:                                            ; preds = %bb.11
  br label %bb.14

bb.14:                                            ; preds = %bb.13
  %memload93 = load i32, ptr %RBP_N.40, align 1
  %EAX100 = add i32 %memload93, 1
  %91 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload93, i32 1)
  %CF94 = extractvalue { i32, i1 } %91, 1
  %92 = and i32 %EAX100, 255
  %93 = call i32 @llvm.ctpop.i32(i32 %92)
  %94 = and i32 %93, 1
  %PF95 = icmp eq i32 %94, 0
  %ZF96 = icmp eq i32 %EAX100, 0
  %highbit97 = and i32 -2147483648, %EAX100
  %SF98 = icmp ne i32 %highbit97, 0
  %95 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload93, i32 1)
  %OF99 = extractvalue { i32, i1 } %95, 1
  store i32 %EAX100, ptr %RBP_N.40, align 1
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
