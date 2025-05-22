; ModuleID = './bin/oobw_using_for_loop'
source_filename = "./bin/oobw_using_for_loop"

@rodata_15 = private unnamed_addr constant [170 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00This is the second string\00random\00String 1 length is: %d\0A\00String 2 length is: %d\0A\00String 1 is: %s\0A\00Test Failed: Out of Bounds Write using simple for loop\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.52 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.44 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 33
  %RBP_N.39 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 37
  %RBP_N.35 = bitcast i8* %4 to i16*
  %RBP_N.33 = getelementptr i8, i8* %stktop_8, i64 39
  %5 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.32 = bitcast i8* %5 to i64*
  %6 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.24 = bitcast i8* %6 to i64*
  %7 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.16 = bitcast i8* %7 to i64*
  %8 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.8 = bitcast i8* %8 to i16*
  %9 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %9 to i32*
  %10 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %10 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %11 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %11, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.32, align 1
  %12 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %12, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.24, align 1
  %13 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* %13, align 1, !ROData_Content !6
  store i64 %memload2, i64* %RBP_N.16, align 1
  %14 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 40) to i16*, !ROData_Index !7
  %memload3 = load i16, i16* %14, align 1, !ROData_Content !8
  store i16 %memload3, i16* %RBP_N.8, align 1
  %15 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 42) to i32*, !ROData_Index !9
  %memload4 = load i32, i32* %15, align 1, !ROData_Content !10
  store i32 %memload4, i32* %RBP_N.39, align 1
  %16 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 46) to i16*, !ROData_Index !11
  %memload5 = load i16, i16* %16, align 1, !ROData_Content !12
  store i16 %memload5, i16* %RBP_N.35, align 1
  %memload6 = load i8, i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 48), align 1, !ROData_Content !13
  store i8 %memload6, i8* %RBP_N.33, align 1
  store i32 26, i32* %RBP_N.44, align 1
  store i32 7, i32* %RBP_N.48, align 1
  %memload7 = load i32, i32* %RBP_N.44, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 49), i32 %memload7)
  %memload8 = load i32, i32* %RBP_N.48, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 73), i32 %memload8)
  store i32 0, i32* %RBP_N.52, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload10 = load i32, i32* %RBP_N.52, align 1
  %17 = load i32, i32* %RBP_N.44, align 1
  %18 = sub i32 %memload10, %17
  %19 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %17)
  %CF = extractvalue { i32, i1 } %19, 1
  %ZF = icmp eq i32 %18, 0
  %highbit = and i32 -2147483648, %18
  %SF = icmp ne i32 %highbit, 0
  %20 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %17)
  %OF = extractvalue { i32, i1 } %20, 1
  %21 = and i32 %18, 255
  %22 = call i32 @llvm.ctpop.i32(i32 %21)
  %23 = and i32 %22, 1
  %PF = icmp eq i32 %23, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %24 = bitcast i32* %RBP_N.52 to i64*
  %memload11 = load i64, i64* %24, align 1
  %25 = trunc i64 %memload11 to i32
  %RAX = sext i32 %25 to i64
  %26 = bitcast i32* %RBP_N.39 to i8*
  %27 = getelementptr i8, i8* %26, i64 %RAX
  %28 = bitcast i8* %27 to i32*
  %29 = bitcast i32* %28 to i8*
  store i8 120, i8* %29, align 1
  %memload12 = load i32, i32* %RBP_N.52, align 1
  %EAX19 = add i32 %memload12, 1
  %30 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload12, i32 1)
  %CF13 = extractvalue { i32, i1 } %30, 1
  %31 = and i32 %EAX19, 255
  %32 = call i32 @llvm.ctpop.i32(i32 %31)
  %33 = and i32 %32, 1
  %PF14 = icmp eq i32 %33, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %34 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload12, i32 1)
  %OF18 = extractvalue { i32, i1 } %34, 1
  store i32 %EAX19, i32* %RBP_N.52, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint i64* %RBP_N.32 to i64
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 97), i64 %RSI)
  %35 = bitcast i64* %RBP_N.32 to i32*
  %memload21 = load i32, i32* %35, align 1
  %36 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %36 to i32
  %37 = sub i32 %EAX22, 120
  %38 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 120)
  %CF23 = extractvalue { i32, i1 } %38, 1
  %ZF24 = icmp eq i32 %37, 0
  %highbit25 = and i32 -2147483648, %37
  %SF26 = icmp ne i32 %highbit25, 0
  %39 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 120)
  %OF27 = extractvalue { i32, i1 } %39, 1
  %40 = and i32 %37, 255
  %41 = call i32 @llvm.ctpop.i32(i32 %40)
  %42 = and i32 %41, 1
  %PF28 = icmp eq i32 %42, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 114))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  ret i32 0
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
!1 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 40)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 42)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 46)}
!12 = !{!11}
!13 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 48)}
