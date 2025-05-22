; ModuleID = './protected_bc/oobr_direct_index_integer.bc'
source_filename = "./bin/oobr_direct_index_integer"

@rodata_15 = private unnamed_addr constant [175 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00Last element of arr2 is: %d\0A\00Out of bounds read: %d\0A\00Test Failed: Simple Integer Array Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_64 = private constant i32 9
@rodata_15_16 = private constant i64 17179869186
@rodata_15_56 = private constant i64 30064771077
@rodata_15_32 = private constant i32 10
@rodata_15_48 = private constant i64 12884901889
@rodata_15_24 = private constant i64 34359738374

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 68
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr12, align 1
  %1 = bitcast i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr9, align 1
  %2 = bitcast i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* @rodata_15_32, align 1, !ROData_Content !6
  store i32 %memload2, i32* %ns_ptr6, align 1
  %3 = bitcast i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* @rodata_15_48, align 1, !ROData_Content !8
  store i64 %memload3, i64* %RSPAdj_N.64, align 1
  %4 = bitcast i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 56) to i64*, !ROData_Index !9
  %memload4 = load i64, i64* @rodata_15_56, align 1, !ROData_Content !10
  store i64 %memload4, i64* %ns_ptr18, align 1
  %5 = bitcast i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 64) to i32*, !ROData_Index !11
  %memload5 = load i32, i32* @rodata_15_64, align 1, !ROData_Content !12
  store i32 %memload5, i32* %ns_ptr15, align 1
  %memload6 = load i32, i32* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 68), i32 %memload6)
  %6 = bitcast i64* %ns_ptr to i32*
  %memload7 = load i32, i32* %6, align 1
  %EAX8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 97), i32 %memload7)
  %7 = bitcast i64* %ns_ptr to i8*
  %8 = getelementptr i8, i8* %7, i64 4
  %9 = bitcast i8* %8 to i32*
  %memload9 = load i32, i32* %9, align 1
  %EAX10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 97), i32 %memload9)
  %10 = bitcast i64* %ns_ptr to i32*
  %11 = load i32, i32* %10, align 1
  %12 = zext i32 %11 to i64
  %13 = zext i32 0 to i64
  %14 = sub i64 %12, %13
  %15 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %12, i64 %13)
  %CF = extractvalue { i64, i1 } %15, 1
  %ZF = icmp eq i64 %14, 0
  %highbit = and i64 -9223372036854775808, %14
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %12, i64 %13)
  %OF = extractvalue { i64, i1 } %16, 1
  %17 = and i64 %14, 255
  %18 = call i64 @llvm.ctpop.i64(i64 %17)
  %19 = and i64 %18, 1
  %PF = icmp eq i64 %19, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %20 = bitcast i64* %ns_ptr to i8*
  %21 = getelementptr i8, i8* %20, i64 4
  %22 = bitcast i8* %21 to i32*
  %23 = load i32, i32* %22, align 1
  %24 = zext i32 %23 to i64
  %25 = zext i32 0 to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF11 = extractvalue { i64, i1 } %27, 1
  %ZF12 = icmp eq i64 %26, 0
  %highbit13 = and i64 -9223372036854775808, %26
  %SF14 = icmp ne i64 %highbit13, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF15 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF16 = icmp eq i64 %31, 0
  %CmpZF_JE = icmp eq i1 %ZF12, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 121))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 48)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 56)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([175 x i8], [175 x i8]* @rodata_15, i32 0, i32 64)}
!12 = !{!11}
