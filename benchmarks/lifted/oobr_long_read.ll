; ModuleID = './bin/oobr_long_read'
source_filename = "./bin/oobr_long_read"

@rodata_15 = private unnamed_addr constant [116 x i8] c"\01\00\02\00PUBLIC\00VALUABLE DATA\00String 1: %s\0A\00String 2: %s\0A\0A\00%x\0A\00Test Failed: Pointer casting leads to Out of Bounds Read\0A\00", align 4, !ROData_SecInfo !0

define dso_local void @choice(i64 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 16, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %0 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %stktop_8, align 1
  ret void
}

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.56 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 47
  %RBP_N.25 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 55
  %RBP_N.17 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 59
  %RBP_N.13 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 61
  %RBP_N.11 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 65
  %RBP_N.7 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 67
  %RBP_N.5 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %10 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i32, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i32 %memload, ptr %RBP_N.11, align 1
  %memload1 = load i16, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 8), align 1, !ROData_Content !2
  store i16 %memload1, ptr %RBP_N.7, align 1
  %memload2 = load i8, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  store i8 %memload2, ptr %RBP_N.5, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 11), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.25, align 1
  %memload4 = load i32, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 19), align 1, !ROData_Content !5
  store i32 %memload4, ptr %RBP_N.17, align 1
  %memload5 = load i16, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 23), align 1, !ROData_Content !6
  store i16 %memload5, ptr %RBP_N.13, align 1
  %RAX = ptrtoint ptr %RBP_N.11 to i64
  store i64 %RAX, ptr %RBP_N.40, align 1
  %RAX6 = ptrtoint ptr %RBP_N.25 to i64
  store i64 %RAX6, ptr %RBP_N.48, align 1
  %memload7 = load i64, ptr %RBP_N.40, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 25), i64 %memload7)
  %memload8 = load i64, ptr %RBP_N.48, align 1
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 39), i64 %memload8)
  %memload10 = load i64, ptr %RBP_N.40, align 1
  %RAX11 = add i64 %memload10, 5
  %11 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload10, i64 5)
  %CF = extractvalue { i64, i1 } %11, 1
  %12 = and i64 %RAX11, 255
  %13 = call i64 @llvm.ctpop.i64(i64 %12)
  %14 = and i64 %13, 1
  %PF = icmp eq i64 %14, 0
  %ZF = icmp eq i64 %RAX11, 0
  %highbit = and i64 -9223372036854775808, %RAX11
  %SF = icmp ne i64 %highbit, 0
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload10, i64 5)
  %OF = extractvalue { i64, i1 } %15, 1
  store i64 %RAX11, ptr %RBP_N.56, align 1
  %memload12 = load i64, ptr %RBP_N.56, align 1
  %16 = inttoptr i64 %memload12 to ptr
  %memload13 = load i32, ptr %16, align 1
  %EAX14 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 54), i32 %memload13)
  %memload15 = load i64, ptr %RBP_N.56, align 1
  %17 = inttoptr i64 %memload15 to ptr
  %18 = load i32, ptr %17, align 1
  %19 = zext i32 %18 to i64
  %20 = zext i32 1096155203 to i64
  %21 = sub i64 %19, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %19, i64 %20)
  %CF16 = extractvalue { i64, i1 } %22, 1
  %ZF17 = icmp eq i64 %21, 0
  %highbit18 = and i64 -9223372036854775808, %21
  %SF19 = icmp ne i64 %highbit18, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %19, i64 %20)
  %OF20 = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF21 = icmp eq i64 %26, 0
  %CmpZF_JNE = icmp eq i1 %ZF17, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 58))
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

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 8)}
!3 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 11)}
!5 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 19)}
!6 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 23)}
