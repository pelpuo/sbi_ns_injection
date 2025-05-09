; ModuleID = './bin/oobr_direct_index_string'
source_filename = "./bin/oobr_direct_index_string"

@.rodata13 = private unnamed_addr constant [174 x i8] c"\01\00\02\00\00\00\00\00abcde\00\00\00fghij\00\00\00Last element of string 1 is: %c\0A\00\00\00\00\00\00\00\00Null terminator for string 1: %d\0A\00\00\00\00\00\00\00Out of bounds read: %c\0A\00Test Failed: Simple String Out of Bounds Read\00", align 8

define dso_local i32 @main() {
  %1 = alloca ptr, align 8
  store ptr getelementptr inbounds ([174 x i8], ptr @.rodata13, i64 0, i32 8), ptr %1, align 8
  %2 = alloca ptr, align 8
  store ptr getelementptr inbounds ([174 x i8], ptr @.rodata13, i64 0, i32 16), ptr %2, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = ptrtoint ptr %3 to i64
  %5 = add i64 %4, 4
  %6 = inttoptr i64 %5 to ptr
  %7 = getelementptr inbounds i8, ptr %6, i32 0
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = add i32 %9, 0
  %11 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([174 x i8], ptr @.rodata13, i64 0, i32 24), i32 %10)
  %12 = load ptr, ptr %1, align 8
  %13 = ptrtoint ptr %12 to i64
  %14 = add i64 %13, 5
  %15 = inttoptr i64 %14 to ptr
  %16 = getelementptr inbounds i8, ptr %15, i32 0
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = add i32 %18, 0
  %20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([174 x i8], ptr @.rodata13, i64 0, i32 64), i32 %19)
  %21 = load ptr, ptr %1, align 8
  %22 = ptrtoint ptr %21 to i64
  %23 = add i64 %22, 6
  %24 = inttoptr i64 %23 to ptr
  %25 = getelementptr inbounds i8, ptr %24, i32 0
  %26 = load i8, ptr %25, align 1
  %27 = sext i8 %26 to i32
  %28 = add i32 %27, 0
  %29 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([174 x i8], ptr @.rodata13, i64 0, i32 104), i32 %28)
  %30 = load ptr, ptr %1, align 8
  %31 = ptrtoint ptr %30 to i64
  %32 = add i64 %31, 6
  %33 = inttoptr i64 %32 to ptr
  %34 = getelementptr inbounds i8, ptr %33, i32 0
  %35 = load i8, ptr %34, align 1
  %36 = sext i8 %35 to i64
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %40, label %38

38:                                               ; preds = %0
  %39 = call i32 @puts(ptr getelementptr inbounds ([174 x i8], ptr @.rodata13, i64 0, i32 128))
  br label %40

40:                                               ; preds = %0, %38
  ret i32 0
}

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)
