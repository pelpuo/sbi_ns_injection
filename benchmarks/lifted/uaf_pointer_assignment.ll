; ModuleID = './bin/uaf_pointer_assignment'
source_filename = "./bin/uaf_pointer_assignment"

@.rodata13 = private unnamed_addr constant [140 x i8] c"\01\00\02\00\00\00\00\00Hello\00\00\00Addr of a:%p\0A\00\00\00Addr of b:%p\0A\0A\00\00World\00\00\00a: %s\0A\00\00b: %s\0A\00\00Test Failed: Incorrect pointer assignment leading to Use After Free\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 16)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @memcpy(ptr %5, ptr getelementptr inbounds ([140 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %7 = load ptr, ptr %2, align 8
  store ptr %7, ptr %4, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([140 x i8], ptr @.rodata13, i64 0, i32 16), ptr %8, i32 16)
  %10 = load ptr, ptr %4, align 8
  %11 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([140 x i8], ptr @.rodata13, i64 0, i32 32), ptr %10, i32 16)
  %12 = load ptr, ptr %2, align 8
  call void @free(ptr %12)
  %13 = load ptr, ptr %4, align 8
  %14 = call ptr @memcpy(ptr %13, ptr getelementptr inbounds ([140 x i8], ptr @.rodata13, i64 0, i32 48), i64 16)
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([140 x i8], ptr @.rodata13, i64 0, i32 56), ptr %15, i32 16)
  %17 = load ptr, ptr %4, align 8
  %18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([140 x i8], ptr @.rodata13, i64 0, i32 64), ptr %17, i32 16)
  %19 = load ptr, ptr %2, align 8
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i64
  %22 = icmp eq i64 %21, 72
  br i1 %22, label %25, label %23

23:                                               ; preds = %0
  %24 = call i32 @puts(ptr getelementptr inbounds ([140 x i8], ptr @.rodata13, i64 0, i32 72))
  br label %25

25:                                               ; preds = %0, %23
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
