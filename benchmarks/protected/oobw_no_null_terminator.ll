; ModuleID = './protected_bc/oobw_no_null_terminator.bc'
source_filename = "./bin/oobw_no_null_terminator"

@rodata_15 = private unnamed_addr constant [120 x i8] c"\01\00\02\00PUBLICVALUABLEDATA\00Str1: %s\0A\00Str2: %s\0A\00Test Failed: Missing null terminator in string leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i32 1279415632
@rodata_15_18 = private constant i32 1096040772
@rodata_15_8 = private constant i16 17225
@rodata_15_22 = private constant i8 0
@rodata_15_10 = private constant i64 4993438935218405718

define dso_local void @choice(i64 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 16, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %RBP_N.8 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i64 %arg1, i64* %RBP_N.8, align 1
  ret void
}

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 30
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 2)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i16*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 26
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 21
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %RBP_N.15 = getelementptr i8, i8* %stktop_8, i64 25
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i32 0, i32* %ns_ptr6, align 1
  %0 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* @rodata_15_4, align 1, !ROData_Content !2
  store i32 %memload, i32* %ns_ptr12, align 1
  %1 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* @rodata_15_8, align 1, !ROData_Content !4
  store i16 %memload1, i16* %ns_ptr9, align 1
  %2 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 10) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* @rodata_15_10, align 1, !ROData_Content !6
  %3 = bitcast i64* %RSPAdj_N.32 to i8*
  %4 = getelementptr i8, i8* %3, i64 5
  %5 = bitcast i8* %4 to i64*
  store i64 %memload2, i64* %5, align 1
  %6 = bitcast i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 18) to i32*, !ROData_Index !7
  %memload3 = load i32, i32* @rodata_15_18, align 1, !ROData_Content !8
  store i32 %memload3, i32* %ns_ptr15, align 1
  %memload4 = load i8, i8* @rodata_15_22, align 1, !ROData_Content !9
  store i8 %memload4, i8* %RBP_N.15, align 1
  %7 = bitcast i64* %RSPAdj_N.32 to i32*
  store i32 0, i32* %7, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %memload5 = load i64, i64* %RSPAdj_N.32, align 1
  %8 = trunc i64 %memload5 to i32
  %RAX = sext i32 %8 to i64
  %9 = bitcast i32* %ns_ptr12 to i8*
  %10 = getelementptr i8, i8* %9, i64 %RAX
  %11 = bitcast i8* %10 to i32*
  %memload6 = load i32, i32* %11, align 1
  %12 = trunc i32 %memload6 to i8
  %EAX = sext i8 %12 to i32
  %13 = sub i32 %EAX, 0
  %14 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX, i32 0)
  %CF = extractvalue { i32, i1 } %14, 1
  %ZF = icmp eq i32 %13, 0
  %highbit = and i32 -2147483648, %13
  %SF = icmp ne i32 %highbit, 0
  %15 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX, i32 0)
  %OF = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %13, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF = icmp eq i32 %18, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload7 = load i64, i64* %RSPAdj_N.32, align 1
  %19 = trunc i64 %memload7 to i32
  %RAX8 = sext i32 %19 to i64
  %20 = bitcast i32* %ns_ptr12 to i8*
  %21 = getelementptr i8, i8* %20, i64 %RAX8
  %22 = bitcast i8* %21 to i32*
  %23 = bitcast i32* %22 to i8*
  store i8 88, i8* %23, align 1
  %24 = bitcast i64* %RSPAdj_N.32 to i32*
  %memload10 = load i32, i32* %24, align 1
  %EAX17 = add i32 %memload10, 1
  %25 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload10, i32 1)
  %CF11 = extractvalue { i32, i1 } %25, 1
  %26 = and i32 %EAX17, 255
  %27 = call i32 @llvm.ctpop.i32(i32 %26)
  %28 = and i32 %27, 1
  %PF12 = icmp eq i32 %28, 0
  %ZF13 = icmp eq i32 %EAX17, 0
  %highbit14 = and i32 -2147483648, %EAX17
  %SF15 = icmp ne i32 %highbit14, 0
  %29 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload10, i32 1)
  %OF16 = extractvalue { i32, i1 } %29, 1
  %30 = bitcast i64* %RSPAdj_N.32 to i32*
  store i32 %EAX17, i32* %30, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint i32* %ns_ptr12 to i64
  %EAX18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 23), i64 %RSI)
  %31 = ptrtoint i64* %RSPAdj_N.32 to i64
  %RSI19 = add i64 %31, 5
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 33), i64 %RSI19)
  %32 = bitcast i64* %RSPAdj_N.32 to i8*
  %33 = getelementptr i8, i8* %32, i64 5
  %34 = bitcast i8* %33 to i32*
  %memload21 = load i32, i32* %34, align 1
  %35 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %35 to i32
  %36 = sub i32 %EAX22, 88
  %37 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 88)
  %CF23 = extractvalue { i32, i1 } %37, 1
  %ZF24 = icmp eq i32 %36, 0
  %highbit25 = and i32 -2147483648, %36
  %SF26 = icmp ne i32 %highbit25, 0
  %38 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 88)
  %OF27 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %36, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF28 = icmp eq i32 %41, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([120 x i8], [120 x i8]* @rodata_15, i32 0, i32 43))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload30 = load i32, i32* %ns_ptr3, align 1
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

declare i8* @zeno_protect(i8*, i64)

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
