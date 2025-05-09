; ModuleID = './bin/hm_fake_chunk_malloc'
source_filename = "./bin/hm_fake_chunk_malloc"

@.rodata13 = private unnamed_addr constant [161 x i8] c"\01\00\02\00\00\00\00\00ptr0: %p\0A\00\00\00\00\00\00\00ptr1: %p\0A\00\00\00\00\00\00\00Target: %p\0A\0A\00\00\00\00ptr_x: %p\0A\00\00\00\00\00\00ptr_y: %p\0A\00\00\00\00\00\00Test Failed: Heap manipulation leading to allocation on specific address\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 16)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = call ptr @malloc(i64 16)
  %6 = alloca ptr, align 8
  store ptr %5, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([161 x i8], ptr @.rodata13, i64 0, i32 8), ptr %7)
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([161 x i8], ptr @.rodata13, i64 0, i32 24), ptr %9)
  %11 = load ptr, ptr %6, align 8
  %12 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([161 x i8], ptr @.rodata13, i64 0, i32 40), ptr %11)
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr %13)
  %14 = load ptr, ptr %4, align 8
  call void @free(ptr %14)
  %15 = load ptr, ptr %4, align 8
  %16 = load i64, ptr %15, align 8
  %17 = add i64 %16, 64
  %18 = load ptr, ptr %4, align 8
  store i64 %17, ptr %18, align 8
  %19 = call ptr @malloc(i64 16)
  %20 = alloca ptr, align 8
  store ptr %19, ptr %20, align 8
  %21 = call ptr @malloc(i64 16)
  %22 = alloca ptr, align 8
  store ptr %21, ptr %22, align 8
  %23 = load ptr, ptr %20, align 8
  %24 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([161 x i8], ptr @.rodata13, i64 0, i32 56), ptr %23)
  %25 = load ptr, ptr %22, align 8
  %26 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([161 x i8], ptr @.rodata13, i64 0, i32 72), ptr %25)
  %27 = load ptr, ptr %22, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = icmp ne ptr %27, %28
  br i1 %29, label %32, label %30

30:                                               ; preds = %0
  %31 = call i32 @puts(ptr getelementptr inbounds ([161 x i8], ptr @.rodata13, i64 0, i32 88))
  br label %32

32:                                               ; preds = %0, %30
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
