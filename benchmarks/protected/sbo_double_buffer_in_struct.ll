; ModuleID = './protected_bc/sbo_double_buffer_in_struct.bc'
source_filename = "./bin/sbo_double_buffer_in_struct"

@rodata_15 = private unnamed_addr constant [148 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\1F\85\EBQ\B8\1E\09@\AEG\E1z\14\AE\05@\8F\C2\F5(\\\8F\F6?\AEG\E1z\14\AE\FB?Test Failed: Stack Buffer Overflow within elements of struct with different sizes\0A\00Flag is normal.\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_40 = private constant i64 4610470046527997870
@rodata_15_16 = private constant i64 4614253070214989087
@rodata_15_32 = private constant i64 4609028894647239311
@rodata_15_24 = private constant i64 4613284796295104430

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
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to double*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
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
  store i32 0, i32* %ns_ptr6, align 1
  %0 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr21, align 1
  %1 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr18, align 1
  %2 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* @rodata_15_32, align 1, !ROData_Content !6
  store i64 %memload2, i64* %ns_ptr15, align 1
  %3 = bitcast i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* @rodata_15_40, align 1, !ROData_Content !8
  store i64 %memload3, i64* %ns_ptr12, align 1
  %4 = sext i32 0 to i64
  store i64 %4, i64* %ns_ptr24, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %5 = load i64, i64* %ns_ptr24, align 1
  %6 = sub i64 %5, 4
  %7 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %5, i64 4)
  %CF = extractvalue { i64, i1 } %7, 1
  %ZF = icmp eq i64 %6, 0
  %highbit = and i64 -9223372036854775808, %6
  %SF = icmp ne i64 %highbit, 0
  %8 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %5, i64 4)
  %OF = extractvalue { i64, i1 } %8, 1
  %9 = and i64 %6, 255
  %10 = call i64 @llvm.ctpop.i64(i64 %9)
  %11 = and i64 %10, 1
  %PF = icmp eq i64 %11, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i64, i64* %ns_ptr24, align 1
  %sc-m = mul i64 8, %memload4
  %12 = bitcast i64* %ns_ptr21 to i8*
  %13 = getelementptr i8, i8* %12, i64 %sc-m
  %14 = bitcast i8* %13 to i64*
  %15 = bitcast i64* %14 to double*
  %memload5 = load double, double* %15, align 1
  %memload6 = load i64, i64* %ns_ptr24, align 1
  %16 = ptrtoint double* %ns_ptr9 to i64
  %sc-m7 = mul i64 8, %memload6
  %idx-a8 = add i64 %16, %sc-m7
  %17 = inttoptr i64 %idx-a8 to double*
  store double %memload5, double* %17, align 1
  %memload9 = load i64, i64* %ns_ptr24, align 1
  %RAX = add i64 %memload9, 1
  %18 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload9, i64 1)
  %CF10 = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %RAX, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF11 = icmp eq i64 %21, 0
  %ZF12 = icmp eq i64 %RAX, 0
  %highbit13 = and i64 -9223372036854775808, %RAX
  %SF14 = icmp ne i64 %highbit13, 0
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload9, i64 1)
  %OF15 = extractvalue { i64, i1 } %22, 1
  store i64 %RAX, i64* %ns_ptr24, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %23 = load i32, i32* %ns_ptr6, align 1
  %24 = zext i32 %23 to i64
  %25 = zext i32 0 to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF16 = extractvalue { i64, i1 } %27, 1
  %ZF17 = icmp eq i64 %26, 0
  %highbit18 = and i64 -9223372036854775808, %26
  %SF19 = icmp ne i64 %highbit18, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF20 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF21 = icmp eq i64 %31, 0
  %CmpZF_JE = icmp eq i1 %ZF17, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 48))
  br label %bb.6

bb.5:                                             ; preds = %bb.3
  %EAX22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 131))
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([148 x i8], [148 x i8]* @rodata_15, i32 0, i32 40)}
!8 = !{!7}
