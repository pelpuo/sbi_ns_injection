; ModuleID = './bin/uaf_function_pointer'
source_filename = "./bin/uaf_function_pointer"

@rodata_18 = private unnamed_addr constant [105 x i8] c"\01\00\02\00\00\00\00\00Using default pointer after free\00Public data\00\00\00\00Test Failed: Use After Free for function pointer\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)

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
  store i64 %RAX, ptr %stktop_8, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %RDX = ptrtoint ptr @default_function to i64
  %4 = inttoptr i64 %memload to ptr
  store i64 %RDX, ptr %4, align 1
  %memload1 = load i64, ptr %stktop_8, align 1
  %5 = inttoptr i64 %memload1 to ptr
  %memload2 = load i64, ptr %5, align 1
  %6 = inttoptr i64 %memload2 to ptr
  call void %6(i32 8)
  %memload3 = load i64, ptr %stktop_8, align 1
  %7 = inttoptr i64 %memload3 to ptr
  call void @free(ptr %7)
  %8 = zext i32 8 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX4 = ptrtoint ptr %9 to i64
  store i64 %RAX4, ptr %RBP_N.8, align 1
  %memload5 = load i64, ptr %RBP_N.8, align 1
  %RDX6 = ptrtoint ptr @target_function to i64
  %10 = inttoptr i64 %memload5 to ptr
  store i64 %RDX6, ptr %10, align 1
  %RAX7 = ptrtoint ptr getelementptr inbounds ([105 x i8], ptr @rodata_18, i32 0, i32 8) to i64, !ROData_Index !1
  %EAX = call i32 @puts(ptr getelementptr inbounds ([105 x i8], ptr @rodata_18, i32 0, i32 8))
  %memload8 = load i64, ptr %stktop_8, align 1
  %11 = inttoptr i64 %memload8 to ptr
  %memload9 = load i64, ptr %11, align 1
  %12 = inttoptr i64 %memload9 to ptr
  call void %12(i64 %RAX7)
  ret void
}

define dso_local i32 @default_function() {
entry:
  %RSP_P.0 = alloca i64, align 1
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %EAX = call i32 @puts(ptr getelementptr inbounds ([105 x i8], ptr @rodata_18, i32 0, i32 41))
  ret i32 %EAX
}

define dso_local i32 @target_function() {
entry:
  %RSP_P.0 = alloca i64, align 1
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %EAX = call i32 @puts(ptr getelementptr inbounds ([105 x i8], ptr @rodata_18, i32 0, i32 56))
  ret i32 %EAX
}

!0 = !{i64 8192}
!1 = !{ptr getelementptr inbounds ([105 x i8], ptr @rodata_18, i32 0, i32 8)}
