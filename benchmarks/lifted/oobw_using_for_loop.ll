; ModuleID = './bin/oobw_using_for_loop'
source_filename = "./bin/oobw_using_for_loop"

@rodata_15 = private unnamed_addr constant [170 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00This is the second string\00random\00String 1 length is: %d\0A\00String 2 length is: %d\0A\00String 1 is: %s\0A\00Test Failed: Out of Bounds Write using simple for loop\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.52 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 28
  %RBP_N.44 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 33
  %RBP_N.39 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 37
  %RBP_N.35 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 39
  %RBP_N.33 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 40
  %RBP_N.32 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 48
  %RBP_N.24 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 56
  %RBP_N.16 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 64
  %RBP_N.8 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %11 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.32, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.24, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i64 %memload2, ptr %RBP_N.16, align 1
  %memload3 = load i16, ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 40), align 1, !ROData_Content !4
  store i16 %memload3, ptr %RBP_N.8, align 1
  %memload4 = load i32, ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 42), align 1, !ROData_Content !5
  store i32 %memload4, ptr %RBP_N.39, align 1
  %memload5 = load i16, ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 46), align 1, !ROData_Content !6
  store i16 %memload5, ptr %RBP_N.35, align 1
  %memload6 = load i8, ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 48), align 1, !ROData_Content !7
  store i8 %memload6, ptr %RBP_N.33, align 1
  store i32 26, ptr %RBP_N.44, align 1
  store i32 7, ptr %RBP_N.48, align 1
  %memload7 = load i32, ptr %RBP_N.44, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 49), i32 %memload7)
  %memload8 = load i32, ptr %RBP_N.48, align 1
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 73), i32 %memload8)
  store i32 0, ptr %RBP_N.52, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload10 = load i32, ptr %RBP_N.52, align 1
  %12 = load i32, ptr %RBP_N.44, align 1
  %13 = sub i32 %memload10, %12
  %14 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %12)
  %CF = extractvalue { i32, i1 } %14, 1
  %ZF = icmp eq i32 %13, 0
  %highbit = and i32 -2147483648, %13
  %SF = icmp ne i32 %highbit, 0
  %15 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %12)
  %OF = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %13, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF = icmp eq i32 %18, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload11 = load i64, ptr %RBP_N.52, align 1
  %19 = trunc i64 %memload11 to i32
  %RAX = sext i32 %19 to i64
  %20 = getelementptr i8, ptr %RBP_N.39, i64 %RAX
  store i8 120, ptr %20, align 1
  %memload12 = load i32, ptr %RBP_N.52, align 1
  %EAX19 = add i32 %memload12, 1
  %21 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload12, i32 1)
  %CF13 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %EAX19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF14 = icmp eq i32 %24, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %25 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload12, i32 1)
  %OF18 = extractvalue { i32, i1 } %25, 1
  store i32 %EAX19, ptr %RBP_N.52, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint ptr %RBP_N.32 to i64
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 97), i64 %RSI)
  %memload21 = load i32, ptr %RBP_N.32, align 1
  %26 = trunc i32 %memload21 to i8
  %EAX22 = sext i8 %26 to i32
  %27 = sub i32 %EAX22, 120
  %28 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX22, i32 120)
  %CF23 = extractvalue { i32, i1 } %28, 1
  %ZF24 = icmp eq i32 %27, 0
  %highbit25 = and i32 -2147483648, %27
  %SF26 = icmp ne i32 %highbit25, 0
  %29 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX22, i32 120)
  %OF27 = extractvalue { i32, i1 } %29, 1
  %30 = and i32 %27, 255
  %31 = call i32 @llvm.ctpop.i32(i32 %30)
  %32 = and i32 %31, 1
  %PF28 = icmp eq i32 %32, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 114))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  ret i32 0
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
!1 = !{ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 32)}
!4 = !{ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 40)}
!5 = !{ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 42)}
!6 = !{ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 46)}
!7 = !{ptr getelementptr inbounds ([170 x i8], ptr @rodata_15, i32 0, i32 48)}
