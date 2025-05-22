; ModuleID = './bin/oobr_using_for_loop'
source_filename = "./bin/oobr_using_for_loop"

@rodata_15 = private unnamed_addr constant [154 x i8] c"\01\00\02\00random\00String 1 length is: %d\0A\00String 2 length is: %d\0A\00%c\00Test Failed: Out of Bounds Read using simple for loop\0A\00\00\00\00\00\00\00\00\00\00\00\00This is the second string\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.56 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.52 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.40 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.32 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.24 = bitcast i8* %5 to i16*
  %6 = getelementptr i8, i8* %stktop_8, i64 61
  %RBP_N.11 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 65
  %RBP_N.7 = bitcast i8* %7 to i16*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 67
  %8 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %8 to i32*
  %9 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %9 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %10 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* %10, align 1, !ROData_Content !2
  store i32 %memload, i32* %RBP_N.11, align 1
  %11 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* %11, align 1, !ROData_Content !4
  store i16 %memload1, i16* %RBP_N.7, align 1
  %memload2 = load i8, i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 10), align 1, !ROData_Content !5
  store i8 %memload2, i8* %RBP_N.5, align 1
  %12 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 128) to i64*, !ROData_Index !6
  %memload3 = load i64, i64* %12, align 1, !ROData_Content !7
  store i64 %memload3, i64* %RBP_N.48, align 1
  %13 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 136) to i64*, !ROData_Index !8
  %memload4 = load i64, i64* %13, align 1, !ROData_Content !9
  store i64 %memload4, i64* %RBP_N.40, align 1
  %14 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 144) to i64*, !ROData_Index !10
  %memload5 = load i64, i64* %14, align 1, !ROData_Content !11
  store i64 %memload5, i64* %RBP_N.32, align 1
  %15 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 152) to i16*, !ROData_Index !12
  %memload6 = load i16, i16* %15, align 1, !ROData_Content !13
  store i16 %memload6, i16* %RBP_N.24, align 1
  store i32 7, i32* %RBP_N.52, align 1
  store i32 26, i32* %RBP_N.56, align 1
  %memload7 = load i32, i32* %RBP_N.52, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 11), i32 %memload7)
  %memload8 = load i32, i32* %RBP_N.56, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 35), i32 %memload8)
  %16 = bitcast i64* %RSPAdj_N.64 to i8*
  %17 = getelementptr i8, i8* %16, i64 4
  %18 = bitcast i8* %17 to i32*
  store i32 0, i32* %18, align 1
  %19 = bitcast i64* %RSPAdj_N.64 to i32*
  store i32 0, i32* %19, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.6
  %20 = bitcast i64* %RSPAdj_N.64 to i32*
  %memload10 = load i32, i32* %20, align 1
  %21 = load i32, i32* %RBP_N.56, align 1
  %22 = sub i32 %memload10, %21
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %21)
  %CF = extractvalue { i32, i1 } %23, 1
  %ZF = icmp eq i32 %22, 0
  %highbit = and i32 -2147483648, %22
  %SF = icmp ne i32 %highbit, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %21)
  %OF = extractvalue { i32, i1 } %24, 1
  %25 = and i32 %22, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %25)
  %27 = and i32 %26, 1
  %PF = icmp eq i32 %27, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload11 = load i64, i64* %RSPAdj_N.64, align 1
  %28 = trunc i64 %memload11 to i32
  %RAX = sext i32 %28 to i64
  %29 = bitcast i32* %RBP_N.11 to i8*
  %30 = getelementptr i8, i8* %29, i64 %RAX
  %31 = bitcast i8* %30 to i32*
  %memload12 = load i32, i32* %31, align 1
  %32 = trunc i32 %memload12 to i8
  %ESI = sext i8 %32 to i32
  %EAX13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 59), i32 %ESI)
  %33 = bitcast i64* %RSPAdj_N.64 to i32*
  %memload14 = load i32, i32* %33, align 1
  %34 = load i32, i32* %RBP_N.52, align 1
  %35 = sub i32 %memload14, %34
  %36 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload14, i32 %34)
  %CF15 = extractvalue { i32, i1 } %36, 1
  %ZF16 = icmp eq i32 %35, 0
  %highbit17 = and i32 -2147483648, %35
  %SF18 = icmp ne i32 %highbit17, 0
  %37 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload14, i32 %34)
  %OF19 = extractvalue { i32, i1 } %37, 1
  %38 = and i32 %35, 255
  %39 = call i32 @llvm.ctpop.i32(i32 %38)
  %40 = and i32 %39, 1
  %PF20 = icmp eq i32 %40, 0
  %SFAndOF_JL = icmp ne i1 %SF18, %OF19
  br i1 %SFAndOF_JL, label %bb.5, label %bb.3

bb.3:                                             ; preds = %bb.2
  %memload21 = load i64, i64* %RSPAdj_N.64, align 1
  %41 = trunc i64 %memload21 to i32
  %RAX22 = sext i32 %41 to i64
  %42 = bitcast i32* %RBP_N.11 to i8*
  %43 = getelementptr i8, i8* %42, i64 %RAX22
  %44 = bitcast i8* %43 to i32*
  %memload24 = load i32, i32* %44, align 1
  %45 = trunc i32 %memload24 to i8
  %EAX25 = sext i8 %45 to i32
  %46 = sub i32 %EAX25, 0
  %47 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX25, i32 0)
  %CF26 = extractvalue { i32, i1 } %47, 1
  %ZF27 = icmp eq i32 %46, 0
  %highbit28 = and i32 -2147483648, %46
  %SF29 = icmp ne i32 %highbit28, 0
  %48 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX25, i32 0)
  %OF30 = extractvalue { i32, i1 } %48, 1
  %49 = and i32 %46, 255
  %50 = call i32 @llvm.ctpop.i32(i32 %49)
  %51 = and i32 %50, 1
  %PF31 = icmp eq i32 %51, 0
  %CmpZF_JE = icmp eq i1 %ZF27, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %52 = bitcast i64* %RSPAdj_N.64 to i8*
  %53 = getelementptr i8, i8* %52, i64 4
  %54 = bitcast i8* %53 to i32*
  store i32 1, i32* %54, align 1
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3, %bb.2
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %55 = bitcast i64* %RSPAdj_N.64 to i32*
  %memload32 = load i32, i32* %55, align 1
  %EAX39 = add i32 %memload32, 1
  %56 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload32, i32 1)
  %CF33 = extractvalue { i32, i1 } %56, 1
  %57 = and i32 %EAX39, 255
  %58 = call i32 @llvm.ctpop.i32(i32 %57)
  %59 = and i32 %58, 1
  %PF34 = icmp eq i32 %59, 0
  %ZF35 = icmp eq i32 %EAX39, 0
  %highbit36 = and i32 -2147483648, %EAX39
  %SF37 = icmp ne i32 %highbit36, 0
  %60 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload32, i32 1)
  %OF38 = extractvalue { i32, i1 } %60, 1
  %61 = bitcast i64* %RSPAdj_N.64 to i32*
  store i32 %EAX39, i32* %61, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  %EAX40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 33))
  %62 = bitcast i64* %RSPAdj_N.64 to i8*
  %63 = getelementptr i8, i8* %62, i64 4
  %64 = bitcast i8* %63 to i32*
  %65 = load i32, i32* %64, align 1
  %66 = zext i32 %65 to i64
  %67 = zext i32 1 to i64
  %68 = sub i64 %66, %67
  %69 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %66, i64 %67)
  %CF41 = extractvalue { i64, i1 } %69, 1
  %ZF42 = icmp eq i64 %68, 0
  %highbit43 = and i64 -9223372036854775808, %68
  %SF44 = icmp ne i64 %highbit43, 0
  %70 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %66, i64 %67)
  %OF45 = extractvalue { i64, i1 } %70, 1
  %71 = and i64 %68, 255
  %72 = call i64 @llvm.ctpop.i64(i64 %71)
  %73 = and i64 %72, 1
  %PF46 = icmp eq i64 %73, 0
  %CmpZF_JNE = icmp eq i1 %ZF42, false
  br i1 %CmpZF_JNE, label %bb.9, label %bb.8

bb.8:                                             ; preds = %bb.7
  %EAX47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 62))
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.7
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 128)}
!7 = !{!6}
!8 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 136)}
!9 = !{!8}
!10 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 144)}
!11 = !{!10}
!12 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 152)}
!13 = !{!12}
