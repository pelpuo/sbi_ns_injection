; ModuleID = './bin/oobw_direct_index_integer'
source_filename = "./bin/oobw_direct_index_integer"

@rodata_15 = private unnamed_addr constant [132 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Direct int array Out of Bounds Write\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.68 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.64 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.56 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.48 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 56
  %RBP_N.32 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 64
  %RBP_N.24 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 72
  %RBP_N.16 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 84
  %RBP_N.4 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 0
  %9 = inttoptr i64 %8 to ptr
  store i64 3735928559, ptr %9, align 8
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.32, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.24, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i32 %memload2, ptr %RBP_N.16, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 48), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.64, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 56), align 1, !ROData_Content !5
  store i64 %memload4, ptr %RBP_N.56, align 1
  %memload5 = load i32, ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 64), align 1, !ROData_Content !6
  store i32 %memload5, ptr %RBP_N.48, align 1
  %RSI = ptrtoint ptr %RBP_N.32 to i64
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 68), i64 %RSI)
  %RSI6 = ptrtoint ptr %RBP_N.64 to i64
  %EAX7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 72), i64 %RSI6)
  store i32 420, ptr %9, align 1
  store i32 0, ptr %RBP_N.68, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %10 = load i32, ptr %RBP_N.68, align 1
  %11 = zext i32 %10 to i64
  %12 = zext i32 5 to i64
  %13 = sub i64 %11, %12
  %14 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %11, i64 %12)
  %CF = extractvalue { i64, i1 } %14, 1
  %ZF = icmp eq i64 %13, 0
  %highbit = and i64 -9223372036854775808, %13
  %SF = icmp ne i64 %highbit, 0
  %15 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %11, i64 %12)
  %OF = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %13, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF = icmp eq i64 %18, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload8 = load i64, ptr %RBP_N.68, align 1
  %19 = trunc i64 %memload8 to i32
  %RAX = sext i32 %19 to i64
  %sc-m = mul i64 4, %RAX
  %20 = getelementptr i8, ptr %RBP_N.64, i64 %sc-m
  %memload9 = load i32, ptr %20, align 1
  %EAX10 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 77), i32 %memload9)
  %memload11 = load i32, ptr %RBP_N.68, align 1
  %EAX18 = add i32 %memload11, 1
  %21 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload11, i32 1)
  %CF12 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %EAX18, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF13 = icmp eq i32 %24, 0
  %ZF14 = icmp eq i32 %EAX18, 0
  %highbit15 = and i32 -2147483648, %EAX18
  %SF16 = icmp ne i32 %highbit15, 0
  %25 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload11, i32 1)
  %OF17 = extractvalue { i32, i1 } %25, 1
  store i32 %EAX18, ptr %RBP_N.68, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX19 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 75))
  %26 = load i32, ptr %RBP_N.64, align 1
  %27 = zext i32 %26 to i64
  %28 = zext i32 420 to i64
  %29 = sub i64 %27, %28
  %30 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %27, i64 %28)
  %CF20 = extractvalue { i64, i1 } %30, 1
  %ZF21 = icmp eq i64 %29, 0
  %highbit22 = and i64 -9223372036854775808, %29
  %SF23 = icmp ne i64 %highbit22, 0
  %31 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %27, i64 %28)
  %OF24 = extractvalue { i64, i1 } %31, 1
  %32 = and i64 %29, 255
  %33 = call i64 @llvm.ctpop.i64(i64 %32)
  %34 = and i64 %33, 1
  %PF25 = icmp eq i64 %34, 0
  %CmpZF_JNE = icmp eq i1 %ZF21, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX26 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 81))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 32)}
!4 = !{ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 48)}
!5 = !{ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 56)}
!6 = !{ptr getelementptr inbounds ([132 x i8], ptr @rodata_15, i32 0, i32 64)}
