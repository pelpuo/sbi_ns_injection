; ModuleID = './bin/oobr_char_to_int_conversion_advanced'
source_filename = "./bin/oobr_char_to_int_conversion_advanced"

@.rodata13 = private unnamed_addr constant [147 x i8] c"\01\00\02\00\00\00\00\00public string\00\00\00This is the secret in memory\00\00\00\00%p \00\00\00\00\00%c \0A\00\00\00\00%c\0A\00\00\00\00\00Test Failed: Out of Bounds Read by Char to Int Conversion Advanced\00", align 8

define dso_local i32 @main() {
  %1 = alloca ptr, align 8
  store ptr getelementptr inbounds ([147 x i8], ptr @.rodata13, i64 0, i32 8), ptr %1, align 8
  %2 = alloca ptr, align 8
  store ptr getelementptr inbounds ([147 x i8], ptr @.rodata13, i64 0, i32 24), ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 8, ptr %3, align 4
  %4 = load ptr, ptr %1, align 8
  %5 = alloca ptr, align 8
  store ptr %4, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = alloca ptr, align 8
  store ptr %6, ptr %7, align 8
  %8 = alloca i32, align 4
  store i32 1, ptr %8, align 4
  %9 = alloca i64, align 8
  store i64 0, ptr %9, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  br label %14

14:                                               ; preds = %0, %81
  %15 = load i64, ptr %9, align 8
  %16 = load i32, ptr %3, align 4
  %17 = add i64 %15, 0
  %18 = add i32 %16, 0
  %19 = sext i32 %18 to i64
  %20 = icmp slt i64 %17, %19
  br i1 %20, label %81, label %21

21:                                               ; preds = %14
  %22 = call i32 @putchar(i32 10)
  store i64 0, ptr %10, align 8
  br label %23

23:                                               ; preds = %21, %49
  %24 = load i64, ptr %10, align 8
  %25 = load i32, ptr %3, align 4
  %26 = add i64 %24, 0
  %27 = add i32 %25, 0
  %28 = sext i32 %27 to i64
  %29 = icmp slt i64 %26, %28
  br i1 %29, label %39, label %30

30:                                               ; preds = %23
  %31 = call i32 @putchar(i32 10)
  %32 = load i32, ptr %8, align 4
  %33 = add i32 %32, 0
  %34 = sext i32 %33 to i64
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %38, label %36

36:                                               ; preds = %30
  %37 = call i32 @puts(ptr getelementptr inbounds ([147 x i8], ptr @.rodata13, i64 0, i32 80))
  br label %38

38:                                               ; preds = %30, %36
  ret i32 0

39:                                               ; preds = %23
  %40 = load i64, ptr %10, align 8
  %41 = shl i64 %40, 2
  %42 = load ptr, ptr %5, align 8
  %43 = ptrtoint ptr %42 to i64
  %44 = add i64 %41, %43
  store i64 %44, ptr %11, align 8
  store i64 0, ptr %12, align 8
  br label %45

45:                                               ; preds = %39, %78
  %46 = load i64, ptr %12, align 8
  %47 = add i64 %46, 0
  %48 = icmp sge i64 3, %47
  br i1 %48, label %52, label %49

49:                                               ; preds = %45
  %50 = load i64, ptr %10, align 8
  %51 = add i64 %50, 1
  store i64 %51, ptr %10, align 8
  br label %23

52:                                               ; preds = %45
  %53 = load i64, ptr %12, align 8
  %54 = load i64, ptr %11, align 8
  %55 = add i64 %53, %54
  store i64 %55, ptr %13, align 8
  %56 = load i64, ptr %13, align 8
  %57 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([147 x i8], ptr @.rodata13, i64 0, i32 56), i64 %56)
  %58 = load i64, ptr %13, align 8
  %59 = inttoptr i64 %58 to ptr
  %60 = getelementptr inbounds i8, ptr %59, i32 0
  %61 = load i8, ptr %60, align 1
  %62 = sext i8 %61 to i32
  %63 = add i32 %62, 0
  %64 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([147 x i8], ptr @.rodata13, i64 0, i32 72), i32 %63)
  %65 = load ptr, ptr %1, align 8
  %66 = ptrtoint ptr %65 to i64
  %67 = add i64 %66, 8
  %68 = load i64, ptr %13, align 8
  %69 = icmp uge i64 %67, %68
  br i1 %69, label %78, label %70

70:                                               ; preds = %52
  %71 = load i64, ptr %13, align 8
  %72 = inttoptr i64 %71 to ptr
  %73 = getelementptr inbounds i8, ptr %72, i32 0
  %74 = load i8, ptr %73, align 1
  %75 = sext i8 %74 to i64
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %78, label %77

77:                                               ; preds = %70
  store i64 0, ptr %8, align 8
  br label %78

78:                                               ; preds = %70, %52, %77
  %79 = load i64, ptr %12, align 8
  %80 = add i64 %79, 1
  store i64 %80, ptr %12, align 8
  br label %45

81:                                               ; preds = %14
  %82 = load i64, ptr %9, align 8
  %83 = load ptr, ptr %5, align 8
  %84 = ptrtoint ptr %83 to i64
  %85 = add i64 %82, %84
  %86 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([147 x i8], ptr @.rodata13, i64 0, i32 56), i64 %85)
  %87 = load i64, ptr %9, align 8
  %88 = load ptr, ptr %5, align 8
  %89 = ptrtoint ptr %88 to i64
  %90 = add i64 %87, %89
  %91 = inttoptr i64 %90 to ptr
  %92 = getelementptr inbounds i8, ptr %91, i32 0
  %93 = load i8, ptr %92, align 1
  %94 = sext i8 %93 to i32
  %95 = add i32 %94, 0
  %96 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([147 x i8], ptr @.rodata13, i64 0, i32 64), i32 %95)
  %97 = load i64, ptr %9, align 8
  %98 = add i64 %97, 1
  store i64 %98, ptr %9, align 8
  br label %14
}

declare dso_local i32 @putchar(i32)

declare dso_local i32 @puts(ptr)

declare dso_local i32 @printf(ptr, ...)
