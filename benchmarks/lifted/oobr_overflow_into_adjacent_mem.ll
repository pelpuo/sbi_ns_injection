; ModuleID = './bin/oobr_overflow_into_adjacent_mem'
source_filename = "./bin/oobr_overflow_into_adjacent_mem"

@.rodata13 = private unnamed_addr constant [218 x i8] c"\01\00\02\00\00\00\00\00c: %p\0A\00\00d: %p\0A\00\00e: %p\0A\0A\00This is a secret!!!\00\00\00\00\0011111111111111111111111111111111\00\00\00\00\00\00\00\00c: %s\0A\00\00Test Failed: Out of Bounds Read caused by string null terminator corruption\00\00\00\00\001111111111111111111111111\00\00\00\00\00\00\00A\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 32)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = call ptr @malloc(i64 16)
  %6 = alloca ptr, align 8
  store ptr %5, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 8), ptr %7)
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 16), ptr %9)
  %11 = load ptr, ptr %6, align 8
  %12 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 24), ptr %11)
  %13 = load ptr, ptr %4, align 8
  %14 = call ptr @memcpy(ptr %13, ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 32), i64 32)
  %15 = load ptr, ptr %2, align 8
  %16 = call ptr @memcpy(ptr %15, ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 56), i64 32)
  %17 = load ptr, ptr %2, align 8
  %18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 96), ptr %17, i64 32)
  %19 = alloca i64, align 8
  store i64 0, ptr %19, align 8
  br label %20

20:                                               ; preds = %0, %47
  %21 = load i64, ptr %19, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = ptrtoint ptr %22 to i64
  %24 = add i64 %21, %23
  %25 = inttoptr i64 %24 to ptr
  %26 = getelementptr inbounds i8, ptr %25, i32 0
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i64
  %29 = icmp ne i64 %28, 0
  br i1 %29, label %30, label %42

30:                                               ; preds = %20
  %31 = load i64, ptr %19, align 8
  %32 = load ptr, ptr %2, align 8
  %33 = ptrtoint ptr %32 to i64
  %34 = add i64 %31, %33
  %35 = inttoptr i64 %34 to ptr
  %36 = getelementptr inbounds i8, ptr %35, i32 0
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i64
  %39 = icmp eq i64 %38, 49
  br i1 %39, label %47, label %40

40:                                               ; preds = %30
  %41 = call i32 @puts(ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 104))
  br label %42

42:                                               ; preds = %40, %20
  %43 = load ptr, ptr %2, align 8
  call void @free(ptr %43)
  %44 = load ptr, ptr %2, align 8
  %45 = call ptr @memcpy(ptr %44, ptr getelementptr inbounds ([218 x i8], ptr @.rodata13, i64 0, i32 184), i64 48)
  %46 = load ptr, ptr %4, align 8
  call void @free(ptr %46)
  ret i32 0

47:                                               ; preds = %30
  %48 = load i64, ptr %19, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr %19, align 8
  br label %20
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @puts(ptr)

declare dso_local void @free(ptr)
