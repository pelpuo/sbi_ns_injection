; ModuleID = './bin/hbo_char_array'
source_filename = "./bin/hbo_char_array"

@.rodata13 = private unnamed_addr constant [146 x i8] c"\01\00\02\00\00\00\00\001234567890123456\00\00\00\00\00\00\00\00Original content of b: %s\0A\00\00\00\00\00\00Content of b after overflow: %s\0A\00\00\00\00\00\00\00\00Test Failed: Heap buffer overflow occured\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 32)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 32)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load i8, ptr %5, align 1
  %7 = alloca i8, align 1
  store i8 %6, ptr %7, align 1
  %8 = load ptr, ptr %4, align 8
  %9 = call ptr @memcpy(ptr %8, ptr getelementptr inbounds ([146 x i8], ptr @.rodata13, i64 0, i32 8), i64 17)
  %10 = load ptr, ptr %4, align 8
  %11 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([146 x i8], ptr @.rodata13, i64 0, i32 32), ptr %10, i32 17, ptr getelementptr inbounds ([146 x i8], ptr @.rodata13, i64 0, i32 8), ptr %8, i32 17)
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = ptrtoint ptr %12 to i64
  %15 = ptrtoint ptr %13 to i64
  %16 = sub i64 %14, %15
  %17 = add i64 %16, -16
  %18 = alloca i64, align 8
  store i64 %17, ptr %18, align 8
  %19 = load i64, ptr %18, align 8
  %20 = add i64 %19, 18
  %21 = call ptr @malloc(i64 %20)
  %22 = alloca ptr, align 8
  store ptr %21, ptr %22, align 8
  %23 = load i64, ptr %18, align 8
  %24 = load ptr, ptr %22, align 8
  %25 = call ptr @memset(ptr %24, i32 65, i64 %23)
  %26 = load ptr, ptr %22, align 8
  %27 = load i64, ptr %18, align 8
  %28 = ptrtoint ptr %26 to i64
  %29 = add i64 %28, %27
  %30 = load ptr, ptr %2, align 8
  %31 = load i64, ptr %18, align 8
  %32 = ptrtoint ptr %30 to i64
  %33 = add i64 %31, %32
  %34 = inttoptr i64 %29 to ptr
  %35 = inttoptr i64 %33 to ptr
  %36 = call ptr @memcpy(ptr %34, ptr %35, i64 18)
  %37 = load i64, ptr %18, align 8
  %38 = add i64 %37, 16
  %39 = load ptr, ptr %22, align 8
  %40 = ptrtoint ptr %39 to i64
  %41 = add i64 %38, %40
  %42 = inttoptr i64 %41 to ptr
  %43 = call ptr @memset(ptr %42, i32 66, i64 2)
  %44 = load i64, ptr %18, align 8
  %45 = add i64 %44, 18
  %46 = load ptr, ptr %22, align 8
  %47 = load ptr, ptr %2, align 8
  %48 = call ptr @memcpy(ptr %47, ptr %46, i64 %45)
  %49 = alloca i64, align 8
  store i64 0, ptr %49, align 8
  br label %50

50:                                               ; preds = %0, %72
  %51 = load i64, ptr %49, align 8
  %52 = load i64, ptr %18, align 8
  %53 = add i64 %52, 18
  %54 = icmp ult i64 %51, %53
  br i1 %54, label %72, label %55

55:                                               ; preds = %50
  %56 = call i32 @putchar(i32 10)
  %57 = load ptr, ptr %4, align 8
  %58 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([146 x i8], ptr @.rodata13, i64 0, i32 64), ptr %57)
  %59 = load ptr, ptr %4, align 8
  %60 = load i8, ptr %59, align 1
  %61 = load i8, ptr %7, align 1
  %62 = sext i8 %61 to i32
  %63 = and i32 %62, 255
  %64 = sext i8 %60 to i32
  %65 = icmp eq i32 %63, %64
  br i1 %65, label %68, label %66

66:                                               ; preds = %55
  %67 = call i32 @puts(ptr getelementptr inbounds ([146 x i8], ptr @.rodata13, i64 0, i32 104))
  br label %68

68:                                               ; preds = %55, %66
  %69 = load ptr, ptr %2, align 8
  call void @free(ptr %69)
  %70 = load ptr, ptr %4, align 8
  call void @free(ptr %70)
  %71 = load ptr, ptr %22, align 8
  call void @free(ptr %71)
  ret i32 0

72:                                               ; preds = %50
  %73 = load i64, ptr %49, align 8
  %74 = load ptr, ptr %2, align 8
  %75 = ptrtoint ptr %74 to i64
  %76 = add i64 %73, %75
  %77 = inttoptr i64 %76 to ptr
  %78 = getelementptr inbounds i8, ptr %77, i32 0
  %79 = load i8, ptr %78, align 1
  %80 = sext i8 %79 to i32
  %81 = add i32 %80, 0
  %82 = call i32 @putchar(i32 %81)
  %83 = load i64, ptr %49, align 8
  %84 = add i64 %83, 1
  store i64 %84, ptr %49, align 8
  br label %50
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local i32 @putchar(i32)

declare dso_local i32 @puts(ptr)

declare dso_local void @free(ptr)
