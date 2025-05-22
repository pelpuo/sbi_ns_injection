; ModuleID = './protected_bc/oobr_negative_array_index.bc'
source_filename = "./bin/oobr_negative_array_index"

@rodata_15 = private unnamed_addr constant [136 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\0A\00\00\00Value is: %d\0A\00Test Failed: Out of Bounds Read caused by negative array indices\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i8* @memcpy(i8*, i8*, i64)

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 80
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 76
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i32 10, i32* %ns_ptr9, align 1
  %0 = bitcast i64* %ns_ptr12 to i8*
  %1 = zext i32 40 to i64
  %2 = call i8* @zeno_memcpy(i8* %0, i8* getelementptr inbounds ([136 x i8], [136 x i8]* @rodata_15, i32 0, i32 16), i64 %1)
  %RAX = ptrtoint i8* %2 to i64
  store i32 -5, i32* %ns_ptr15, align 1
  %memload = load i32, i32* %ns_ptr15, align 1
  %3 = load i32, i32* %ns_ptr9, align 1
  %4 = sub i32 %memload, %3
  %5 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload, i32 %3)
  %CF = extractvalue { i32, i1 } %5, 1
  %ZF = icmp eq i32 %4, 0
  %highbit = and i32 -2147483648, %4
  %SF = icmp ne i32 %highbit, 0
  %6 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload, i32 %3)
  %OF = extractvalue { i32, i1 } %6, 1
  %7 = and i32 %4, 255
  %8 = call i32 @llvm.ctpop.i32(i32 %7)
  %9 = and i32 %8, 1
  %PF = icmp eq i32 %9, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.4, label %bb.1

bb.1:                                             ; preds = %entry
  %10 = bitcast i32* %ns_ptr15 to i64*
  %memload1 = load i64, i64* %10, align 1
  %11 = trunc i64 %memload1 to i32
  %RAX2 = sext i32 %11 to i64
  %sc-m = mul i64 4, %RAX2
  %12 = bitcast i64* %ns_ptr12 to i8*
  %13 = getelementptr i8, i8* %12, i64 %sc-m
  %14 = bitcast i8* %13 to i64*
  %15 = bitcast i64* %14 to i32*
  %memload3 = load i32, i32* %15, align 1
  store i32 %memload3, i32* %ns_ptr6, align 1
  %16 = bitcast i32* %ns_ptr15 to i64*
  %memload4 = load i64, i64* %16, align 1
  %17 = trunc i64 %memload4 to i32
  %RAX5 = sext i32 %17 to i64
  %sc-m6 = mul i64 4, %RAX5
  %18 = bitcast i64* %ns_ptr12 to i8*
  %19 = getelementptr i8, i8* %18, i64 %sc-m6
  %20 = bitcast i8* %19 to i64*
  %21 = bitcast i64* %20 to i32*
  %memload8 = load i32, i32* %21, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([136 x i8], [136 x i8]* @rodata_15, i32 0, i32 56), i32 %memload8)
  %22 = load i32, i32* %ns_ptr6, align 1
  %23 = zext i32 %22 to i64
  %24 = zext i32 0 to i64
  %25 = sub i64 %23, %24
  %26 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %23, i64 %24)
  %CF9 = extractvalue { i64, i1 } %26, 1
  %ZF10 = icmp eq i64 %25, 0
  %highbit11 = and i64 -9223372036854775808, %25
  %SF12 = icmp ne i64 %highbit11, 0
  %27 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %23, i64 %24)
  %OF13 = extractvalue { i64, i1 } %27, 1
  %28 = and i64 %25, 255
  %29 = call i64 @llvm.ctpop.i64(i64 %28)
  %30 = and i64 %29, 1
  %PF14 = icmp eq i64 %30, 0
  %CmpZF_JE = icmp eq i1 %ZF10, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([136 x i8], [136 x i8]* @rodata_15, i32 0, i32 70))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.5

bb.4:                                             ; preds = %entry
  store i32 -1, i32* %ns_ptr6, align 1
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
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_memcpy(i8*, i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
