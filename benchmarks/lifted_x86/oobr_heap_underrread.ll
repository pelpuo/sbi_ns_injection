; ModuleID = './bin/oobr_heap_underrread'
source_filename = "./bin/oobr_heap_underrread"

@rodata_18 = private unnamed_addr constant [67 x i8] c"\01\00\02\00\00\00\00\00hello secret!!!!\00\00\00\00\00\00\00\00Test Failed: Heap Buffer Underread\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

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
  %2 = zext i32 16 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr %stktop_8, align 1
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX1 = ptrtoint ptr %5 to i64
  store i64 %RAX1, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %6 = inttoptr i64 %memload to ptr
  %7 = zext i32 16 to i64
  %8 = call ptr @memcpy(ptr %6, ptr getelementptr inbounds ([67 x i8], ptr @rodata_18, i32 0, i32 8), i64 %7)
  %RAX2 = ptrtoint ptr %8 to i64
  %memload3 = load i64, ptr %RBP_N.8, align 1
  %RAX4 = sub i64 %memload3, 32
  %9 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload3, i64 32)
  %CF = extractvalue { i64, i1 } %9, 1
  %10 = and i64 %RAX4, 255
  %11 = call i64 @llvm.ctpop.i64(i64 %10)
  %12 = and i64 %11, 1
  %PF = icmp eq i64 %12, 0
  %ZF = icmp eq i64 %RAX4, 0
  %highbit = and i64 -9223372036854775808, %RAX4
  %SF = icmp ne i64 %highbit, 0
  %13 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload3, i64 32)
  %OF = extractvalue { i64, i1 } %13, 1
  %14 = inttoptr i64 %RAX4 to ptr
  %EAX = call i32 @puts(ptr %14)
  %memload5 = load i64, ptr %RBP_N.8, align 1
  %RAX12 = sub i64 %memload5, 32
  %15 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload5, i64 32)
  %CF6 = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %RAX12, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF7 = icmp eq i64 %18, 0
  %ZF8 = icmp eq i64 %RAX12, 0
  %highbit9 = and i64 -9223372036854775808, %RAX12
  %SF10 = icmp ne i64 %highbit9, 0
  %19 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload5, i64 32)
  %OF11 = extractvalue { i64, i1 } %19, 1
  %20 = inttoptr i64 %RAX12 to ptr
  %memload13 = load i32, ptr %20, align 1
  %21 = trunc i32 %memload13 to i8
  %EAX14 = zext i8 %21 to i32
  %22 = trunc i32 %EAX14 to i8
  %23 = trunc i32 %EAX14 to i8
  %24 = and i8 %22, %23
  %highbit15 = and i8 -128, %24
  %SF16 = icmp ne i8 %highbit15, 0
  %ZF17 = icmp eq i8 %24, 0
  %25 = call i8 @llvm.ctpop.i8(i8 %24)
  %26 = and i8 %25, 1
  %PF18 = icmp eq i8 %26, 0
  %CmpZF_JE = icmp eq i1 %ZF17, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX20 = call i32 @puts(ptr getelementptr inbounds ([67 x i8], ptr @rodata_18, i32 0, i32 32))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.ctpop.i8(i8) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
