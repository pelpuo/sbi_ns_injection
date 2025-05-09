; ModuleID = './bin/df_editing_size'
source_filename = "./bin/df_editing_size"

@.rodata13 = private unnamed_addr constant [126 x i8] c"\01\00\02\00\00\00\00\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00x\00\00\00\00\00\00\00b: %p\0Ac: %p\0A\00\00\00\00Test Failed: Size manipulation leading to Double Free\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @memcpy(ptr %3, ptr getelementptr inbounds ([126 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %5 = load ptr, ptr %2, align 8
  %6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @.rodata13, i64 0, i32 24), ptr %5, i32 16)
  %7 = load ptr, ptr %2, align 8
  %8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @.rodata13, i64 0, i32 40), ptr %7, i32 16)
  %9 = load ptr, ptr %2, align 8
  call void @free(ptr %9)
  %10 = load ptr, ptr %2, align 8
  %11 = ptrtoint ptr %10 to i64
  %12 = add i64 %11, 15
  %13 = inttoptr i64 %12 to ptr
  %14 = call ptr @memcpy(ptr %13, ptr getelementptr inbounds ([126 x i8], ptr @.rodata13, i64 0, i32 48), i64 1)
  %15 = load ptr, ptr %2, align 8
  call void @free(ptr %15)
  %16 = call ptr @malloc(i64 16)
  %17 = alloca ptr, align 8
  store ptr %16, ptr %17, align 8
  %18 = call ptr @malloc(i64 16)
  %19 = alloca ptr, align 8
  store ptr %18, ptr %19, align 8
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr %17, align 8
  %22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @.rodata13, i64 0, i32 56), ptr %21, ptr %20)
  %23 = load ptr, ptr %17, align 8
  %24 = load ptr, ptr %19, align 8
  %25 = icmp ne ptr %23, %24
  br i1 %25, label %28, label %26

26:                                               ; preds = %0
  %27 = call i32 @puts(ptr getelementptr inbounds ([126 x i8], ptr @.rodata13, i64 0, i32 72))
  br label %28

28:                                               ; preds = %0, %26
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
