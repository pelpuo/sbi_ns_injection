; ModuleID = './bin/oobw_char_to_int_conversion_advanced'
source_filename = "./bin/oobw_char_to_int_conversion_advanced"

@rodata_15 = private unnamed_addr constant [166 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00public string\00\00\00This is the secret in memory\00\00%s\0A\00Test Failed: Out of Bounds Write to adjacent array using char to int pointer conversion - Advanced\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 120, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.104 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 28
  %RBP_N.92 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.88 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.80 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 52
  %RBP_N.68 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 56
  %RBP_N.64 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 64
  %RBP_N.56 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 72
  %RBP_N.48 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 80
  %RBP_N.40 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 84
  %RBP_N.36 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 101
  %RBP_N.19 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 109
  %RBP_N.11 = inttoptr i64 %11 to ptr
  %12 = add i64 %tos, 113
  %RBP_N.7 = inttoptr i64 %12 to ptr
  %13 = add i64 %tos, 115
  %RBP_N.5 = inttoptr i64 %13 to ptr
  %14 = add i64 %tos, 116
  %RBP_N.4 = inttoptr i64 %14 to ptr
  %15 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %15 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.19, align 1
  %memload1 = load i32, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i32 %memload1, ptr %RBP_N.11, align 1
  %memload2 = load i16, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 28), align 1, !ROData_Content !3
  store i16 %memload2, ptr %RBP_N.7, align 1
  %memload3 = load i8, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 30), align 1, !ROData_Content !4
  store i8 %memload3, ptr %RBP_N.5, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !5
  store i64 %memload4, ptr %RBP_N.64, align 1
  %memload5 = load i64, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 40), align 1, !ROData_Content !6
  store i64 %memload5, ptr %RBP_N.56, align 1
  %memload6 = load i64, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 48), align 1, !ROData_Content !7
  store i64 %memload6, ptr %RBP_N.48, align 1
  %memload7 = load i32, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 56), align 1, !ROData_Content !8
  store i32 %memload7, ptr %RBP_N.40, align 1
  %memload8 = load i16, ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 60), align 1, !ROData_Content !9
  store i16 %memload8, ptr %RBP_N.36, align 1
  store i32 15, ptr %RBP_N.68, align 1
  %RAX = ptrtoint ptr %RBP_N.19 to i64
  store i64 %RAX, ptr %RBP_N.80, align 1
  %memload9 = load i64, ptr %RBP_N.80, align 1
  store i64 %memload9, ptr %RBP_N.88, align 1
  store i32 0, ptr %RBP_N.92, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.6
  %memload10 = load i32, ptr %RBP_N.92, align 1
  %memload11 = load i32, ptr %RBP_N.68, align 1
  %ECX = sub i32 %memload11, 2
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload11, i32 2)
  %CF = extractvalue { i32, i1 } %16, 1
  %17 = and i32 %ECX, 255
  %18 = call i32 @llvm.ctpop.i32(i32 %17)
  %19 = and i32 %18, 1
  %PF = icmp eq i32 %19, 0
  %ZF = icmp eq i32 %ECX, 0
  %highbit = and i32 -2147483648, %ECX
  %SF = icmp ne i32 %highbit, 0
  %20 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload11, i32 2)
  %OF = extractvalue { i32, i1 } %20, 1
  %21 = sub i32 %memload10, %ECX
  %22 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %CF12 = extractvalue { i32, i1 } %22, 1
  %ZF13 = icmp eq i32 %21, 0
  %highbit14 = and i32 -2147483648, %21
  %SF15 = icmp ne i32 %highbit14, 0
  %23 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %OF16 = extractvalue { i32, i1 } %23, 1
  %24 = and i32 %21, 255
  %25 = call i32 @llvm.ctpop.i32(i32 %24)
  %26 = and i32 %25, 1
  %PF17 = icmp eq i32 %26, 0
  %CmpSFOF_JGE = icmp eq i1 %SF15, %OF16
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload18 = load i64, ptr %RBP_N.80, align 1
  %memload19 = load i64, ptr %RBP_N.92, align 1
  %27 = trunc i64 %memload19 to i32
  %RCX = sext i32 %27 to i64
  %RCX23 = shl i64 %RCX, 2
  %ZF20 = icmp eq i64 %RCX23, 0
  %highbit21 = and i64 -9223372036854775808, %RCX23
  %SF22 = icmp ne i64 %highbit21, 0
  %RAX27 = add nsw i64 %memload18, %RCX23
  %highbit24 = and i64 -9223372036854775808, %RAX27
  %SF25 = icmp ne i64 %highbit24, 0
  %ZF26 = icmp eq i64 %RAX27, 0
  store i64 %RAX27, ptr %RBP_N.104, align 1
  %28 = ptrtoint ptr %stktop_8 to i64
  %29 = add i64 %28, 4
  %30 = inttoptr i64 %29 to ptr
  store i32 0, ptr %30, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.4
  %31 = ptrtoint ptr %stktop_8 to i64
  %32 = add i64 %31, 4
  %33 = inttoptr i64 %32 to ptr
  %34 = load i32, ptr %33, align 1
  %35 = zext i32 %34 to i64
  %36 = zext i32 4 to i64
  %37 = sub i64 %35, %36
  %38 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %35, i64 %36)
  %CF28 = extractvalue { i64, i1 } %38, 1
  %ZF29 = icmp eq i64 %37, 0
  %highbit30 = and i64 -9223372036854775808, %37
  %SF31 = icmp ne i64 %highbit30, 0
  %39 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %35, i64 %36)
  %OF32 = extractvalue { i64, i1 } %39, 1
  %40 = and i64 %37, 255
  %41 = call i64 @llvm.ctpop.i64(i64 %40)
  %42 = and i64 %41, 1
  %PF33 = icmp eq i64 %42, 0
  %CmpSFOF_JGE81 = icmp eq i1 %SF31, %OF32
  br i1 %CmpSFOF_JGE81, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload34 = load i64, ptr %RBP_N.104, align 1
  %43 = ptrtoint ptr %stktop_8 to i64
  %44 = add i64 %43, 4
  %45 = inttoptr i64 %44 to ptr
  %memload35 = load i64, ptr %45, align 1
  %46 = trunc i64 %memload35 to i32
  %RCX36 = sext i32 %46 to i64
  %memref-basereg = add i64 %memload34, %RCX36
  %47 = inttoptr i64 %memref-basereg to ptr
  store i8 65, ptr %47, align 1
  %48 = ptrtoint ptr %stktop_8 to i64
  %49 = add i64 %48, 4
  %50 = inttoptr i64 %49 to ptr
  %memload37 = load i32, ptr %50, align 1
  %EAX = add i32 %memload37, 1
  %51 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload37, i32 1)
  %CF38 = extractvalue { i32, i1 } %51, 1
  %52 = and i32 %EAX, 255
  %53 = call i32 @llvm.ctpop.i32(i32 %52)
  %54 = and i32 %53, 1
  %PF39 = icmp eq i32 %54, 0
  %ZF40 = icmp eq i32 %EAX, 0
  %highbit41 = and i32 -2147483648, %EAX
  %SF42 = icmp ne i32 %highbit41, 0
  %55 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload37, i32 1)
  %OF43 = extractvalue { i32, i1 } %55, 1
  %56 = ptrtoint ptr %stktop_8 to i64
  %57 = add i64 %56, 4
  %58 = inttoptr i64 %57 to ptr
  store i32 %EAX, ptr %58, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload44 = load i32, ptr %RBP_N.92, align 1
  %EAX51 = add i32 %memload44, 1
  %59 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload44, i32 1)
  %CF45 = extractvalue { i32, i1 } %59, 1
  %60 = and i32 %EAX51, 255
  %61 = call i32 @llvm.ctpop.i32(i32 %60)
  %62 = and i32 %61, 1
  %PF46 = icmp eq i32 %62, 0
  %ZF47 = icmp eq i32 %EAX51, 0
  %highbit48 = and i32 -2147483648, %EAX51
  %SF49 = icmp ne i32 %highbit48, 0
  %63 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload44, i32 1)
  %OF50 = extractvalue { i32, i1 } %63, 1
  store i32 %EAX51, ptr %RBP_N.92, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  %RSI = ptrtoint ptr %RBP_N.19 to i64
  %EAX52 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 62), i64 %RSI)
  %RSI53 = ptrtoint ptr %RBP_N.64 to i64
  %EAX54 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 62), i64 %RSI53)
  store i32 0, ptr %stktop_8, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.12
  %64 = load i32, ptr %stktop_8, align 1
  %65 = zext i32 %64 to i64
  %66 = zext i32 28 to i64
  %67 = sub i64 %65, %66
  %68 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %65, i64 %66)
  %CF55 = extractvalue { i64, i1 } %68, 1
  %ZF56 = icmp eq i64 %67, 0
  %highbit57 = and i64 -9223372036854775808, %67
  %SF58 = icmp ne i64 %highbit57, 0
  %69 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %65, i64 %66)
  %OF59 = extractvalue { i64, i1 } %69, 1
  %70 = and i64 %67, 255
  %71 = call i64 @llvm.ctpop.i64(i64 %70)
  %72 = and i64 %71, 1
  %PF60 = icmp eq i64 %72, 0
  %CmpSFOF_JGE82 = icmp eq i1 %SF58, %OF59
  br i1 %CmpSFOF_JGE82, label %bb.13, label %bb.9

bb.9:                                             ; preds = %bb.8
  %memload61 = load i64, ptr %stktop_8, align 1
  %73 = trunc i64 %memload61 to i32
  %RAX62 = sext i32 %73 to i64
  %74 = getelementptr i8, ptr %RBP_N.64, i64 %RAX62
  %memload63 = load i32, ptr %74, align 1
  %75 = trunc i32 %memload63 to i8
  %EAX64 = sext i8 %75 to i32
  %76 = sub i32 %EAX64, 65
  %77 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX64, i32 65)
  %CF65 = extractvalue { i32, i1 } %77, 1
  %ZF66 = icmp eq i32 %76, 0
  %highbit67 = and i32 -2147483648, %76
  %SF68 = icmp ne i32 %highbit67, 0
  %78 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX64, i32 65)
  %OF69 = extractvalue { i32, i1 } %78, 1
  %79 = and i32 %76, 255
  %80 = call i32 @llvm.ctpop.i32(i32 %79)
  %81 = and i32 %80, 1
  %PF70 = icmp eq i32 %81, 0
  %CmpZF_JNE = icmp eq i1 %ZF66, false
  br i1 %CmpZF_JNE, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX71 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 66))
  br label %bb.13

bb.11:                                            ; preds = %bb.9
  br label %bb.12

bb.12:                                            ; preds = %bb.11
  %memload72 = load i32, ptr %stktop_8, align 1
  %EAX79 = add i32 %memload72, 1
  %82 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload72, i32 1)
  %CF73 = extractvalue { i32, i1 } %82, 1
  %83 = and i32 %EAX79, 255
  %84 = call i32 @llvm.ctpop.i32(i32 %83)
  %85 = and i32 %84, 1
  %PF74 = icmp eq i32 %85, 0
  %ZF75 = icmp eq i32 %EAX79, 0
  %highbit76 = and i32 -2147483648, %EAX79
  %SF77 = icmp ne i32 %highbit76, 0
  %86 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload72, i32 1)
  %OF78 = extractvalue { i32, i1 } %86, 1
  store i32 %EAX79, ptr %stktop_8, align 1
  br label %bb.8

bb.13:                                            ; preds = %bb.10, %bb.8
  %memload80 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload80
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

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
!1 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 28)}
!4 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 30)}
!5 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 32)}
!6 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 40)}
!7 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 48)}
!8 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 56)}
!9 = !{ptr getelementptr inbounds ([166 x i8], ptr @rodata_15, i32 0, i32 60)}
