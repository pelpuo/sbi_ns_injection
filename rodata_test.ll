; ModuleID = 'rodata_test.bc'
source_filename = "./bin/oobr_direct_index_integer"

@rodata_15 = private unnamed_addr constant [175 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00Last element of arr2 is: %d\0A\00Out of bounds read: %d\0A\00Test Failed: Simple Integer Array Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_64 = private constant i32 9
@rodata_15_16 = private constant i64 17179869186
@rodata_15_56 = private constant i64 30064771077
@rodata_15_32 = private constant i32 10
@rodata_15_48 = private constant i64 12884901889
@rodata_15_24 = private constant i64 34359738374

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast ptr %stktop_8 to ptr
  %0 = getelementptr i8, ptr %stktop_8, i64 16
  %RBP_N.56 = bitcast ptr %0 to ptr
  %1 = getelementptr i8, ptr %stktop_8, i64 24
  %RBP_N.48 = bitcast ptr %1 to ptr
  %2 = getelementptr i8, ptr %stktop_8, i64 40
  %RBP_N.32 = bitcast ptr %2 to ptr
  %3 = getelementptr i8, ptr %stktop_8, i64 48
  %RBP_N.24 = bitcast ptr %3 to ptr
  %4 = getelementptr i8, ptr %stktop_8, i64 56
  %RBP_N.16 = bitcast ptr %4 to ptr
  %5 = getelementptr i8, ptr %stktop_8, i64 68
  %RBP_N.4 = bitcast ptr %5 to ptr
  %6 = getelementptr i8, ptr %stktop_8, i64 0
  %RSP_P.0 = bitcast ptr %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  store i32 0, ptr %RBP_N.4, align 1
  %7 = bitcast ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 16) to ptr, !ROData_Index !1
  %memload = load i64, ptr @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, ptr %RBP_N.32, align 1
  %8 = bitcast ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 24) to ptr, !ROData_Index !3
  %memload1 = load i64, ptr @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, ptr %RBP_N.24, align 1
  %9 = bitcast ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 32) to ptr, !ROData_Index !5
  %memload2 = load i32, ptr @rodata_15_32, align 1, !ROData_Content !6
  store i32 %memload2, ptr %RBP_N.16, align 1
  %10 = bitcast ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 48) to ptr, !ROData_Index !7
  %memload3 = load i64, ptr @rodata_15_48, align 1, !ROData_Content !8
  store i64 %memload3, ptr %RSPAdj_N.64, align 1
  %11 = bitcast ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 56) to ptr, !ROData_Index !9
  %memload4 = load i64, ptr @rodata_15_56, align 1, !ROData_Content !10
  store i64 %memload4, ptr %RBP_N.56, align 1
  %12 = bitcast ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 64) to ptr, !ROData_Index !11
  %memload5 = load i32, ptr @rodata_15_64, align 1, !ROData_Content !12
  store i32 %memload5, ptr %RBP_N.48, align 1
  %memload6 = load i32, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 68), i32 %memload6)
  %13 = bitcast ptr %RSP_P.0 to ptr
  %memload7 = load i32, ptr %13, align 1
  %EAX8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 97), i32 %memload7)
  %14 = bitcast ptr %RSP_P.0 to ptr
  %15 = getelementptr i8, ptr %14, i64 4
  %16 = bitcast ptr %15 to ptr
  %memload9 = load i32, ptr %16, align 1
  %EAX10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 97), i32 %memload9)
  %17 = bitcast ptr %RSP_P.0 to ptr
  %18 = load i32, ptr %17, align 1
  %19 = zext i32 %18 to i64
  %20 = zext i32 0 to i64
  %21 = sub i64 %19, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %19, i64 %20)
  %CF = extractvalue { i64, i1 } %22, 1
  %ZF = icmp eq i64 %21, 0
  %highbit = and i64 -9223372036854775808, %21
  %SF = icmp ne i64 %highbit, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %19, i64 %20)
  %OF = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF = icmp eq i64 %26, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %27 = bitcast ptr %RSP_P.0 to ptr
  %28 = getelementptr i8, ptr %27, i64 4
  %29 = bitcast ptr %28 to ptr
  %30 = load i32, ptr %29, align 1
  %31 = zext i32 %30 to i64
  %32 = zext i32 0 to i64
  %33 = sub i64 %31, %32
  %34 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %31, i64 %32)
  %CF11 = extractvalue { i64, i1 } %34, 1
  %ZF12 = icmp eq i64 %33, 0
  %highbit13 = and i64 -9223372036854775808, %33
  %SF14 = icmp ne i64 %highbit13, 0
  %35 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %31, i64 %32)
  %OF15 = extractvalue { i64, i1 } %35, 1
  %36 = and i64 %33, 255
  %37 = call i64 @llvm.ctpop.i64(i64 %36)
  %38 = and i64 %37, 1
  %PF16 = icmp eq i64 %38, 0
  %CmpZF_JE = icmp eq i1 %ZF12, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 121))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 48)}
!8 = !{!7}
!9 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 56)}
!10 = !{!9}
!11 = !{ptr getelementptr inbounds ([175 x i8], ptr @rodata_15, i32 0, i32 64)}
!12 = !{!11}
