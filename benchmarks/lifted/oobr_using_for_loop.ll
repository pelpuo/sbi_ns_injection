; ModuleID = './bin/oobr_using_for_loop'
source_filename = "./bin/oobr_using_for_loop"

@rodata_15 = private unnamed_addr constant [154 x i8] c"\01\00\02\00random\00String 1 length is: %d\0A\00String 2 length is: %d\0A\00%c\00Test Failed: Out of Bounds Read using simple for loop\0A\00\00\00\00\00\00\00\00\00\00\00\00This is the second string\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.56 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.52 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 40
  %RBP_N.32 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 48
  %RBP_N.24 = inttoptr i64 %5 to ptr
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
  %memload = load i32, ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i32 %memload, ptr %RBP_N.11, align 1
  %memload1 = load i16, ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 8), align 1, !ROData_Content !2
  store i16 %memload1, ptr %RBP_N.7, align 1
  %memload2 = load i8, ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  store i8 %memload2, ptr %RBP_N.5, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 128), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.48, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 136), align 1, !ROData_Content !5
  store i64 %memload4, ptr %RBP_N.40, align 1
  %memload5 = load i64, ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 144), align 1, !ROData_Content !6
  store i64 %memload5, ptr %RBP_N.32, align 1
  %memload6 = load i16, ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 152), align 1, !ROData_Content !7
  store i16 %memload6, ptr %RBP_N.24, align 1
  store i32 7, ptr %RBP_N.52, align 1
  store i32 26, ptr %RBP_N.56, align 1
  %memload7 = load i32, ptr %RBP_N.52, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 11), i32 %memload7)
  %memload8 = load i32, ptr %RBP_N.56, align 1
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 35), i32 %memload8)
  %11 = ptrtoint ptr %stktop_8 to i64
  %12 = add i64 %11, 4
  %13 = inttoptr i64 %12 to ptr
  store i32 0, ptr %13, align 1
  store i32 0, ptr %stktop_8, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.6
  %memload10 = load i32, ptr %stktop_8, align 1
  %14 = load i32, ptr %RBP_N.56, align 1
  %15 = sub i32 %memload10, %14
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %14)
  %CF = extractvalue { i32, i1 } %16, 1
  %ZF = icmp eq i32 %15, 0
  %highbit = and i32 -2147483648, %15
  %SF = icmp ne i32 %highbit, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %14)
  %OF = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF = icmp eq i32 %20, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload11 = load i64, ptr %stktop_8, align 1
  %21 = trunc i64 %memload11 to i32
  %RAX = sext i32 %21 to i64
  %22 = getelementptr i8, ptr %RBP_N.11, i64 %RAX
  %memload12 = load i32, ptr %22, align 1
  %23 = trunc i32 %memload12 to i8
  %ESI = sext i8 %23 to i32
  %EAX13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 59), i32 %ESI)
  %memload14 = load i32, ptr %stktop_8, align 1
  %24 = load i32, ptr %RBP_N.52, align 1
  %25 = sub i32 %memload14, %24
  %26 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload14, i32 %24)
  %CF15 = extractvalue { i32, i1 } %26, 1
  %ZF16 = icmp eq i32 %25, 0
  %highbit17 = and i32 -2147483648, %25
  %SF18 = icmp ne i32 %highbit17, 0
  %27 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload14, i32 %24)
  %OF19 = extractvalue { i32, i1 } %27, 1
  %28 = and i32 %25, 255
  %29 = call i32 @llvm.ctpop.i32(i32 %28)
  %30 = and i32 %29, 1
  %PF20 = icmp eq i32 %30, 0
  %SFAndOF_JL = icmp ne i1 %SF18, %OF19
  br i1 %SFAndOF_JL, label %bb.5, label %bb.3

bb.3:                                             ; preds = %bb.2
  %memload21 = load i64, ptr %stktop_8, align 1
  %31 = trunc i64 %memload21 to i32
  %RAX22 = sext i32 %31 to i64
  %32 = getelementptr i8, ptr %RBP_N.11, i64 %RAX22
  %memload24 = load i32, ptr %32, align 1
  %33 = trunc i32 %memload24 to i8
  %EAX25 = sext i8 %33 to i32
  %34 = sub i32 %EAX25, 0
  %35 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX25, i32 0)
  %CF26 = extractvalue { i32, i1 } %35, 1
  %ZF27 = icmp eq i32 %34, 0
  %highbit28 = and i32 -2147483648, %34
  %SF29 = icmp ne i32 %highbit28, 0
  %36 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX25, i32 0)
  %OF30 = extractvalue { i32, i1 } %36, 1
  %37 = and i32 %34, 255
  %38 = call i32 @llvm.ctpop.i32(i32 %37)
  %39 = and i32 %38, 1
  %PF31 = icmp eq i32 %39, 0
  %CmpZF_JE = icmp eq i1 %ZF27, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %40 = ptrtoint ptr %stktop_8 to i64
  %41 = add i64 %40, 4
  %42 = inttoptr i64 %41 to ptr
  store i32 1, ptr %42, align 1
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3, %bb.2
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload32 = load i32, ptr %stktop_8, align 1
  %EAX39 = add i32 %memload32, 1
  %43 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload32, i32 1)
  %CF33 = extractvalue { i32, i1 } %43, 1
  %44 = and i32 %EAX39, 255
  %45 = call i32 @llvm.ctpop.i32(i32 %44)
  %46 = and i32 %45, 1
  %PF34 = icmp eq i32 %46, 0
  %ZF35 = icmp eq i32 %EAX39, 0
  %highbit36 = and i32 -2147483648, %EAX39
  %SF37 = icmp ne i32 %highbit36, 0
  %47 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload32, i32 1)
  %OF38 = extractvalue { i32, i1 } %47, 1
  store i32 %EAX39, ptr %stktop_8, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  %EAX40 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 33))
  %48 = ptrtoint ptr %stktop_8 to i64
  %49 = add i64 %48, 4
  %50 = inttoptr i64 %49 to ptr
  %51 = load i32, ptr %50, align 1
  %52 = zext i32 %51 to i64
  %53 = zext i32 1 to i64
  %54 = sub i64 %52, %53
  %55 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %52, i64 %53)
  %CF41 = extractvalue { i64, i1 } %55, 1
  %ZF42 = icmp eq i64 %54, 0
  %highbit43 = and i64 -9223372036854775808, %54
  %SF44 = icmp ne i64 %highbit43, 0
  %56 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %52, i64 %53)
  %OF45 = extractvalue { i64, i1 } %56, 1
  %57 = and i64 %54, 255
  %58 = call i64 @llvm.ctpop.i64(i64 %57)
  %59 = and i64 %58, 1
  %PF46 = icmp eq i64 %59, 0
  %CmpZF_JNE = icmp eq i1 %ZF42, false
  br i1 %CmpZF_JNE, label %bb.9, label %bb.8

bb.8:                                             ; preds = %bb.7
  %EAX47 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 62))
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.7
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 8)}
!3 = !{ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 128)}
!5 = !{ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 136)}
!6 = !{ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 144)}
!7 = !{ptr getelementptr inbounds ([154 x i8], ptr @rodata_15, i32 0, i32 152)}
