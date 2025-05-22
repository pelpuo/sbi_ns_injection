; ModuleID = './bin/oobw_negative_array_index'
source_filename = "./bin/oobw_negative_array_index"

@rodata_15 = private unnamed_addr constant [108 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Negative array index leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.24 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.20 = bitcast i8* %1 to i32*
  %RBP_N.19 = getelementptr i8, i8* %stktop_8, i64 21
  %2 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.16 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.12 = bitcast i8* %3 to i16*
  %4 = getelementptr i8, i8* %stktop_8, i64 30
  %RBP_N.10 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 34
  %RBP_N.6 = bitcast i8* %5 to i16*
  %6 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.4 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %7 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %8 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* %8, align 1, !ROData_Content !2
  store i32 %memload, i32* %RBP_N.10, align 1
  %9 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* %9, align 1, !ROData_Content !4
  store i16 %memload1, i16* %RBP_N.6, align 1
  %10 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 10) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* %10, align 1, !ROData_Content !6
  store i32 %memload2, i32* %RBP_N.16, align 1
  %11 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 14) to i16*, !ROData_Index !7
  %memload3 = load i16, i16* %11, align 1, !ROData_Content !8
  store i16 %memload3, i16* %RBP_N.12, align 1
  store i8 88, i8* %RBP_N.19, align 1
  %RSI = ptrtoint i32* %RBP_N.10 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 16), i64 %RSI)
  %RSI4 = ptrtoint i32* %RBP_N.16 to i64
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 30), i64 %RSI4)
  store i32 0, i32* %RBP_N.20, align 1
  store i32 0, i32* %RBP_N.24, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.5
  %12 = load i32, i32* %RBP_N.24, align 1
  %13 = zext i32 %12 to i64
  %14 = zext i32 5 to i64
  %15 = sub i64 %13, %14
  %16 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %13, i64 %14)
  %CF = extractvalue { i64, i1 } %16, 1
  %ZF = icmp eq i64 %15, 0
  %highbit = and i64 -9223372036854775808, %15
  %SF = icmp ne i64 %highbit, 0
  %17 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %13, i64 %14)
  %OF = extractvalue { i64, i1 } %17, 1
  %18 = and i64 %15, 255
  %19 = call i64 @llvm.ctpop.i64(i64 %18)
  %20 = and i64 %19, 1
  %PF = icmp eq i64 %20, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  %21 = bitcast i32* %RBP_N.24 to i64*
  %memload6 = load i64, i64* %21, align 1
  %22 = trunc i64 %memload6 to i32
  %RAX = sext i32 %22 to i64
  %23 = bitcast i32* %RBP_N.10 to i8*
  %24 = getelementptr i8, i8* %23, i64 %RAX
  %25 = bitcast i8* %24 to i32*
  %memload7 = load i32, i32* %25, align 1
  %26 = trunc i32 %memload7 to i8
  %EAX8 = sext i8 %26 to i32
  %27 = sub i32 %EAX8, 88
  %28 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX8, i32 88)
  %CF9 = extractvalue { i32, i1 } %28, 1
  %ZF10 = icmp eq i32 %27, 0
  %highbit11 = and i32 -2147483648, %27
  %SF12 = icmp ne i32 %highbit11, 0
  %29 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX8, i32 88)
  %OF13 = extractvalue { i32, i1 } %29, 1
  %30 = and i32 %27, 255
  %31 = call i32 @llvm.ctpop.i32(i32 %30)
  %32 = and i32 %31, 1
  %PF14 = icmp eq i32 %32, 0
  %CmpZF_JNE = icmp eq i1 %ZF10, false
  br i1 %CmpZF_JNE, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  store i32 1, i32* %RBP_N.20, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  br label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload15 = load i32, i32* %RBP_N.24, align 1
  %EAX22 = add i32 %memload15, 1
  %33 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload15, i32 1)
  %CF16 = extractvalue { i32, i1 } %33, 1
  %34 = and i32 %EAX22, 255
  %35 = call i32 @llvm.ctpop.i32(i32 %34)
  %36 = and i32 %35, 1
  %PF17 = icmp eq i32 %36, 0
  %ZF18 = icmp eq i32 %EAX22, 0
  %highbit19 = and i32 -2147483648, %EAX22
  %SF20 = icmp ne i32 %highbit19, 0
  %37 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload15, i32 1)
  %OF21 = extractvalue { i32, i1 } %37, 1
  store i32 %EAX22, i32* %RBP_N.24, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
  %38 = load i32, i32* %RBP_N.20, align 1
  %39 = zext i32 %38 to i64
  %40 = zext i32 1 to i64
  %41 = sub i64 %39, %40
  %42 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %39, i64 %40)
  %CF23 = extractvalue { i64, i1 } %42, 1
  %ZF24 = icmp eq i64 %41, 0
  %highbit25 = and i64 -9223372036854775808, %41
  %SF26 = icmp ne i64 %highbit25, 0
  %43 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %39, i64 %40)
  %OF27 = extractvalue { i64, i1 } %43, 1
  %44 = and i64 %41, 255
  %45 = call i64 @llvm.ctpop.i64(i64 %44)
  %46 = and i64 %45, 1
  %PF28 = icmp eq i64 %46, 0
  %CmpZF_JNE30 = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE30, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 44))
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

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
!1 = !{i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 14)}
!8 = !{!7}
