; ModuleID = './bin/oobw_char_to_int_conversion_basic'
source_filename = "./bin/oobw_char_to_int_conversion_basic"

@rodata_15 = private unnamed_addr constant [163 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00public string\00\00\00This is the secret in memory\00\00%s\0A\00Test Failed: Out of Bounds Write to adjacent array using char to int pointer conversion - Basic\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 104, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.88 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.80 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 36
  %RBP_N.68 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.64 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 48
  %RBP_N.56 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 56
  %RBP_N.48 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 64
  %RBP_N.40 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 68
  %RBP_N.36 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 85
  %RBP_N.19 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 93
  %RBP_N.11 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 97
  %RBP_N.7 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 99
  %RBP_N.5 = inttoptr i64 %11 to ptr
  %12 = add i64 %tos, 100
  %RBP_N.4 = inttoptr i64 %12 to ptr
  %13 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %13 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.19, align 1
  %memload1 = load i32, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i32 %memload1, ptr %RBP_N.11, align 1
  %memload2 = load i16, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 28), align 1, !ROData_Content !3
  store i16 %memload2, ptr %RBP_N.7, align 1
  %memload3 = load i8, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 30), align 1, !ROData_Content !4
  store i8 %memload3, ptr %RBP_N.5, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !5
  store i64 %memload4, ptr %RBP_N.64, align 1
  %memload5 = load i64, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 40), align 1, !ROData_Content !6
  store i64 %memload5, ptr %RBP_N.56, align 1
  %memload6 = load i64, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 48), align 1, !ROData_Content !7
  store i64 %memload6, ptr %RBP_N.48, align 1
  %memload7 = load i32, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 56), align 1, !ROData_Content !8
  store i32 %memload7, ptr %RBP_N.40, align 1
  %memload8 = load i16, ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 60), align 1, !ROData_Content !9
  store i16 %memload8, ptr %RBP_N.36, align 1
  store i32 15, ptr %RBP_N.68, align 1
  %RAX = ptrtoint ptr %RBP_N.19 to i64
  store i64 %RAX, ptr %RBP_N.80, align 1
  %memload9 = load i64, ptr %RBP_N.80, align 1
  store i64 %memload9, ptr %RBP_N.88, align 1
  %14 = ptrtoint ptr %stktop_8 to i64
  %15 = add i64 %14, 4
  %16 = inttoptr i64 %15 to ptr
  store i32 0, ptr %16, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %17 = ptrtoint ptr %stktop_8 to i64
  %18 = add i64 %17, 4
  %19 = inttoptr i64 %18 to ptr
  %memload10 = load i32, ptr %19, align 1
  %memload11 = load i32, ptr %RBP_N.68, align 1
  %ECX = sub i32 %memload11, 2
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload11, i32 2)
  %CF = extractvalue { i32, i1 } %20, 1
  %21 = and i32 %ECX, 255
  %22 = call i32 @llvm.ctpop.i32(i32 %21)
  %23 = and i32 %22, 1
  %PF = icmp eq i32 %23, 0
  %ZF = icmp eq i32 %ECX, 0
  %highbit = and i32 -2147483648, %ECX
  %SF = icmp ne i32 %highbit, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload11, i32 2)
  %OF = extractvalue { i32, i1 } %24, 1
  %25 = sub i32 %memload10, %ECX
  %26 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %CF12 = extractvalue { i32, i1 } %26, 1
  %ZF13 = icmp eq i32 %25, 0
  %highbit14 = and i32 -2147483648, %25
  %SF15 = icmp ne i32 %highbit14, 0
  %27 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %OF16 = extractvalue { i32, i1 } %27, 1
  %28 = and i32 %25, 255
  %29 = call i32 @llvm.ctpop.i32(i32 %28)
  %30 = and i32 %29, 1
  %PF17 = icmp eq i32 %30, 0
  %CmpSFOF_JGE = icmp eq i1 %SF15, %OF16
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload18 = load i64, ptr %RBP_N.88, align 1
  %31 = ptrtoint ptr %stktop_8 to i64
  %32 = add i64 %31, 4
  %33 = inttoptr i64 %32 to ptr
  %memload19 = load i64, ptr %33, align 1
  %34 = trunc i64 %memload19 to i32
  %RCX = sext i32 %34 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload18, %memref-idxreg
  %35 = inttoptr i64 %memref-basereg to ptr
  store i8 65, ptr %35, align 1
  %36 = ptrtoint ptr %stktop_8 to i64
  %37 = add i64 %36, 4
  %38 = inttoptr i64 %37 to ptr
  %memload20 = load i32, ptr %38, align 1
  %EAX = add i32 %memload20, 1
  %39 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload20, i32 1)
  %CF21 = extractvalue { i32, i1 } %39, 1
  %40 = and i32 %EAX, 255
  %41 = call i32 @llvm.ctpop.i32(i32 %40)
  %42 = and i32 %41, 1
  %PF22 = icmp eq i32 %42, 0
  %ZF23 = icmp eq i32 %EAX, 0
  %highbit24 = and i32 -2147483648, %EAX
  %SF25 = icmp ne i32 %highbit24, 0
  %43 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload20, i32 1)
  %OF26 = extractvalue { i32, i1 } %43, 1
  %44 = ptrtoint ptr %stktop_8 to i64
  %45 = add i64 %44, 4
  %46 = inttoptr i64 %45 to ptr
  store i32 %EAX, ptr %46, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint ptr %RBP_N.19 to i64
  %EAX27 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 62), i64 %RSI)
  %RSI28 = ptrtoint ptr %RBP_N.64 to i64
  %EAX29 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 62), i64 %RSI28)
  store i32 0, ptr %stktop_8, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.8
  %47 = load i32, ptr %stktop_8, align 1
  %48 = zext i32 %47 to i64
  %49 = zext i32 28 to i64
  %50 = sub i64 %48, %49
  %51 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %48, i64 %49)
  %CF30 = extractvalue { i64, i1 } %51, 1
  %ZF31 = icmp eq i64 %50, 0
  %highbit32 = and i64 -9223372036854775808, %50
  %SF33 = icmp ne i64 %highbit32, 0
  %52 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %48, i64 %49)
  %OF34 = extractvalue { i64, i1 } %52, 1
  %53 = and i64 %50, 255
  %54 = call i64 @llvm.ctpop.i64(i64 %53)
  %55 = and i64 %54, 1
  %PF35 = icmp eq i64 %55, 0
  %CmpSFOF_JGE56 = icmp eq i1 %SF33, %OF34
  br i1 %CmpSFOF_JGE56, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload36 = load i64, ptr %stktop_8, align 1
  %56 = trunc i64 %memload36 to i32
  %RAX37 = sext i32 %56 to i64
  %57 = getelementptr i8, ptr %RBP_N.64, i64 %RAX37
  %memload38 = load i32, ptr %57, align 1
  %58 = trunc i32 %memload38 to i8
  %EAX39 = sext i8 %58 to i32
  %59 = sub i32 %EAX39, 65
  %60 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX39, i32 65)
  %CF40 = extractvalue { i32, i1 } %60, 1
  %ZF41 = icmp eq i32 %59, 0
  %highbit42 = and i32 -2147483648, %59
  %SF43 = icmp ne i32 %highbit42, 0
  %61 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX39, i32 65)
  %OF44 = extractvalue { i32, i1 } %61, 1
  %62 = and i32 %59, 255
  %63 = call i32 @llvm.ctpop.i32(i32 %62)
  %64 = and i32 %63, 1
  %PF45 = icmp eq i32 %64, 0
  %CmpZF_JNE = icmp eq i1 %ZF41, false
  br i1 %CmpZF_JNE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX46 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 66))
  br label %bb.9

bb.7:                                             ; preds = %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload47 = load i32, ptr %stktop_8, align 1
  %EAX54 = add i32 %memload47, 1
  %65 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload47, i32 1)
  %CF48 = extractvalue { i32, i1 } %65, 1
  %66 = and i32 %EAX54, 255
  %67 = call i32 @llvm.ctpop.i32(i32 %66)
  %68 = and i32 %67, 1
  %PF49 = icmp eq i32 %68, 0
  %ZF50 = icmp eq i32 %EAX54, 0
  %highbit51 = and i32 -2147483648, %EAX54
  %SF52 = icmp ne i32 %highbit51, 0
  %69 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload47, i32 1)
  %OF53 = extractvalue { i32, i1 } %69, 1
  store i32 %EAX54, ptr %stktop_8, align 1
  br label %bb.4

bb.9:                                             ; preds = %bb.6, %bb.4
  %memload55 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload55
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

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
!1 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 28)}
!4 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 30)}
!5 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 32)}
!6 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 40)}
!7 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 48)}
!8 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 56)}
!9 = !{ptr getelementptr inbounds ([163 x i8], ptr @rodata_15, i32 0, i32 60)}
