; ModuleID = './bin/oobw_direct_index_integer'
source_filename = "./bin/oobw_direct_index_integer"

@rodata_15 = private unnamed_addr constant [132 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Direct int array Out of Bounds Write\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.68 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.64 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.56 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.48 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.32 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.24 = bitcast i8* %5 to i64*
  %6 = getelementptr i8, i8* %stktop_8, i64 72
  %RBP_N.16 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 84
  %RBP_N.4 = bitcast i8* %7 to i32*
  %8 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %8 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  store i32 0, i32* %RBP_N.4, align 1
  %9 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %9, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.32, align 1
  %10 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %10, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.24, align 1
  %11 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* %11, align 1, !ROData_Content !6
  store i32 %memload2, i32* %RBP_N.16, align 1
  %12 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* %12, align 1, !ROData_Content !8
  store i64 %memload3, i64* %RBP_N.64, align 1
  %13 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 56) to i64*, !ROData_Index !9
  %memload4 = load i64, i64* %13, align 1, !ROData_Content !10
  store i64 %memload4, i64* %RBP_N.56, align 1
  %14 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 64) to i32*, !ROData_Index !11
  %memload5 = load i32, i32* %14, align 1, !ROData_Content !12
  store i32 %memload5, i32* %RBP_N.48, align 1
  %RSI = ptrtoint i64* %RBP_N.32 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 68), i64 %RSI)
  %RSI6 = ptrtoint i64* %RBP_N.64 to i64
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 72), i64 %RSI6)
  %15 = bitcast i64* %RSP_P.0 to i32*
  store i32 420, i32* %15, align 1
  store i32 0, i32* %RBP_N.68, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %16 = load i32, i32* %RBP_N.68, align 1
  %17 = zext i32 %16 to i64
  %18 = zext i32 5 to i64
  %19 = sub i64 %17, %18
  %20 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %17, i64 %18)
  %CF = extractvalue { i64, i1 } %20, 1
  %ZF = icmp eq i64 %19, 0
  %highbit = and i64 -9223372036854775808, %19
  %SF = icmp ne i64 %highbit, 0
  %21 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %17, i64 %18)
  %OF = extractvalue { i64, i1 } %21, 1
  %22 = and i64 %19, 255
  %23 = call i64 @llvm.ctpop.i64(i64 %22)
  %24 = and i64 %23, 1
  %PF = icmp eq i64 %24, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %25 = bitcast i32* %RBP_N.68 to i64*
  %memload8 = load i64, i64* %25, align 1
  %26 = trunc i64 %memload8 to i32
  %RAX = sext i32 %26 to i64
  %sc-m = mul i64 4, %RAX
  %27 = bitcast i64* %RBP_N.64 to i8*
  %28 = getelementptr i8, i8* %27, i64 %sc-m
  %29 = bitcast i8* %28 to i64*
  %30 = bitcast i64* %29 to i32*
  %memload9 = load i32, i32* %30, align 1
  %EAX10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 77), i32 %memload9)
  %memload11 = load i32, i32* %RBP_N.68, align 1
  %EAX18 = add i32 %memload11, 1
  %31 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload11, i32 1)
  %CF12 = extractvalue { i32, i1 } %31, 1
  %32 = and i32 %EAX18, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %32)
  %34 = and i32 %33, 1
  %PF13 = icmp eq i32 %34, 0
  %ZF14 = icmp eq i32 %EAX18, 0
  %highbit15 = and i32 -2147483648, %EAX18
  %SF16 = icmp ne i32 %highbit15, 0
  %35 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload11, i32 1)
  %OF17 = extractvalue { i32, i1 } %35, 1
  store i32 %EAX18, i32* %RBP_N.68, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 75))
  %36 = load i64, i64* %RBP_N.64, align 1
  %37 = sub i64 %36, 420
  %38 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %36, i64 420)
  %CF20 = extractvalue { i64, i1 } %38, 1
  %ZF21 = icmp eq i64 %37, 0
  %highbit22 = and i64 -9223372036854775808, %37
  %SF23 = icmp ne i64 %highbit22, 0
  %39 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %36, i64 420)
  %OF24 = extractvalue { i64, i1 } %39, 1
  %40 = and i64 %37, 255
  %41 = call i64 @llvm.ctpop.i64(i64 %40)
  %42 = and i64 %41, 1
  %PF25 = icmp eq i64 %42, 0
  %CmpZF_JNE = icmp eq i1 %ZF21, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 81))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
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
!1 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 48)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 56)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 64)}
!12 = !{!11}
