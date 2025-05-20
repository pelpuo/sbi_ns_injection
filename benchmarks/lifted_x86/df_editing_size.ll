; ModuleID = './bin/df_editing_size'
source_filename = "./bin/df_editing_size"

@rodata_18 = private unnamed_addr constant [118 x i8] c"\01\00\02\00\00\00\00\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00x\00b: %p\0Ac: %p\0A\00\00Test Failed: Size manipulation leading to Double Free\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %6 = inttoptr i64 %memload to ptr
  %7 = zext i32 16 to i64
  %8 = call ptr @memcpy(ptr %6, ptr getelementptr inbounds ([118 x i8], ptr @rodata_18, i32 0, i32 8), i64 %7)
  %RAX1 = ptrtoint ptr %8 to i64
  %memload2 = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_18, i32 0, i32 24), i64 %memload2)
  %memload4 = load i64, ptr %RBP_N.24, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_18, i32 0, i32 40), i64 %memload4)
  %memload7 = load i64, ptr %RBP_N.24, align 1
  %9 = inttoptr i64 %memload7 to ptr
  call void @free(ptr %9)
  %memload8 = load i64, ptr %RBP_N.24, align 1
  %RAX9 = add i64 %memload8, 15
  %10 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload8, i64 15)
  %CF = extractvalue { i64, i1 } %10, 1
  %11 = and i64 %RAX9, 255
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = and i64 %12, 1
  %PF = icmp eq i64 %13, 0
  %ZF = icmp eq i64 %RAX9, 0
  %highbit = and i64 -9223372036854775808, %RAX9
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload8, i64 15)
  %OF = extractvalue { i64, i1 } %14, 1
  %15 = inttoptr i64 %RAX9 to ptr
  %16 = zext i32 1 to i64
  %17 = call ptr @memcpy(ptr %15, ptr getelementptr inbounds ([118 x i8], ptr @rodata_18, i32 0, i32 48), i64 %16)
  %RAX11 = ptrtoint ptr %17 to i64
  %memload12 = load i64, ptr %RBP_N.24, align 1
  %18 = inttoptr i64 %memload12 to ptr
  call void @free(ptr %18)
  %19 = zext i32 16 to i64
  %20 = call ptr @malloc(i64 %19)
  %RAX13 = ptrtoint ptr %20 to i64
  store i64 %RAX13, ptr %RBP_N.16, align 1
  %21 = zext i32 16 to i64
  %22 = call ptr @malloc(i64 %21)
  %RAX14 = ptrtoint ptr %22 to i64
  store i64 %RAX14, ptr %RBP_N.8, align 1
  %memload15 = load i64, ptr %RBP_N.8, align 1
  %memload16 = load i64, ptr %RBP_N.16, align 1
  %EAX18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_18, i32 0, i32 50), i64 %memload16, i64 %memload15)
  %memload19 = load i64, ptr %RBP_N.16, align 1
  %23 = load i64, ptr %RBP_N.8, align 1
  %24 = sub i64 %memload19, %23
  %25 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload19, i64 %23)
  %CF20 = extractvalue { i64, i1 } %25, 1
  %ZF21 = icmp eq i64 %24, 0
  %highbit22 = and i64 -9223372036854775808, %24
  %SF23 = icmp ne i64 %highbit22, 0
  %26 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload19, i64 %23)
  %OF24 = extractvalue { i64, i1 } %26, 1
  %27 = and i64 %24, 255
  %28 = call i64 @llvm.ctpop.i64(i64 %27)
  %29 = and i64 %28, 1
  %PF25 = icmp eq i64 %29, 0
  %CmpZF_JNE = icmp eq i1 %ZF21, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX27 = call i32 @puts(ptr getelementptr inbounds ([118 x i8], ptr @rodata_18, i32 0, i32 64))
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
