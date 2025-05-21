; ModuleID = './bin/sbo_double_buffer_in_struct'
source_filename = "./bin/sbo_double_buffer_in_struct"

@rodata_15 = private unnamed_addr constant [148 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\1F\85\EBQ\B8\1E\09@\AEG\E1z\14\AE\05@\8F\C2\F5(\\\8F\F6?\AEG\E1z\14\AE\FB?Test Failed: Stack Buffer Overflow within elements of struct with different sizes\0A\00Flag is normal.\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.72 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.64 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.56 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.48 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 48
  %RBP_N.40 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 56
  %RBP_N.32 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 72
  %RBP_N.16 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 84
  %RBP_N.4 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %8 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i32 0, ptr %RBP_N.16, align 1
  %memload = load i64, ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.64, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.56, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i64 %memload2, ptr %RBP_N.48, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 40), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.40, align 1
  %9 = sext i32 0 to i64
  store i64 %9, ptr %RBP_N.72, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %10 = load i64, ptr %RBP_N.72, align 1
  %11 = sub i64 %10, 4
  %12 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %10, i64 4)
  %CF = extractvalue { i64, i1 } %12, 1
  %ZF = icmp eq i64 %11, 0
  %highbit = and i64 -9223372036854775808, %11
  %SF = icmp ne i64 %highbit, 0
  %13 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %10, i64 4)
  %OF = extractvalue { i64, i1 } %13, 1
  %14 = and i64 %11, 255
  %15 = call i64 @llvm.ctpop.i64(i64 %14)
  %16 = and i64 %15, 1
  %PF = icmp eq i64 %16, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i64, ptr %RBP_N.72, align 1
  %sc-m = mul i64 8, %memload4
  %17 = getelementptr i8, ptr %RBP_N.64, i64 %sc-m
  %memload5 = load double, ptr %17, align 1
  %memload6 = load i64, ptr %RBP_N.72, align 1
  %sc-m7 = mul i64 8, %memload6
  %18 = getelementptr i8, ptr %RBP_N.32, i64 %sc-m7
  store double %memload5, ptr %18, align 1
  %memload9 = load i64, ptr %RBP_N.72, align 1
  %RAX = add i64 %memload9, 1
  %19 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload9, i64 1)
  %CF10 = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %RAX, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF11 = icmp eq i64 %22, 0
  %ZF12 = icmp eq i64 %RAX, 0
  %highbit13 = and i64 -9223372036854775808, %RAX
  %SF14 = icmp ne i64 %highbit13, 0
  %23 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload9, i64 1)
  %OF15 = extractvalue { i64, i1 } %23, 1
  store i64 %RAX, ptr %RBP_N.72, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %24 = load i32, ptr %RBP_N.16, align 1
  %25 = zext i32 %24 to i64
  %26 = zext i32 0 to i64
  %27 = sub i64 %25, %26
  %28 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %25, i64 %26)
  %CF16 = extractvalue { i64, i1 } %28, 1
  %ZF17 = icmp eq i64 %27, 0
  %highbit18 = and i64 -9223372036854775808, %27
  %SF19 = icmp ne i64 %highbit18, 0
  %29 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %25, i64 %26)
  %OF20 = extractvalue { i64, i1 } %29, 1
  %30 = and i64 %27, 255
  %31 = call i64 @llvm.ctpop.i64(i64 %30)
  %32 = and i64 %31, 1
  %PF21 = icmp eq i64 %32, 0
  %CmpZF_JE = icmp eq i1 %ZF17, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 48))
  br label %bb.6

bb.5:                                             ; preds = %bb.3
  %EAX22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 131))
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  ret i32 0
}

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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 32)}
!4 = !{ptr getelementptr inbounds ([148 x i8], ptr @rodata_15, i32 0, i32 40)}
