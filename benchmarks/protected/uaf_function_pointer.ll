; ModuleID = './protected_bc/uaf_function_pointer.bc'
source_filename = "./bin/uaf_function_pointer"

@rodata_15 = private unnamed_addr constant [101 x i8] c"\01\00\02\00Using default pointer after free\0A\00Public data\0A\00Test Failed: Use After Free for function pointer\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local void @free(i8*)

declare dso_local i32 @printf(i8*, ...)

define dso_local void @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 8)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i64*
  %RSPAdj_N.16 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  %0 = zext i32 8 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr3, align 1
  %memload = load i64, i64* %ns_ptr3, align 1
  %2 = ptrtoint i32 ()* @default_function to i64
  %3 = inttoptr i64 %memload to i64*
  store i64 %2, i64* %3, align 1
  %memload1 = load i64, i64* %ns_ptr3, align 1
  %4 = inttoptr i64 %memload1 to i64*
  %memload2 = load i64, i64* %4, align 1
  %5 = inttoptr i64 %memload2 to void (i32)*
  call void %5(i32 8)
  %memload3 = load i64, i64* %ns_ptr3, align 1
  %6 = inttoptr i64 %memload3 to i8*
  call void @zeno_free(i8* %6)
  %7 = zext i32 8 to i64
  %8 = call i8* @zeno_malloc(i64 %7)
  %RAX4 = ptrtoint i8* %8 to i64
  store i64 %RAX4, i64* %RSPAdj_N.16, align 1
  %memload5 = load i64, i64* %RSPAdj_N.16, align 1
  %9 = ptrtoint i32 ()* @target_function to i64
  %10 = inttoptr i64 %memload5 to i64*
  store i64 %9, i64* %10, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([101 x i8], [101 x i8]* @rodata_15, i32 0, i32 4))
  %memload6 = load i64, i64* %ns_ptr3, align 1
  %11 = inttoptr i64 %memload6 to i64*
  %memload7 = load i64, i64* %11, align 1
  %12 = inttoptr i64 %memload7 to void (i8*)*
  call void %12(i8* getelementptr inbounds ([101 x i8], [101 x i8]* @rodata_15, i32 0, i32 4))
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

!0 = !{i64 4202496}
