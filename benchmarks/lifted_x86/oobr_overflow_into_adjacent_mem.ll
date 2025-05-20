; ModuleID = './bin/oobr_overflow_into_adjacent_mem'
source_filename = "./bin/oobr_overflow_into_adjacent_mem"

@rodata_18 = private unnamed_addr constant [210 x i8] c"\01\00\02\00\00\00\00\00c: %p\0A\00d: %p\0A\00e: %p\0A\0A\00This is a secret!!!\00\00\00\00\00\00\0011111111111111111111111111111111\00c: %s\0A\00Test Failed: Out of Bounds Read caused by string null terminator corruption\00\00\00\00\001111111111111111111111111\00\00\00\00\00\00\00A\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @puts(ptr)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.24, align 1
  %6 = zext i32 32 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX1 = ptrtoint ptr %7 to i64
  store i64 %RAX1, ptr %RBP_N.16, align 1
  %8 = zext i32 16 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX2 = ptrtoint ptr %9 to i64
  store i64 %RAX2, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload)
  %memload4 = load i64, ptr %RBP_N.16, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 15), i64 %memload4)
  %memload7 = load i64, ptr %RBP_N.8, align 1
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 22), i64 %memload7)
  %memload10 = load i64, ptr %RBP_N.16, align 1
  %10 = inttoptr i64 %memload10 to ptr
  %11 = zext i32 32 to i64
  %12 = call ptr @memcpy(ptr %10, ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 30), i64 %11)
  %RAX11 = ptrtoint ptr %12 to i64
  %memload12 = load i64, ptr %RBP_N.24, align 1
  %13 = inttoptr i64 %memload12 to ptr
  %14 = zext i32 32 to i64
  %15 = call ptr @memcpy(ptr %13, ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 56), i64 %14)
  %RAX14 = ptrtoint ptr %15 to i64
  %memload15 = load i64, ptr %RBP_N.24, align 1
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 89), i64 %memload15)
  %16 = ptrtoint ptr %stktop_8 to i64
  %17 = add i64 %16, 4
  %18 = inttoptr i64 %17 to ptr
  store i32 0, ptr %18, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %entry
  %19 = ptrtoint ptr %stktop_8 to i64
  %20 = add i64 %19, 4
  %21 = inttoptr i64 %20 to ptr
  %memload18 = load i32, ptr %21, align 1
  %RDX = sext i32 %memload18 to i64
  %memload19 = load i64, ptr %RBP_N.24, align 1
  %RAX20 = add nsw i64 %memload19, %RDX
  %highbit = and i64 -9223372036854775808, %RAX20
  %SF = icmp ne i64 %highbit, 0
  %ZF = icmp eq i64 %RAX20, 0
  %22 = inttoptr i64 %RAX20 to ptr
  %memload21 = load i32, ptr %22, align 1
  %23 = trunc i32 %memload21 to i8
  %EAX22 = zext i8 %23 to i32
  %24 = trunc i32 %EAX22 to i8
  %25 = trunc i32 %EAX22 to i8
  %26 = and i8 %24, %25
  %highbit23 = and i8 -128, %26
  %SF24 = icmp ne i8 %highbit23, 0
  %ZF25 = icmp eq i8 %26, 0
  %27 = call i8 @llvm.ctpop.i8(i8 %26)
  %28 = and i8 %27, 1
  %PF = icmp eq i8 %28, 0
  %CmpZF_JNE = icmp eq i1 %ZF25, false
  br i1 %CmpZF_JNE, label %bb.1, label %bb.5

bb.1:                                             ; preds = %bb.4
  %29 = ptrtoint ptr %stktop_8 to i64
  %30 = add i64 %29, 4
  %31 = inttoptr i64 %30 to ptr
  %memload26 = load i32, ptr %31, align 1
  %RDX27 = sext i32 %memload26 to i64
  %memload28 = load i64, ptr %RBP_N.24, align 1
  %RAX32 = add nsw i64 %memload28, %RDX27
  %highbit29 = and i64 -9223372036854775808, %RAX32
  %SF30 = icmp ne i64 %highbit29, 0
  %ZF31 = icmp eq i64 %RAX32, 0
  %32 = inttoptr i64 %RAX32 to ptr
  %memload33 = load i32, ptr %32, align 1
  %33 = trunc i32 %memload33 to i8
  %EAX34 = zext i8 %33 to i32
  %34 = sub i32 %EAX34, 49
  %35 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX34, i32 49)
  %CF = extractvalue { i32, i1 } %35, 1
  %ZF35 = icmp eq i32 %34, 0
  %highbit36 = and i32 -2147483648, %34
  %SF37 = icmp ne i32 %highbit36, 0
  %36 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX34, i32 49)
  %OF = extractvalue { i32, i1 } %36, 1
  %37 = and i32 %34, 255
  %38 = call i32 @llvm.ctpop.i32(i32 %37)
  %39 = and i32 %38, 1
  %PF38 = icmp eq i32 %39, 0
  %CmpZF_JE = icmp eq i1 %ZF35, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX40 = call i32 @puts(ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 96))
  br label %bb.5

bb.5:                                             ; preds = %bb.2, %bb.4
  %memload41 = load i64, ptr %RBP_N.24, align 1
  %40 = inttoptr i64 %memload41 to ptr
  call void @free(ptr %40)
  %memload42 = load i64, ptr %RBP_N.24, align 1
  %41 = inttoptr i64 %memload42 to ptr
  %42 = zext i32 48 to i64
  %43 = call ptr @memcpy(ptr %41, ptr getelementptr inbounds ([210 x i8], ptr @rodata_18, i32 0, i32 176), i64 %42)
  %RAX44 = ptrtoint ptr %43 to i64
  %memload45 = load i64, ptr %RBP_N.16, align 1
  %44 = inttoptr i64 %memload45 to ptr
  call void @free(ptr %44)
  ret i32 0

bb.3:                                             ; preds = %bb.1
  %45 = ptrtoint ptr %stktop_8 to i64
  %46 = add i64 %45, 4
  %47 = inttoptr i64 %46 to ptr
  %48 = zext i8 1 to i32
  %49 = load i32, ptr %47, align 1
  %50 = add i32 %49, %48
  %51 = and i32 %50, 255
  %52 = call i32 @llvm.ctpop.i32(i32 %51)
  %53 = and i32 %52, 1
  %PF46 = icmp eq i32 %53, 0
  store i32 %50, ptr %47, align 1
  br label %bb.4
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.ctpop.i8(i8) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
