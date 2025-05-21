; ModuleID = './bin/hm_parent_and_child_chunk'
source_filename = "./bin/hm_parent_and_child_chunk"

@rodata_15 = private unnamed_addr constant [130 x i8] c"\01\00\02\00victim's data\00d: %p\0A\00e: %p\0A\0A\00g: %p -> %p\0A\00h: %p\0A\00h: %s\0A\00Test Failed: Heap manipulation leading to overlapping memory regions\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local void @free(ptr)

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local i32 @printf(ptr, ...)

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
  %4 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %5 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX = ptrtoint ptr %7 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %8 = zext i32 16 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX1 = ptrtoint ptr %9 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %10 = zext i32 16 to i64
  %11 = call ptr @malloc(i64 %10)
  %RAX2 = ptrtoint ptr %11 to i64
  store i64 %RAX2, ptr %RBP_N.32, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %memref-disp = add i64 %memload, 24
  %12 = inttoptr i64 %memref-disp to ptr
  store i8 97, ptr %12, align 1
  %memload3 = load i64, ptr %RBP_N.24, align 1
  %13 = inttoptr i64 %memload3 to ptr
  call void @free(ptr %13)
  %memload4 = load i64, ptr %RBP_N.32, align 1
  %14 = inttoptr i64 %memload4 to ptr
  call void @free(ptr %14)
  %15 = zext i32 80 to i64
  %16 = call ptr @malloc(i64 %15)
  %RAX5 = ptrtoint ptr %16 to i64
  store i64 %RAX5, ptr %RBP_N.40, align 1
  %17 = zext i32 16 to i64
  %18 = call ptr @malloc(i64 %17)
  %RAX6 = ptrtoint ptr %18 to i64
  store i64 %RAX6, ptr %stktop_8, align 1
  %memload7 = load i64, ptr %stktop_8, align 1
  %memload8 = load i64, ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %19 = inttoptr i64 %memload7 to ptr
  store i64 %memload8, ptr %19, align 1
  %memload9 = load i32, ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp10 = add i64 %memload7, 8
  %20 = inttoptr i64 %memref-disp10 to ptr
  store i32 %memload9, ptr %20, align 1
  %memload11 = load i16, ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !3
  %memref-disp12 = add i64 %memload7, 12
  %21 = inttoptr i64 %memref-disp12 to ptr
  store i16 %memload11, ptr %21, align 1
  %memload13 = load i64, ptr %RBP_N.40, align 1
  %RDI = add i64 %memload13, 32
  %22 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload13, i64 32)
  %CF = extractvalue { i64, i1 } %22, 1
  %23 = and i64 %RDI, 255
  %24 = call i64 @llvm.ctpop.i64(i64 %23)
  %25 = and i64 %24, 1
  %PF = icmp eq i64 %25, 0
  %ZF = icmp eq i64 %RDI, 0
  %highbit = and i64 -9223372036854775808, %RDI
  %SF = icmp ne i64 %highbit, 0
  %26 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload13, i64 32)
  %OF = extractvalue { i64, i1 } %26, 1
  %27 = inttoptr i64 %RDI to ptr
  %28 = zext i32 15 to i64
  %29 = call ptr @memset(ptr %27, i32 65, i64 %28)
  %RAX14 = ptrtoint ptr %29 to i64
  %memload15 = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 18), i64 %memload15)
  %memload16 = load i64, ptr %RBP_N.32, align 1
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 25), i64 %memload16)
  %memload18 = load i64, ptr %RBP_N.40, align 1
  %memload19 = load i64, ptr %RBP_N.40, align 1
  %RDX = add i64 %memload19, 80
  %30 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload19, i64 80)
  %CF20 = extractvalue { i64, i1 } %30, 1
  %31 = and i64 %RDX, 255
  %32 = call i64 @llvm.ctpop.i64(i64 %31)
  %33 = and i64 %32, 1
  %PF21 = icmp eq i64 %33, 0
  %ZF22 = icmp eq i64 %RDX, 0
  %highbit23 = and i64 -9223372036854775808, %RDX
  %SF24 = icmp ne i64 %highbit23, 0
  %34 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload19, i64 80)
  %OF25 = extractvalue { i64, i1 } %34, 1
  %EAX26 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 33), i64 %memload18, i64 %RDX)
  %memload27 = load i64, ptr %stktop_8, align 1
  %EAX28 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 46), i64 %memload27)
  %memload29 = load i64, ptr %stktop_8, align 1
  %EAX30 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 53), i64 %memload29)
  %memload31 = load i64, ptr %stktop_8, align 1
  %35 = inttoptr i64 %memload31 to ptr
  %memload32 = load i32, ptr %35, align 1
  %36 = trunc i32 %memload32 to i8
  %EAX33 = sext i8 %36 to i32
  %37 = sub i32 %EAX33, 65
  %38 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX33, i32 65)
  %CF34 = extractvalue { i32, i1 } %38, 1
  %ZF35 = icmp eq i32 %37, 0
  %highbit36 = and i32 -2147483648, %37
  %SF37 = icmp ne i32 %highbit36, 0
  %39 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX33, i32 65)
  %OF38 = extractvalue { i32, i1 } %39, 1
  %40 = and i32 %37, 255
  %41 = call i32 @llvm.ctpop.i32(i32 %40)
  %42 = and i32 %41, 1
  %PF39 = icmp eq i32 %42, 0
  %CmpZF_JNE = icmp eq i1 %ZF35, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX40 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 60))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload41 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload41
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

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 16)}
