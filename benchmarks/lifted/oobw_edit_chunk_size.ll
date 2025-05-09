; ModuleID = './bin/oobw_edit_chunk_size'
source_filename = "./bin/oobw_edit_chunk_size"

@.rodata13 = private unnamed_addr constant [90 x i8] c"\01\00\02\00\00\00\00\00c: %p\0A\00\00d: %p\0A\0A\00g: %p\0A\00\00h: %p\0A\00\00Test Failed: Out of Bounds write to heap metadata\00", align 8

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
  %8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 8), ptr %7)
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 16), ptr %9)
  %11 = load ptr, ptr %2, align 8
  %12 = ptrtoint ptr %11 to i64
  %13 = add i64 %12, 24
  %14 = inttoptr i64 %13 to ptr
  %15 = getelementptr inbounds i8, ptr %14, i32 0
  store i64 49, ptr %15, align 8
  %16 = load ptr, ptr %4, align 8
  call void @free(ptr %16)
  %17 = call ptr @malloc(i64 32)
  %18 = alloca ptr, align 8
  store ptr %17, ptr %18, align 8
  %19 = call ptr @malloc(i64 16)
  %20 = alloca ptr, align 8
  store ptr %19, ptr %20, align 8
  %21 = load ptr, ptr %18, align 8
  %22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 24), ptr %21)
  %23 = load ptr, ptr %20, align 8
  %24 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 32), ptr %23)
  %25 = load ptr, ptr %18, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = icmp ne ptr %25, %26
  br i1 %27, label %30, label %28

28:                                               ; preds = %0
  %29 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 40))
  br label %30

30:                                               ; preds = %0, %28
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
