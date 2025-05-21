; ModuleID = './bin/df_overwriting_free'
source_filename = "./bin/df_overwriting_free"

@rodata_15 = private unnamed_addr constant [118 x i8] c"\01\00\02\00hello!\00a contains: %s\0A\0A\00a: %p\0A\0A\00RANDOMSTRING\00b: %p\0Ac: %p\0A\00Test Failed: Metadata overwrite leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

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
  %4 = zext i32 10 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %6 = inttoptr i64 %memload to ptr
  store i64 %memload1, ptr %6, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %7 = inttoptr i64 %memref-disp to ptr
  store i64 %memload2, ptr %7, align 1
  %memload3 = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload4 = load i64, ptr %RBP_N.16, align 1
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 28), i64 %memload4)
  %memload6 = load i64, ptr %RBP_N.16, align 1
  %8 = inttoptr i64 %memload6 to ptr
  call void @free(ptr %8)
  %memload7 = load i64, ptr %RBP_N.16, align 1
  %memload8 = load i64, ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 36), align 1, !ROData_Content !3
  %9 = inttoptr i64 %memload7 to ptr
  store i64 %memload8, ptr %9, align 1
  %memload9 = load i64, ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 44), align 1, !ROData_Content !4
  %memref-disp10 = add i64 %memload7, 8
  %10 = inttoptr i64 %memref-disp10 to ptr
  store i64 %memload9, ptr %10, align 1
  %memload11 = load i64, ptr %RBP_N.16, align 1
  %EAX12 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 11), i64 %memload11)
  %memload13 = load i64, ptr %RBP_N.16, align 1
  %11 = inttoptr i64 %memload13 to ptr
  call void @free(ptr %11)
  %12 = zext i32 10 to i64
  %13 = call ptr @malloc(i64 %12)
  %RAX14 = ptrtoint ptr %13 to i64
  store i64 %RAX14, ptr %RBP_N.24, align 1
  %14 = zext i32 10 to i64
  %15 = call ptr @malloc(i64 %14)
  %RAX15 = ptrtoint ptr %15 to i64
  store i64 %RAX15, ptr %stktop_8, align 1
  %memload16 = load i64, ptr %RBP_N.24, align 1
  %memload17 = load i64, ptr %stktop_8, align 1
  %EAX18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 49), i64 %memload16, i64 %memload17)
  %memload19 = load i64, ptr %RBP_N.24, align 1
  %16 = load i64, ptr %stktop_8, align 1
  %17 = sub i64 %memload19, %16
  %18 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload19, i64 %16)
  %CF = extractvalue { i64, i1 } %18, 1
  %ZF = icmp eq i64 %17, 0
  %highbit = and i64 -9223372036854775808, %17
  %SF = icmp ne i64 %highbit, 0
  %19 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload19, i64 %16)
  %OF = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %17, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF = icmp eq i64 %22, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 62))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload21 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload21
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 36)}
!4 = !{ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 44)}
