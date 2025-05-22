; ModuleID = './protected_bc/oobw_direct_index_integer_long_write.bc'
source_filename = "./bin/oobw_direct_index_integer_long_write"

@rodata_15 = private unnamed_addr constant [152 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Int array on heap using long pointer Out of Bounds Write\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_64 = private constant i32 9
@rodata_15_16 = private constant i64 17179869186
@rodata_15_56 = private constant i64 30064771077
@rodata_15_32 = private constant i32 10
@rodata_15_48 = private constant i64 12884901889
@rodata_15_24 = private constant i64 34359738374

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 84
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 72
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 64
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 8)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i64*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 8)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i64*
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr12, align 1
  %1 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr9, align 1
  %2 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* @rodata_15_32, align 1, !ROData_Content !6
  store i32 %memload2, i32* %ns_ptr6, align 1
  %3 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* @rodata_15_48, align 1, !ROData_Content !8
  store i64 %memload3, i64* %ns_ptr21, align 1
  %4 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 56) to i64*, !ROData_Index !9
  %memload4 = load i64, i64* @rodata_15_56, align 1, !ROData_Content !10
  store i64 %memload4, i64* %ns_ptr18, align 1
  %5 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 64) to i32*, !ROData_Index !11
  %memload5 = load i32, i32* @rodata_15_64, align 1, !ROData_Content !12
  store i32 %memload5, i32* %ns_ptr15, align 1
  %RSI = ptrtoint i64* %ns_ptr12 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 68), i64 %RSI)
  %RSI6 = ptrtoint i64* %ns_ptr21 to i64
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 72), i64 %RSI6)
  %RAX = ptrtoint i64* %ns_ptr12 to i64
  %RAX8 = add i64 %RAX, 32
  %6 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RAX, i64 32)
  %CF = extractvalue { i64, i1 } %6, 1
  %7 = and i64 %RAX8, 255
  %8 = call i64 @llvm.ctpop.i64(i64 %7)
  %9 = and i64 %8, 1
  %PF = icmp eq i64 %9, 0
  %ZF = icmp eq i64 %RAX8, 0
  %highbit = and i64 -9223372036854775808, %RAX8
  %SF = icmp ne i64 %highbit, 0
  %10 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RAX, i64 32)
  %OF = extractvalue { i64, i1 } %10, 1
  store i64 %RAX8, i64* %ns_ptr24, align 1
  %memload9 = load i64, i64* %ns_ptr24, align 1
  %11 = inttoptr i64 %memload9 to i64*
  store i64 4919420920202273057, i64* %11, align 1
  %12 = bitcast i64* %RSPAdj_N.80 to i8*
  %13 = getelementptr i8, i8* %12, i64 4
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %15 = bitcast i64* %RSPAdj_N.80 to i8*
  %16 = getelementptr i8, i8* %15, i64 4
  %17 = bitcast i8* %16 to i32*
  %18 = load i32, i32* %17, align 1
  %19 = zext i32 %18 to i64
  %20 = zext i32 5 to i64
  %21 = sub i64 %19, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %19, i64 %20)
  %CF10 = extractvalue { i64, i1 } %22, 1
  %ZF11 = icmp eq i64 %21, 0
  %highbit12 = and i64 -9223372036854775808, %21
  %SF13 = icmp ne i64 %highbit12, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %19, i64 %20)
  %OF14 = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF15 = icmp eq i64 %26, 0
  %CmpSFOF_JGE = icmp eq i1 %SF13, %OF14
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %27 = bitcast i64* %RSPAdj_N.80 to i8*
  %28 = getelementptr i8, i8* %27, i64 4
  %29 = bitcast i8* %28 to i64*
  %memload16 = load i64, i64* %29, align 1
  %30 = trunc i64 %memload16 to i32
  %RAX17 = sext i32 %30 to i64
  %sc-m = mul i64 4, %RAX17
  %31 = bitcast i64* %ns_ptr21 to i8*
  %32 = getelementptr i8, i8* %31, i64 %sc-m
  %33 = bitcast i8* %32 to i64*
  %34 = bitcast i64* %33 to i32*
  %memload18 = load i32, i32* %34, align 1
  %EAX19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 77), i32 %memload18)
  %35 = bitcast i64* %RSPAdj_N.80 to i8*
  %36 = getelementptr i8, i8* %35, i64 4
  %37 = bitcast i8* %36 to i32*
  %memload20 = load i32, i32* %37, align 1
  %EAX27 = add i32 %memload20, 1
  %38 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload20, i32 1)
  %CF21 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %EAX27, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF22 = icmp eq i32 %41, 0
  %ZF23 = icmp eq i32 %EAX27, 0
  %highbit24 = and i32 -2147483648, %EAX27
  %SF25 = icmp ne i32 %highbit24, 0
  %42 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload20, i32 1)
  %OF26 = extractvalue { i32, i1 } %42, 1
  %43 = bitcast i64* %RSPAdj_N.80 to i8*
  %44 = getelementptr i8, i8* %43, i64 4
  %45 = bitcast i8* %44 to i32*
  store i32 %EAX27, i32* %45, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 75))
  %46 = bitcast i64* %RSPAdj_N.80 to i32*
  store i32 0, i32* %46, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.8, %bb.3
  %47 = load i64, i64* %RSPAdj_N.80, align 1
  %48 = sub i64 %47, 5
  %49 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %47, i64 5)
  %CF29 = extractvalue { i64, i1 } %49, 1
  %ZF30 = icmp eq i64 %48, 0
  %highbit31 = and i64 -9223372036854775808, %48
  %SF32 = icmp ne i64 %highbit31, 0
  %50 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %47, i64 5)
  %OF33 = extractvalue { i64, i1 } %50, 1
  %51 = and i64 %48, 255
  %52 = call i64 @llvm.ctpop.i64(i64 %51)
  %53 = and i64 %52, 1
  %PF34 = icmp eq i64 %53, 0
  %CmpSFOF_JGE54 = icmp eq i1 %SF32, %OF33
  br i1 %CmpSFOF_JGE54, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload35 = load i64, i64* %RSPAdj_N.80, align 1
  %54 = trunc i64 %memload35 to i32
  %RAX36 = sext i32 %54 to i64
  %sc-m37 = mul i64 4, %RAX36
  %55 = bitcast i64* %ns_ptr21 to i8*
  %56 = getelementptr i8, i8* %55, i64 %sc-m37
  %57 = bitcast i8* %56 to i64*
  %58 = load i64, i64* %57, align 1
  %59 = sub i64 %58, 9
  %60 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %58, i64 9)
  %CF39 = extractvalue { i64, i1 } %60, 1
  %ZF40 = icmp eq i64 %59, 0
  %highbit41 = and i64 -9223372036854775808, %59
  %SF42 = icmp ne i64 %highbit41, 0
  %61 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %58, i64 9)
  %OF43 = extractvalue { i64, i1 } %61, 1
  %62 = and i64 %59, 255
  %63 = call i64 @llvm.ctpop.i64(i64 %62)
  %64 = and i64 %63, 1
  %PF44 = icmp eq i64 %64, 0
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
  %65 = bitcast i64* %RSPAdj_N.80 to i32*
  %memload46 = load i32, i32* %65, align 1
  %EAX53 = add i32 %memload46, 1
  %66 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload46, i32 1)
  %CF47 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %EAX53, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF48 = icmp eq i32 %69, 0
  %ZF49 = icmp eq i32 %EAX53, 0
  %highbit50 = and i32 -2147483648, %EAX53
  %SF51 = icmp ne i32 %highbit50, 0
  %70 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload46, i32 1)
  %OF52 = extractvalue { i32, i1 } %70, 1
  %71 = bitcast i64* %RSPAdj_N.80 to i32*
  store i32 %EAX53, i32* %71, align 1
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

declare i8* @zeno_protect(i8*, i64)

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
