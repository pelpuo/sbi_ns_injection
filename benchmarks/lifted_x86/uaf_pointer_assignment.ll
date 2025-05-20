; ModuleID = './bin/uaf_pointer_assignment'
source_filename = "./bin/uaf_pointer_assignment"

@rodata_18 = private unnamed_addr constant [132 x i8] c"\01\00\02\00\00\00\00\00Hello\00Addr of a:%p\0A\00Addr of b:%p\0A\0A\00World\00a: %s\0A\00b: %s\0A\00\00Test Failed: Incorrect pointer assignment leading to Use After Free\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

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
  %8 = call ptr @memcpy(ptr %6, ptr getelementptr inbounds ([132 x i8], ptr @rodata_18, i32 0, i32 8), i64 %7)
  %RAX2 = ptrtoint ptr %8 to i64
  %memload3 = load i64, ptr %stktop_8, align 1
  store i64 %memload3, ptr %RBP_N.8, align 1
  %memload4 = load i64, ptr %stktop_8, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_18, i32 0, i32 14), i64 %memload4)
  %memload6 = load i64, ptr %RBP_N.8, align 1
  %EAX8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_18, i32 0, i32 28), i64 %memload6)
  %memload9 = load i64, ptr %stktop_8, align 1
  %9 = inttoptr i64 %memload9 to ptr
  call void @free(ptr %9)
  %memload10 = load i64, ptr %RBP_N.8, align 1
  %10 = inttoptr i64 %memload10 to ptr
  %11 = zext i32 16 to i64
  %12 = call ptr @memcpy(ptr %10, ptr getelementptr inbounds ([132 x i8], ptr @rodata_18, i32 0, i32 43), i64 %11)
  %RAX12 = ptrtoint ptr %12 to i64
  %memload13 = load i64, ptr %stktop_8, align 1
  %EAX15 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_18, i32 0, i32 49), i64 %memload13)
  %memload16 = load i64, ptr %RBP_N.8, align 1
  %EAX18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_18, i32 0, i32 56), i64 %memload16)
  %memload19 = load i64, ptr %stktop_8, align 1
  %13 = inttoptr i64 %memload19 to ptr
  %memload20 = load i32, ptr %13, align 1
  %14 = trunc i32 %memload20 to i8
  %EAX21 = zext i8 %14 to i32
  %15 = sub i32 %EAX21, 72
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX21, i32 72)
  %CF = extractvalue { i32, i1 } %16, 1
  %ZF = icmp eq i32 %15, 0
  %highbit = and i32 -2147483648, %15
  %SF = icmp ne i32 %highbit, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX21, i32 72)
  %OF = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF = icmp eq i32 %20, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX23 = call i32 @puts(ptr getelementptr inbounds ([132 x i8], ptr @rodata_18, i32 0, i32 64))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
