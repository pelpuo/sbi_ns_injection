; ModuleID = './bin/oobw_direct_index_string_heap'
source_filename = "./bin/oobw_direct_index_string_heap"

@.rodata13 = private unnamed_addr constant [115 x i8] c"\01\00\02\00\00\00\00\00abcde\00\00\00fghij\00\00\00String 1: %s\0A\00\00\00String 2: %s\0A\00\00\00Test Failed: Direct char array on heap Out of Bounds Write\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 16)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @memcpy(ptr %5, ptr getelementptr inbounds ([115 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %7 = load ptr, ptr %4, align 8
  %8 = call ptr @memcpy(ptr %7, ptr getelementptr inbounds ([115 x i8], ptr @.rodata13, i64 0, i32 16), i64 16)
  %9 = load ptr, ptr %2, align 8
  %10 = ptrtoint ptr %9 to i64
  %11 = add i64 %10, 32
  %12 = inttoptr i64 %11 to ptr
  %13 = getelementptr inbounds i8, ptr %12, i32 0
  store i64 120, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([115 x i8], ptr @.rodata13, i64 0, i32 24), ptr %14, i32 16)
  %16 = load ptr, ptr %4, align 8
  %17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([115 x i8], ptr @.rodata13, i64 0, i32 40), ptr %16, i32 16)
  %18 = load ptr, ptr %4, align 8
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i64
  %21 = icmp ne i64 %20, 120
  br i1 %21, label %24, label %22

22:                                               ; preds = %0
  %23 = call i32 @puts(ptr getelementptr inbounds ([115 x i8], ptr @.rodata13, i64 0, i32 56))
  br label %24

24:                                               ; preds = %0, %22
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)
