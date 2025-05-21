; ModuleID = './bin/ip_large_size'
source_filename = "./bin/ip_large_size"

@rodata_15 = private unnamed_addr constant [119 x i8] c"\01\00\02\00Address of x: %p\0A\00Value of x: %d\0A\00Test Failed: Illegal pointer access caused by incorrect sized memory allocation\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i64 4398046511104, ptr %RBP_N.16, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %4 = call ptr @malloc(i64 %memload)
  %RAX = ptrtoint ptr %4 to i64
  store i64 %RAX, ptr %RBP_N.24, align 1
  %memload1 = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([119 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload1)
  %memload2 = load i64, ptr %RBP_N.24, align 1
  %5 = inttoptr i64 %memload2 to ptr
  %memload3 = load i32, ptr %5, align 1
  %EAX4 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([119 x i8], ptr @rodata_15, i32 0, i32 22), i32 %memload3)
  %memload5 = load i64, ptr %RBP_N.24, align 1
  %6 = inttoptr i64 %memload5 to ptr
  %7 = load i32, ptr %6, align 1
  %8 = zext i32 %7 to i64
  %9 = zext i32 0 to i64
  %10 = sub i64 %8, %9
  %11 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %8, i64 %9)
  %CF = extractvalue { i64, i1 } %11, 1
  %ZF = icmp eq i64 %10, 0
  %highbit = and i64 -9223372036854775808, %10
  %SF = icmp ne i64 %highbit, 0
  %12 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 %9)
  %OF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %10, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([119 x i8], ptr @rodata_15, i32 0, i32 38))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload7 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload7
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
