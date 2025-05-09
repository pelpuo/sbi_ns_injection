; ModuleID = './bin/hm_parent_and_child_chunk'
source_filename = "./bin/hm_parent_and_child_chunk"

@.rodata13 = private unnamed_addr constant [141 x i8] c"\01\00\02\00\00\00\00\00victim's data\00\00\00d: %p\0A\00\00e: %p\0A\0A\00g: %p -> %p\0A\00\00\00\00h: %p\0A\00\00h: %s\0A\00\00Test Failed: Heap manipulation leading to overlapping memory regions\00", align 8

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
  %8 = ptrtoint ptr %7 to i64
  %9 = add i64 %8, 24
  %10 = inttoptr i64 %9 to ptr
  %11 = getelementptr inbounds i8, ptr %10, i32 0
  store i64 97, ptr %11, align 8
  %12 = load ptr, ptr %4, align 8
  call void @free(ptr %12)
  %13 = load ptr, ptr %6, align 8
  call void @free(ptr %13)
  %14 = call ptr @malloc(i64 80)
  %15 = alloca ptr, align 8
  store ptr %14, ptr %15, align 8
  %16 = call ptr @malloc(i64 16)
  %17 = alloca ptr, align 8
  store ptr %16, ptr %17, align 8
  %18 = load ptr, ptr %17, align 8
  %19 = call ptr @memcpy(ptr %18, ptr getelementptr inbounds ([141 x i8], ptr @.rodata13, i64 0, i32 8), i64 14)
  %20 = load ptr, ptr %15, align 8
  %21 = ptrtoint ptr %20 to i64
  %22 = add i64 %21, 32
  %23 = inttoptr i64 %22 to ptr
  %24 = call ptr @memset(ptr %23, i32 65, i64 15)
  %25 = load ptr, ptr %4, align 8
  %26 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @.rodata13, i64 0, i32 24), ptr %25, i32 15)
  %27 = load ptr, ptr %6, align 8
  %28 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @.rodata13, i64 0, i32 32), ptr %27, i32 15)
  %29 = load ptr, ptr %15, align 8
  %30 = ptrtoint ptr %29 to i64
  %31 = add i64 %30, 80
  %32 = load ptr, ptr %15, align 8
  %33 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @.rodata13, i64 0, i32 40), ptr %32, i64 %31)
  %34 = load ptr, ptr %17, align 8
  %35 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @.rodata13, i64 0, i32 56), ptr %34, i64 %31)
  %36 = load ptr, ptr %17, align 8
  %37 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @.rodata13, i64 0, i32 64), ptr %36, i64 %31)
  %38 = load ptr, ptr %17, align 8
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i64
  %41 = icmp ne i64 %40, 65
  br i1 %41, label %44, label %42

42:                                               ; preds = %0
  %43 = call i32 @puts(ptr getelementptr inbounds ([141 x i8], ptr @.rodata13, i64 0, i32 72))
  br label %44

44:                                               ; preds = %0, %42
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local void @free(ptr)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)
