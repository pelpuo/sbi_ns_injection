; ModuleID = './bin/oobw_direct_index_integer_long_write'
source_filename = "./bin/oobw_direct_index_integer_long_write"

@rodata_15 = private unnamed_addr constant [152 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\06\00\00\00\08\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\05\00\00\00\07\00\00\00\09\00\00\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Int array on heap using long pointer Out of Bounds Write\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.72 = inttoptr i64 %0 to ptr
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
  %RSP_P.0 = inttoptr i64 %8 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.32, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.24, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i32 %memload2, ptr %RBP_N.16, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 48), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.64, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 56), align 1, !ROData_Content !5
  store i64 %memload4, ptr %RBP_N.56, align 1
  %memload5 = load i32, ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 64), align 1, !ROData_Content !6
  store i32 %memload5, ptr %RBP_N.48, align 1
  %RSI = ptrtoint ptr %RBP_N.32 to i64
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 68), i64 %RSI)
  %RSI6 = ptrtoint ptr %RBP_N.64 to i64
  %EAX7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 72), i64 %RSI6)
  %RAX = ptrtoint ptr %RBP_N.32 to i64
  %RAX8 = add i64 %RAX, 32
  %9 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RAX, i64 32)
  %CF = extractvalue { i64, i1 } %9, 1
  %10 = and i64 %RAX8, 255
  %11 = call i64 @llvm.ctpop.i64(i64 %10)
  %12 = and i64 %11, 1
  %PF = icmp eq i64 %12, 0
  %ZF = icmp eq i64 %RAX8, 0
  %highbit = and i64 -9223372036854775808, %RAX8
  %SF = icmp ne i64 %highbit, 0
  %13 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RAX, i64 32)
  %OF = extractvalue { i64, i1 } %13, 1
  store i64 %RAX8, ptr %RBP_N.72, align 1
  %memload9 = load i64, ptr %RBP_N.72, align 1
  %14 = inttoptr i64 %memload9 to ptr
  store i64 4919420920202273057, ptr %14, align 1
  %15 = ptrtoint ptr %stktop_8 to i64
  %16 = add i64 %15, 4
  %17 = inttoptr i64 %16 to ptr
  store i32 0, ptr %17, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %18 = ptrtoint ptr %stktop_8 to i64
  %19 = add i64 %18, 4
  %20 = inttoptr i64 %19 to ptr
  %21 = load i32, ptr %20, align 1
  %22 = zext i32 %21 to i64
  %23 = zext i32 5 to i64
  %24 = sub i64 %22, %23
  %25 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %22, i64 %23)
  %CF10 = extractvalue { i64, i1 } %25, 1
  %ZF11 = icmp eq i64 %24, 0
  %highbit12 = and i64 -9223372036854775808, %24
  %SF13 = icmp ne i64 %highbit12, 0
  %26 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %22, i64 %23)
  %OF14 = extractvalue { i64, i1 } %26, 1
  %27 = and i64 %24, 255
  %28 = call i64 @llvm.ctpop.i64(i64 %27)
  %29 = and i64 %28, 1
  %PF15 = icmp eq i64 %29, 0
  %CmpSFOF_JGE = icmp eq i1 %SF13, %OF14
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %30 = ptrtoint ptr %stktop_8 to i64
  %31 = add i64 %30, 4
  %32 = inttoptr i64 %31 to ptr
  %memload16 = load i64, ptr %32, align 1
  %33 = trunc i64 %memload16 to i32
  %RAX17 = sext i32 %33 to i64
  %sc-m = mul i64 4, %RAX17
  %34 = getelementptr i8, ptr %RBP_N.64, i64 %sc-m
  %memload18 = load i32, ptr %34, align 1
  %EAX19 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 77), i32 %memload18)
  %35 = ptrtoint ptr %stktop_8 to i64
  %36 = add i64 %35, 4
  %37 = inttoptr i64 %36 to ptr
  %memload20 = load i32, ptr %37, align 1
  %EAX27 = add i32 %memload20, 1
  %38 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload20, i32 1)
  %CF21 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %EAX27, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF22 = icmp eq i32 %41, 0
  %ZF23 = icmp eq i32 %EAX27, 0
  %highbit24 = and i32 -2147483648, %EAX27
  %SF25 = icmp ne i32 %highbit24, 0
  %42 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload20, i32 1)
  %OF26 = extractvalue { i32, i1 } %42, 1
  %43 = ptrtoint ptr %stktop_8 to i64
  %44 = add i64 %43, 4
  %45 = inttoptr i64 %44 to ptr
  store i32 %EAX27, ptr %45, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX28 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 75))
  store i32 0, ptr %stktop_8, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.8
  %46 = load i32, ptr %stktop_8, align 1
  %47 = zext i32 %46 to i64
  %48 = zext i32 5 to i64
  %49 = sub i64 %47, %48
  %50 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %47, i64 %48)
  %CF29 = extractvalue { i64, i1 } %50, 1
  %ZF30 = icmp eq i64 %49, 0
  %highbit31 = and i64 -9223372036854775808, %49
  %SF32 = icmp ne i64 %highbit31, 0
  %51 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %47, i64 %48)
  %OF33 = extractvalue { i64, i1 } %51, 1
  %52 = and i64 %49, 255
  %53 = call i64 @llvm.ctpop.i64(i64 %52)
  %54 = and i64 %53, 1
  %PF34 = icmp eq i64 %54, 0
  %CmpSFOF_JGE54 = icmp eq i1 %SF32, %OF33
  br i1 %CmpSFOF_JGE54, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload35 = load i64, ptr %stktop_8, align 1
  %55 = trunc i64 %memload35 to i32
  %RAX36 = sext i32 %55 to i64
  %sc-m37 = mul i64 4, %RAX36
  %56 = getelementptr i8, ptr %RBP_N.64, i64 %sc-m37
  %57 = load i32, ptr %56, align 1
  %58 = zext i32 %57 to i64
  %59 = zext i32 9 to i64
  %60 = sub i64 %58, %59
  %61 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %58, i64 %59)
  %CF39 = extractvalue { i64, i1 } %61, 1
  %ZF40 = icmp eq i64 %60, 0
  %highbit41 = and i64 -9223372036854775808, %60
  %SF42 = icmp ne i64 %highbit41, 0
  %62 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %58, i64 %59)
  %OF43 = extractvalue { i64, i1 } %62, 1
  %63 = and i64 %60, 255
  %64 = call i64 @llvm.ctpop.i64(i64 %63)
  %65 = and i64 %64, 1
  %PF44 = icmp eq i64 %65, 0
  %CmpZF_JLE = icmp eq i1 %ZF40, true
  %CmpOF_JLE = icmp ne i1 %SF42, %OF43
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX45 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 81))
  br label %bb.9

bb.7:                                             ; preds = %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload46 = load i32, ptr %stktop_8, align 1
  %EAX53 = add i32 %memload46, 1
  %66 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload46, i32 1)
  %CF47 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %EAX53, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF48 = icmp eq i32 %69, 0
  %ZF49 = icmp eq i32 %EAX53, 0
  %highbit50 = and i32 -2147483648, %EAX53
  %SF51 = icmp ne i32 %highbit50, 0
  %70 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload46, i32 1)
  %OF52 = extractvalue { i32, i1 } %70, 1
  store i32 %EAX53, ptr %stktop_8, align 1
  br label %bb.4

bb.9:                                             ; preds = %bb.6, %bb.4
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 32)}
!4 = !{ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 48)}
!5 = !{ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 56)}
!6 = !{ptr getelementptr inbounds ([152 x i8], ptr @rodata_15, i32 0, i32 64)}
