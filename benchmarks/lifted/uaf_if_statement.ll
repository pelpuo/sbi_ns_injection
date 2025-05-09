; ModuleID = './bin/uaf_if_statement'
source_filename = "./bin/uaf_if_statement"

@.rodata13 = private unnamed_addr constant [90 x i8] c"\01\00\02\00\00\00\00\00%c\0A\00\00\00\00\00FREED!\00\00Test Failed: Use After Free - condition check on a freed pointer!\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 1)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store i64 65, ptr %3, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i64
  %7 = icmp eq i64 %6, 88
  br i1 %7, label %17, label %8

8:                                                ; preds = %0
  %9 = load ptr, ptr %2, align 8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = add i32 %11, 0
  %13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 8), i32 %12)
  %14 = load ptr, ptr %2, align 8
  store i64 65, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  call void @free(ptr %15)
  %16 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 16))
  br label %17

17:                                               ; preds = %0, %8
  %18 = load ptr, ptr %2, align 8
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i64
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %29, label %22

22:                                               ; preds = %17
  %23 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 24))
  %24 = load ptr, ptr %2, align 8
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = add i32 %26, 0
  %28 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 8), i32 %27)
  br label %31

29:                                               ; preds = %17
  %30 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @.rodata13, i64 0, i32 24))
  br label %31

31:                                               ; preds = %22, %29
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
