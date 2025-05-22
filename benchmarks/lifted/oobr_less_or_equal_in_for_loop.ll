; ModuleID = './bin/oobr_less_or_equal_in_for_loop'
source_filename = "./bin/oobr_less_or_equal_in_for_loop"

@rodata_15 = private unnamed_addr constant [151 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00Index %d: %d\0A\00Test Failed: Incorrect condition in loop causing Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.72 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.68 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.64 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.56 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.48 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.32 = bitcast i8* %5 to i64*
  %6 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.24 = bitcast i8* %6 to i64*
  %7 = getelementptr i8, i8* %stktop_8, i64 72
  %RBP_N.16 = bitcast i8* %7 to i32*
  %8 = getelementptr i8, i8* %stktop_8, i64 84
  %RBP_N.4 = bitcast i8* %8 to i32*
  %9 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %9 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %10 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %10, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.32, align 1
  %11 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %11, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.24, align 1
  %12 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* %12, align 1, !ROData_Content !6
  store i32 %memload2, i32* %RBP_N.16, align 1
  %13 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* %13, align 1, !ROData_Content !8
  store i64 %memload3, i64* %RBP_N.64, align 1
  %14 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 56) to i64*, !ROData_Index !9
  %memload4 = load i64, i64* %14, align 1, !ROData_Content !10
  store i64 %memload4, i64* %RBP_N.56, align 1
  %15 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 64) to i32*, !ROData_Index !11
  %memload5 = load i32, i32* %15, align 1, !ROData_Content !12
  store i32 %memload5, i32* %RBP_N.48, align 1
  store i32 5, i32* %RBP_N.68, align 1
  store i32 0, i32* %RBP_N.72, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.6
  %memload6 = load i32, i32* %RBP_N.72, align 1
  %16 = load i32, i32* %RBP_N.68, align 1
  %17 = sub i32 %memload6, %16
  %18 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload6, i32 %16)
  %CF = extractvalue { i32, i1 } %18, 1
  %ZF = icmp eq i32 %17, 0
  %highbit = and i32 -2147483648, %17
  %SF = icmp ne i32 %highbit, 0
  %19 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload6, i32 %16)
  %OF = extractvalue { i32, i1 } %19, 1
  %20 = and i32 %17, 255
  %21 = call i32 @llvm.ctpop.i32(i32 %20)
  %22 = and i32 %21, 1
  %PF = icmp eq i32 %22, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload7 = load i32, i32* %RBP_N.72, align 1
  %23 = bitcast i32* %RBP_N.72 to i64*
  %memload8 = load i64, i64* %23, align 1
  %24 = trunc i64 %memload8 to i32
  %RAX = sext i32 %24 to i64
  %sc-m = mul i64 4, %RAX
  %25 = bitcast i64* %RBP_N.64 to i8*
  %26 = getelementptr i8, i8* %25, i64 %sc-m
  %27 = bitcast i8* %26 to i64*
  %28 = bitcast i64* %27 to i32*
  %memload9 = load i32, i32* %28, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 68), i32 %memload7, i32 %memload9)
  %memload10 = load i32, i32* %RBP_N.72, align 1
  %29 = load i32, i32* %RBP_N.68, align 1
  %30 = sub i32 %memload10, %29
  %31 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %29)
  %CF11 = extractvalue { i32, i1 } %31, 1
  %ZF12 = icmp eq i32 %30, 0
  %highbit13 = and i32 -2147483648, %30
  %SF14 = icmp ne i32 %highbit13, 0
  %32 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %29)
  %OF15 = extractvalue { i32, i1 } %32, 1
  %33 = and i32 %30, 255
  %34 = call i32 @llvm.ctpop.i32(i32 %33)
  %35 = and i32 %34, 1
  %PF16 = icmp eq i32 %35, 0
  %CmpZF_JNE = icmp eq i1 %ZF12, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.3

bb.3:                                             ; preds = %bb.2
  %36 = bitcast i32* %RBP_N.72 to i64*
  %memload17 = load i64, i64* %36, align 1
  %37 = trunc i64 %memload17 to i32
  %RAX18 = sext i32 %37 to i64
  %sc-m19 = mul i64 4, %RAX18
  %38 = bitcast i64* %RBP_N.64 to i8*
  %39 = getelementptr i8, i8* %38, i64 %sc-m19
  %40 = bitcast i8* %39 to i64*
  %41 = load i64, i64* %40, align 1
  %42 = sub i64 %41, 0
  %43 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %41, i64 0)
  %CF21 = extractvalue { i64, i1 } %43, 1
  %ZF22 = icmp eq i64 %42, 0
  %highbit23 = and i64 -9223372036854775808, %42
  %SF24 = icmp ne i64 %highbit23, 0
  %44 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %41, i64 0)
  %OF25 = extractvalue { i64, i1 } %44, 1
  %45 = and i64 %42, 255
  %46 = call i64 @llvm.ctpop.i64(i64 %45)
  %47 = and i64 %46, 1
  %PF26 = icmp eq i64 %47, 0
  %CmpZF_JE = icmp eq i1 %ZF22, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 82))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3, %bb.2
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload28 = load i32, i32* %RBP_N.72, align 1
  %EAX35 = add i32 %memload28, 1
  %48 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload28, i32 1)
  %CF29 = extractvalue { i32, i1 } %48, 1
  %49 = and i32 %EAX35, 255
  %50 = call i32 @llvm.ctpop.i32(i32 %49)
  %51 = and i32 %50, 1
  %PF30 = icmp eq i32 %51, 0
  %ZF31 = icmp eq i32 %EAX35, 0
  %highbit32 = and i32 -2147483648, %EAX35
  %SF33 = icmp ne i32 %highbit32, 0
  %52 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload28, i32 1)
  %OF34 = extractvalue { i32, i1 } %52, 1
  store i32 %EAX35, i32* %RBP_N.72, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 48)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 56)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 64)}
!12 = !{!11}
