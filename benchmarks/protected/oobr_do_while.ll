; ModuleID = './protected_bc/oobr_do_while.bc'
source_filename = "./bin/oobr_do_while"

@rodata_15 = private unnamed_addr constant [112 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00i: %d \09val: %d\0A\00Test Failed: Integer Array Out of Bounds - Loop Off by One\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_16 = private constant i64 8589934593
@rodata_15_32 = private constant i32 5
@rodata_15_24 = private constant i64 17179869187

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i32 5, i32* %ns_ptr6, align 1
  %0 = bitcast i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr15, align 1
  %1 = bitcast i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr12, align 1
  %2 = bitcast i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* @rodata_15_32, align 1, !ROData_Content !6
  store i32 %memload2, i32* %ns_ptr9, align 1
  store i32 0, i32* %ns_ptr18, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.4, %entry
  %memload3 = load i32, i32* %ns_ptr18, align 1
  %EAX = add i32 %memload3, 1
  %3 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload3, i32 1)
  %CF = extractvalue { i32, i1 } %3, 1
  %4 = and i32 %EAX, 255
  %5 = call i32 @llvm.ctpop.i32(i32 %4)
  %6 = and i32 %5, 1
  %PF = icmp eq i32 %6, 0
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %7 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload3, i32 1)
  %OF = extractvalue { i32, i1 } %7, 1
  store i32 %EAX, i32* %ns_ptr18, align 1
  %memload4 = load i32, i32* %ns_ptr18, align 1
  %8 = bitcast i32* %ns_ptr18 to i64*
  %memload5 = load i64, i64* %8, align 1
  %9 = trunc i64 %memload5 to i32
  %RAX = sext i32 %9 to i64
  %sc-m = mul i64 4, %RAX
  %10 = bitcast i64* %ns_ptr15 to i8*
  %11 = getelementptr i8, i8* %10, i64 %sc-m
  %12 = bitcast i8* %11 to i64*
  %13 = bitcast i64* %12 to i32*
  %memload6 = load i32, i32* %13, align 1
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 36), i32 %memload4, i32 %memload6)
  %memload8 = load i32, i32* %ns_ptr18, align 1
  %14 = load i32, i32* %ns_ptr6, align 1
  %15 = sub i32 %memload8, %14
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload8, i32 %14)
  %CF9 = extractvalue { i32, i1 } %16, 1
  %ZF10 = icmp eq i32 %15, 0
  %highbit11 = and i32 -2147483648, %15
  %SF12 = icmp ne i32 %highbit11, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload8, i32 %14)
  %OF13 = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF14 = icmp eq i32 %20, 0
  %SFAndOF_JL = icmp ne i1 %SF12, %OF13
  br i1 %SFAndOF_JL, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 52))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload16 = load i32, i32* %ns_ptr18, align 1
  %21 = load i32, i32* %ns_ptr6, align 1
  %22 = sub i32 %memload16, %21
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload16, i32 %21)
  %CF17 = extractvalue { i32, i1 } %23, 1
  %ZF18 = icmp eq i32 %22, 0
  %highbit19 = and i32 -2147483648, %22
  %SF20 = icmp ne i32 %highbit19, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload16, i32 %21)
  %OF21 = extractvalue { i32, i1 } %24, 1
  %25 = and i32 %22, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %25)
  %27 = and i32 %26, 1
  %PF22 = icmp eq i32 %27, 0
  %SFAndOF_JL24 = icmp ne i1 %SF20, %OF21
  br i1 %SFAndOF_JL24, label %bb.1, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload23 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload23
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
