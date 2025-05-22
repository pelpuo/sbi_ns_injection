; ModuleID = './protected_bc/oobw_negative_array_index.bc'
source_filename = "./bin/oobw_negative_array_index"

@rodata_15 = private unnamed_addr constant [108 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Negative array index leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_14 = private constant i16 106
@rodata_15_4 = private constant i32 1684234849
@rodata_15_8 = private constant i16 101
@rodata_15_10 = private constant i32 1768449894

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 34
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 2)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i16*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 30
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 2)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i16*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %RBP_N.19 = getelementptr i8, i8* %stktop_8, i64 21
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* @rodata_15_4, align 1, !ROData_Content !2
  store i32 %memload, i32* %ns_ptr9, align 1
  %1 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* @rodata_15_8, align 1, !ROData_Content !4
  store i16 %memload1, i16* %ns_ptr6, align 1
  %2 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 10) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* @rodata_15_10, align 1, !ROData_Content !6
  store i32 %memload2, i32* %ns_ptr15, align 1
  %3 = bitcast i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 14) to i16*, !ROData_Index !7
  %memload3 = load i16, i16* @rodata_15_14, align 1, !ROData_Content !8
  store i16 %memload3, i16* %ns_ptr12, align 1
  store i8 88, i8* %RBP_N.19, align 1
  %RSI = ptrtoint i32* %ns_ptr9 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 16), i64 %RSI)
  %RSI4 = ptrtoint i32* %ns_ptr15 to i64
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @rodata_15, i32 0, i32 30), i64 %RSI4)
  store i32 0, i32* %ns_ptr18, align 1
  store i32 0, i32* %ns_ptr21, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.5, %entry
  %4 = load i32, i32* %ns_ptr21, align 1
  %5 = zext i32 %4 to i64
  %6 = zext i32 5 to i64
  %7 = sub i64 %5, %6
  %8 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %5, i64 %6)
  %CF = extractvalue { i64, i1 } %8, 1
  %ZF = icmp eq i64 %7, 0
  %highbit = and i64 -9223372036854775808, %7
  %SF = icmp ne i64 %highbit, 0
  %9 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %5, i64 %6)
  %OF = extractvalue { i64, i1 } %9, 1
  %10 = and i64 %7, 255
  %11 = call i64 @llvm.ctpop.i64(i64 %10)
  %12 = and i64 %11, 1
  %PF = icmp eq i64 %12, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  %13 = bitcast i32* %ns_ptr21 to i64*
  %memload6 = load i64, i64* %13, align 1
  %14 = trunc i64 %memload6 to i32
  %RAX = sext i32 %14 to i64
  %15 = bitcast i32* %ns_ptr9 to i8*
  %16 = getelementptr i8, i8* %15, i64 %RAX
  %17 = bitcast i8* %16 to i32*
  %memload7 = load i32, i32* %17, align 1
  %18 = trunc i32 %memload7 to i8
  %EAX8 = sext i8 %18 to i32
  %19 = sub i32 %EAX8, 88
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX8, i32 88)
  %CF9 = extractvalue { i32, i1 } %20, 1
  %ZF10 = icmp eq i32 %19, 0
  %highbit11 = and i32 -2147483648, %19
  %SF12 = icmp ne i32 %highbit11, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX8, i32 88)
  %OF13 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF14 = icmp eq i32 %24, 0
  %CmpZF_JNE = icmp eq i1 %ZF10, false
  br i1 %CmpZF_JNE, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  store i32 1, i32* %ns_ptr18, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  br label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload15 = load i32, i32* %ns_ptr21, align 1
  %EAX22 = add i32 %memload15, 1
  %25 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload15, i32 1)
  %CF16 = extractvalue { i32, i1 } %25, 1
  %26 = and i32 %EAX22, 255
  %27 = call i32 @llvm.ctpop.i32(i32 %26)
  %28 = and i32 %27, 1
  %PF17 = icmp eq i32 %28, 0
  %ZF18 = icmp eq i32 %EAX22, 0
  %highbit19 = and i32 -2147483648, %EAX22
  %SF20 = icmp ne i32 %highbit19, 0
  %29 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload15, i32 1)
  %OF21 = extractvalue { i32, i1 } %29, 1
  store i32 %EAX22, i32* %ns_ptr21, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
  %30 = load i32, i32* %ns_ptr18, align 1
  %31 = zext i32 %30 to i64
  %32 = zext i32 1 to i64
  %33 = sub i64 %31, %32
  %34 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %31, i64 %32)
  %CF23 = extractvalue { i64, i1 } %34, 1
  %ZF24 = icmp eq i64 %33, 0
  %highbit25 = and i64 -9223372036854775808, %33
  %SF26 = icmp ne i64 %highbit25, 0
  %35 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %31, i64 %32)
  %OF27 = extractvalue { i64, i1 } %35, 1
  %36 = and i64 %33, 255
  %37 = call i64 @llvm.ctpop.i64(i64 %36)
  %38 = and i64 %37, 1
  %PF28 = icmp eq i64 %38, 0
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

declare i8* @zeno_protect(i8*, i64)

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
