; ModuleID = './bin/oobr_off_by_one_mat_str'
source_filename = "./bin/oobr_off_by_one_mat_str"

@rodata_15 = private unnamed_addr constant [99 x i8] c"\01\00\02\00abcdefghijklmnopqr%c\00\0ATest Failed: Off by One in string matrix manipulation leaks information\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 19
  %RBP_N.37 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.36 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.32 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 28
  %RBP_N.28 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 34
  %RBP_N.22 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 42
  %RBP_N.14 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 43
  %RBP_N.13 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 51
  %RBP_N.5 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %9 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.13, align 1
  %memload1 = load i8, ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  store i8 %memload1, ptr %RBP_N.5, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 13), align 1, !ROData_Content !3
  store i64 %memload2, ptr %RBP_N.22, align 1
  %memload3 = load i8, ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 21), align 1, !ROData_Content !4
  store i8 %memload3, ptr %RBP_N.14, align 1
  store i32 0, ptr %RBP_N.28, align 1
  store i32 0, ptr %RBP_N.32, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.8
  %10 = load i32, ptr %RBP_N.32, align 1
  %11 = zext i32 %10 to i64
  %12 = zext i32 3 to i64
  %13 = sub i64 %11, %12
  %14 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %11, i64 %12)
  %CF = extractvalue { i64, i1 } %14, 1
  %ZF = icmp eq i64 %13, 0
  %highbit = and i64 -9223372036854775808, %13
  %SF = icmp ne i64 %highbit, 0
  %15 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %11, i64 %12)
  %OF = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %13, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF = icmp eq i64 %18, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.9, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.7
  %19 = load i32, ptr %RBP_N.36, align 1
  %20 = zext i32 %19 to i64
  %21 = zext i32 3 to i64
  %22 = sub i64 %20, %21
  %23 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %20, i64 %21)
  %CF4 = extractvalue { i64, i1 } %23, 1
  %ZF5 = icmp eq i64 %22, 0
  %highbit6 = and i64 -9223372036854775808, %22
  %SF7 = icmp ne i64 %highbit6, 0
  %24 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %20, i64 %21)
  %OF8 = extractvalue { i64, i1 } %24, 1
  %25 = and i64 %22, 255
  %26 = call i64 @llvm.ctpop.i64(i64 %25)
  %27 = and i64 %26, 1
  %PF9 = icmp eq i64 %27, 0
  %ZFCmp_JG66 = icmp eq i1 %ZF5, false
  %SFOFCmp_JG67 = icmp eq i1 %SF7, %OF8
  %ZFAndSFOF_JG68 = and i1 %ZFCmp_JG66, %SFOFCmp_JG67
  br i1 %ZFAndSFOF_JG68, label %bb.8, label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload10 = load i64, ptr %RBP_N.32, align 1
  %28 = trunc i64 %memload10 to i32
  %RCX = sext i32 %28 to i64
  %RAX = ptrtoint ptr %RBP_N.13 to i64
  %RCX12 = mul i64 %RCX, 3
  %29 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 3)
  %OF11 = extractvalue { i64, i1 } %29, 1
  %RAX16 = add nsw i64 %RAX, %RCX12
  %highbit13 = and i64 -9223372036854775808, %RAX16
  %SF14 = icmp ne i64 %highbit13, 0
  %ZF15 = icmp eq i64 %RAX16, 0
  %memload17 = load i64, ptr %RBP_N.36, align 1
  %30 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %30 to i64
  %memref-basereg = add i64 %RAX16, %RCX18
  %31 = inttoptr i64 %memref-basereg to ptr
  %memload19 = load i8, ptr %31, align 1
  store i8 %memload19, ptr %RBP_N.37, align 1
  %memload20 = load i64, ptr %RBP_N.32, align 1
  %32 = trunc i64 %memload20 to i32
  %RCX21 = sext i32 %32 to i64
  %RAX22 = ptrtoint ptr %RBP_N.13 to i64
  %RCX24 = mul i64 %RCX21, 3
  %33 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX21, i64 3)
  %OF23 = extractvalue { i64, i1 } %33, 1
  %RAX28 = add nsw i64 %RAX22, %RCX24
  %highbit25 = and i64 -9223372036854775808, %RAX28
  %SF26 = icmp ne i64 %highbit25, 0
  %ZF27 = icmp eq i64 %RAX28, 0
  %memload29 = load i64, ptr %RBP_N.36, align 1
  %34 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %34 to i64
  %memref-basereg31 = add i64 %RAX28, %RCX30
  %35 = inttoptr i64 %memref-basereg31 to ptr
  %memload32 = load i32, ptr %35, align 1
  %36 = trunc i32 %memload32 to i8
  %ESI = sext i8 %36 to i32
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 22), i32 %ESI)
  %memload33 = load i32, ptr %RBP_N.37, align 1
  %37 = trunc i32 %memload33 to i8
  %EAX34 = sext i8 %37 to i32
  %38 = sub i32 %EAX34, 106
  %39 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX34, i32 106)
  %CF35 = extractvalue { i32, i1 } %39, 1
  %ZF36 = icmp eq i32 %38, 0
  %highbit37 = and i32 -2147483648, %38
  %SF38 = icmp ne i32 %highbit37, 0
  %40 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX34, i32 106)
  %OF39 = extractvalue { i32, i1 } %40, 1
  %41 = and i32 %38, 255
  %42 = call i32 @llvm.ctpop.i32(i32 %41)
  %43 = and i32 %42, 1
  %PF40 = icmp eq i32 %43, 0
  %CmpZF_JNE = icmp eq i1 %ZF36, false
  br i1 %CmpZF_JNE, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  store i32 1, ptr %RBP_N.28, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  br label %bb.7

bb.7:                                             ; preds = %bb.6
  %memload41 = load i32, ptr %RBP_N.36, align 1
  %EAX48 = add i32 %memload41, 1
  %44 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload41, i32 1)
  %CF42 = extractvalue { i32, i1 } %44, 1
  %45 = and i32 %EAX48, 255
  %46 = call i32 @llvm.ctpop.i32(i32 %45)
  %47 = and i32 %46, 1
  %PF43 = icmp eq i32 %47, 0
  %ZF44 = icmp eq i32 %EAX48, 0
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %48 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload41, i32 1)
  %OF47 = extractvalue { i32, i1 } %48, 1
  store i32 %EAX48, ptr %RBP_N.36, align 1
  br label %bb.3

bb.8:                                             ; preds = %bb.3
  %EAX49 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 97))
  %memload50 = load i32, ptr %RBP_N.32, align 1
  %EAX57 = add i32 %memload50, 1
  %49 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload50, i32 1)
  %CF51 = extractvalue { i32, i1 } %49, 1
  %50 = and i32 %EAX57, 255
  %51 = call i32 @llvm.ctpop.i32(i32 %50)
  %52 = and i32 %51, 1
  %PF52 = icmp eq i32 %52, 0
  %ZF53 = icmp eq i32 %EAX57, 0
  %highbit54 = and i32 -2147483648, %EAX57
  %SF55 = icmp ne i32 %highbit54, 0
  %53 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload50, i32 1)
  %OF56 = extractvalue { i32, i1 } %53, 1
  store i32 %EAX57, ptr %RBP_N.32, align 1
  br label %bb.1

bb.9:                                             ; preds = %bb.1
  %54 = load i32, ptr %RBP_N.28, align 1
  %55 = zext i32 %54 to i64
  %56 = zext i32 1 to i64
  %57 = sub i64 %55, %56
  %58 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %55, i64 %56)
  %CF58 = extractvalue { i64, i1 } %58, 1
  %ZF59 = icmp eq i64 %57, 0
  %highbit60 = and i64 -9223372036854775808, %57
  %SF61 = icmp ne i64 %highbit60, 0
  %59 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %55, i64 %56)
  %OF62 = extractvalue { i64, i1 } %59, 1
  %60 = and i64 %57, 255
  %61 = call i64 @llvm.ctpop.i64(i64 %60)
  %62 = and i64 %61, 1
  %PF63 = icmp eq i64 %62, 0
  %CmpZF_JNE69 = icmp eq i1 %ZF59, false
  br i1 %CmpZF_JNE69, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX64 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 25))
  br label %bb.11

bb.11:                                            ; preds = %bb.10, %bb.9
  %memload65 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload65
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 13)}
!4 = !{ptr getelementptr inbounds ([99 x i8], ptr @rodata_15, i32 0, i32 21)}
