; ModuleID = './bin/df_nonadjacent_free'
source_filename = "./bin/df_nonadjacent_free"

@rodata_15 = private unnamed_addr constant [121 x i8] c"\01\00\02\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00b: %p\0Ac: %p\0A\00Test Failed: Non-adjacent free sequence leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

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
  %memload = load i64, ptr %RBP_N.16, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %10 = inttoptr i64 %memload to ptr
  store i64 %memload2, ptr %10, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %11 = inttoptr i64 %memref-disp to ptr
  store i64 %memload3, ptr %11, align 1
  %memload4 = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 20), i64 %memload4)
  %memload5 = load i64, ptr %RBP_N.16, align 1
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 36), i64 %memload5)
  %memload7 = load i64, ptr %RBP_N.16, align 1
  %12 = inttoptr i64 %memload7 to ptr
  call void @free(ptr %12)
  %memload8 = load i64, ptr %RBP_N.24, align 1
  %13 = inttoptr i64 %memload8 to ptr
  call void @free(ptr %13)
  %memload9 = load i64, ptr %RBP_N.16, align 1
  %14 = inttoptr i64 %memload9 to ptr
  call void @free(ptr %14)
  %15 = zext i32 10 to i64
  %16 = call ptr @malloc(i64 %15)
  %RAX10 = ptrtoint ptr %16 to i64
  store i64 %RAX10, ptr %RBP_N.32, align 1
  %17 = zext i32 10 to i64
  %18 = call ptr @malloc(i64 %17)
  %RAX11 = ptrtoint ptr %18 to i64
  store i64 %RAX11, ptr %RBP_N.40, align 1
  %memload12 = load i64, ptr %RBP_N.32, align 1
  %memload13 = load i64, ptr %RBP_N.40, align 1
  %EAX14 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 44), i64 %memload12, i64 %memload13)
  %memload15 = load i64, ptr %RBP_N.32, align 1
  %19 = load i64, ptr %RBP_N.40, align 1
  %20 = sub i64 %memload15, %19
  %21 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload15, i64 %19)
  %CF = extractvalue { i64, i1 } %21, 1
  %ZF = icmp eq i64 %20, 0
  %highbit = and i64 -9223372036854775808, %20
  %SF = icmp ne i64 %highbit, 0
  %22 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload15, i64 %19)
  %OF = extractvalue { i64, i1 } %22, 1
  %23 = and i64 %20, 255
  %24 = call i64 @llvm.ctpop.i64(i64 %23)
  %25 = and i64 %24, 1
  %PF = icmp eq i64 %25, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX16 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 57))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload17 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload17
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([121 x i8], ptr @rodata_15, i32 0, i32 12)}
