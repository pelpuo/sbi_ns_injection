; ModuleID = './bin/uaf_wrong_branching'
source_filename = "./bin/uaf_wrong_branching"

@.rodata13 = private unnamed_addr constant [188 x i8] c"\01\00\02\00\00\00\00\00VALUABLE VALUE\00\00HELLO\00\00\00NOT HELLO\00\00\00\00\00\00\00pointer changed to %s\0A\00\00WORLD\00\00\00NOT WORLD\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00NOT EMPTY\00\00\00\00\00\00\00Test Failed: Repeated free operations caused by incorrect branching\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @memcpy(ptr %3, ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %5 = alloca i64, align 8
  store i64 0, ptr %5, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = icmp eq ptr %6, getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 24)
  br i1 %7, label %16, label %8

8:                                                ; preds = %0
  %9 = load ptr, ptr %2, align 8
  %10 = call ptr @memcpy(ptr %9, ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 32), i64 16)
  %11 = load ptr, ptr %2, align 8
  %12 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 48), ptr %11, i32 16)
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr %13)
  %14 = load i64, ptr %5, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr %5, align 8
  br label %16

16:                                               ; preds = %0, %8
  %17 = load ptr, ptr %2, align 8
  %18 = icmp eq ptr %17, getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 72)
  br i1 %18, label %27, label %19

19:                                               ; preds = %16
  %20 = load ptr, ptr %2, align 8
  %21 = call ptr @memcpy(ptr %20, ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 80), i64 16)
  %22 = load ptr, ptr %2, align 8
  %23 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 48), ptr %22, i32 16)
  %24 = load ptr, ptr %2, align 8
  call void @free(ptr %24)
  %25 = load i64, ptr %5, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr %5, align 8
  br label %27

27:                                               ; preds = %16, %19
  %28 = load ptr, ptr %2, align 8
  %29 = icmp eq ptr %28, getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 96)
  br i1 %29, label %38, label %30

30:                                               ; preds = %27
  %31 = load ptr, ptr %2, align 8
  %32 = call ptr @memcpy(ptr %31, ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 104), i64 16)
  %33 = load ptr, ptr %2, align 8
  %34 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 48), ptr %33, i32 16)
  %35 = load ptr, ptr %2, align 8
  call void @free(ptr %35)
  %36 = load i64, ptr %5, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr %5, align 8
  br label %38

38:                                               ; preds = %27, %30
  %39 = load i64, ptr %5, align 8
  %40 = add i64 %39, 0
  %41 = icmp sge i64 1, %40
  br i1 %41, label %44, label %42

42:                                               ; preds = %38
  %43 = call i32 @puts(ptr getelementptr inbounds ([188 x i8], ptr @.rodata13, i64 0, i32 120))
  br label %44

44:                                               ; preds = %38, %42
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
