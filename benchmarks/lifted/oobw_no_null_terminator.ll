; ModuleID = './bin/oobw_no_null_terminator'
source_filename = "./bin/oobw_no_null_terminator"

@rodata_15 = private unnamed_addr constant [120 x i8] c"\01\00\02\00PUBLICVALUABLEDATA\00Str1: %s\0A\00Str2: %s\0A\00Test Failed: Missing null terminator in string leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

define dso_local void @choice(i64 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 16, align 1
  %RBP_N.8 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %0 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i64 %arg1, i64* %RBP_N.8, align 1
  ret void
}

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 21
  %RBP_N.19 = bitcast i8* %0 to i32*
  %RBP_N.15 = getelementptr i8, i8* %stktop_8, i64 25
  %1 = getelementptr i8, i8* %stktop_8, i64 26
  %RBP_N.14 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 30
  %RBP_N.10 = bitcast i8* %2 to i16*
  %3 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.8 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.4 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %5 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 0, i32* %RBP_N.8, align 1
  %6 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* %6, align 1, !ROData_Content !2
  store i32 %memload, i32* %RBP_N.14, align 1
  %7 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* %7, align 1, !ROData_Content !4
  store i16 %memload1, i16* %RBP_N.10, align 1
  %8 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 10) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !6
  %9 = bitcast i64* %RSPAdj_N.32 to i8*
  %10 = getelementptr i8, i8* %9, i64 5
  %11 = bitcast i8* %10 to i64*
  store i64 %memload2, i64* %11, align 1
  %12 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 18) to i32*, !ROData_Index !7
  %memload3 = load i32, i32* %12, align 1, !ROData_Content !8
  store i32 %memload3, i32* %RBP_N.19, align 1
  %memload4 = load i8, i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 22), align 1, !ROData_Content !9
  store i8 %memload4, i8* %RBP_N.15, align 1
  %13 = bitcast i64* %RSPAdj_N.32 to i32*
  store i32 0, i32* %13, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload5 = load i64, i64* %RSPAdj_N.32, align 1
  %14 = trunc i64 %memload5 to i32
  %RAX = sext i32 %14 to i64
  %15 = bitcast i32* %RBP_N.14 to i8*
  %16 = getelementptr i8, i8* %15, i64 %RAX
  %17 = bitcast i8* %16 to i32*
  %memload6 = load i32, i32* %17, align 1
  %18 = trunc i32 %memload6 to i8
  %EAX = sext i8 %18 to i32
  %19 = sub i32 %EAX, 0
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX, i32 0)
  %CF = extractvalue { i32, i1 } %20, 1
  %ZF = icmp eq i32 %19, 0
  %highbit = and i32 -2147483648, %19
  %SF = icmp ne i32 %highbit, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX, i32 0)
  %OF = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF = icmp eq i32 %24, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload7 = load i64, i64* %RSPAdj_N.32, align 1
  %25 = trunc i64 %memload7 to i32
  %RAX8 = sext i32 %25 to i64
  %26 = bitcast i32* %RBP_N.14 to i8*
  %27 = getelementptr i8, i8* %26, i64 %RAX8
  %28 = bitcast i8* %27 to i32*
  %29 = bitcast i32* %28 to i8*
  store i8 88, i8* %29, align 1
  %30 = bitcast i64* %RSPAdj_N.32 to i32*
  %memload10 = load i32, i32* %30, align 1
  %EAX17 = add i32 %memload10, 1
  %31 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload10, i32 1)
  %CF11 = extractvalue { i32, i1 } %31, 1
  %32 = and i32 %EAX17, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %32)
  %34 = and i32 %33, 1
  %PF12 = icmp eq i32 %34, 0
  %ZF13 = icmp eq i32 %EAX17, 0
  %highbit14 = and i32 -2147483648, %EAX17
  %SF15 = icmp ne i32 %highbit14, 0
  %35 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload10, i32 1)
  %OF16 = extractvalue { i32, i1 } %35, 1
  %36 = bitcast i64* %RSPAdj_N.32 to i32*
  store i32 %EAX17, i32* %36, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint i32* %RBP_N.14 to i64
  %EAX18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 23), i64 %RSI)
  %37 = ptrtoint i64* %RSPAdj_N.32 to i64
  %RSI19 = add i64 %37, 5
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 33), i64 %RSI19)
  %38 = bitcast i64* %RSPAdj_N.32 to i8*
  %39 = getelementptr i8, i8* %38, i64 5
  %40 = bitcast i8* %39 to i32*
  %memload21 = load i32, i32* %40, align 1
  %41 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %41 to i32
  %42 = sub i32 %EAX22, 88
  %43 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 88)
  %CF23 = extractvalue { i32, i1 } %43, 1
  %ZF24 = icmp eq i32 %42, 0
  %highbit25 = and i32 -2147483648, %42
  %SF26 = icmp ne i32 %highbit25, 0
  %44 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 88)
  %OF27 = extractvalue { i32, i1 } %44, 1
  %45 = and i32 %42, 255
  %46 = call i32 @llvm.ctpop.i32(i32 %45)
  %47 = and i32 %46, 1
  %PF28 = icmp eq i32 %47, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 43))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload30 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload30
}

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
!1 = !{i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 18)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 22)}
