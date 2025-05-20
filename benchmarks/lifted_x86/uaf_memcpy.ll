; ModuleID = './bin/uaf_memcpy'
source_filename = "./bin/uaf_memcpy"

@rodata_18 = private unnamed_addr constant [121 x i8] c"\01\00\02\00\00\00\00\00hello!\00a contains: %s\0A\0A\00a: %p\0A\00b: %p\0A\0A\00RANDOMSTRING\00b contains: %s\0A\0A\00\00\00\00Test Failed: Use After Free using memcpy\00", align 8, !ROData_SecInfo !0

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
  %memload = load i64, ptr %stktop_8, align 1
  %4 = inttoptr i64 %memload to ptr
  %5 = zext i32 16 to i64
  %6 = call ptr @memcpy(ptr %4, ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 8), i64 %5)
  %RAX1 = ptrtoint ptr %6 to i64
  %memload2 = load i64, ptr %stktop_8, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 15), i64 %memload2)
  %memload4 = load i64, ptr %stktop_8, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 32), i64 %memload4)
  %memload7 = load i64, ptr %stktop_8, align 1
  %7 = inttoptr i64 %memload7 to ptr
  call void @free(ptr %7)
  %8 = zext i32 10 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX8 = ptrtoint ptr %9 to i64
  store i64 %RAX8, ptr %RBP_N.8, align 1
  %memload9 = load i64, ptr %RBP_N.8, align 1
  %EAX11 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 39), i64 %memload9)
  %memload12 = load i64, ptr %stktop_8, align 1
  %10 = inttoptr i64 %memload12 to ptr
  %11 = zext i32 16 to i64
  %12 = call ptr @memcpy(ptr %10, ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 47), i64 %11)
  %RAX14 = ptrtoint ptr %12 to i64
  %memload15 = load i64, ptr %stktop_8, align 1
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 15), i64 %memload15)
  %memload18 = load i64, ptr %RBP_N.8, align 1
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 60), i64 %memload18)
  %memload21 = load i64, ptr %stktop_8, align 1
  %13 = inttoptr i64 %memload21 to ptr
  %memload22 = load i32, ptr %13, align 1
  %14 = trunc i32 %memload22 to i8
  %EAX23 = zext i8 %14 to i32
  %15 = sub i32 %EAX23, 82
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX23, i32 82)
  %CF = extractvalue { i32, i1 } %16, 1
  %ZF = icmp eq i32 %15, 0
  %highbit = and i32 -2147483648, %15
  %SF = icmp ne i32 %highbit, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX23, i32 82)
  %OF = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF = icmp eq i32 %20, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX25 = call i32 @puts(ptr getelementptr inbounds ([121 x i8], ptr @rodata_18, i32 0, i32 80))
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
