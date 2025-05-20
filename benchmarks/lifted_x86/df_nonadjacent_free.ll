; ModuleID = './bin/df_nonadjacent_free'
source_filename = "./bin/df_nonadjacent_free"

@rodata_18 = private unnamed_addr constant [127 x i8] c"\01\00\02\00\00\00\00\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00b: %p\0Ac: %p\0A\00\00\00\00Test Failed: Non-adjacent free sequence leading to Double Free\00", align 8, !ROData_SecInfo !0

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
  store i64 %RAX, ptr %stktop_8, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX1 = ptrtoint ptr %7 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %8 = inttoptr i64 %memload to ptr
  %9 = zext i32 16 to i64
  %10 = call ptr @memcpy(ptr %8, ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 8), i64 %9)
  %RAX2 = ptrtoint ptr %10 to i64
  %memload3 = load i64, ptr %stktop_8, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 24), i64 %memload3)
  %memload5 = load i64, ptr %stktop_8, align 1
  %EAX7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 40), i64 %memload5)
  %memload8 = load i64, ptr %stktop_8, align 1
  %11 = inttoptr i64 %memload8 to ptr
  call void @free(ptr %11)
  %memload9 = load i64, ptr %RBP_N.24, align 1
  %12 = inttoptr i64 %memload9 to ptr
  call void @free(ptr %12)
  %memload10 = load i64, ptr %stktop_8, align 1
  %13 = inttoptr i64 %memload10 to ptr
  call void @free(ptr %13)
  %14 = zext i32 10 to i64
  %15 = call ptr @malloc(i64 %14)
  %RAX11 = ptrtoint ptr %15 to i64
  store i64 %RAX11, ptr %RBP_N.16, align 1
  %16 = zext i32 10 to i64
  %17 = call ptr @malloc(i64 %16)
  %RAX12 = ptrtoint ptr %17 to i64
  store i64 %RAX12, ptr %RBP_N.8, align 1
  %memload13 = load i64, ptr %RBP_N.8, align 1
  %memload14 = load i64, ptr %RBP_N.16, align 1
  %EAX16 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 48), i64 %memload14, i64 %memload13)
  %memload17 = load i64, ptr %RBP_N.16, align 1
  %18 = load i64, ptr %RBP_N.8, align 1
  %19 = sub i64 %memload17, %18
  %20 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload17, i64 %18)
  %CF = extractvalue { i64, i1 } %20, 1
  %ZF = icmp eq i64 %19, 0
  %highbit = and i64 -9223372036854775808, %19
  %SF = icmp ne i64 %highbit, 0
  %21 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload17, i64 %18)
  %OF = extractvalue { i64, i1 } %21, 1
  %22 = and i64 %19, 255
  %23 = call i64 @llvm.ctpop.i64(i64 %22)
  %24 = and i64 %23, 1
  %PF = icmp eq i64 %24, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX19 = call i32 @puts(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 64))
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
