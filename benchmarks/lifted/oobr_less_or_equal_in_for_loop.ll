; ModuleID = './bin/oobr_less_or_equal_in_for_loop'
source_filename = "./bin/oobr_less_or_equal_in_for_loop"

@rodata_15 = private unnamed_addr constant [151 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00Index %d: %d\0A\00Test Failed: Incorrect condition in loop causing Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.72 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.68 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.64 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.56 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 40
  %RBP_N.48 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 56
  %RBP_N.32 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 64
  %RBP_N.24 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 72
  %RBP_N.16 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 84
  %RBP_N.4 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %9 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.32, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.24, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i32 %memload2, ptr %RBP_N.16, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 48), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.64, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 56), align 1, !ROData_Content !5
  store i64 %memload4, ptr %RBP_N.56, align 1
  %memload5 = load i32, ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 64), align 1, !ROData_Content !6
  store i32 %memload5, ptr %RBP_N.48, align 1
  store i32 5, ptr %RBP_N.68, align 1
  store i32 0, ptr %RBP_N.72, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.6
  %memload6 = load i32, ptr %RBP_N.72, align 1
  %10 = load i32, ptr %RBP_N.68, align 1
  %11 = sub i32 %memload6, %10
  %12 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload6, i32 %10)
  %CF = extractvalue { i32, i1 } %12, 1
  %ZF = icmp eq i32 %11, 0
  %highbit = and i32 -2147483648, %11
  %SF = icmp ne i32 %highbit, 0
  %13 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload6, i32 %10)
  %OF = extractvalue { i32, i1 } %13, 1
  %14 = and i32 %11, 255
  %15 = call i32 @llvm.ctpop.i32(i32 %14)
  %16 = and i32 %15, 1
  %PF = icmp eq i32 %16, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload7 = load i32, ptr %RBP_N.72, align 1
  %memload8 = load i64, ptr %RBP_N.72, align 1
  %17 = trunc i64 %memload8 to i32
  %RAX = sext i32 %17 to i64
  %sc-m = mul i64 4, %RAX
  %18 = getelementptr i8, ptr %RBP_N.64, i64 %sc-m
  %memload9 = load i32, ptr %18, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 68), i32 %memload7, i32 %memload9)
  %memload10 = load i32, ptr %RBP_N.72, align 1
  %19 = load i32, ptr %RBP_N.68, align 1
  %20 = sub i32 %memload10, %19
  %21 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %19)
  %CF11 = extractvalue { i32, i1 } %21, 1
  %ZF12 = icmp eq i32 %20, 0
  %highbit13 = and i32 -2147483648, %20
  %SF14 = icmp ne i32 %highbit13, 0
  %22 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %19)
  %OF15 = extractvalue { i32, i1 } %22, 1
  %23 = and i32 %20, 255
  %24 = call i32 @llvm.ctpop.i32(i32 %23)
  %25 = and i32 %24, 1
  %PF16 = icmp eq i32 %25, 0
  %CmpZF_JNE = icmp eq i1 %ZF12, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.3

bb.3:                                             ; preds = %bb.2
  %memload17 = load i64, ptr %RBP_N.72, align 1
  %26 = trunc i64 %memload17 to i32
  %RAX18 = sext i32 %26 to i64
  %sc-m19 = mul i64 4, %RAX18
  %27 = getelementptr i8, ptr %RBP_N.64, i64 %sc-m19
  %28 = load i32, ptr %27, align 1
  %29 = zext i32 %28 to i64
  %30 = zext i32 0 to i64
  %31 = sub i64 %29, %30
  %32 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %29, i64 %30)
  %CF21 = extractvalue { i64, i1 } %32, 1
  %ZF22 = icmp eq i64 %31, 0
  %highbit23 = and i64 -9223372036854775808, %31
  %SF24 = icmp ne i64 %highbit23, 0
  %33 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %29, i64 %30)
  %OF25 = extractvalue { i64, i1 } %33, 1
  %34 = and i64 %31, 255
  %35 = call i64 @llvm.ctpop.i64(i64 %34)
  %36 = and i64 %35, 1
  %PF26 = icmp eq i64 %36, 0
  %CmpZF_JE = icmp eq i1 %ZF22, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX27 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 82))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3, %bb.2
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload28 = load i32, ptr %RBP_N.72, align 1
  %EAX35 = add i32 %memload28, 1
  %37 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload28, i32 1)
  %CF29 = extractvalue { i32, i1 } %37, 1
  %38 = and i32 %EAX35, 255
  %39 = call i32 @llvm.ctpop.i32(i32 %38)
  %40 = and i32 %39, 1
  %PF30 = icmp eq i32 %40, 0
  %ZF31 = icmp eq i32 %EAX35, 0
  %highbit32 = and i32 -2147483648, %EAX35
  %SF33 = icmp ne i32 %highbit32, 0
  %41 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload28, i32 1)
  %OF34 = extractvalue { i32, i1 } %41, 1
  store i32 %EAX35, ptr %RBP_N.72, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 32)}
!4 = !{ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 48)}
!5 = !{ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 56)}
!6 = !{ptr getelementptr inbounds ([151 x i8], ptr @rodata_15, i32 0, i32 64)}
