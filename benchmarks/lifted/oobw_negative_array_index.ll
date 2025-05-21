; ModuleID = './bin/oobw_negative_array_index'
source_filename = "./bin/oobw_negative_array_index"

@rodata_15 = private unnamed_addr constant [108 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Negative array index leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.20 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 21
  %RBP_N.19 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 28
  %RBP_N.12 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 30
  %RBP_N.10 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 34
  %RBP_N.6 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %8 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i32, ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i32 %memload, ptr %RBP_N.10, align 1
  %memload1 = load i16, ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 8), align 1, !ROData_Content !2
  store i16 %memload1, ptr %RBP_N.6, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  store i32 %memload2, ptr %RBP_N.16, align 1
  %memload3 = load i16, ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 14), align 1, !ROData_Content !4
  store i16 %memload3, ptr %RBP_N.12, align 1
  store i8 88, ptr %RBP_N.19, align 1
  %RSI = ptrtoint ptr %RBP_N.10 to i64
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 16), i64 %RSI)
  %RSI4 = ptrtoint ptr %RBP_N.16 to i64
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 30), i64 %RSI4)
  store i32 0, ptr %RBP_N.20, align 1
  store i32 0, ptr %RBP_N.24, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.5
  %9 = load i32, ptr %RBP_N.24, align 1
  %10 = zext i32 %9 to i64
  %11 = zext i32 5 to i64
  %12 = sub i64 %10, %11
  %13 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %10, i64 %11)
  %CF = extractvalue { i64, i1 } %13, 1
  %ZF = icmp eq i64 %12, 0
  %highbit = and i64 -9223372036854775808, %12
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %10, i64 %11)
  %OF = extractvalue { i64, i1 } %14, 1
  %15 = and i64 %12, 255
  %16 = call i64 @llvm.ctpop.i64(i64 %15)
  %17 = and i64 %16, 1
  %PF = icmp eq i64 %17, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload6 = load i64, ptr %RBP_N.24, align 1
  %18 = trunc i64 %memload6 to i32
  %RAX = sext i32 %18 to i64
  %19 = getelementptr i8, ptr %RBP_N.10, i64 %RAX
  %memload7 = load i32, ptr %19, align 1
  %20 = trunc i32 %memload7 to i8
  %EAX8 = sext i8 %20 to i32
  %21 = sub i32 %EAX8, 88
  %22 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX8, i32 88)
  %CF9 = extractvalue { i32, i1 } %22, 1
  %ZF10 = icmp eq i32 %21, 0
  %highbit11 = and i32 -2147483648, %21
  %SF12 = icmp ne i32 %highbit11, 0
  %23 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX8, i32 88)
  %OF13 = extractvalue { i32, i1 } %23, 1
  %24 = and i32 %21, 255
  %25 = call i32 @llvm.ctpop.i32(i32 %24)
  %26 = and i32 %25, 1
  %PF14 = icmp eq i32 %26, 0
  %CmpZF_JNE = icmp eq i1 %ZF10, false
  br i1 %CmpZF_JNE, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  store i32 1, ptr %RBP_N.20, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  br label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload15 = load i32, ptr %RBP_N.24, align 1
  %EAX22 = add i32 %memload15, 1
  %27 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload15, i32 1)
  %CF16 = extractvalue { i32, i1 } %27, 1
  %28 = and i32 %EAX22, 255
  %29 = call i32 @llvm.ctpop.i32(i32 %28)
  %30 = and i32 %29, 1
  %PF17 = icmp eq i32 %30, 0
  %ZF18 = icmp eq i32 %EAX22, 0
  %highbit19 = and i32 -2147483648, %EAX22
  %SF20 = icmp ne i32 %highbit19, 0
  %31 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload15, i32 1)
  %OF21 = extractvalue { i32, i1 } %31, 1
  store i32 %EAX22, ptr %RBP_N.24, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
  %32 = load i32, ptr %RBP_N.20, align 1
  %33 = zext i32 %32 to i64
  %34 = zext i32 1 to i64
  %35 = sub i64 %33, %34
  %36 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %33, i64 %34)
  %CF23 = extractvalue { i64, i1 } %36, 1
  %ZF24 = icmp eq i64 %35, 0
  %highbit25 = and i64 -9223372036854775808, %35
  %SF26 = icmp ne i64 %highbit25, 0
  %37 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %33, i64 %34)
  %OF27 = extractvalue { i64, i1 } %37, 1
  %38 = and i64 %35, 255
  %39 = call i64 @llvm.ctpop.i64(i64 %38)
  %40 = and i64 %39, 1
  %PF28 = icmp eq i64 %40, 0
  %CmpZF_JNE30 = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE30, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  %EAX29 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 44))
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

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
!1 = !{ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 8)}
!3 = !{ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([108 x i8], ptr @rodata_15, i32 0, i32 14)}
