; ModuleID = './bin/oobr_overflow_into_adjacent_mem'
source_filename = "./bin/oobr_overflow_into_adjacent_mem"

@rodata_15 = private unnamed_addr constant [197 x i8] c"\01\00\02\00c: %p\0A\00d: %p\0A\00e: %p\0A\0A\00This is a secret!!!\0011111111111111111111111111111111\00c: %s\0A\00Test Failed: Out of Bounds Read caused by string null terminator corruption\0A\001111111111111111111111111\00\00\00\00\00\00\00A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local ptr @memcpy(ptr, ptr, i64)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.36 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.32 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.24 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.16 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %5 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX = ptrtoint ptr %7 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %8 = zext i32 32 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX1 = ptrtoint ptr %9 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %10 = zext i32 16 to i64
  %11 = call ptr @malloc(i64 %10)
  %RAX2 = ptrtoint ptr %11 to i64
  store i64 %RAX2, ptr %RBP_N.32, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload)
  %memload3 = load i64, ptr %RBP_N.24, align 1
  %EAX4 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload5 = load i64, ptr %RBP_N.32, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 18), i64 %memload5)
  %memload7 = load i64, ptr %RBP_N.24, align 1
  %memload8 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 26), align 1, !ROData_Content !1
  %12 = inttoptr i64 %memload7 to ptr
  store i64 %memload8, ptr %12, align 1
  %memload9 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 34), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload7, 8
  %13 = inttoptr i64 %memref-disp to ptr
  store i64 %memload9, ptr %13, align 1
  %memload10 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 42), align 1, !ROData_Content !3
  %memref-disp11 = add i64 %memload7, 16
  %14 = inttoptr i64 %memref-disp11 to ptr
  store i64 %memload10, ptr %14, align 1
  %memload12 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 50), align 1, !ROData_Content !4
  %memref-disp13 = add i64 %memload7, 24
  %15 = inttoptr i64 %memref-disp13 to ptr
  store i64 %memload12, ptr %15, align 1
  %memload14 = load i64, ptr %RBP_N.16, align 1
  %memload15 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 46), align 1, !ROData_Content !5
  %16 = inttoptr i64 %memload14 to ptr
  store i64 %memload15, ptr %16, align 1
  %memload16 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 54), align 1, !ROData_Content !6
  %memref-disp17 = add i64 %memload14, 8
  %17 = inttoptr i64 %memref-disp17 to ptr
  store i64 %memload16, ptr %17, align 1
  %memload18 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 62), align 1, !ROData_Content !7
  %memref-disp19 = add i64 %memload14, 16
  %18 = inttoptr i64 %memref-disp19 to ptr
  store i64 %memload18, ptr %18, align 1
  %memload20 = load i64, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 70), align 1, !ROData_Content !8
  %memref-disp21 = add i64 %memload14, 24
  %19 = inttoptr i64 %memref-disp21 to ptr
  store i64 %memload20, ptr %19, align 1
  %memload22 = load i64, ptr %RBP_N.16, align 1
  %EAX23 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 79), i64 %memload22)
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.4
  %memload24 = load i64, ptr %RBP_N.16, align 1
  %memload25 = load i64, ptr %RBP_N.36, align 1
  %20 = trunc i64 %memload25 to i32
  %RCX = sext i32 %20 to i64
  %memref-basereg = add i64 %memload24, %RCX
  %21 = inttoptr i64 %memref-basereg to ptr
  %memload26 = load i32, ptr %21, align 1
  %22 = trunc i32 %memload26 to i8
  %EAX27 = sext i8 %22 to i32
  %23 = sub i32 %EAX27, 0
  %24 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX27, i32 0)
  %CF = extractvalue { i32, i1 } %24, 1
  %ZF = icmp eq i32 %23, 0
  %highbit = and i32 -2147483648, %23
  %SF = icmp ne i32 %highbit, 0
  %25 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX27, i32 0)
  %OF = extractvalue { i32, i1 } %25, 1
  %26 = and i32 %23, 255
  %27 = call i32 @llvm.ctpop.i32(i32 %26)
  %28 = and i32 %27, 1
  %PF = icmp eq i32 %28, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload28 = load i64, ptr %RBP_N.16, align 1
  %memload29 = load i64, ptr %RBP_N.36, align 1
  %29 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %29 to i64
  %memref-basereg31 = add i64 %memload28, %RCX30
  %30 = inttoptr i64 %memref-basereg31 to ptr
  %memload32 = load i32, ptr %30, align 1
  %31 = trunc i32 %memload32 to i8
  %EAX33 = sext i8 %31 to i32
  %32 = sub i32 %EAX33, 49
  %33 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX33, i32 49)
  %CF34 = extractvalue { i32, i1 } %33, 1
  %ZF35 = icmp eq i32 %32, 0
  %highbit36 = and i32 -2147483648, %32
  %SF37 = icmp ne i32 %highbit36, 0
  %34 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX33, i32 49)
  %OF38 = extractvalue { i32, i1 } %34, 1
  %35 = and i32 %32, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %35)
  %37 = and i32 %36, 1
  %PF39 = icmp eq i32 %37, 0
  %CmpZF_JE54 = icmp eq i1 %ZF35, true
  br i1 %CmpZF_JE54, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX40 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 86))
  br label %bb.5

bb.4:                                             ; preds = %bb.2
  %memload41 = load i32, ptr %RBP_N.36, align 1
  %EAX48 = add i32 %memload41, 1
  %38 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload41, i32 1)
  %CF42 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %EAX48, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF43 = icmp eq i32 %41, 0
  %ZF44 = icmp eq i32 %EAX48, 0
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %42 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload41, i32 1)
  %OF47 = extractvalue { i32, i1 } %42, 1
  store i32 %EAX48, ptr %RBP_N.36, align 1
  br label %bb.1

bb.5:                                             ; preds = %bb.3, %bb.1
  %memload49 = load i64, ptr %RBP_N.16, align 1
  %43 = inttoptr i64 %memload49 to ptr
  call void @free(ptr %43)
  %memload50 = load i64, ptr %RBP_N.16, align 1
  %44 = inttoptr i64 %memload50 to ptr
  %45 = zext i32 48 to i64
  %46 = call ptr @memcpy(ptr %44, ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 163), i64 %45)
  %RAX51 = ptrtoint ptr %46 to i64
  %memload52 = load i64, ptr %RBP_N.24, align 1
  %47 = inttoptr i64 %memload52 to ptr
  call void @free(ptr %47)
  %memload53 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload53
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 26)}
!2 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 34)}
!3 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 42)}
!4 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 50)}
!5 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 46)}
!6 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 54)}
!7 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 62)}
!8 = !{ptr getelementptr inbounds ([197 x i8], ptr @rodata_15, i32 0, i32 70)}
