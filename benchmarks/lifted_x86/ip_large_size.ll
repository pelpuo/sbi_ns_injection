; ModuleID = './bin/ip_large_size'
source_filename = "./bin/ip_large_size"

@rodata_18 = private unnamed_addr constant [128 x i8] c"\01\00\02\00\00\00\00\00Address of x: %p\0A\00Value of x: %d\0A\00\00\00\00\00\00\00Test Failed: Illegal pointer access caused by incorrect sized memory allocation\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 4398046511104, ptr %stktop_8, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %2 = call ptr @malloc(i64 %memload)
  %RAX = ptrtoint ptr %2 to i64
  store i64 %RAX, ptr %RBP_N.8, align 1
  %memload1 = load i64, ptr %RBP_N.8, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload1)
  %memload3 = load i64, ptr %RBP_N.8, align 1
  %3 = inttoptr i64 %memload3 to ptr
  %memload4 = load i32, ptr %3, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @rodata_18, i32 0, i32 26), i32 %memload4)
  %memload7 = load i64, ptr %RBP_N.8, align 1
  %4 = inttoptr i64 %memload7 to ptr
  %memload8 = load i32, ptr %4, align 1
  %5 = and i32 %memload8, %memload8
  %highbit = and i32 -2147483648, %5
  %SF = icmp ne i32 %highbit, 0
  %ZF = icmp eq i32 %5, 0
  %6 = and i32 %5, 255
  %7 = call i32 @llvm.ctpop.i32(i32 %6)
  %8 = and i32 %7, 1
  %PF = icmp eq i32 %8, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX10 = call i32 @puts(ptr getelementptr inbounds ([128 x i8], ptr @rodata_18, i32 0, i32 48))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
