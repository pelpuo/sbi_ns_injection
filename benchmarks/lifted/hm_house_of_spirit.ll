; ModuleID = './bin/hm_house_of_spirit'
source_filename = "./bin/hm_house_of_spirit"

@fake_chunks = dso_local global [32 x i32] zeroinitializer, align 4
@.rodata13 = private unnamed_addr constant [134 x i8] c"\01\00\02\00\00\00\00\00ptr: %p\0A\00\00\00\00\00\00\00\00Overwritten ptr: %p\0A\0A\00\00\00victim: %p\0A\00\00\00\00\00Test Failed: Heap manipulation leading to arbitrary memory allocation\00", align 8
@victim = dso_local global [2 x i32] zeroinitializer, align 4

define dso_local i32 @main() {
  %1 = call ptr @malloc(i64 48)
  store ptr %1, ptr @fake_chunks, align 8
  %2 = load i64, ptr @fake_chunks, align 8
  %3 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([134 x i8], ptr @.rodata13, i64 0, i32 8), i64 %2)
  %4 = load i64, ptr @fake_chunks, align 8
  %5 = alloca i64, align 8
  store i64 %4, ptr %5, align 8
  store i64 64, ptr getelementptr inbounds ([32 x i32], ptr @fake_chunks, i64 0, i32 2), align 8
  store i64 64, ptr getelementptr inbounds ([32 x i32], ptr @fake_chunks, i64 0, i32 18), align 8
  store ptr @fake_chunks, ptr @fake_chunks, align 8
  %6 = load i64, ptr @fake_chunks, align 8
  %7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([134 x i8], ptr @.rodata13, i64 0, i32 24), i64 %6)
  %8 = load i64, ptr @fake_chunks, align 8
  %9 = inttoptr i64 %8 to ptr
  call void @free(ptr %9)
  %10 = call ptr @malloc(i64 48)
  store ptr %10, ptr @victim, align 8
  %11 = load i64, ptr @victim, align 8
  %12 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([134 x i8], ptr @.rodata13, i64 0, i32 48), i64 %11)
  %13 = load i64, ptr @victim, align 8
  %14 = load i64, ptr %5, align 8
  %15 = icmp eq i64 %14, %13
  br i1 %15, label %18, label %16

16:                                               ; preds = %0
  %17 = call i32 @puts(ptr getelementptr inbounds ([134 x i8], ptr @.rodata13, i64 0, i32 64))
  br label %18

18:                                               ; preds = %0, %16
  ret i32 0
}

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)
