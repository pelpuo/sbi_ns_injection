; ModuleID = './protected_bc/type_conf_overflow.bc'
source_filename = "./bin/type_conf_overflow"

@rodata_15 = private unnamed_addr constant [193 x i8] c"\01\00\02\00Allocating buffer of size %d\0A\00Bounds of allocated buffer: %p - %p\0A\00Requesting buffer of size %d\0A\00Retrieved value at address %p: 0x%x\0A\00Test Failed: OOB access caused by int->short overflow\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

declare dso_local i8* @malloc(i64)

define dso_local i64 @get_buf(i16 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 22
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 2)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i16*
  %RSPAdj_N.16 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i16 %arg1, i16* %ns_ptr3, align 1
  %0 = bitcast i16* %ns_ptr3 to i32*
  %memload = load i32, i32* %0, align 1
  %1 = trunc i32 %memload to i16
  %ESI = sext i16 %1 to i32
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 4), i32 %ESI)
  %2 = bitcast i16* %ns_ptr3 to i64*
  %memload1 = load i64, i64* %2, align 1
  %3 = trunc i64 %memload1 to i16
  %RDI = sext i16 %3 to i64
  %4 = call i8* @zeno_malloc(i64 %RDI)
  %RAX = ptrtoint i8* %4 to i64
  store i64 %RAX, i64* %RSPAdj_N.16, align 1
  %memload2 = load i64, i64* %RSPAdj_N.16, align 1
  %memload3 = load i64, i64* %RSPAdj_N.16, align 1
  %5 = bitcast i16* %ns_ptr3 to i32*
  %memload4 = load i32, i32* %5, align 1
  %6 = trunc i32 %memload4 to i16
  %EAX5 = sext i16 %6 to i32
  %RAX6 = sext i32 %EAX5 to i64
  %RDX = add nsw i64 %memload3, %RAX6
  %highbit = and i64 -9223372036854775808, %RDX
  %SF = icmp ne i64 %highbit, 0
  %ZF = icmp eq i64 %RDX, 0
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 34), i64 %memload2, i64 %RDX)
  %memload8 = load i64, i64* %RSPAdj_N.16, align 1
  ret i64 %memload8
}

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i32 1, i32* %ns_ptr6, align 1
  store i32 65552, i32* %ns_ptr9, align 1
  %memload = load i32, i32* %ns_ptr9, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 71), i32 %memload)
  %memload1 = load i32, i32* %ns_ptr9, align 1
  %0 = trunc i32 %memload1 to i16
  %EDI = sext i16 %0 to i32
  %1 = trunc i32 %EDI to i16
  %RAX = call i64 @get_buf(i16 %1)
  store i64 %RAX, i64* %ns_ptr12, align 1
  %2 = bitcast i64* %RSPAdj_N.32 to i8*
  %3 = getelementptr i8, i8* %2, i64 4
  %4 = bitcast i8* %3 to i32*
  store i32 100, i32* %4, align 1
  %5 = bitcast i64* %RSPAdj_N.32 to i8*
  %6 = getelementptr i8, i8* %5, i64 4
  %7 = bitcast i8* %6 to i32*
  %memload2 = load i32, i32* %7, align 1
  %8 = load i32, i32* %ns_ptr9, align 1
  %9 = sub i32 %memload2, %8
  %10 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload2, i32 %8)
  %CF = extractvalue { i32, i1 } %10, 1
  %ZF = icmp eq i32 %9, 0
  %highbit = and i32 -2147483648, %9
  %SF = icmp ne i32 %highbit, 0
  %11 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload2, i32 %8)
  %OF = extractvalue { i32, i1 } %11, 1
  %12 = and i32 %9, 255
  %13 = call i32 @llvm.ctpop.i32(i32 %12)
  %14 = and i32 %13, 1
  %PF = icmp eq i32 %14, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.4, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, i64* %ns_ptr12, align 1
  %15 = bitcast i64* %RSPAdj_N.32 to i8*
  %16 = getelementptr i8, i8* %15, i64 4
  %17 = bitcast i8* %16 to i64*
  %memload4 = load i64, i64* %17, align 1
  %18 = trunc i64 %memload4 to i32
  %RCX = sext i32 %18 to i64
  %memref-basereg = add i64 %memload3, %RCX
  %19 = inttoptr i64 %memref-basereg to i8*
  store i8 65, i8* %19, align 1
  %memload5 = load i64, i64* %ns_ptr12, align 1
  %20 = bitcast i64* %RSPAdj_N.32 to i8*
  %21 = getelementptr i8, i8* %20, i64 4
  %22 = bitcast i8* %21 to i64*
  %memload6 = load i64, i64* %22, align 1
  %23 = trunc i64 %memload6 to i32
  %RAX7 = sext i32 %23 to i64
  %RSI = add nsw i64 %memload5, %RAX7
  %highbit8 = and i64 -9223372036854775808, %RSI
  %SF9 = icmp ne i64 %highbit8, 0
  %ZF10 = icmp eq i64 %RSI, 0
  %memload11 = load i64, i64* %ns_ptr12, align 1
  %24 = bitcast i64* %RSPAdj_N.32 to i8*
  %25 = getelementptr i8, i8* %24, i64 4
  %26 = bitcast i8* %25 to i64*
  %memload12 = load i64, i64* %26, align 1
  %27 = trunc i64 %memload12 to i32
  %RCX13 = sext i32 %27 to i64
  %memref-basereg14 = add i64 %memload11, %RCX13
  %28 = inttoptr i64 %memref-basereg14 to i32*
  %memload15 = load i32, i32* %28, align 1
  %29 = trunc i32 %memload15 to i8
  %EDX = sext i8 %29 to i32
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 101), i64 %RSI, i32 %EDX, i64 %RCX13)
  %memload17 = load i64, i64* %ns_ptr12, align 1
  %30 = bitcast i64* %RSPAdj_N.32 to i8*
  %31 = getelementptr i8, i8* %30, i64 4
  %32 = bitcast i8* %31 to i64*
  %memload18 = load i64, i64* %32, align 1
  %33 = trunc i64 %memload18 to i32
  %RCX19 = sext i32 %33 to i64
  %memref-basereg20 = add i64 %memload17, %RCX19
  %34 = inttoptr i64 %memref-basereg20 to i32*
  %memload21 = load i32, i32* %34, align 1
  %35 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %35 to i32
  %36 = sub i32 %EAX22, 65
  %37 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 65)
  %CF23 = extractvalue { i32, i1 } %37, 1
  %ZF24 = icmp eq i32 %36, 0
  %highbit25 = and i32 -2147483648, %36
  %SF26 = icmp ne i32 %highbit25, 0
  %38 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 65)
  %OF27 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %36, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF28 = icmp eq i32 %41, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %ns_ptr6, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %entry
  %42 = load i32, i32* %ns_ptr6, align 1
  %43 = zext i32 %42 to i64
  %44 = zext i32 0 to i64
  %45 = sub i64 %43, %44
  %46 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %43, i64 %44)
  %CF29 = extractvalue { i64, i1 } %46, 1
  %ZF30 = icmp eq i64 %45, 0
  %highbit31 = and i64 -9223372036854775808, %45
  %SF32 = icmp ne i64 %highbit31, 0
  %47 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %43, i64 %44)
  %OF33 = extractvalue { i64, i1 } %47, 1
  %48 = and i64 %45, 255
  %49 = call i64 @llvm.ctpop.i64(i64 %48)
  %50 = and i64 %49, 1
  %PF34 = icmp eq i64 %50, 0
  %CmpZF_JNE37 = icmp eq i1 %ZF30, false
  br i1 %CmpZF_JNE37, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %EAX35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 138))
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %memload36 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload36
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

declare i8* @zeno_malloc(i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
