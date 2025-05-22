; ModuleID = './protected_bc/oobr_less_or_equal_in_for_loop.bc'
source_filename = "./bin/oobr_less_or_equal_in_for_loop"

@rodata_15 = private unnamed_addr constant [151 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00Index %d: %d\0A\00Test Failed: Incorrect condition in loop causing Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_64 = private constant i32 5
@rodata_15_16 = private constant i64 30064771078
@rodata_15_56 = private constant i64 17179869187
@rodata_15_32 = private constant i32 10
@rodata_15_48 = private constant i64 8589934593
@rodata_15_24 = private constant i64 38654705672

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
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 4)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i32*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 4)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i32*
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr12, align 1
  %1 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr9, align 1
  %2 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* @rodata_15_32, align 1, !ROData_Content !6
  store i32 %memload2, i32* %ns_ptr6, align 1
  %3 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* @rodata_15_48, align 1, !ROData_Content !8
  store i64 %memload3, i64* %ns_ptr21, align 1
  %4 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 56) to i64*, !ROData_Index !9
  %memload4 = load i64, i64* @rodata_15_56, align 1, !ROData_Content !10
  store i64 %memload4, i64* %ns_ptr18, align 1
  %5 = bitcast i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 64) to i32*, !ROData_Index !11
  %memload5 = load i32, i32* @rodata_15_64, align 1, !ROData_Content !12
  store i32 %memload5, i32* %ns_ptr15, align 1
  store i32 5, i32* %ns_ptr24, align 1
  store i32 0, i32* %ns_ptr27, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.6, %entry
  %memload6 = load i32, i32* %ns_ptr27, align 1
  %6 = load i32, i32* %ns_ptr24, align 1
  %7 = sub i32 %memload6, %6
  %8 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload6, i32 %6)
  %CF = extractvalue { i32, i1 } %8, 1
  %ZF = icmp eq i32 %7, 0
  %highbit = and i32 -2147483648, %7
  %SF = icmp ne i32 %highbit, 0
  %9 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload6, i32 %6)
  %OF = extractvalue { i32, i1 } %9, 1
  %10 = and i32 %7, 255
  %11 = call i32 @llvm.ctpop.i32(i32 %10)
  %12 = and i32 %11, 1
  %PF = icmp eq i32 %12, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload7 = load i32, i32* %ns_ptr27, align 1
  %13 = bitcast i32* %ns_ptr27 to i64*
  %memload8 = load i64, i64* %13, align 1
  %14 = trunc i64 %memload8 to i32
  %RAX = sext i32 %14 to i64
  %sc-m = mul i64 4, %RAX
  %15 = bitcast i64* %ns_ptr21 to i8*
  %16 = getelementptr i8, i8* %15, i64 %sc-m
  %17 = bitcast i8* %16 to i64*
  %18 = bitcast i64* %17 to i32*
  %memload9 = load i32, i32* %18, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 68), i32 %memload7, i32 %memload9)
  %memload10 = load i32, i32* %ns_ptr27, align 1
  %19 = load i32, i32* %ns_ptr24, align 1
  %20 = sub i32 %memload10, %19
  %21 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %19)
  %CF11 = extractvalue { i32, i1 } %21, 1
  %ZF12 = icmp eq i32 %20, 0
  %highbit13 = and i32 -2147483648, %20
  %SF14 = icmp ne i32 %highbit13, 0
  %22 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %19)
  %OF15 = extractvalue { i32, i1 } %22, 1
  %23 = and i32 %20, 255
  %24 = call i32 @llvm.ctpop.i32(i32 %23)
  %25 = and i32 %24, 1
  %PF16 = icmp eq i32 %25, 0
  %CmpZF_JNE = icmp eq i1 %ZF12, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.3

bb.3:                                             ; preds = %bb.2
  %26 = bitcast i32* %ns_ptr27 to i64*
  %memload17 = load i64, i64* %26, align 1
  %27 = trunc i64 %memload17 to i32
  %RAX18 = sext i32 %27 to i64
  %sc-m19 = mul i64 4, %RAX18
  %28 = bitcast i64* %ns_ptr21 to i8*
  %29 = getelementptr i8, i8* %28, i64 %sc-m19
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30, align 1
  %32 = sub i64 %31, 0
  %33 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %31, i64 0)
  %CF21 = extractvalue { i64, i1 } %33, 1
  %ZF22 = icmp eq i64 %32, 0
  %highbit23 = and i64 -9223372036854775808, %32
  %SF24 = icmp ne i64 %highbit23, 0
  %34 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %31, i64 0)
  %OF25 = extractvalue { i64, i1 } %34, 1
  %35 = and i64 %32, 255
  %36 = call i64 @llvm.ctpop.i64(i64 %35)
  %37 = and i64 %36, 1
  %PF26 = icmp eq i64 %37, 0
  %CmpZF_JE = icmp eq i1 %ZF22, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([151 x i8], [151 x i8]* @rodata_15, i32 0, i32 82))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3, %bb.2
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload28 = load i32, i32* %ns_ptr27, align 1
  %EAX35 = add i32 %memload28, 1
  %38 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload28, i32 1)
  %CF29 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %EAX35, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF30 = icmp eq i32 %41, 0
  %ZF31 = icmp eq i32 %EAX35, 0
  %highbit32 = and i32 -2147483648, %EAX35
  %SF33 = icmp ne i32 %highbit32, 0
  %42 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload28, i32 1)
  %OF34 = extractvalue { i32, i1 } %42, 1
  store i32 %EAX35, i32* %ns_ptr27, align 1
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

declare i8* @zeno_protect(i8*, i64)

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
