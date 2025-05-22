; ModuleID = './bin/oobr_long_read'
source_filename = "./bin/oobr_long_read"

@rodata_15 = private unnamed_addr constant [116 x i8] c"\01\00\02\00PUBLIC\00VALUABLE DATA\00String 1: %s\0A\00String 2: %s\0A\0A\00%x\0A\00Test Failed: Pointer casting leads to Out of Bounds Read\0A\00", align 4, !ROData_SecInfo !0

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
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.56 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.40 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 47
  %RBP_N.25 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 55
  %RBP_N.17 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 59
  %RBP_N.13 = bitcast i8* %5 to i16*
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
  %10 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* %10, align 1, !ROData_Content !2
  store i32 %memload, i32* %RBP_N.11, align 1
  %11 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* %11, align 1, !ROData_Content !4
  store i16 %memload1, i16* %RBP_N.7, align 1
  %memload2 = load i8, i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 10), align 1, !ROData_Content !5
  store i8 %memload2, i8* %RBP_N.5, align 1
  %12 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 11) to i64*, !ROData_Index !6
  %memload3 = load i64, i64* %12, align 1, !ROData_Content !7
  store i64 %memload3, i64* %RBP_N.25, align 1
  %13 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 19) to i32*, !ROData_Index !8
  %memload4 = load i32, i32* %13, align 1, !ROData_Content !9
  store i32 %memload4, i32* %RBP_N.17, align 1
  %14 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 23) to i16*, !ROData_Index !10
  %memload5 = load i16, i16* %14, align 1, !ROData_Content !11
  store i16 %memload5, i16* %RBP_N.13, align 1
  %RAX = ptrtoint i32* %RBP_N.11 to i64
  store i64 %RAX, i64* %RBP_N.40, align 1
  %RAX6 = ptrtoint i64* %RBP_N.25 to i64
  store i64 %RAX6, i64* %RBP_N.48, align 1
  %memload7 = load i64, i64* %RBP_N.40, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 25), i64 %memload7)
  %memload8 = load i64, i64* %RBP_N.48, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 39), i64 %memload8)
  %memload10 = load i64, i64* %RBP_N.40, align 1
  %RAX11 = add i64 %memload10, 5
  %15 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload10, i64 5)
  %CF = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %RAX11, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF = icmp eq i64 %18, 0
  %ZF = icmp eq i64 %RAX11, 0
  %highbit = and i64 -9223372036854775808, %RAX11
  %SF = icmp ne i64 %highbit, 0
  %19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload10, i64 5)
  %OF = extractvalue { i64, i1 } %19, 1
  store i64 %RAX11, i64* %RBP_N.56, align 1
  %memload12 = load i64, i64* %RBP_N.56, align 1
  %20 = inttoptr i64 %memload12 to i32*
  %memload13 = load i32, i32* %20, align 1
  %EAX14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 54), i32 %memload13)
  %memload15 = load i64, i64* %RBP_N.56, align 1
  %21 = inttoptr i64 %memload15 to i32*
  %22 = load i32, i32* %21, align 1
  %23 = zext i32 %22 to i64
  %24 = zext i32 1096155203 to i64
  %25 = sub i64 %23, %24
  %26 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %23, i64 %24)
  %CF16 = extractvalue { i64, i1 } %26, 1
  %ZF17 = icmp eq i64 %25, 0
  %highbit18 = and i64 -9223372036854775808, %25
  %SF19 = icmp ne i64 %highbit18, 0
  %27 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %23, i64 %24)
  %OF20 = extractvalue { i64, i1 } %27, 1
  %28 = and i64 %25, 255
  %29 = call i64 @llvm.ctpop.i64(i64 %28)
  %30 = and i64 %29, 1
  %PF21 = icmp eq i64 %30, 0
  %CmpZF_JNE = icmp eq i1 %ZF17, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 58))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 11)}
!7 = !{!6}
!8 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 19)}
!9 = !{!8}
!10 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 23)}
!11 = !{!10}
