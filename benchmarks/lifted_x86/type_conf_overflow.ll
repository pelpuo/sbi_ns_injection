; ModuleID = './bin/type_conf_overflow'
source_filename = "./bin/type_conf_overflow"

@rodata_18 = private unnamed_addr constant [206 x i8] c"\01\00\02\00\00\00\00\00Allocating buffer of size %d\0A\00\00\00Bounds of allocated buffer: %p - %p\0A\00Requesting buffer of size %d\0A\00\00\00\00\00\00Retrieved value at address %p: 0x%x\0A\00\00\00\00Test Failed: OOB access caused by int->short overflow\00", align 8, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

declare dso_local ptr @malloc(i64)

define dso_local i64 @get_buf(i32 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.20 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %2 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %3 = trunc i32 %arg1 to i16
  store i16 %3, ptr %RBP_N.20, align 1
  %memload = load i32, ptr %RBP_N.20, align 1
  %4 = trunc i32 %memload to i16
  %EAX = sext i16 %4 to i32
  %EAX1 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([206 x i8], ptr @rodata_18, i32 0, i32 8), i32 %EAX)
  %memload2 = load i64, ptr %RBP_N.20, align 1
  %5 = trunc i64 %memload2 to i16
  %RAX3 = sext i16 %5 to i64
  %6 = call ptr @malloc(i64 %RAX3)
  %RAX4 = ptrtoint ptr %6 to i64
  store i64 %RAX4, ptr %RBP_N.8, align 1
  %memload5 = load i64, ptr %RBP_N.20, align 1
  %7 = trunc i64 %memload5 to i16
  %RDX = sext i16 %7 to i64
  %memload6 = load i64, ptr %RBP_N.8, align 1
  %RDX7 = add nsw i64 %RDX, %memload6
  %highbit = and i64 -9223372036854775808, %RDX7
  %SF = icmp ne i64 %highbit, 0
  %ZF = icmp eq i64 %RDX7, 0
  %memload8 = load i64, ptr %RBP_N.8, align 1
  %EAX10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([206 x i8], ptr @rodata_18, i32 0, i32 40), i64 %memload8, i64 %RDX7)
  %memload11 = load i64, ptr %RBP_N.8, align 1
  ret i64 %memload11
}

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.20 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 28
  %RBP_N.12 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %4 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 1, ptr %RBP_N.20, align 1
  store i32 65552, ptr %RBP_N.16, align 1
  %memload = load i32, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([206 x i8], ptr @rodata_18, i32 0, i32 77), i32 %memload)
  %memload1 = load i32, ptr %RBP_N.16, align 1
  %5 = trunc i32 %memload1 to i16
  %EAX2 = sext i16 %5 to i32
  %RAX3 = call i64 @get_buf(i32 %EAX2)
  store i64 %RAX3, ptr %RBP_N.8, align 1
  store i32 100, ptr %RBP_N.12, align 1
  %memload4 = load i32, ptr %RBP_N.12, align 1
  %6 = load i32, ptr %RBP_N.16, align 1
  %7 = sub i32 %memload4, %6
  %8 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload4, i32 %6)
  %CF = extractvalue { i32, i1 } %8, 1
  %ZF = icmp eq i32 %7, 0
  %highbit = and i32 -2147483648, %7
  %SF = icmp ne i32 %highbit, 0
  %9 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload4, i32 %6)
  %OF = extractvalue { i32, i1 } %9, 1
  %10 = and i32 %7, 255
  %11 = call i32 @llvm.ctpop.i32(i32 %10)
  %12 = and i32 %11, 1
  %PF = icmp eq i32 %12, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.1

bb.1:                                             ; preds = %entry
  %memload5 = load i32, ptr %RBP_N.12, align 1
  %RDX = sext i32 %memload5 to i64
  %memload6 = load i64, ptr %RBP_N.8, align 1
  %RAX10 = add nsw i64 %memload6, %RDX
  %highbit7 = and i64 -9223372036854775808, %RAX10
  %SF8 = icmp ne i64 %highbit7, 0
  %ZF9 = icmp eq i64 %RAX10, 0
  %13 = inttoptr i64 %RAX10 to ptr
  store i8 65, ptr %13, align 1
  %memload11 = load i32, ptr %RBP_N.12, align 1
  %RDX12 = sext i32 %memload11 to i64
  %memload13 = load i64, ptr %RBP_N.8, align 1
  %RAX17 = add nsw i64 %memload13, %RDX12
  %highbit14 = and i64 -9223372036854775808, %RAX17
  %SF15 = icmp ne i64 %highbit14, 0
  %ZF16 = icmp eq i64 %RAX17, 0
  %14 = inttoptr i64 %RAX17 to ptr
  %memload18 = load i32, ptr %14, align 1
  %15 = trunc i32 %memload18 to i8
  %EAX19 = zext i8 %15 to i32
  %16 = trunc i32 %EAX19 to i8
  %EAX20 = sext i8 %16 to i32
  %memload21 = load i32, ptr %RBP_N.12, align 1
  %RCX = sext i32 %memload21 to i64
  %memload22 = load i64, ptr %RBP_N.8, align 1
  %RCX26 = add nsw i64 %RCX, %memload22
  %highbit23 = and i64 -9223372036854775808, %RCX26
  %SF24 = icmp ne i64 %highbit23, 0
  %ZF25 = icmp eq i64 %RCX26, 0
  %EAX28 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([206 x i8], ptr @rodata_18, i32 0, i32 112), i64 %RCX26, i32 %EAX20, i64 %RCX26)
  %memload29 = load i32, ptr %RBP_N.12, align 1
  %RDX30 = sext i32 %memload29 to i64
  %memload31 = load i64, ptr %RBP_N.8, align 1
  %RAX35 = add nsw i64 %memload31, %RDX30
  %highbit32 = and i64 -9223372036854775808, %RAX35
  %SF33 = icmp ne i64 %highbit32, 0
  %ZF34 = icmp eq i64 %RAX35, 0
  %17 = inttoptr i64 %RAX35 to ptr
  %memload36 = load i32, ptr %17, align 1
  %18 = trunc i32 %memload36 to i8
  %EAX37 = zext i8 %18 to i32
  %19 = sub i32 %EAX37, 65
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX37, i32 65)
  %CF38 = extractvalue { i32, i1 } %20, 1
  %ZF39 = icmp eq i32 %19, 0
  %highbit40 = and i32 -2147483648, %19
  %SF41 = icmp ne i32 %highbit40, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX37, i32 65)
  %OF42 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF43 = icmp eq i32 %24, 0
  %CmpZF_JNE = icmp eq i1 %ZF39, false
  br i1 %CmpZF_JNE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, ptr %RBP_N.20, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1, %entry
  %25 = load i32, ptr %RBP_N.20, align 1
  %26 = zext i32 %25 to i64
  %27 = zext i32 0 to i64
  %28 = sub i64 %26, %27
  %29 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %26, i64 %27)
  %CF44 = extractvalue { i64, i1 } %29, 1
  %ZF45 = icmp eq i64 %28, 0
  %highbit46 = and i64 -9223372036854775808, %28
  %SF47 = icmp ne i64 %highbit46, 0
  %30 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %26, i64 %27)
  %OF48 = extractvalue { i64, i1 } %30, 1
  %31 = and i64 %28, 255
  %32 = call i64 @llvm.ctpop.i64(i64 %31)
  %33 = and i64 %32, 1
  %PF49 = icmp eq i64 %33, 0
  %CmpZF_JNE52 = icmp eq i1 %ZF45, false
  br i1 %CmpZF_JNE52, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX51 = call i32 @puts(ptr getelementptr inbounds ([206 x i8], ptr @rodata_18, i32 0, i32 152))
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
