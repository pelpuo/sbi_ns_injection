; ModuleID = './bin/ip_large_size'
source_filename = "./bin/ip_large_size"

@.rodata13 = private unnamed_addr constant [128 x i8] c"\01\00\02\00\00\00\00\00Address of x: %p\0A\00\00\00\00\00\00\00Value of x: %d\0A\00Test Failed: Illegal pointer access caused by incorrect sized memory allocation\00", align 8

define dso_local i32 @main() {
  %1 = alloca i32, align 4
  store i32 poison, ptr %1, align 4
  %2 = load i32, ptr %1, align 4
  %3 = sext i32 %2 to i64
  %4 = call ptr @malloc(i64 %3)
  %5 = alloca ptr, align 8
  store ptr %4, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @.rodata13, i64 0, i32 8), ptr %6)
  %8 = load ptr, ptr %5, align 8
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @.rodata13, i64 0, i32 32), i32 %9)
  %11 = load ptr, ptr %5, align 8
  %12 = load i32, ptr %11, align 4
  %13 = sext i32 %12 to i64
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %17, label %15

15:                                               ; preds = %0
  %16 = call i32 @puts(ptr getelementptr inbounds ([128 x i8], ptr @.rodata13, i64 0, i32 48))
  br label %17

17:                                               ; preds = %0, %15
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)
