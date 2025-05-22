; ModuleID = './bin/oobw_direct_index_integer_long_write'
source_filename = "./bin/oobw_direct_index_integer_long_write"

@rodata_15 = private unnamed_addr constant [152 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Int array on heap using long pointer Out of Bounds Write\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.72 = bitcast i8* %0 to i64*
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
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %9 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %9, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.32, align 1
  %10 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %10, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.24, align 1
  %11 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* %11, align 1, !ROData_Content !6
  store i32 %memload2, i32* %RBP_N.16, align 1
  %12 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* %12, align 1, !ROData_Content !8
  store i64 %memload3, i64* %RBP_N.64, align 1
  %13 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 56) to i64*, !ROData_Index !9
  %memload4 = load i64, i64* %13, align 1, !ROData_Content !10
  store i64 %memload4, i64* %RBP_N.56, align 1
  %14 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 64) to i32*, !ROData_Index !11
  %memload5 = load i32, i32* %14, align 1, !ROData_Content !12
  store i32 %memload5, i32* %RBP_N.48, align 1
  %RSI = ptrtoint i64* %RBP_N.32 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 68), i64 %RSI)
  %RSI6 = ptrtoint i64* %RBP_N.64 to i64
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 72), i64 %RSI6)
  %RAX = ptrtoint i64* %RBP_N.32 to i64
  %RAX8 = add i64 %RAX, 32
  %15 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RAX, i64 32)
  %CF = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %RAX8, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF = icmp eq i64 %18, 0
  %ZF = icmp eq i64 %RAX8, 0
  %highbit = and i64 -9223372036854775808, %RAX8
  %SF = icmp ne i64 %highbit, 0
  %19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RAX, i64 32)
  %OF = extractvalue { i64, i1 } %19, 1
  store i64 %RAX8, i64* %RBP_N.72, align 1
  %memload9 = load i64, i64* %RBP_N.72, align 1
  %20 = inttoptr i64 %memload9 to i64*
  store i64 4919420920202273057, i64* %20, align 1
  %21 = bitcast i64* %RSPAdj_N.80 to i8*
  %22 = getelementptr i8, i8* %21, i64 4
  %23 = bitcast i8* %22 to i32*
  store i32 0, i32* %23, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %24 = bitcast i64* %RSPAdj_N.80 to i8*
  %25 = getelementptr i8, i8* %24, i64 4
  %26 = bitcast i8* %25 to i32*
  %27 = load i32, i32* %26, align 1
  %28 = zext i32 %27 to i64
  %29 = zext i32 5 to i64
  %30 = sub i64 %28, %29
  %31 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %28, i64 %29)
  %CF10 = extractvalue { i64, i1 } %31, 1
  %ZF11 = icmp eq i64 %30, 0
  %highbit12 = and i64 -9223372036854775808, %30
  %SF13 = icmp ne i64 %highbit12, 0
  %32 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %28, i64 %29)
  %OF14 = extractvalue { i64, i1 } %32, 1
  %33 = and i64 %30, 255
  %34 = call i64 @llvm.ctpop.i64(i64 %33)
  %35 = and i64 %34, 1
  %PF15 = icmp eq i64 %35, 0
  %CmpSFOF_JGE = icmp eq i1 %SF13, %OF14
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %36 = bitcast i64* %RSPAdj_N.80 to i8*
  %37 = getelementptr i8, i8* %36, i64 4
  %38 = bitcast i8* %37 to i64*
  %memload16 = load i64, i64* %38, align 1
  %39 = trunc i64 %memload16 to i32
  %RAX17 = sext i32 %39 to i64
  %sc-m = mul i64 4, %RAX17
  %40 = bitcast i64* %RBP_N.64 to i8*
  %41 = getelementptr i8, i8* %40, i64 %sc-m
  %42 = bitcast i8* %41 to i64*
  %43 = bitcast i64* %42 to i32*
  %memload18 = load i32, i32* %43, align 1
  %EAX19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 77), i32 %memload18)
  %44 = bitcast i64* %RSPAdj_N.80 to i8*
  %45 = getelementptr i8, i8* %44, i64 4
  %46 = bitcast i8* %45 to i32*
  %memload20 = load i32, i32* %46, align 1
  %EAX27 = add i32 %memload20, 1
  %47 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload20, i32 1)
  %CF21 = extractvalue { i32, i1 } %47, 1
  %48 = and i32 %EAX27, 255
  %49 = call i32 @llvm.ctpop.i32(i32 %48)
  %50 = and i32 %49, 1
  %PF22 = icmp eq i32 %50, 0
  %ZF23 = icmp eq i32 %EAX27, 0
  %highbit24 = and i32 -2147483648, %EAX27
  %SF25 = icmp ne i32 %highbit24, 0
  %51 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload20, i32 1)
  %OF26 = extractvalue { i32, i1 } %51, 1
  %52 = bitcast i64* %RSPAdj_N.80 to i8*
  %53 = getelementptr i8, i8* %52, i64 4
  %54 = bitcast i8* %53 to i32*
  store i32 %EAX27, i32* %54, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 75))
  %55 = bitcast i64* %RSPAdj_N.80 to i32*
  store i32 0, i32* %55, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.8
  %56 = load i64, i64* %RSPAdj_N.80, align 1
  %57 = sub i64 %56, 5
  %58 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %56, i64 5)
  %CF29 = extractvalue { i64, i1 } %58, 1
  %ZF30 = icmp eq i64 %57, 0
  %highbit31 = and i64 -9223372036854775808, %57
  %SF32 = icmp ne i64 %highbit31, 0
  %59 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %56, i64 5)
  %OF33 = extractvalue { i64, i1 } %59, 1
  %60 = and i64 %57, 255
  %61 = call i64 @llvm.ctpop.i64(i64 %60)
  %62 = and i64 %61, 1
  %PF34 = icmp eq i64 %62, 0
  %CmpSFOF_JGE54 = icmp eq i1 %SF32, %OF33
  br i1 %CmpSFOF_JGE54, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload35 = load i64, i64* %RSPAdj_N.80, align 1
  %63 = trunc i64 %memload35 to i32
  %RAX36 = sext i32 %63 to i64
  %sc-m37 = mul i64 4, %RAX36
  %64 = bitcast i64* %RBP_N.64 to i8*
  %65 = getelementptr i8, i8* %64, i64 %sc-m37
  %66 = bitcast i8* %65 to i64*
  %67 = load i64, i64* %66, align 1
  %68 = sub i64 %67, 9
  %69 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %67, i64 9)
  %CF39 = extractvalue { i64, i1 } %69, 1
  %ZF40 = icmp eq i64 %68, 0
  %highbit41 = and i64 -9223372036854775808, %68
  %SF42 = icmp ne i64 %highbit41, 0
  %70 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %67, i64 9)
  %OF43 = extractvalue { i64, i1 } %70, 1
  %71 = and i64 %68, 255
  %72 = call i64 @llvm.ctpop.i64(i64 %71)
  %73 = and i64 %72, 1
  %PF44 = icmp eq i64 %73, 0
  %CmpZF_JLE = icmp eq i1 %ZF40, true
  %CmpOF_JLE = icmp ne i1 %SF42, %OF43
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 81))
  br label %bb.9

bb.7:                                             ; preds = %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %74 = bitcast i64* %RSPAdj_N.80 to i32*
  %memload46 = load i32, i32* %74, align 1
  %EAX53 = add i32 %memload46, 1
  %75 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload46, i32 1)
  %CF47 = extractvalue { i32, i1 } %75, 1
  %76 = and i32 %EAX53, 255
  %77 = call i32 @llvm.ctpop.i32(i32 %76)
  %78 = and i32 %77, 1
  %PF48 = icmp eq i32 %78, 0
  %ZF49 = icmp eq i32 %EAX53, 0
  %highbit50 = and i32 -2147483648, %EAX53
  %SF51 = icmp ne i32 %highbit50, 0
  %79 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload46, i32 1)
  %OF52 = extractvalue { i32, i1 } %79, 1
  %80 = bitcast i64* %RSPAdj_N.80 to i32*
  store i32 %EAX53, i32* %80, align 1
  br label %bb.4

bb.9:                                             ; preds = %bb.6, %bb.4
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 48)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 56)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 64)}
!12 = !{!11}
