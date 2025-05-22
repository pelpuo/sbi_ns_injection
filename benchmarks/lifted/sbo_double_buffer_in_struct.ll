; ModuleID = './bin/sbo_double_buffer_in_struct'
source_filename = "./bin/sbo_double_buffer_in_struct"

@rodata_15 = private unnamed_addr constant [148 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\1F\85\EBQ\B8\1E\09@\AEG\E1z\14\AE\05@\8F\C2\F5(\\\8F\F6?\AEG\E1z\14\AE\FB?Test Failed: Stack Buffer Overflow within elements of struct with different sizes\0A\00Flag is normal.\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.72 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.64 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.56 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.48 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.40 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.32 = bitcast i8* %5 to double*
  %6 = getelementptr i8, i8* %stktop_8, i64 72
  %RBP_N.16 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 84
  %RBP_N.4 = bitcast i8* %7 to i32*
  %8 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %8 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 0, i32* %RBP_N.16, align 1
  %9 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %9, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.64, align 1
  %10 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %10, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.56, align 1
  %11 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* %11, align 1, !ROData_Content !6
  store i64 %memload2, i64* %RBP_N.48, align 1
  %12 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* %12, align 1, !ROData_Content !8
  store i64 %memload3, i64* %RBP_N.40, align 1
  %13 = sext i32 0 to i64
  store i64 %13, i64* %RBP_N.72, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %14 = load i64, i64* %RBP_N.72, align 1
  %15 = sub i64 %14, 4
  %16 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %14, i64 4)
  %CF = extractvalue { i64, i1 } %16, 1
  %ZF = icmp eq i64 %15, 0
  %highbit = and i64 -9223372036854775808, %15
  %SF = icmp ne i64 %highbit, 0
  %17 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %14, i64 4)
  %OF = extractvalue { i64, i1 } %17, 1
  %18 = and i64 %15, 255
  %19 = call i64 @llvm.ctpop.i64(i64 %18)
  %20 = and i64 %19, 1
  %PF = icmp eq i64 %20, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i64, i64* %RBP_N.72, align 1
  %sc-m = mul i64 8, %memload4
  %21 = bitcast i64* %RBP_N.64 to i8*
  %22 = getelementptr i8, i8* %21, i64 %sc-m
  %23 = bitcast i8* %22 to i64*
  %24 = bitcast i64* %23 to double*
  %memload5 = load double, double* %24, align 1
  %memload6 = load i64, i64* %RBP_N.72, align 1
  %25 = ptrtoint double* %RBP_N.32 to i64
  %sc-m7 = mul i64 8, %memload6
  %idx-a8 = add i64 %25, %sc-m7
  %26 = inttoptr i64 %idx-a8 to double*
  store double %memload5, double* %26, align 1
  %memload9 = load i64, i64* %RBP_N.72, align 1
  %RAX = add i64 %memload9, 1
  %27 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload9, i64 1)
  %CF10 = extractvalue { i64, i1 } %27, 1
  %28 = and i64 %RAX, 255
  %29 = call i64 @llvm.ctpop.i64(i64 %28)
  %30 = and i64 %29, 1
  %PF11 = icmp eq i64 %30, 0
  %ZF12 = icmp eq i64 %RAX, 0
  %highbit13 = and i64 -9223372036854775808, %RAX
  %SF14 = icmp ne i64 %highbit13, 0
  %31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload9, i64 1)
  %OF15 = extractvalue { i64, i1 } %31, 1
  store i64 %RAX, i64* %RBP_N.72, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %32 = load i32, i32* %RBP_N.16, align 1
  %33 = zext i32 %32 to i64
  %34 = zext i32 0 to i64
  %35 = sub i64 %33, %34
  %36 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %33, i64 %34)
  %CF16 = extractvalue { i64, i1 } %36, 1
  %ZF17 = icmp eq i64 %35, 0
  %highbit18 = and i64 -9223372036854775808, %35
  %SF19 = icmp ne i64 %highbit18, 0
  %37 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %33, i64 %34)
  %OF20 = extractvalue { i64, i1 } %37, 1
  %38 = and i64 %35, 255
  %39 = call i64 @llvm.ctpop.i64(i64 %38)
  %40 = and i64 %39, 1
  %PF21 = icmp eq i64 %40, 0
  %CmpZF_JE = icmp eq i1 %ZF17, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 48))
  br label %bb.6

bb.5:                                             ; preds = %bb.3
  %EAX22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 131))
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
!1 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 40)}
!8 = !{!7}
