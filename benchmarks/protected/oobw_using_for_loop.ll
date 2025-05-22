; ModuleID = './protected_bc/oobw_using_for_loop.bc'
source_filename = "./bin/oobw_using_for_loop"

@rodata_15 = private unnamed_addr constant [170 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00This is the second string\00random\00String 1 length is: %d\0A\00String 2 length is: %d\0A\00String 1 is: %s\0A\00Test Failed: Out of Bounds Write using simple for loop\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_40 = private constant i16 103
@rodata_15_16 = private constant i64 2338328219631577172
@rodata_15_42 = private constant i32 1684955506
@rodata_15_32 = private constant i64 7956016061199967342
@rodata_15_46 = private constant i16 28015
@rodata_15_48 = private constant i8 0
@rodata_15_24 = private constant i64 8026370506043517044

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 64
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 2)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i16*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 37
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 2)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i16*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 33
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 4)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i32*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 4)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i32*
  %ns_base28 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot29 = call i8* @zeno_protect(i8* %ns_base28, i64 4)
  %ns_ptr30 = bitcast i8* %ns_prot29 to i32*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %RBP_N.33 = getelementptr i8, i8* %stktop_8, i64 39
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr15, align 1
  %1 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr12, align 1
  %2 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* @rodata_15_32, align 1, !ROData_Content !6
  store i64 %memload2, i64* %ns_ptr9, align 1
  %3 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 40) to i16*, !ROData_Index !7
  %memload3 = load i16, i16* @rodata_15_40, align 1, !ROData_Content !8
  store i16 %memload3, i16* %ns_ptr6, align 1
  %4 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 42) to i32*, !ROData_Index !9
  %memload4 = load i32, i32* @rodata_15_42, align 1, !ROData_Content !10
  store i32 %memload4, i32* %ns_ptr21, align 1
  %5 = bitcast i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 46) to i16*, !ROData_Index !11
  %memload5 = load i16, i16* @rodata_15_46, align 1, !ROData_Content !12
  store i16 %memload5, i16* %ns_ptr18, align 1
  %memload6 = load i8, i8* @rodata_15_48, align 1, !ROData_Content !13
  store i8 %memload6, i8* %RBP_N.33, align 1
  store i32 26, i32* %ns_ptr24, align 1
  store i32 7, i32* %ns_ptr27, align 1
  %memload7 = load i32, i32* %ns_ptr24, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 49), i32 %memload7)
  %memload8 = load i32, i32* %ns_ptr27, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 73), i32 %memload8)
  store i32 0, i32* %ns_ptr30, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %memload10 = load i32, i32* %ns_ptr30, align 1
  %6 = load i32, i32* %ns_ptr24, align 1
  %7 = sub i32 %memload10, %6
  %8 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %6)
  %CF = extractvalue { i32, i1 } %8, 1
  %ZF = icmp eq i32 %7, 0
  %highbit = and i32 -2147483648, %7
  %SF = icmp ne i32 %highbit, 0
  %9 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %6)
  %OF = extractvalue { i32, i1 } %9, 1
  %10 = and i32 %7, 255
  %11 = call i32 @llvm.ctpop.i32(i32 %10)
  %12 = and i32 %11, 1
  %PF = icmp eq i32 %12, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %13 = bitcast i32* %ns_ptr30 to i64*
  %memload11 = load i64, i64* %13, align 1
  %14 = trunc i64 %memload11 to i32
  %RAX = sext i32 %14 to i64
  %15 = bitcast i32* %ns_ptr21 to i8*
  %16 = getelementptr i8, i8* %15, i64 %RAX
  %17 = bitcast i8* %16 to i32*
  %18 = bitcast i32* %17 to i8*
  store i8 120, i8* %18, align 1
  %memload12 = load i32, i32* %ns_ptr30, align 1
  %EAX19 = add i32 %memload12, 1
  %19 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload12, i32 1)
  %CF13 = extractvalue { i32, i1 } %19, 1
  %20 = and i32 %EAX19, 255
  %21 = call i32 @llvm.ctpop.i32(i32 %20)
  %22 = and i32 %21, 1
  %PF14 = icmp eq i32 %22, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %23 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload12, i32 1)
  %OF18 = extractvalue { i32, i1 } %23, 1
  store i32 %EAX19, i32* %ns_ptr30, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint i64* %ns_ptr15 to i64
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 97), i64 %RSI)
  %24 = bitcast i64* %ns_ptr15 to i32*
  %memload21 = load i32, i32* %24, align 1
  %25 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %25 to i32
  %26 = sub i32 %EAX22, 120
  %27 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 120)
  %CF23 = extractvalue { i32, i1 } %27, 1
  %ZF24 = icmp eq i32 %26, 0
  %highbit25 = and i32 -2147483648, %26
  %SF26 = icmp ne i32 %highbit25, 0
  %28 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 120)
  %OF27 = extractvalue { i32, i1 } %28, 1
  %29 = and i32 %26, 255
  %30 = call i32 @llvm.ctpop.i32(i32 %29)
  %31 = and i32 %30, 1
  %PF28 = icmp eq i32 %31, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 114))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
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

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 40)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 42)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 46)}
!12 = !{!11}
!13 = !{i8* getelementptr inbounds ([170 x i8], [170 x i8]* @rodata_15, i32 0, i32 48)}
