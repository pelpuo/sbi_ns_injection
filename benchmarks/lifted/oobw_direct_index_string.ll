; ModuleID = './bin/oobw_direct_index_string'
source_filename = "./bin/oobw_direct_index_string"

@rodata_15 = private unnamed_addr constant [105 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Direct char array on stack Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %RSPAdj_N.16 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 18
  %RBP_N.6 = bitcast i8* %0 to i16*
  %1 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.4 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %2 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %3 = bitcast i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* %3, align 1, !ROData_Content !2
  %4 = bitcast i64* %RSPAdj_N.16 to i8*
  %5 = getelementptr i8, i8* %4, i64 6
  %6 = bitcast i8* %5 to i32*
  store i32 %memload, i32* %6, align 1
  %7 = bitcast i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* %7, align 1, !ROData_Content !4
  store i16 %memload1, i16* %RBP_N.6, align 1
  %8 = bitcast i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 10) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* %8, align 1, !ROData_Content !6
  %9 = bitcast i64* %RSPAdj_N.16 to i32*
  store i32 %memload2, i32* %9, align 1
  %10 = bitcast i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 14) to i16*, !ROData_Index !7
  %memload3 = load i16, i16* %10, align 1, !ROData_Content !8
  %11 = bitcast i64* %RSPAdj_N.16 to i8*
  %12 = getelementptr i8, i8* %11, i64 4
  %13 = bitcast i8* %12 to i16*
  store i16 %memload3, i16* %13, align 1
  %14 = bitcast i32* %RBP_N.4 to i8*
  store i8 120, i8* %14, align 1
  %15 = ptrtoint i64* %RSPAdj_N.16 to i64
  %RSI = add i64 %15, 6
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 16), i64 %RSI)
  %RSI4 = ptrtoint i64* %RSPAdj_N.16 to i64
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 30), i64 %RSI4)
  %16 = bitcast i64* %RSPAdj_N.16 to i32*
  %memload6 = load i32, i32* %16, align 1
  %17 = trunc i32 %memload6 to i8
  %EAX7 = sext i8 %17 to i32
  %18 = sub i32 %EAX7, 120
  %19 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX7, i32 120)
  %CF = extractvalue { i32, i1 } %19, 1
  %ZF = icmp eq i32 %18, 0
  %highbit = and i32 -2147483648, %18
  %SF = icmp ne i32 %highbit, 0
  %20 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX7, i32 120)
  %OF = extractvalue { i32, i1 } %20, 1
  %21 = and i32 %18, 255
  %22 = call i32 @llvm.ctpop.i32(i32 %21)
  %23 = and i32 %22, 1
  %PF = icmp eq i32 %23, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 44))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([105 x i8], [105 x i8]* @rodata_15, i32 0, i32 14)}
!8 = !{!7}
