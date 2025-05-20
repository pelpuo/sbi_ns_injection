; ModuleID = './bin/hm_parent_and_child_chunk'
source_filename = "./bin/hm_parent_and_child_chunk"

@rodata_18 = private unnamed_addr constant [133 x i8] c"\01\00\02\00\00\00\00\00victim's data\00d: %p\0A\00e: %p\0A\0A\00g: %p -> %p\0A\00h: %p\0A\00h: %s\0A\00Test Failed: Heap manipulation leading to overlapping memory regions\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local void @free(ptr)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local i32 @printf(ptr, ...)

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
  %RAX3 = add i64 %memload, 24
  %12 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload, i64 24)
  %CF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RAX3, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %ZF = icmp eq i64 %RAX3, 0
  %highbit = and i64 -9223372036854775808, %RAX3
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload, i64 24)
  %OF = extractvalue { i64, i1 } %16, 1
  %17 = inttoptr i64 %RAX3 to ptr
  store i8 97, ptr %17, align 1
  %memload4 = load i64, ptr %RBP_N.32, align 1
  %18 = inttoptr i64 %memload4 to ptr
  call void @free(ptr %18)
  %memload5 = load i64, ptr %RBP_N.24, align 1
  %19 = inttoptr i64 %memload5 to ptr
  call void @free(ptr %19)
  %20 = zext i32 80 to i64
  %21 = call ptr @malloc(i64 %20)
  %RAX6 = ptrtoint ptr %21 to i64
  store i64 %RAX6, ptr %RBP_N.16, align 1
  %22 = zext i32 16 to i64
  %23 = call ptr @malloc(i64 %22)
  %RAX7 = ptrtoint ptr %23 to i64
  store i64 %RAX7, ptr %RBP_N.8, align 1
  %memload8 = load i64, ptr %RBP_N.8, align 1
  %24 = inttoptr i64 %memload8 to ptr
  %25 = zext i32 14 to i64
  %26 = call ptr @memcpy(ptr %24, ptr getelementptr inbounds ([133 x i8], ptr @rodata_18, i32 0, i32 8), i64 %25)
  %RAX9 = ptrtoint ptr %26 to i64
  %memload10 = load i64, ptr %RBP_N.16, align 1
  %RAX17 = add i64 %memload10, 32
  %27 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload10, i64 32)
  %CF11 = extractvalue { i64, i1 } %27, 1
  %28 = and i64 %RAX17, 255
  %29 = call i64 @llvm.ctpop.i64(i64 %28)
  %30 = and i64 %29, 1
  %PF12 = icmp eq i64 %30, 0
  %ZF13 = icmp eq i64 %RAX17, 0
  %highbit14 = and i64 -9223372036854775808, %RAX17
  %SF15 = icmp ne i64 %highbit14, 0
  %31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload10, i64 32)
  %OF16 = extractvalue { i64, i1 } %31, 1
  %32 = inttoptr i64 %RAX17 to ptr
  %33 = zext i32 15 to i64
  %34 = call ptr @memset(ptr %32, i32 65, i64 %33)
  %RAX18 = ptrtoint ptr %34 to i64
  %memload19 = load i64, ptr %RBP_N.32, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_18, i32 0, i32 22), i64 %memload19)
  %memload21 = load i64, ptr %RBP_N.24, align 1
  %EAX23 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_18, i32 0, i32 29), i64 %memload21)
  %memload24 = load i64, ptr %RBP_N.16, align 1
  %memref-disp = add i64 %memload24, 80
  %memload25 = load i64, ptr %RBP_N.16, align 1
  %EAX27 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_18, i32 0, i32 37), i64 %memload25, i64 %memref-disp)
  %memload28 = load i64, ptr %RBP_N.8, align 1
  %EAX30 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_18, i32 0, i32 50), i64 %memload28)
  %memload31 = load i64, ptr %RBP_N.8, align 1
  %EAX33 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([133 x i8], ptr @rodata_18, i32 0, i32 57), i64 %memload31)
  %memload34 = load i64, ptr %RBP_N.8, align 1
  %35 = inttoptr i64 %memload34 to ptr
  %memload35 = load i32, ptr %35, align 1
  %36 = trunc i32 %memload35 to i8
  %EAX36 = zext i8 %36 to i32
  %37 = sub i32 %EAX36, 65
  %38 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX36, i32 65)
  %CF37 = extractvalue { i32, i1 } %38, 1
  %ZF38 = icmp eq i32 %37, 0
  %highbit39 = and i32 -2147483648, %37
  %SF40 = icmp ne i32 %highbit39, 0
  %39 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX36, i32 65)
  %OF41 = extractvalue { i32, i1 } %39, 1
  %40 = and i32 %37, 255
  %41 = call i32 @llvm.ctpop.i32(i32 %40)
  %42 = and i32 %41, 1
  %PF42 = icmp eq i32 %42, 0
  %CmpZF_JNE = icmp eq i1 %ZF38, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX44 = call i32 @puts(ptr getelementptr inbounds ([133 x i8], ptr @rodata_18, i32 0, i32 64))
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
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
