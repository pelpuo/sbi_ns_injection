; ModuleID = './bin/oobr_direct_index_integer'
source_filename = "./bin/oobr_direct_index_integer"

@rodata_15 = private unnamed_addr constant [175 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00Last element of arr2 is: %d\0A\00Out of bounds read: %d\0A\00Test Failed: Simple Integer Array Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.56 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 40
  %RBP_N.32 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 48
  %RBP_N.24 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 56
  %RBP_N.16 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %7 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %7, align 8
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.32, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.24, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i32 %memload2, ptr %RBP_N.16, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 48), align 1, !ROData_Content !4
  store i64 %memload3, ptr %stktop_8, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 56), align 1, !ROData_Content !5
  store i64 %memload4, ptr %RBP_N.56, align 1
  %memload5 = load i32, ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 64), align 1, !ROData_Content !6
  store i32 %memload5, ptr %RBP_N.48, align 1
  %memload6 = load i32, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 68), i32 %memload6)
  %memload7 = load i32, ptr %7, align 1
  %EAX8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 97), i32 %memload7)
  %8 = getelementptr i8, ptr %7, i64 4
  %memload9 = load i32, ptr %8, align 1
  %EAX10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 97), i32 %memload9)
  %9 = load i32, ptr %7, align 1
  %10 = zext i32 %9 to i64
  %11 = zext i32 0 to i64
  %12 = sub i64 %10, %11
  %13 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %10, i64 %11)
  %CF = extractvalue { i64, i1 } %13, 1
  %ZF = icmp eq i64 %12, 0
  %highbit = and i64 -9223372036854775808, %12
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %10, i64 %11)
  %OF = extractvalue { i64, i1 } %14, 1
  %15 = and i64 %12, 255
  %16 = call i64 @llvm.ctpop.i64(i64 %15)
  %17 = and i64 %16, 1
  %PF = icmp eq i64 %17, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %18 = getelementptr i8, ptr %7, i64 4
  %19 = load i32, ptr %18, align 1
  %20 = zext i32 %19 to i64
  %21 = zext i32 0 to i64
  %22 = sub i64 %20, %21
  %23 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %20, i64 %21)
  %CF11 = extractvalue { i64, i1 } %23, 1
  %ZF12 = icmp eq i64 %22, 0
  %highbit13 = and i64 -9223372036854775808, %22
  %SF14 = icmp ne i64 %highbit13, 0
  %24 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %20, i64 %21)
  %OF15 = extractvalue { i64, i1 } %24, 1
  %25 = and i64 %22, 255
  %26 = call i64 @llvm.ctpop.i64(i64 %25)
  %27 = and i64 %26, 1
  %PF16 = icmp eq i64 %27, 0
  %CmpZF_JE = icmp eq i1 %ZF12, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 121))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 32)}
!4 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 48)}
!5 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 56)}
!6 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 64)}
