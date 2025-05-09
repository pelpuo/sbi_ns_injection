; ModuleID = './bin/df_with_oobw'
source_filename = "./bin/df_with_oobw"

@.rodata13 = private unnamed_addr constant [96 x i8] c"\01\00\02\00\00\00\00\00b: %p\0A\0A\00x\00\00\00\00\00\00\00c: %p\0Ad: %p\0A\00\00\00\00Test Failed: Metadata corruption leading to Double Free\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 16)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([96 x i8], ptr @.rodata13, i64 0, i32 8), ptr %5)
  %7 = load ptr, ptr %4, align 8
  call void @free(ptr %7)
  %8 = load ptr, ptr %2, align 8
  %9 = ptrtoint ptr %8 to i64
  %10 = add i64 %9, 40
  %11 = inttoptr i64 %10 to ptr
  %12 = call ptr @memcpy(ptr %11, ptr getelementptr inbounds ([96 x i8], ptr @.rodata13, i64 0, i32 16), i64 1)
  %13 = load ptr, ptr %4, align 8
  call void @free(ptr %13)
  %14 = call ptr @malloc(i64 16)
  %15 = alloca ptr, align 8
  store ptr %14, ptr %15, align 8
  %16 = call ptr @malloc(i64 16)
  %17 = alloca ptr, align 8
  store ptr %16, ptr %17, align 8
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %15, align 8
  %20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([96 x i8], ptr @.rodata13, i64 0, i32 24), ptr %19, ptr %18)
  %21 = load ptr, ptr %15, align 8
  %22 = load ptr, ptr %17, align 8
  %23 = icmp ne ptr %21, %22
  br i1 %23, label %26, label %24

24:                                               ; preds = %0
  %25 = call i32 @puts(ptr getelementptr inbounds ([96 x i8], ptr @.rodata13, i64 0, i32 40))
  br label %26

26:                                               ; preds = %0, %24
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @puts(ptr)
