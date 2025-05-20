; ModuleID = './bin/hm_fake_chunk_malloc'
source_filename = "./bin/hm_fake_chunk_malloc"

@rodata_18 = private unnamed_addr constant [137 x i8] c"\01\00\02\00\00\00\00\00ptr0: %p\0A\00ptr1: %p\0A\00Target: %p\0A\0A\00ptr_x: %p\0A\00ptr_y: %p\0A\00\00Test Failed: Heap manipulation leading to allocation on specific address\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.40 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.32 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.24 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.16 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 48
  %RBP_N.8 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %5 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX = ptrtoint ptr %7 to i64
  store i64 %RAX, ptr %RBP_N.40, align 1
  %8 = zext i32 16 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX1 = ptrtoint ptr %9 to i64
  store i64 %RAX1, ptr %RBP_N.32, align 1
  %10 = zext i32 16 to i64
  %11 = call ptr @malloc(i64 %10)
  %RAX2 = ptrtoint ptr %11 to i64
  store i64 %RAX2, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.40, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload)
  %memload4 = load i64, ptr %RBP_N.32, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @rodata_18, i32 0, i32 18), i64 %memload4)
  %memload7 = load i64, ptr %RBP_N.24, align 1
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @rodata_18, i32 0, i32 28), i64 %memload7)
  %memload10 = load i64, ptr %RBP_N.40, align 1
  %12 = inttoptr i64 %memload10 to ptr
  call void @free(ptr %12)
  %memload11 = load i64, ptr %RBP_N.32, align 1
  %13 = inttoptr i64 %memload11 to ptr
  call void @free(ptr %13)
  %memload12 = load i64, ptr %RBP_N.32, align 1
  %14 = inttoptr i64 %memload12 to ptr
  %memload13 = load i64, ptr %14, align 1
  %memref-disp = add i64 %memload13, 64
  %memload14 = load i64, ptr %RBP_N.32, align 1
  %15 = inttoptr i64 %memload14 to ptr
  store i64 %memref-disp, ptr %15, align 1
  %16 = zext i32 16 to i64
  %17 = call ptr @malloc(i64 %16)
  %RAX15 = ptrtoint ptr %17 to i64
  store i64 %RAX15, ptr %RBP_N.16, align 1
  %18 = zext i32 16 to i64
  %19 = call ptr @malloc(i64 %18)
  %RAX16 = ptrtoint ptr %19 to i64
  store i64 %RAX16, ptr %RBP_N.8, align 1
  %memload17 = load i64, ptr %RBP_N.16, align 1
  %EAX19 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @rodata_18, i32 0, i32 41), i64 %memload17)
  %memload20 = load i64, ptr %RBP_N.8, align 1
  %EAX22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([137 x i8], ptr @rodata_18, i32 0, i32 52), i64 %memload20)
  %memload23 = load i64, ptr %RBP_N.8, align 1
  %20 = load i64, ptr %RBP_N.24, align 1
  %21 = sub i64 %memload23, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload23, i64 %20)
  %CF = extractvalue { i64, i1 } %22, 1
  %ZF = icmp eq i64 %21, 0
  %highbit = and i64 -9223372036854775808, %21
  %SF = icmp ne i64 %highbit, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload23, i64 %20)
  %OF = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF = icmp eq i64 %26, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX25 = call i32 @puts(ptr getelementptr inbounds ([137 x i8], ptr @rodata_18, i32 0, i32 64))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
