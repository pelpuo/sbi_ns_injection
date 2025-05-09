; ModuleID = './bin/df_overwriting_free'
source_filename = "./bin/df_overwriting_free"

@.rodata13 = private unnamed_addr constant [135 x i8] c"\01\00\02\00\00\00\00\00hello!\00\00a contains: %s\0A\0A\00\00\00\00\00\00\00\00a: %p\0A\0A\00RANDOMSTRING\00\00\00\00b: %p\0Ac: %p\0A\00\00\00\00Test Failed: Metadata overwrite leading to Double Free\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 10)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @memcpy(ptr %3, ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %5 = load ptr, ptr %2, align 8
  %6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 16), ptr %5, i32 16)
  %7 = load ptr, ptr %2, align 8
  %8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 40), ptr %7, i32 16)
  %9 = load ptr, ptr %2, align 8
  call void @free(ptr %9)
  %10 = load ptr, ptr %2, align 8
  %11 = call ptr @memcpy(ptr %10, ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 48), i64 16)
  %12 = load ptr, ptr %2, align 8
  %13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 16), ptr %12, i32 16)
  %14 = load ptr, ptr %2, align 8
  call void @free(ptr %14)
  %15 = call ptr @malloc(i64 10)
  %16 = alloca ptr, align 8
  store ptr %15, ptr %16, align 8
  %17 = call ptr @malloc(i64 10)
  %18 = alloca ptr, align 8
  store ptr %17, ptr %18, align 8
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %16, align 8
  %21 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 64), ptr %20, ptr %19)
  %22 = load ptr, ptr %16, align 8
  %23 = load ptr, ptr %18, align 8
  %24 = icmp ne ptr %22, %23
  br i1 %24, label %27, label %25

25:                                               ; preds = %0
  %26 = call i32 @puts(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 80))
  br label %27

27:                                               ; preds = %0, %25
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
