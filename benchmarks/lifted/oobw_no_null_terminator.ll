; ModuleID = './bin/oobw_no_null_terminator'
source_filename = "./bin/oobw_no_null_terminator"

@rodata_15 = private unnamed_addr constant [120 x i8] c"\01\00\02\00PUBLICVALUABLEDATA\00Str1: %s\0A\00Str2: %s\0A\00Test Failed: Missing null terminator in string leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

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
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 21
  %RBP_N.19 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 25
  %RBP_N.15 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 26
  %RBP_N.14 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 30
  %RBP_N.10 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i32 0, ptr %RBP_N.8, align 1
  %memload = load i32, ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i32 %memload, ptr %RBP_N.14, align 1
  %memload1 = load i16, ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 8), align 1, !ROData_Content !2
  store i16 %memload1, ptr %RBP_N.10, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  %7 = ptrtoint ptr %stktop_8 to i64
  %8 = add i64 %7, 5
  %9 = inttoptr i64 %8 to ptr
  store i64 %memload2, ptr %9, align 1
  %memload3 = load i32, ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 18), align 1, !ROData_Content !4
  store i32 %memload3, ptr %RBP_N.19, align 1
  %memload4 = load i8, ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 22), align 1, !ROData_Content !5
  store i8 %memload4, ptr %RBP_N.15, align 1
  store i32 0, ptr %stktop_8, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload5 = load i64, ptr %stktop_8, align 1
  %10 = trunc i64 %memload5 to i32
  %RAX = sext i32 %10 to i64
  %11 = getelementptr i8, ptr %RBP_N.14, i64 %RAX
  %memload6 = load i32, ptr %11, align 1
  %12 = trunc i32 %memload6 to i8
  %EAX = sext i8 %12 to i32
  %13 = sub i32 %EAX, 0
  %14 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX, i32 0)
  %CF = extractvalue { i32, i1 } %14, 1
  %ZF = icmp eq i32 %13, 0
  %highbit = and i32 -2147483648, %13
  %SF = icmp ne i32 %highbit, 0
  %15 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX, i32 0)
  %OF = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %13, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF = icmp eq i32 %18, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload7 = load i64, ptr %stktop_8, align 1
  %19 = trunc i64 %memload7 to i32
  %RAX8 = sext i32 %19 to i64
  %20 = getelementptr i8, ptr %RBP_N.14, i64 %RAX8
  store i8 88, ptr %20, align 1
  %memload10 = load i32, ptr %stktop_8, align 1
  %EAX17 = add i32 %memload10, 1
  %21 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload10, i32 1)
  %CF11 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %EAX17, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF12 = icmp eq i32 %24, 0
  %ZF13 = icmp eq i32 %EAX17, 0
  %highbit14 = and i32 -2147483648, %EAX17
  %SF15 = icmp ne i32 %highbit14, 0
  %25 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload10, i32 1)
  %OF16 = extractvalue { i32, i1 } %25, 1
  store i32 %EAX17, ptr %stktop_8, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint ptr %RBP_N.14 to i64
  %EAX18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 23), i64 %RSI)
  %26 = ptrtoint ptr %stktop_8 to i64
  %RSI19 = add i64 %26, 5
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 33), i64 %RSI19)
  %27 = ptrtoint ptr %stktop_8 to i64
  %28 = add i64 %27, 5
  %29 = inttoptr i64 %28 to ptr
  %memload21 = load i32, ptr %29, align 1
  %30 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %30 to i32
  %31 = sub i32 %EAX22, 88
  %32 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 88)
  %CF23 = extractvalue { i32, i1 } %32, 1
  %ZF24 = icmp eq i32 %31, 0
  %highbit25 = and i32 -2147483648, %31
  %SF26 = icmp ne i32 %highbit25, 0
  %33 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 88)
  %OF27 = extractvalue { i32, i1 } %33, 1
  %34 = and i32 %31, 255
  %35 = call i32 @llvm.ctpop.i32(i32 %34)
  %36 = and i32 %35, 1
  %PF28 = icmp eq i32 %36, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 43))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload30 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload30
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 8)}
!3 = !{ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 18)}
!5 = !{ptr getelementptr inbounds ([120 x i8], ptr @rodata_15, i32 0, i32 22)}
