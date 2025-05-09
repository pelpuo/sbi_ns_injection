; ModuleID = './bin/oobw_direct_index_int_heap'
source_filename = "./bin/oobw_direct_index_int_heap"

@.rodata13 = private unnamed_addr constant [90 x i8] c"\01\00\02\00\00\00\00\00%p\0A\00\00\00\00\00%p\0A\0A\00\00\00\00%d \00\00\00\00\00Test Failed: Direct int array on heap Out of Bounds Write\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 32)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 32)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = alloca i64, align 8
  store i64 0, ptr %5, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  br label %9

9:                                                ; preds = %0, %79
  %10 = load i64, ptr %5, align 8
  %11 = add i64 %10, 0
  %12 = icmp sge i64 4, %11
  br i1 %12, label %79, label %13

13:                                               ; preds = %9
  store i64 0, ptr %6, align 8
  br label %14

14:                                               ; preds = %13, %66
  %15 = load i64, ptr %6, align 8
  %16 = add i64 %15, 0
  %17 = icmp sge i64 4, %16
  br i1 %17, label %66, label %18

18:                                               ; preds = %14
  %19 = load ptr, ptr %2, align 8
  %20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 8), ptr %19)
  %21 = load ptr, ptr %4, align 8
  %22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 16), ptr %21)
  %23 = load ptr, ptr %2, align 8
  %24 = ptrtoint ptr %23 to i64
  %25 = add i64 %24, 48
  %26 = inttoptr i64 %25 to ptr
  %27 = getelementptr inbounds i32, ptr %26, i32 0
  store i64 420, ptr %27, align 8
  store i64 0, ptr %7, align 8
  br label %28

28:                                               ; preds = %18, %54
  %29 = load i64, ptr %7, align 8
  %30 = add i64 %29, 0
  %31 = icmp sge i64 4, %30
  br i1 %31, label %54, label %32

32:                                               ; preds = %28
  %33 = call i32 @putchar(i32 10)
  store i64 0, ptr %8, align 8
  br label %34

34:                                               ; preds = %32, %51
  %35 = load i64, ptr %8, align 8
  %36 = add i64 %35, 0
  %37 = icmp sge i64 4, %36
  br i1 %37, label %38, label %50

38:                                               ; preds = %34
  %39 = load i64, ptr %8, align 8
  %40 = shl i64 %39, 2
  %41 = load ptr, ptr %4, align 8
  %42 = ptrtoint ptr %41 to i64
  %43 = add i64 %40, %42
  %44 = inttoptr i64 %43 to ptr
  %45 = getelementptr inbounds i32, ptr %44, i32 0
  %46 = load i32, ptr %45, align 4
  %47 = icmp sge i32 9, %46
  br i1 %47, label %51, label %48

48:                                               ; preds = %38
  %49 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 32))
  br label %50

50:                                               ; preds = %48, %34
  ret i32 0

51:                                               ; preds = %38
  %52 = load i64, ptr %8, align 8
  %53 = add i64 %52, 1
  store i64 %53, ptr %8, align 8
  br label %34

54:                                               ; preds = %28
  %55 = load i64, ptr %7, align 8
  %56 = shl i64 %55, 2
  %57 = load ptr, ptr %4, align 8
  %58 = ptrtoint ptr %57 to i64
  %59 = add i64 %56, %58
  %60 = inttoptr i64 %59 to ptr
  %61 = getelementptr inbounds i32, ptr %60, i32 0
  %62 = load i32, ptr %61, align 4
  %63 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 24), i32 %62)
  %64 = load i64, ptr %7, align 8
  %65 = add i64 %64, 1
  store i64 %65, ptr %7, align 8
  br label %28

66:                                               ; preds = %14
  %67 = load i64, ptr %6, align 8
  %68 = shl i64 %67, 2
  %69 = load ptr, ptr %4, align 8
  %70 = ptrtoint ptr %69 to i64
  %71 = add i64 %68, %70
  %72 = load i64, ptr %6, align 8
  %73 = add i64 %72, 1
  %74 = add i64 %73, 0
  %75 = inttoptr i64 %71 to ptr
  %76 = getelementptr inbounds i32, ptr %75, i32 0
  store i64 %74, ptr %76, align 8
  %77 = load i64, ptr %6, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr %6, align 8
  br label %14

79:                                               ; preds = %9
  %80 = load i64, ptr %5, align 8
  %81 = add i64 %80, 1
  %82 = add i64 %81, 0
  %83 = load i64, ptr %5, align 8
  %84 = shl i64 %83, 2
  %85 = load ptr, ptr %2, align 8
  %86 = ptrtoint ptr %85 to i64
  %87 = add i64 %84, %86
  %88 = shl i64 %82, 1
  %89 = add i64 %88, 0
  %90 = inttoptr i64 %87 to ptr
  %91 = getelementptr inbounds i32, ptr %90, i32 0
  store i64 %89, ptr %91, align 8
  %92 = load i64, ptr %5, align 8
  %93 = add i64 %92, 1
  store i64 %93, ptr %5, align 8
  br label %9
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @putchar(i32)

declare dso_local i32 @puts(ptr)
