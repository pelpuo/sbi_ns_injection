; ModuleID = './bin/oobw_edit_chunk_size'
source_filename = "./bin/oobw_edit_chunk_size"

@rodata_18 = private unnamed_addr constant [90 x i8] c"\01\00\02\00\00\00\00\00c: %p\0A\00d: %p\0A\0A\00g: %p\0A\00h: %p\0A\00\00\00\00Test Failed: Out of Bounds write to heap metadata\00", align 8, !ROData_SecInfo !0

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
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload)
  %memload4 = load i64, ptr %RBP_N.32, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 15), i64 %memload4)
  %memload7 = load i64, ptr %RBP_N.40, align 1
  %RAX8 = add i64 %memload7, 24
  %12 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload7, i64 24)
  %CF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RAX8, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %ZF = icmp eq i64 %RAX8, 0
  %highbit = and i64 -9223372036854775808, %RAX8
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload7, i64 24)
  %OF = extractvalue { i64, i1 } %16, 1
  %17 = inttoptr i64 %RAX8 to ptr
  store i8 49, ptr %17, align 1
  %memload9 = load i64, ptr %RBP_N.32, align 1
  %18 = inttoptr i64 %memload9 to ptr
  call void @free(ptr %18)
  %19 = zext i32 32 to i64
  %20 = call ptr @malloc(i64 %19)
  %RAX10 = ptrtoint ptr %20 to i64
  store i64 %RAX10, ptr %RBP_N.16, align 1
  %21 = zext i32 16 to i64
  %22 = call ptr @malloc(i64 %21)
  %RAX11 = ptrtoint ptr %22 to i64
  store i64 %RAX11, ptr %RBP_N.8, align 1
  %memload12 = load i64, ptr %RBP_N.16, align 1
  %EAX14 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 23), i64 %memload12)
  %memload15 = load i64, ptr %RBP_N.8, align 1
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 30), i64 %memload15)
  %memload18 = load i64, ptr %RBP_N.16, align 1
  %23 = load i64, ptr %RBP_N.32, align 1
  %24 = sub i64 %memload18, %23
  %25 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload18, i64 %23)
  %CF19 = extractvalue { i64, i1 } %25, 1
  %ZF20 = icmp eq i64 %24, 0
  %highbit21 = and i64 -9223372036854775808, %24
  %SF22 = icmp ne i64 %highbit21, 0
  %26 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload18, i64 %23)
  %OF23 = extractvalue { i64, i1 } %26, 1
  %27 = and i64 %24, 255
  %28 = call i64 @llvm.ctpop.i64(i64 %27)
  %29 = and i64 %28, 1
  %PF24 = icmp eq i64 %29, 0
  %CmpZF_JNE = icmp eq i1 %ZF20, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX26 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 40))
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

!0 = !{i64 8192}
