; ModuleID = './bin/oobr_char_to_int_conversion_advanced'
source_filename = "./bin/oobr_char_to_int_conversion_advanced"

@rodata_18 = private unnamed_addr constant [139 x i8] c"\01\00\02\00\00\00\00\00public string\00\00This is the secret in memory\00\00%p \00%c \0A\00%c\0A\00\00\00\00\00\00\00Test Failed: Out of Bounds Read by Char to Int Conversion Advanced\00", align 8, !ROData_SecInfo !0

declare dso_local i32 @putchar(i32)

declare dso_local i32 @puts(ptr)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
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
  %RBP_N.48 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 48
  %RBP_N.40 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 56
  %RBP_N.32 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 64
  %RBP_N.24 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 72
  %RBP_N.16 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 80
  %RBP_N.8 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %11 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %RAX = ptrtoint ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 8) to i64, !ROData_Index !1
  store i64 %RAX, ptr %RBP_N.48, align 1
  %RAX1 = ptrtoint ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 23) to i64, !ROData_Index !2
  store i64 %RAX1, ptr %RBP_N.40, align 1
  store i32 8, ptr %RBP_N.52, align 1
  %memload = load i64, ptr %RBP_N.48, align 1
  store i64 %memload, ptr %RBP_N.32, align 1
  %memload2 = load i64, ptr %RBP_N.32, align 1
  store i64 %memload2, ptr %RBP_N.24, align 1
  store i32 1, ptr %RBP_N.68, align 1
  store i32 0, ptr %RBP_N.64, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload3 = load i32, ptr %RBP_N.64, align 1
  %12 = load i32, ptr %RBP_N.52, align 1
  %13 = sub i32 %memload3, %12
  %14 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload3, i32 %12)
  %CF = extractvalue { i32, i1 } %14, 1
  %ZF = icmp eq i32 %13, 0
  %highbit = and i32 -2147483648, %13
  %SF = icmp ne i32 %highbit, 0
  %15 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload3, i32 %12)
  %OF = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %13, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF = icmp eq i32 %18, 0
  %SFAndOF_JL = icmp ne i1 %SF, %OF
  br i1 %SFAndOF_JL, label %bb.1, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX = call i32 @putchar(i32 10)
  store i32 0, ptr %RBP_N.60, align 1
  br label %bb.11

bb.11:                                            ; preds = %bb.10, %bb.3
  %memload4 = load i32, ptr %RBP_N.60, align 1
  %19 = load i32, ptr %RBP_N.52, align 1
  %20 = sub i32 %memload4, %19
  %21 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload4, i32 %19)
  %CF5 = extractvalue { i32, i1 } %21, 1
  %ZF6 = icmp eq i32 %20, 0
  %highbit7 = and i32 -2147483648, %20
  %SF8 = icmp ne i32 %highbit7, 0
  %22 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload4, i32 %19)
  %OF9 = extractvalue { i32, i1 } %22, 1
  %23 = and i32 %20, 255
  %24 = call i32 @llvm.ctpop.i32(i32 %23)
  %25 = and i32 %24, 1
  %PF10 = icmp eq i32 %25, 0
  %SFAndOF_JL93 = icmp ne i1 %SF8, %OF9
  br i1 %SFAndOF_JL93, label %bb.4, label %bb.12

bb.12:                                            ; preds = %bb.11
  %EAX11 = call i32 @putchar(i32 10)
  %26 = load i32, ptr %RBP_N.68, align 1
  %27 = zext i32 %26 to i64
  %28 = zext i32 0 to i64
  %29 = sub i64 %27, %28
  %30 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %27, i64 %28)
  %CF12 = extractvalue { i64, i1 } %30, 1
  %ZF13 = icmp eq i64 %29, 0
  %highbit14 = and i64 -9223372036854775808, %29
  %SF15 = icmp ne i64 %highbit14, 0
  %31 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %27, i64 %28)
  %OF16 = extractvalue { i64, i1 } %31, 1
  %32 = and i64 %29, 255
  %33 = call i64 @llvm.ctpop.i64(i64 %32)
  %34 = and i64 %33, 1
  %PF17 = icmp eq i64 %34, 0
  %CmpZF_JNE = icmp eq i1 %ZF13, false
  br i1 %CmpZF_JNE, label %bb.14, label %bb.13

bb.13:                                            ; preds = %bb.12
  %EAX19 = call i32 @puts(ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 72))
  br label %bb.14

bb.14:                                            ; preds = %bb.13, %bb.12
  ret i32 0

bb.4:                                             ; preds = %bb.11
  %memload20 = load i32, ptr %RBP_N.60, align 1
  %RAX21 = sext i32 %memload20 to i64
  %memref-idxreg = mul i64 4, %RAX21
  %memload22 = load i64, ptr %RBP_N.32, align 1
  %RAX26 = add nsw i64 %memload22, %memref-idxreg
  %highbit23 = and i64 -9223372036854775808, %RAX26
  %SF24 = icmp ne i64 %highbit23, 0
  %ZF25 = icmp eq i64 %RAX26, 0
  store i64 %RAX26, ptr %RBP_N.16, align 1
  store i32 0, ptr %RBP_N.56, align 1
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.4
  %35 = load i32, ptr %RBP_N.56, align 1
  %36 = zext i32 %35 to i64
  %37 = zext i32 3 to i64
  %38 = sub i64 %36, %37
  %39 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %36, i64 %37)
  %CF27 = extractvalue { i64, i1 } %39, 1
  %ZF28 = icmp eq i64 %38, 0
  %highbit29 = and i64 -9223372036854775808, %38
  %SF30 = icmp ne i64 %highbit29, 0
  %40 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %36, i64 %37)
  %OF31 = extractvalue { i64, i1 } %40, 1
  %41 = and i64 %38, 255
  %42 = call i64 @llvm.ctpop.i64(i64 %41)
  %43 = and i64 %42, 1
  %PF32 = icmp eq i64 %43, 0
  %CmpZF_JLE = icmp eq i1 %ZF28, true
  %CmpOF_JLE = icmp ne i1 %SF30, %OF31
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.5, label %bb.10

bb.10:                                            ; preds = %bb.9
  %44 = zext i8 1 to i32
  %45 = load i32, ptr %RBP_N.60, align 1
  %46 = add i32 %45, %44
  %47 = and i32 %46, 255
  %48 = call i32 @llvm.ctpop.i32(i32 %47)
  %49 = and i32 %48, 1
  %PF33 = icmp eq i32 %49, 0
  store i32 %46, ptr %RBP_N.60, align 1
  br label %bb.11

bb.5:                                             ; preds = %bb.9
  %memload34 = load i32, ptr %RBP_N.56, align 1
  %RDX = sext i32 %memload34 to i64
  %memload35 = load i64, ptr %RBP_N.16, align 1
  %RAX39 = add nsw i64 %memload35, %RDX
  %highbit36 = and i64 -9223372036854775808, %RAX39
  %SF37 = icmp ne i64 %highbit36, 0
  %ZF38 = icmp eq i64 %RAX39, 0
  store i64 %RAX39, ptr %RBP_N.8, align 1
  %memload40 = load i64, ptr %RBP_N.8, align 1
  %EAX42 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 53), i64 %memload40, i64 %RDX)
  %memload43 = load i64, ptr %RBP_N.8, align 1
  %50 = inttoptr i64 %memload43 to ptr
  %memload44 = load i32, ptr %50, align 1
  %51 = trunc i32 %memload44 to i8
  %EAX45 = zext i8 %51 to i32
  %52 = trunc i32 %EAX45 to i8
  %EAX46 = sext i8 %52 to i32
  %EAX48 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 62), i32 %EAX46)
  %memload49 = load i64, ptr %RBP_N.48, align 1
  %RAX56 = add i64 %memload49, 8
  %53 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload49, i64 8)
  %CF50 = extractvalue { i64, i1 } %53, 1
  %54 = and i64 %RAX56, 255
  %55 = call i64 @llvm.ctpop.i64(i64 %54)
  %56 = and i64 %55, 1
  %PF51 = icmp eq i64 %56, 0
  %ZF52 = icmp eq i64 %RAX56, 0
  %highbit53 = and i64 -9223372036854775808, %RAX56
  %SF54 = icmp ne i64 %highbit53, 0
  %57 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload49, i64 8)
  %OF55 = extractvalue { i64, i1 } %57, 1
  %58 = load i64, ptr %RBP_N.8, align 1
  %59 = sub i64 %58, %RAX56
  %60 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %58, i64 %RAX56)
  %CF57 = extractvalue { i64, i1 } %60, 1
  %ZF58 = icmp eq i64 %59, 0
  %highbit59 = and i64 -9223372036854775808, %59
  %SF60 = icmp ne i64 %highbit59, 0
  %61 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %58, i64 %RAX56)
  %OF61 = extractvalue { i64, i1 } %61, 1
  %62 = and i64 %59, 255
  %63 = call i64 @llvm.ctpop.i64(i64 %62)
  %64 = and i64 %63, 1
  %PF62 = icmp eq i64 %64, 0
  %CFCmp_JBE = icmp eq i1 %CF57, true
  %ZFCmp_JBE = icmp eq i1 %ZF58, true
  %CFAndZF_JBE = or i1 %ZFCmp_JBE, %CFCmp_JBE
  br i1 %CFAndZF_JBE, label %bb.8, label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload63 = load i64, ptr %RBP_N.8, align 1
  %65 = inttoptr i64 %memload63 to ptr
  %memload64 = load i32, ptr %65, align 1
  %66 = trunc i32 %memload64 to i8
  %EAX65 = zext i8 %66 to i32
  %67 = trunc i32 %EAX65 to i8
  %68 = trunc i32 %EAX65 to i8
  %69 = and i8 %67, %68
  %highbit66 = and i8 -128, %69
  %SF67 = icmp ne i8 %highbit66, 0
  %ZF68 = icmp eq i8 %69, 0
  %70 = call i8 @llvm.ctpop.i8(i8 %69)
  %71 = and i8 %70, 1
  %PF69 = icmp eq i8 %71, 0
  %CmpZF_JE = icmp eq i1 %ZF68, true
  br i1 %CmpZF_JE, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  store i32 0, ptr %RBP_N.68, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6, %bb.5
  %72 = zext i8 1 to i32
  %73 = load i32, ptr %RBP_N.56, align 1
  %74 = add i32 %73, %72
  %75 = and i32 %74, 255
  %76 = call i32 @llvm.ctpop.i32(i32 %75)
  %77 = and i32 %76, 1
  %PF70 = icmp eq i32 %77, 0
  store i32 %74, ptr %RBP_N.56, align 1
  br label %bb.9

bb.1:                                             ; preds = %bb.2
  %memload71 = load i32, ptr %RBP_N.64, align 1
  %RDX72 = sext i32 %memload71 to i64
  %memload73 = load i64, ptr %RBP_N.32, align 1
  %RAX77 = add nsw i64 %memload73, %RDX72
  %highbit74 = and i64 -9223372036854775808, %RAX77
  %SF75 = icmp ne i64 %highbit74, 0
  %ZF76 = icmp eq i64 %RAX77, 0
  %EAX79 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 53), i64 %RAX77, i64 %RDX72)
  %memload80 = load i32, ptr %RBP_N.64, align 1
  %RDX81 = sext i32 %memload80 to i64
  %memload82 = load i64, ptr %RBP_N.32, align 1
  %RAX86 = add nsw i64 %memload82, %RDX81
  %highbit83 = and i64 -9223372036854775808, %RAX86
  %SF84 = icmp ne i64 %highbit83, 0
  %ZF85 = icmp eq i64 %RAX86, 0
  %78 = inttoptr i64 %RAX86 to ptr
  %memload87 = load i32, ptr %78, align 1
  %79 = trunc i32 %memload87 to i8
  %EAX88 = zext i8 %79 to i32
  %80 = trunc i32 %EAX88 to i8
  %EAX89 = sext i8 %80 to i32
  %EAX91 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 57), i32 %EAX89, i64 %RDX81)
  %81 = zext i8 1 to i32
  %82 = load i32, ptr %RBP_N.64, align 1
  %83 = add i32 %82, %81
  %84 = and i32 %83, 255
  %85 = call i32 @llvm.ctpop.i32(i32 %84)
  %86 = and i32 %85, 1
  %PF92 = icmp eq i32 %86, 0
  store i32 %83, ptr %RBP_N.64, align 1
  br label %bb.2
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.ctpop.i8(i8) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
!1 = !{ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 8)}
!2 = !{ptr getelementptr inbounds ([139 x i8], ptr @rodata_18, i32 0, i32 23)}
