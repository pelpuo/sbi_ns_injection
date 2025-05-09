; ModuleID = './bin/oobr_heap_underrread'
source_filename = "./bin/oobr_heap_underrread"

@.rodata13 = private unnamed_addr constant [67 x i8] c"\01\00\02\00\00\00\00\00hello secret!!!!\00\00\00\00\00\00\00\00Test Failed: Heap Buffer Underread\00", align 8

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 16)
  %2 = alloca ptr, align 8
  store ptr %1, ptr %2, align 8
  %3 = call ptr @malloc(i64 16)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @memcpy(ptr %5, ptr getelementptr inbounds ([67 x i8], ptr @.rodata13, i64 0, i32 8), i64 16)
  %7 = load ptr, ptr %4, align 8
  %8 = ptrtoint ptr %7 to i64
  %9 = add i64 %8, -32
  %10 = inttoptr i64 %9 to ptr
  %11 = call i32 @puts(ptr %10)
  %12 = load ptr, ptr %4, align 8
  %13 = ptrtoint ptr %12 to i64
  %14 = add i64 %13, -32
  %15 = inttoptr i64 %14 to ptr
  %16 = getelementptr inbounds i8, ptr %15, i32 0
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i64
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %0
  %21 = call i32 @puts(ptr getelementptr inbounds ([67 x i8], ptr @.rodata13, i64 0, i32 32))
  br label %22

22:                                               ; preds = %0, %20
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @puts(ptr)
