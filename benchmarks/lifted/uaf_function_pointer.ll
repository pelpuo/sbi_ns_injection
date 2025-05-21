; ModuleID = './bin/uaf_function_pointer'
source_filename = "./bin/uaf_function_pointer"

@rodata_15 = private unnamed_addr constant [101 x i8] c"\01\00\02\00Using default pointer after free\0A\00Public data\0A\00Test Failed: Use After Free for function pointer\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local void @free(ptr)

declare dso_local i32 @printf(ptr, ...)

define dso_local void @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %2 = zext i32 8 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %RBP_N.8, align 1
  %4 = ptrtoint ptr @default_function to i64
  %5 = inttoptr i64 %memload to ptr
  store i64 %4, ptr %5, align 1
  %memload1 = load i64, ptr %RBP_N.8, align 1
  %6 = inttoptr i64 %memload1 to ptr
  %memload2 = load i64, ptr %6, align 1
  %7 = inttoptr i64 %memload2 to ptr
  call void %7(i32 8)
  %memload3 = load i64, ptr %RBP_N.8, align 1
  %8 = inttoptr i64 %memload3 to ptr
  call void @free(ptr %8)
  %9 = zext i32 8 to i64
  %10 = call ptr @malloc(i64 %9)
  %RAX4 = ptrtoint ptr %10 to i64
  store i64 %RAX4, ptr %stktop_8, align 1
  %memload5 = load i64, ptr %stktop_8, align 1
  %11 = ptrtoint ptr @target_function to i64
  %12 = inttoptr i64 %memload5 to ptr
  store i64 %11, ptr %12, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([101 x i8], ptr @rodata_15, i32 0, i32 4))
  %memload6 = load i64, ptr %RBP_N.8, align 1
  %13 = inttoptr i64 %memload6 to ptr
  %memload7 = load i64, ptr %13, align 1
  %14 = inttoptr i64 %memload7 to ptr
  call void %14(ptr getelementptr inbounds ([101 x i8], ptr @rodata_15, i32 0, i32 4))
  ret void
}

define dso_local i32 @default_function() {
entry:
  %RSP_P.0 = alloca i64, align 1
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([101 x i8], ptr @rodata_15, i32 0, i32 38))
  ret i32 %EAX
}

define dso_local i32 @target_function() {
entry:
  %RSP_P.0 = alloca i64, align 1
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([101 x i8], ptr @rodata_15, i32 0, i32 51))
  ret i32 %EAX
}

!0 = !{i64 4202496}
