; ModuleID = './bin/df_nonadjacent_free'
source_filename = "./bin/df_nonadjacent_free"

@.rodata13 = private unnamed_addr constant [127 x i8] c"\01\00\02\00\00\00\00\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00b: %p\0Ac: %p\0A\00\00\00\00Test Failed: Non-adjacent free sequence leading to Double Free\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 16)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @memcpy(ptr %5, ptr getelementptr inbounds ([127 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %7 = load ptr, ptr %2, align 8
  %8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @.rodata13, i64 0, i32 24), ptr %7, i32 16)
  %9 = load ptr, ptr %2, align 8
  %10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @.rodata13, i64 0, i32 40), ptr %9, i32 16)
  %11 = load ptr, ptr %2, align 8
  call void @free(ptr %11)
  %12 = load ptr, ptr %4, align 8
  call void @free(ptr %12)
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr %13)
  %14 = call ptr @malloc(i64 10)
  %15 = alloca ptr, align 8
  store ptr %14, ptr %15, align 8
  %16 = call ptr @malloc(i64 10)
  %17 = alloca ptr, align 8
  store ptr %16, ptr %17, align 8
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %15, align 8
  %20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @.rodata13, i64 0, i32 48), ptr %19, ptr %18)
  %21 = load ptr, ptr %15, align 8
  %22 = load ptr, ptr %17, align 8
  %23 = icmp ne ptr %21, %22
  br i1 %23, label %26, label %24

24:                                               ; preds = %0
  %25 = call i32 @puts(ptr getelementptr inbounds ([127 x i8], ptr @.rodata13, i64 0, i32 64))
  br label %26

26:                                               ; preds = %0, %24
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
