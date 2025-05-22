; ModuleID = './bin/uaf_function_pointer'
source_filename = "./bin/uaf_function_pointer"

@rodata_15 = private unnamed_addr constant [101 x i8] c"\01\00\02\00Using default pointer after free\0A\00Public data\0A\00Test Failed: Use After Free for function pointer\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local void @free(i8*)

declare dso_local i32 @printf(i8*, ...)

define dso_local void @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %RSPAdj_N.16 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.8 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %1 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  %2 = zext i32 8 to i64
  %3 = call i8* @malloc(i64 %2)
  %RAX = ptrtoint i8* %3 to i64
  store i64 %RAX, i64* %RBP_N.8, align 1
  %memload = load i64, i64* %RBP_N.8, align 1
  %4 = ptrtoint i32 ()* @default_function to i64
  %5 = inttoptr i64 %memload to i64*
  store i64 %4, i64* %5, align 1
  %memload1 = load i64, i64* %RBP_N.8, align 1
  %6 = inttoptr i64 %memload1 to i64*
  %memload2 = load i64, i64* %6, align 1
  %7 = inttoptr i64 %memload2 to void (i32)*
  call void %7(i32 8)
  %memload3 = load i64, i64* %RBP_N.8, align 1
  %8 = inttoptr i64 %memload3 to i8*
  call void @free(i8* %8)
  %9 = zext i32 8 to i64
  %10 = call i8* @malloc(i64 %9)
  %RAX4 = ptrtoint i8* %10 to i64
  store i64 %RAX4, i64* %RSPAdj_N.16, align 1
  %memload5 = load i64, i64* %RSPAdj_N.16, align 1
  %11 = ptrtoint i32 ()* @target_function to i64
  %12 = inttoptr i64 %memload5 to i64*
  store i64 %11, i64* %12, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([101 x i8], [101 x i8]* @rodata_15, i32 0, i32 4))
  %memload6 = load i64, i64* %RBP_N.8, align 1
  %13 = inttoptr i64 %memload6 to i64*
  %memload7 = load i64, i64* %13, align 1
  %14 = inttoptr i64 %memload7 to void (i8*)*
  call void %14(i8* getelementptr inbounds ([101 x i8], [101 x i8]* @rodata_15, i32 0, i32 4))
  ret void
}

define dso_local i32 @default_function() {
entry:
  %RSP_P.0 = alloca i64, align 1
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([101 x i8], [101 x i8]* @rodata_15, i32 0, i32 38))
  ret i32 %EAX
}

define dso_local i32 @target_function() {
entry:
  %RSP_P.0 = alloca i64, align 1
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([101 x i8], [101 x i8]* @rodata_15, i32 0, i32 51))
  ret i32 %EAX
}

!0 = !{i64 4202496}
