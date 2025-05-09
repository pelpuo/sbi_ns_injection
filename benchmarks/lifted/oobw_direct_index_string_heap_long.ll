; ModuleID = './bin/oobw_direct_index_string_heap_long'
source_filename = "./bin/oobw_direct_index_string_heap_long"

@.rodata13 = private unnamed_addr constant [136 x i8] c"\01\00\02\00\00\00\00\00abcde\00\00\00fghij\00\00\00String 1: %s\0A\00\00\00String 2: %s\0A\00\00\00Test Failed: Char array on heap using long pointer Out of Bounds Write\00\00!!HACKED", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 16)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @memcpy(ptr %5, ptr getelementptr inbounds ([136 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %7 = load ptr, ptr %4, align 8
  %8 = call ptr @memcpy(ptr %7, ptr getelementptr inbounds ([136 x i8], ptr @.rodata13, i64 0, i32 16), i64 16)
  %9 = load ptr, ptr %2, align 8
  %10 = ptrtoint ptr %9 to i64
  %11 = add i64 %10, 32
  %12 = alloca i64, align 8
  store i64 %11, ptr %12, align 8
  %13 = load i64, ptr %12, align 8
  %14 = load i64, ptr getelementptr inbounds ([136 x i8], ptr @.rodata13, i64 0, i32 128), align 8
  %15 = inttoptr i64 %13 to ptr
  %16 = getelementptr inbounds i64, ptr %15, i32 0
  store i64 %14, ptr %16, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([136 x i8], ptr @.rodata13, i64 0, i32 24), ptr %17, i32 16)
  %19 = load ptr, ptr %4, align 8
  %20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([136 x i8], ptr @.rodata13, i64 0, i32 40), ptr %19, i32 16)
  %21 = alloca i64, align 8
  store i64 0, ptr %21, align 8
  br label %22

22:                                               ; preds = %0, %39
  %23 = load i64, ptr %21, align 8
  %24 = add i64 %23, 0
  %25 = icmp sge i64 4, %24
  br i1 %25, label %27, label %26

26:                                               ; preds = %22
  ret i32 0

27:                                               ; preds = %22
  %28 = load i64, ptr %21, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = ptrtoint ptr %29 to i64
  %31 = add i64 %28, %30
  %32 = inttoptr i64 %31 to ptr
  %33 = getelementptr inbounds i8, ptr %32, i32 0
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i64
  %36 = icmp ne i64 %35, 72
  br i1 %36, label %39, label %37

37:                                               ; preds = %27
  %38 = call i32 @puts(ptr getelementptr inbounds ([136 x i8], ptr @.rodata13, i64 0, i32 56))
  br label %39

39:                                               ; preds = %27, %37
  %40 = load i64, ptr %21, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr %21, align 8
  br label %22
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)
