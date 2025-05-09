; ModuleID = './bin/uaf_memcpy'
source_filename = "./bin/uaf_memcpy"

@.rodata13 = private unnamed_addr constant [137 x i8] c"\01\00\02\00\00\00\00\00hello!\00\00a contains: %s\0A\0A\00\00\00\00\00\00\00\00a: %p\0A\00\00b: %p\0A\0A\00RANDOMSTRING\00\00\00\00b contains: %s\0A\0A\00\00\00\00\00\00\00\00Test Failed: Use After Free using memcpy\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @memcpy(ptr %3, ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %5 = load ptr, ptr %2, align 8
  %6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 16), ptr %5, i32 16)
  %7 = load ptr, ptr %2, align 8
  %8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 40), ptr %7, i32 16)
  %9 = load ptr, ptr %2, align 8
  call void @free(ptr %9)
  %10 = call ptr @malloc(i64 10)
  %11 = alloca ptr, align 8
  store ptr %10, ptr %11, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 48), ptr %12, i32 16)
  %14 = load ptr, ptr %2, align 8
  %15 = call ptr @memcpy(ptr %14, ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 56), i64 16)
  %16 = load ptr, ptr %2, align 8
  %17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 16), ptr %16, i32 16)
  %18 = load ptr, ptr %11, align 8
  %19 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 72), ptr %18, i32 16)
  %20 = load ptr, ptr %2, align 8
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i64
  %23 = icmp ne i64 %22, 82
  br i1 %23, label %26, label %24

24:                                               ; preds = %0
  %25 = call i32 @puts(ptr getelementptr inbounds ([137 x i8], ptr @.rodata13, i64 0, i32 96))
  br label %26

26:                                               ; preds = %0, %24
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
