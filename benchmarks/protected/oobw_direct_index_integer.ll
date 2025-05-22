; ModuleID = './protected_bc/oobw_direct_index_integer.bc'
source_filename = "./bin/oobw_direct_index_integer"

@rodata_15 = private unnamed_addr constant [132 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Direct int array Out of Bounds Write\0A\00", align 16, !ROData_SecInfo !0
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
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 4)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i32*
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr12, align 1
  %1 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr9, align 1
  %2 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* @rodata_15_32, align 1, !ROData_Content !6
  store i32 %memload2, i32* %ns_ptr6, align 1
  %3 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* @rodata_15_48, align 1, !ROData_Content !8
  store i64 %memload3, i64* %ns_ptr21, align 1
  %4 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 56) to i64*, !ROData_Index !9
  %memload4 = load i64, i64* @rodata_15_56, align 1, !ROData_Content !10
  store i64 %memload4, i64* %ns_ptr18, align 1
  %5 = bitcast i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 64) to i32*, !ROData_Index !11
  %memload5 = load i32, i32* @rodata_15_64, align 1, !ROData_Content !12
  store i32 %memload5, i32* %ns_ptr15, align 1
  %RSI = ptrtoint i64* %ns_ptr12 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 68), i64 %RSI)
  %RSI6 = ptrtoint i64* %ns_ptr21 to i64
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 72), i64 %RSI6)
  %6 = bitcast i64* %ns_ptr to i32*
  store i32 420, i32* %6, align 1
  store i32 0, i32* %ns_ptr24, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %7 = load i32, i32* %ns_ptr24, align 1
  %8 = zext i32 %7 to i64
  %9 = zext i32 5 to i64
  %10 = sub i64 %8, %9
  %11 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %8, i64 %9)
  %CF = extractvalue { i64, i1 } %11, 1
  %ZF = icmp eq i64 %10, 0
  %highbit = and i64 -9223372036854775808, %10
  %SF = icmp ne i64 %highbit, 0
  %12 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 %9)
  %OF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %10, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %16 = bitcast i32* %ns_ptr24 to i64*
  %memload8 = load i64, i64* %16, align 1
  %17 = trunc i64 %memload8 to i32
  %RAX = sext i32 %17 to i64
  %sc-m = mul i64 4, %RAX
  %18 = bitcast i64* %ns_ptr21 to i8*
  %19 = getelementptr i8, i8* %18, i64 %sc-m
  %20 = bitcast i8* %19 to i64*
  %21 = bitcast i64* %20 to i32*
  %memload9 = load i32, i32* %21, align 1
  %EAX10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 77), i32 %memload9)
  %memload11 = load i32, i32* %ns_ptr24, align 1
  %EAX18 = add i32 %memload11, 1
  %22 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload11, i32 1)
  %CF12 = extractvalue { i32, i1 } %22, 1
  %23 = and i32 %EAX18, 255
  %24 = call i32 @llvm.ctpop.i32(i32 %23)
  %25 = and i32 %24, 1
  %PF13 = icmp eq i32 %25, 0
  %ZF14 = icmp eq i32 %EAX18, 0
  %highbit15 = and i32 -2147483648, %EAX18
  %SF16 = icmp ne i32 %highbit15, 0
  %26 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload11, i32 1)
  %OF17 = extractvalue { i32, i1 } %26, 1
  store i32 %EAX18, i32* %ns_ptr24, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 75))
  %27 = load i64, i64* %ns_ptr21, align 1
  %28 = sub i64 %27, 420
  %29 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %27, i64 420)
  %CF20 = extractvalue { i64, i1 } %29, 1
  %ZF21 = icmp eq i64 %28, 0
  %highbit22 = and i64 -9223372036854775808, %28
  %SF23 = icmp ne i64 %highbit22, 0
  %30 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %27, i64 420)
  %OF24 = extractvalue { i64, i1 } %30, 1
  %31 = and i64 %28, 255
  %32 = call i64 @llvm.ctpop.i64(i64 %31)
  %33 = and i64 %32, 1
  %PF25 = icmp eq i64 %33, 0
  %CmpZF_JNE = icmp eq i1 %ZF21, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 81))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 48)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 56)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([132 x i8], [132 x i8]* @rodata_15, i32 0, i32 64)}
!12 = !{!11}
