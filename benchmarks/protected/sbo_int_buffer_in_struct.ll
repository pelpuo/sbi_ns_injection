; ModuleID = './protected_bc/sbo_int_buffer_in_struct.bc'
source_filename = "./bin/sbo_int_buffer_in_struct"

@rodata_15 = private unnamed_addr constant [134 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\0090\00\00Test Failed: Stack Buffer Overflow within struct elements of int datatype\0A\00Trigger Check intact.\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_16 = private constant i64 8589934593
@rodata_15_32 = private constant i32 12345
@rodata_15_24 = private constant i64 17179869187

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
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 8)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i64*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i32 0, i32* %ns_ptr6, align 1
  %0 = bitcast i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr18, align 1
  %1 = bitcast i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr15, align 1
  %2 = bitcast i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* @rodata_15_32, align 1, !ROData_Content !6
  store i32 %memload2, i32* %ns_ptr12, align 1
  %3 = sext i32 0 to i64
  store i64 %3, i64* %ns_ptr21, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %4 = load i64, i64* %ns_ptr21, align 1
  %5 = sub i64 %4, 5
  %6 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %4, i64 5)
  %CF = extractvalue { i64, i1 } %6, 1
  %ZF = icmp eq i64 %5, 0
  %highbit = and i64 -9223372036854775808, %5
  %SF = icmp ne i64 %highbit, 0
  %7 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %4, i64 5)
  %OF = extractvalue { i64, i1 } %7, 1
  %8 = and i64 %5, 255
  %9 = call i64 @llvm.ctpop.i64(i64 %8)
  %10 = and i64 %9, 1
  %PF = icmp eq i64 %10, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload3 = load i64, i64* %ns_ptr21, align 1
  %sc-m = mul i64 4, %memload3
  %11 = bitcast i64* %ns_ptr18 to i8*
  %12 = getelementptr i8, i8* %11, i64 %sc-m
  %13 = bitcast i8* %12 to i64*
  %14 = bitcast i64* %13 to i32*
  %memload4 = load i32, i32* %14, align 1
  %memload5 = load i64, i64* %ns_ptr21, align 1
  %sc-m6 = mul i64 4, %memload5
  %15 = bitcast i32* %ns_ptr9 to i8*
  %16 = getelementptr i8, i8* %15, i64 %sc-m6
  %17 = bitcast i8* %16 to i32*
  store i32 %memload4, i32* %17, align 1
  %memload8 = load i64, i64* %ns_ptr21, align 1
  %RAX = add i64 %memload8, 1
  %18 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload8, i64 1)
  %CF9 = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %RAX, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF10 = icmp eq i64 %21, 0
  %ZF11 = icmp eq i64 %RAX, 0
  %highbit12 = and i64 -9223372036854775808, %RAX
  %SF13 = icmp ne i64 %highbit12, 0
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload8, i64 1)
  %OF14 = extractvalue { i64, i1 } %22, 1
  store i64 %RAX, i64* %ns_ptr21, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %23 = load i32, i32* %ns_ptr6, align 1
  %24 = zext i32 %23 to i64
  %25 = zext i32 0 to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF15 = extractvalue { i64, i1 } %27, 1
  %ZF16 = icmp eq i64 %26, 0
  %highbit17 = and i64 -9223372036854775808, %26
  %SF18 = icmp ne i64 %highbit17, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF19 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF20 = icmp eq i64 %31, 0
  %CmpZF_JE = icmp eq i1 %ZF16, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 36))
  br label %bb.6

bb.5:                                             ; preds = %bb.3
  %EAX21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 111))
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
!1 = !{i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
