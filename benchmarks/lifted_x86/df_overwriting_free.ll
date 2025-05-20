; ModuleID = './bin/df_overwriting_free'
source_filename = "./bin/df_overwriting_free"

@rodata_18 = private unnamed_addr constant [127 x i8] c"\01\00\02\00\00\00\00\00hello!\00a contains: %s\0A\0A\00a: %p\0A\0A\00RANDOMSTRING\00b: %p\0Ac: %p\0A\00\00\00\00\00\00\00Test Failed: Metadata overwrite leading to Double Free\00", align 8, !ROData_SecInfo !0

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
  %4 = zext i32 10 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %6 = inttoptr i64 %memload to ptr
  %7 = zext i32 16 to i64
  %8 = call ptr @memcpy(ptr %6, ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 8), i64 %7)
  %RAX1 = ptrtoint ptr %8 to i64
  %memload2 = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 15), i64 %memload2)
  %memload4 = load i64, ptr %RBP_N.24, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 32), i64 %memload4)
  %memload7 = load i64, ptr %RBP_N.24, align 1
  %9 = inttoptr i64 %memload7 to ptr
  call void @free(ptr %9)
  %memload8 = load i64, ptr %RBP_N.24, align 1
  %10 = inttoptr i64 %memload8 to ptr
  %11 = zext i32 16 to i64
  %12 = call ptr @memcpy(ptr %10, ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 40), i64 %11)
  %RAX10 = ptrtoint ptr %12 to i64
  %memload11 = load i64, ptr %RBP_N.24, align 1
  %EAX13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 15), i64 %memload11)
  %memload14 = load i64, ptr %RBP_N.24, align 1
  %13 = inttoptr i64 %memload14 to ptr
  call void @free(ptr %13)
  %14 = zext i32 10 to i64
  %15 = call ptr @malloc(i64 %14)
  %RAX15 = ptrtoint ptr %15 to i64
  store i64 %RAX15, ptr %RBP_N.16, align 1
  %16 = zext i32 10 to i64
  %17 = call ptr @malloc(i64 %16)
  %RAX16 = ptrtoint ptr %17 to i64
  store i64 %RAX16, ptr %RBP_N.8, align 1
  %memload17 = load i64, ptr %RBP_N.8, align 1
  %memload18 = load i64, ptr %RBP_N.16, align 1
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 53), i64 %memload18, i64 %memload17)
  %memload21 = load i64, ptr %RBP_N.16, align 1
  %18 = load i64, ptr %RBP_N.8, align 1
  %19 = sub i64 %memload21, %18
  %20 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload21, i64 %18)
  %CF = extractvalue { i64, i1 } %20, 1
  %ZF = icmp eq i64 %19, 0
  %highbit = and i64 -9223372036854775808, %19
  %SF = icmp ne i64 %highbit, 0
  %21 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload21, i64 %18)
  %OF = extractvalue { i64, i1 } %21, 1
  %22 = and i64 %19, 255
  %23 = call i64 @llvm.ctpop.i64(i64 %22)
  %24 = and i64 %23, 1
  %PF = icmp eq i64 %24, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX23 = call i32 @puts(ptr getelementptr inbounds ([127 x i8], ptr @rodata_18, i32 0, i32 72))
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
