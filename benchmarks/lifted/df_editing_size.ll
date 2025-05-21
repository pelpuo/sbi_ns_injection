; ModuleID = './bin/df_editing_size'
source_filename = "./bin/df_editing_size"

@rodata_15 = private unnamed_addr constant [114 x i8] c"\01\00\02\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00x\00b: %p\0Ac: %p\0A\00Test Failed: Size manipulation leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %6 = inttoptr i64 %memload to ptr
  store i64 %memload1, ptr %6, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %7 = inttoptr i64 %memref-disp to ptr
  store i64 %memload2, ptr %7, align 1
  %memload3 = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 20), i64 %memload3)
  %memload4 = load i64, ptr %RBP_N.16, align 1
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 36), i64 %memload4)
  %memload6 = load i64, ptr %RBP_N.16, align 1
  %8 = inttoptr i64 %memload6 to ptr
  call void @free(ptr %8)
  %memload7 = load i64, ptr %RBP_N.16, align 1
  %memload8 = load i8, ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 44), align 1, !ROData_Content !3
  %memref-disp9 = add i64 %memload7, 15
  %9 = inttoptr i64 %memref-disp9 to ptr
  store i8 %memload8, ptr %9, align 1
  %memload10 = load i64, ptr %RBP_N.16, align 1
  %10 = inttoptr i64 %memload10 to ptr
  call void @free(ptr %10)
  %11 = zext i32 16 to i64
  %12 = call ptr @malloc(i64 %11)
  %RAX11 = ptrtoint ptr %12 to i64
  store i64 %RAX11, ptr %RBP_N.24, align 1
  %13 = zext i32 16 to i64
  %14 = call ptr @malloc(i64 %13)
  %RAX12 = ptrtoint ptr %14 to i64
  store i64 %RAX12, ptr %stktop_8, align 1
  %memload13 = load i64, ptr %RBP_N.24, align 1
  %memload14 = load i64, ptr %stktop_8, align 1
  %EAX15 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 46), i64 %memload13, i64 %memload14)
  %memload16 = load i64, ptr %RBP_N.24, align 1
  %15 = load i64, ptr %stktop_8, align 1
  %16 = sub i64 %memload16, %15
  %17 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload16, i64 %15)
  %CF = extractvalue { i64, i1 } %17, 1
  %ZF = icmp eq i64 %16, 0
  %highbit = and i64 -9223372036854775808, %16
  %SF = icmp ne i64 %highbit, 0
  %18 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload16, i64 %15)
  %OF = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %16, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF = icmp eq i64 %21, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 59))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload18 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload18
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([114 x i8], ptr @rodata_15, i32 0, i32 44)}
