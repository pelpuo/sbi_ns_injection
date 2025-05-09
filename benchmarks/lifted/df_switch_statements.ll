; ModuleID = './bin/df_switch_statements'
source_filename = "./bin/df_switch_statements"

@.rodata13 = private unnamed_addr constant [135 x i8] c"\01\00\02\00\00\00\00\00Char is %s\0A\00\00\00\00\00DEFAULT\00\0Aa: %p\0A\00b: %p\0A\00\00c: %p\0A\00\00Test Failed: Switch fallthrough with metadata overwrite leading to Double Free\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store i64 67, ptr %3, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i32
  %7 = add i32 %6, 0
  %x15_stack_slot = alloca i32, align 4
  store i32 %7, ptr %x15_stack_slot, align 4
  %x13_stack_slot = alloca i32, align 4
  %x14_stack_slot = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = sext i32 %7 to i64
  %11 = icmp eq i64 %10, 67
  br i1 %11, label %32, label %12

12:                                               ; preds = %0
  %13 = load i32, ptr %x15_stack_slot, align 4
  store i32 %13, ptr %x13_stack_slot, align 4
  %14 = sext i32 %13 to i64
  %15 = icmp slt i64 67, %14
  br i1 %15, label %36, label %16

16:                                               ; preds = %12
  %17 = load i32, ptr %x13_stack_slot, align 4
  store i64 65, ptr %x14_stack_slot, align 8
  %18 = sext i32 %17 to i64
  %19 = icmp eq i64 %18, 65
  br i1 %19, label %24, label %20

20:                                               ; preds = %16
  %21 = load i64, ptr %x14_stack_slot, align 8
  %22 = icmp eq i64 %21, 66
  br i1 %22, label %28, label %23

23:                                               ; preds = %20
  br label %36

24:                                               ; preds = %16
  %25 = load ptr, ptr %2, align 8
  %26 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 8), ptr %25)
  %27 = load ptr, ptr %2, align 8
  call void @free(ptr %27)
  br label %28

28:                                               ; preds = %20, %24
  %29 = load ptr, ptr %2, align 8
  %30 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 8), ptr %29)
  %31 = load ptr, ptr %2, align 8
  call void @free(ptr %31)
  br label %32

32:                                               ; preds = %0, %28
  %33 = load ptr, ptr %2, align 8
  %34 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 8), ptr %33)
  %35 = load ptr, ptr %2, align 8
  call void @free(ptr %35)
  br label %36

36:                                               ; preds = %23, %12, %32
  %37 = load ptr, ptr %2, align 8
  %38 = call ptr @memcpy(ptr %37, ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 24), i64 16)
  %39 = load ptr, ptr %2, align 8
  %40 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 8), ptr %39, i32 16)
  %41 = load ptr, ptr %2, align 8
  call void @free(ptr %41)
  %42 = call ptr @malloc(i64 16)
  store ptr %42, ptr %8, align 8
  %43 = call ptr @malloc(i64 16)
  store ptr %43, ptr %9, align 8
  %44 = load ptr, ptr %2, align 8
  %45 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 32), ptr %44, i32 16)
  %46 = load ptr, ptr %8, align 8
  %47 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 40), ptr %46, i32 16)
  %48 = load ptr, ptr %9, align 8
  %49 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 48), ptr %48, i32 16)
  %50 = load ptr, ptr %8, align 8
  %51 = load ptr, ptr %9, align 8
  %52 = icmp ne ptr %50, %51
  br i1 %52, label %55, label %53

53:                                               ; preds = %36
  %54 = call i32 @puts(ptr getelementptr inbounds ([135 x i8], ptr @.rodata13, i64 0, i32 56))
  br label %55

55:                                               ; preds = %36, %53
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @puts(ptr)
