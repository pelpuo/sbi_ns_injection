; ModuleID = './bin/hm_fake_chunk_malloc'
source_filename = "./bin/hm_fake_chunk_malloc"

@rodata_15 = private unnamed_addr constant [133 x i8] c"\01\00\02\00ptr0: %p\0A\00ptr1: %p\0A\00Target: %p\0A\0A\00ptr_x: %p\0A\00ptr_y: %p\0A\00Test Failed: Heap manipulation leading to allocation on specific address\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 40
  %RBP_N.32 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 48
  %RBP_N.24 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 56
  %RBP_N.16 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %7 = zext i32 16 to i64
  %8 = call ptr @malloc(i64 %7)
  %RAX = ptrtoint ptr %8 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %9 = zext i32 16 to i64
  %10 = call ptr @malloc(i64 %9)
  %RAX1 = ptrtoint ptr %10 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %11 = zext i32 16 to i64
  %12 = call ptr @malloc(i64 %11)
  %RAX2 = ptrtoint ptr %12 to i64
  store i64 %RAX2, ptr %RBP_N.32, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload)
  %memload3 = load i64, ptr %RBP_N.24, align 1
  %EAX4 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_15, i32 0, i32 14), i64 %memload3)
  %memload5 = load i64, ptr %RBP_N.32, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_15, i32 0, i32 24), i64 %memload5)
  %memload7 = load i64, ptr %RBP_N.16, align 1
  %13 = inttoptr i64 %memload7 to ptr
  call void @free(ptr %13)
  %memload8 = load i64, ptr %RBP_N.24, align 1
  %14 = inttoptr i64 %memload8 to ptr
  call void @free(ptr %14)
  %memload9 = load i64, ptr %RBP_N.24, align 1
  %15 = inttoptr i64 %memload9 to ptr
  %memload10 = load i64, ptr %15, align 1
  %RCX = add i64 %memload10, 64
  %16 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload10, i64 64)
  %CF = extractvalue { i64, i1 } %16, 1
  %17 = and i64 %RCX, 255
  %18 = call i64 @llvm.ctpop.i64(i64 %17)
  %19 = and i64 %18, 1
  %PF = icmp eq i64 %19, 0
  %ZF = icmp eq i64 %RCX, 0
  %highbit = and i64 -9223372036854775808, %RCX
  %SF = icmp ne i64 %highbit, 0
  %20 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload10, i64 64)
  %OF = extractvalue { i64, i1 } %20, 1
  %memload11 = load i64, ptr %RBP_N.24, align 1
  %21 = inttoptr i64 %memload11 to ptr
  store i64 %RCX, ptr %21, align 1
  %22 = zext i32 16 to i64
  %23 = call ptr @malloc(i64 %22)
  %RAX12 = ptrtoint ptr %23 to i64
  store i64 %RAX12, ptr %RBP_N.40, align 1
  %24 = zext i32 16 to i64
  %25 = call ptr @malloc(i64 %24)
  %RAX13 = ptrtoint ptr %25 to i64
  store i64 %RAX13, ptr %RBP_N.48, align 1
  %memload14 = load i64, ptr %RBP_N.40, align 1
  %EAX15 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_15, i32 0, i32 37), i64 %memload14)
  %memload16 = load i64, ptr %RBP_N.48, align 1
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_15, i32 0, i32 48), i64 %memload16)
  %memload18 = load i64, ptr %RBP_N.48, align 1
  %26 = load i64, ptr %RBP_N.32, align 1
  %27 = sub i64 %memload18, %26
  %28 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload18, i64 %26)
  %CF19 = extractvalue { i64, i1 } %28, 1
  %ZF20 = icmp eq i64 %27, 0
  %highbit21 = and i64 -9223372036854775808, %27
  %SF22 = icmp ne i64 %highbit21, 0
  %29 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload18, i64 %26)
  %OF23 = extractvalue { i64, i1 } %29, 1
  %30 = and i64 %27, 255
  %31 = call i64 @llvm.ctpop.i64(i64 %30)
  %32 = and i64 %31, 1
  %PF24 = icmp eq i64 %32, 0
  %CmpZF_JNE = icmp eq i1 %ZF20, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX25 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_15, i32 0, i32 59))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
