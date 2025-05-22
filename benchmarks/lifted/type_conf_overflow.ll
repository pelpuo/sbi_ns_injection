; ModuleID = './bin/type_conf_overflow'
source_filename = "./bin/type_conf_overflow"

@rodata_15 = private unnamed_addr constant [193 x i8] c"\01\00\02\00Allocating buffer of size %d\0A\00Bounds of allocated buffer: %p - %p\0A\00Requesting buffer of size %d\0A\00Retrieved value at address %p: 0x%x\0A\00Test Failed: OOB access caused by int->short overflow\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

declare dso_local i8* @malloc(i64)

define dso_local i64 @get_buf(i16 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %RSPAdj_N.16 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 22
  %RBP_N.2 = bitcast i8* %0 to i16*
  %1 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %1 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i16 %arg1, i16* %RBP_N.2, align 1
  %2 = bitcast i16* %RBP_N.2 to i32*
  %memload = load i32, i32* %2, align 1
  %3 = trunc i32 %memload to i16
  %ESI = sext i16 %3 to i32
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 4), i32 %ESI)
  %4 = bitcast i16* %RBP_N.2 to i64*
  %memload1 = load i64, i64* %4, align 1
  %5 = trunc i64 %memload1 to i16
  %RDI = sext i16 %5 to i64
  %6 = call i8* @malloc(i64 %RDI)
  %RAX = ptrtoint i8* %6 to i64
  store i64 %RAX, i64* %RSPAdj_N.16, align 1
  %memload2 = load i64, i64* %RSPAdj_N.16, align 1
  %memload3 = load i64, i64* %RSPAdj_N.16, align 1
  %7 = bitcast i16* %RBP_N.2 to i32*
  %memload4 = load i32, i32* %7, align 1
  %8 = trunc i32 %memload4 to i16
  %EAX5 = sext i16 %8 to i32
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
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.24 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.12 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.8 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.4 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %4 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 1, i32* %RBP_N.8, align 1
  store i32 65552, i32* %RBP_N.12, align 1
  %memload = load i32, i32* %RBP_N.12, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 71), i32 %memload)
  %memload1 = load i32, i32* %RBP_N.12, align 1
  %5 = trunc i32 %memload1 to i16
  %EDI = sext i16 %5 to i32
  %6 = trunc i32 %EDI to i16
  %RAX = call i64 @get_buf(i16 %6)
  store i64 %RAX, i64* %RBP_N.24, align 1
  %7 = bitcast i64* %RSPAdj_N.32 to i8*
  %8 = getelementptr i8, i8* %7, i64 4
  %9 = bitcast i8* %8 to i32*
  store i32 100, i32* %9, align 1
  %10 = bitcast i64* %RSPAdj_N.32 to i8*
  %11 = getelementptr i8, i8* %10, i64 4
  %12 = bitcast i8* %11 to i32*
  %memload2 = load i32, i32* %12, align 1
  %13 = load i32, i32* %RBP_N.12, align 1
  %14 = sub i32 %memload2, %13
  %15 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload2, i32 %13)
  %CF = extractvalue { i32, i1 } %15, 1
  %ZF = icmp eq i32 %14, 0
  %highbit = and i32 -2147483648, %14
  %SF = icmp ne i32 %highbit, 0
  %16 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload2, i32 %13)
  %OF = extractvalue { i32, i1 } %16, 1
  %17 = and i32 %14, 255
  %18 = call i32 @llvm.ctpop.i32(i32 %17)
  %19 = and i32 %18, 1
  %PF = icmp eq i32 %19, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.4, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, i64* %RBP_N.24, align 1
  %20 = bitcast i64* %RSPAdj_N.32 to i8*
  %21 = getelementptr i8, i8* %20, i64 4
  %22 = bitcast i8* %21 to i64*
  %memload4 = load i64, i64* %22, align 1
  %23 = trunc i64 %memload4 to i32
  %RCX = sext i32 %23 to i64
  %memref-basereg = add i64 %memload3, %RCX
  %24 = inttoptr i64 %memref-basereg to i8*
  store i8 65, i8* %24, align 1
  %memload5 = load i64, i64* %RBP_N.24, align 1
  %25 = bitcast i64* %RSPAdj_N.32 to i8*
  %26 = getelementptr i8, i8* %25, i64 4
  %27 = bitcast i8* %26 to i64*
  %memload6 = load i64, i64* %27, align 1
  %28 = trunc i64 %memload6 to i32
  %RAX7 = sext i32 %28 to i64
  %RSI = add nsw i64 %memload5, %RAX7
  %highbit8 = and i64 -9223372036854775808, %RSI
  %SF9 = icmp ne i64 %highbit8, 0
  %ZF10 = icmp eq i64 %RSI, 0
  %memload11 = load i64, i64* %RBP_N.24, align 1
  %29 = bitcast i64* %RSPAdj_N.32 to i8*
  %30 = getelementptr i8, i8* %29, i64 4
  %31 = bitcast i8* %30 to i64*
  %memload12 = load i64, i64* %31, align 1
  %32 = trunc i64 %memload12 to i32
  %RCX13 = sext i32 %32 to i64
  %memref-basereg14 = add i64 %memload11, %RCX13
  %33 = inttoptr i64 %memref-basereg14 to i32*
  %memload15 = load i32, i32* %33, align 1
  %34 = trunc i32 %memload15 to i8
  %EDX = sext i8 %34 to i32
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 101), i64 %RSI, i32 %EDX, i64 %RCX13)
  %memload17 = load i64, i64* %RBP_N.24, align 1
  %35 = bitcast i64* %RSPAdj_N.32 to i8*
  %36 = getelementptr i8, i8* %35, i64 4
  %37 = bitcast i8* %36 to i64*
  %memload18 = load i64, i64* %37, align 1
  %38 = trunc i64 %memload18 to i32
  %RCX19 = sext i32 %38 to i64
  %memref-basereg20 = add i64 %memload17, %RCX19
  %39 = inttoptr i64 %memref-basereg20 to i32*
  %memload21 = load i32, i32* %39, align 1
  %40 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %40 to i32
  %41 = sub i32 %EAX22, 65
  %42 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 65)
  %CF23 = extractvalue { i32, i1 } %42, 1
  %ZF24 = icmp eq i32 %41, 0
  %highbit25 = and i32 -2147483648, %41
  %SF26 = icmp ne i32 %highbit25, 0
  %43 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 65)
  %OF27 = extractvalue { i32, i1 } %43, 1
  %44 = and i32 %41, 255
  %45 = call i32 @llvm.ctpop.i32(i32 %44)
  %46 = and i32 %45, 1
  %PF28 = icmp eq i32 %46, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %RBP_N.8, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %entry
  %47 = load i32, i32* %RBP_N.8, align 1
  %48 = zext i32 %47 to i64
  %49 = zext i32 0 to i64
  %50 = sub i64 %48, %49
  %51 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %48, i64 %49)
  %CF29 = extractvalue { i64, i1 } %51, 1
  %ZF30 = icmp eq i64 %50, 0
  %highbit31 = and i64 -9223372036854775808, %50
  %SF32 = icmp ne i64 %highbit31, 0
  %52 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %48, i64 %49)
  %OF33 = extractvalue { i64, i1 } %52, 1
  %53 = and i64 %50, 255
  %54 = call i64 @llvm.ctpop.i64(i64 %53)
  %55 = and i64 %54, 1
  %PF34 = icmp eq i64 %55, 0
  %CmpZF_JNE37 = icmp eq i1 %ZF30, false
  br i1 %CmpZF_JNE37, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %EAX35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([193 x i8], [193 x i8]* @rodata_15, i32 0, i32 138))
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %memload36 = load i32, i32* %RBP_N.4, align 1
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
