; ModuleID = './bin/df_with_oobw'
source_filename = "./bin/df_with_oobw"

@rodata_18 = private unnamed_addr constant [88 x i8] c"\01\00\02\00\00\00\00\00b: %p\0A\0A\00x\00c: %p\0Ad: %p\0A\00\00Test Failed: Metadata corruption leading to Double Free\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local ptr @memcpy(ptr, ptr, i64)

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
  store i64 %RAX, ptr %stktop_8, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX1 = ptrtoint ptr %7 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([88 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload)
  %memload3 = load i64, ptr %RBP_N.24, align 1
  %8 = inttoptr i64 %memload3 to ptr
  call void @free(ptr %8)
  %memload4 = load i64, ptr %stktop_8, align 1
  %RAX5 = add i64 %memload4, 40
  %9 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload4, i64 40)
  %CF = extractvalue { i64, i1 } %9, 1
  %10 = and i64 %RAX5, 255
  %11 = call i64 @llvm.ctpop.i64(i64 %10)
  %12 = and i64 %11, 1
  %PF = icmp eq i64 %12, 0
  %ZF = icmp eq i64 %RAX5, 0
  %highbit = and i64 -9223372036854775808, %RAX5
  %SF = icmp ne i64 %highbit, 0
  %13 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload4, i64 40)
  %OF = extractvalue { i64, i1 } %13, 1
  %14 = inttoptr i64 %RAX5 to ptr
  %15 = zext i32 1 to i64
  %16 = call ptr @memcpy(ptr %14, ptr getelementptr inbounds ([88 x i8], ptr @rodata_18, i32 0, i32 16), i64 %15)
  %RAX6 = ptrtoint ptr %16 to i64
  %memload7 = load i64, ptr %RBP_N.24, align 1
  %17 = inttoptr i64 %memload7 to ptr
  call void @free(ptr %17)
  %18 = zext i32 16 to i64
  %19 = call ptr @malloc(i64 %18)
  %RAX8 = ptrtoint ptr %19 to i64
  store i64 %RAX8, ptr %RBP_N.16, align 1
  %20 = zext i32 16 to i64
  %21 = call ptr @malloc(i64 %20)
  %RAX9 = ptrtoint ptr %21 to i64
  store i64 %RAX9, ptr %RBP_N.8, align 1
  %memload10 = load i64, ptr %RBP_N.8, align 1
  %memload11 = load i64, ptr %RBP_N.16, align 1
  %EAX13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([88 x i8], ptr @rodata_18, i32 0, i32 18), i64 %memload11, i64 %memload10)
  %memload14 = load i64, ptr %RBP_N.16, align 1
  %22 = load i64, ptr %RBP_N.8, align 1
  %23 = sub i64 %memload14, %22
  %24 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload14, i64 %22)
  %CF15 = extractvalue { i64, i1 } %24, 1
  %ZF16 = icmp eq i64 %23, 0
  %highbit17 = and i64 -9223372036854775808, %23
  %SF18 = icmp ne i64 %highbit17, 0
  %25 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload14, i64 %22)
  %OF19 = extractvalue { i64, i1 } %25, 1
  %26 = and i64 %23, 255
  %27 = call i64 @llvm.ctpop.i64(i64 %26)
  %28 = and i64 %27, 1
  %PF20 = icmp eq i64 %28, 0
  %CmpZF_JNE = icmp eq i1 %ZF16, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX22 = call i32 @puts(ptr getelementptr inbounds ([88 x i8], ptr @rodata_18, i32 0, i32 32))
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
