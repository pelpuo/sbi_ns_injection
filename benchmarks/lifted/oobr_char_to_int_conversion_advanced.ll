; ModuleID = './bin/oobr_char_to_int_conversion_advanced'
source_filename = "./bin/oobr_char_to_int_conversion_advanced"

@rodata_15 = private unnamed_addr constant [130 x i8] c"\01\00\02\00public string\00\00This is the secret in memory\00\00%p \00%c \0A\00%c\0A\00Test Failed: Out of Bounds Read by Char to Int Conversion Advanced\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 104, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.88 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 28
  %RBP_N.76 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.72 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 44
  %RBP_N.60 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 48
  %RBP_N.56 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 52
  %RBP_N.52 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 56
  %RBP_N.48 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 64
  %RBP_N.40 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 76
  %RBP_N.28 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 80
  %RBP_N.24 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 88
  %RBP_N.16 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 100
  %RBP_N.4 = inttoptr i64 %11 to ptr
  %12 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %12 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %13 = ptrtoint ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %13, ptr %RBP_N.16, align 1
  %14 = ptrtoint ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 19) to i64, !ROData_Index !2
  store i64 %14, ptr %RBP_N.24, align 1
  store i32 8, ptr %RBP_N.28, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  store i64 %memload, ptr %RBP_N.40, align 1
  %memload1 = load i64, ptr %RBP_N.40, align 1
  store i64 %memload1, ptr %RBP_N.48, align 1
  store i32 1, ptr %RBP_N.52, align 1
  store i32 0, ptr %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload2 = load i32, ptr %RBP_N.56, align 1
  %15 = load i32, ptr %RBP_N.28, align 1
  %16 = sub i32 %memload2, %15
  %17 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload2, i32 %15)
  %CF = extractvalue { i32, i1 } %17, 1
  %ZF = icmp eq i32 %16, 0
  %highbit = and i32 -2147483648, %16
  %SF = icmp ne i32 %highbit, 0
  %18 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload2, i32 %15)
  %OF = extractvalue { i32, i1 } %18, 1
  %19 = and i32 %16, 255
  %20 = call i32 @llvm.ctpop.i32(i32 %19)
  %21 = and i32 %20, 1
  %PF = icmp eq i32 %21, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload3 = load i64, ptr %RBP_N.40, align 1
  %memload4 = load i64, ptr %RBP_N.56, align 1
  %22 = trunc i64 %memload4 to i32
  %RAX = sext i32 %22 to i64
  %RSI = add nsw i64 %memload3, %RAX
  %highbit5 = and i64 -9223372036854775808, %RSI
  %SF6 = icmp ne i64 %highbit5, 0
  %ZF7 = icmp eq i64 %RSI, 0
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 49), i64 %RSI)
  %memload8 = load i64, ptr %RBP_N.40, align 1
  %memload9 = load i64, ptr %RBP_N.56, align 1
  %23 = trunc i64 %memload9 to i32
  %RCX = sext i32 %23 to i64
  %memref-basereg = add i64 %memload8, %RCX
  %24 = inttoptr i64 %memref-basereg to ptr
  %memload10 = load i32, ptr %24, align 1
  %25 = trunc i32 %memload10 to i8
  %ESI = sext i8 %25 to i32
  %EAX11 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 53), i32 %ESI)
  %memload12 = load i32, ptr %RBP_N.56, align 1
  %EAX19 = add i32 %memload12, 1
  %26 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload12, i32 1)
  %CF13 = extractvalue { i32, i1 } %26, 1
  %27 = and i32 %EAX19, 255
  %28 = call i32 @llvm.ctpop.i32(i32 %27)
  %29 = and i32 %28, 1
  %PF14 = icmp eq i32 %29, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %30 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload12, i32 1)
  %OF18 = extractvalue { i32, i1 } %30, 1
  store i32 %EAX19, ptr %RBP_N.56, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 56))
  store i32 0, ptr %RBP_N.60, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.13
  %memload21 = load i32, ptr %RBP_N.60, align 1
  %31 = load i32, ptr %RBP_N.28, align 1
  %32 = sub i32 %memload21, %31
  %33 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload21, i32 %31)
  %CF22 = extractvalue { i32, i1 } %33, 1
  %ZF23 = icmp eq i32 %32, 0
  %highbit24 = and i32 -2147483648, %32
  %SF25 = icmp ne i32 %highbit24, 0
  %34 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload21, i32 %31)
  %OF26 = extractvalue { i32, i1 } %34, 1
  %35 = and i32 %32, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %35)
  %37 = and i32 %36, 1
  %PF27 = icmp eq i32 %37, 0
  %CmpSFOF_JGE107 = icmp eq i1 %SF25, %OF26
  br i1 %CmpSFOF_JGE107, label %bb.14, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload28 = load i64, ptr %RBP_N.40, align 1
  %memload29 = load i64, ptr %RBP_N.60, align 1
  %38 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %38 to i64
  %RCX34 = shl i64 %RCX30, 2
  %ZF31 = icmp eq i64 %RCX34, 0
  %highbit32 = and i64 -9223372036854775808, %RCX34
  %SF33 = icmp ne i64 %highbit32, 0
  %RAX38 = add nsw i64 %memload28, %RCX34
  %highbit35 = and i64 -9223372036854775808, %RAX38
  %SF36 = icmp ne i64 %highbit35, 0
  %ZF37 = icmp eq i64 %RAX38, 0
  store i64 %RAX38, ptr %RBP_N.72, align 1
  store i32 0, ptr %RBP_N.76, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.11
  %39 = load i32, ptr %RBP_N.76, align 1
  %40 = zext i32 %39 to i64
  %41 = zext i32 4 to i64
  %42 = sub i64 %40, %41
  %43 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %40, i64 %41)
  %CF39 = extractvalue { i64, i1 } %43, 1
  %ZF40 = icmp eq i64 %42, 0
  %highbit41 = and i64 -9223372036854775808, %42
  %SF42 = icmp ne i64 %highbit41, 0
  %44 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %40, i64 %41)
  %OF43 = extractvalue { i64, i1 } %44, 1
  %45 = and i64 %42, 255
  %46 = call i64 @llvm.ctpop.i64(i64 %45)
  %47 = and i64 %46, 1
  %PF44 = icmp eq i64 %47, 0
  %CmpSFOF_JGE108 = icmp eq i1 %SF42, %OF43
  br i1 %CmpSFOF_JGE108, label %bb.12, label %bb.7

bb.7:                                             ; preds = %bb.6
  %memload45 = load i64, ptr %RBP_N.72, align 1
  %memload46 = load i64, ptr %RBP_N.76, align 1
  %48 = trunc i64 %memload46 to i32
  %RCX47 = sext i32 %48 to i64
  %RAX51 = add nsw i64 %memload45, %RCX47
  %highbit48 = and i64 -9223372036854775808, %RAX51
  %SF49 = icmp ne i64 %highbit48, 0
  %ZF50 = icmp eq i64 %RAX51, 0
  store i64 %RAX51, ptr %RBP_N.88, align 1
  %memload52 = load i64, ptr %RBP_N.88, align 1
  %EAX53 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 49), i64 %memload52)
  %memload54 = load i64, ptr %RBP_N.88, align 1
  %49 = inttoptr i64 %memload54 to ptr
  %memload55 = load i32, ptr %49, align 1
  %50 = trunc i32 %memload55 to i8
  %ESI56 = sext i8 %50 to i32
  %EAX57 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 58), i32 %ESI56)
  %memload58 = load i64, ptr %RBP_N.88, align 1
  %memload59 = load i64, ptr %RBP_N.16, align 1
  %RCX66 = add i64 %memload59, 8
  %51 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload59, i64 8)
  %CF60 = extractvalue { i64, i1 } %51, 1
  %52 = and i64 %RCX66, 255
  %53 = call i64 @llvm.ctpop.i64(i64 %52)
  %54 = and i64 %53, 1
  %PF61 = icmp eq i64 %54, 0
  %ZF62 = icmp eq i64 %RCX66, 0
  %highbit63 = and i64 -9223372036854775808, %RCX66
  %SF64 = icmp ne i64 %highbit63, 0
  %55 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload59, i64 8)
  %OF65 = extractvalue { i64, i1 } %55, 1
  %56 = sub i64 %memload58, %RCX66
  %57 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload58, i64 %RCX66)
  %CF67 = extractvalue { i64, i1 } %57, 1
  %ZF68 = icmp eq i64 %56, 0
  %highbit69 = and i64 -9223372036854775808, %56
  %SF70 = icmp ne i64 %highbit69, 0
  %58 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload58, i64 %RCX66)
  %OF71 = extractvalue { i64, i1 } %58, 1
  %59 = and i64 %56, 255
  %60 = call i64 @llvm.ctpop.i64(i64 %59)
  %61 = and i64 %60, 1
  %PF72 = icmp eq i64 %61, 0
  %CFCmp_JBE = icmp eq i1 %CF67, true
  %ZFCmp_JBE = icmp eq i1 %ZF68, true
  %CFAndZF_JBE = or i1 %ZFCmp_JBE, %CFCmp_JBE
  br i1 %CFAndZF_JBE, label %bb.10, label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload73 = load i64, ptr %RBP_N.88, align 1
  %62 = inttoptr i64 %memload73 to ptr
  %memload74 = load i32, ptr %62, align 1
  %63 = trunc i32 %memload74 to i8
  %EAX75 = sext i8 %63 to i32
  %64 = sub i32 %EAX75, 0
  %65 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX75, i32 0)
  %CF76 = extractvalue { i32, i1 } %65, 1
  %ZF77 = icmp eq i32 %64, 0
  %highbit78 = and i32 -2147483648, %64
  %SF79 = icmp ne i32 %highbit78, 0
  %66 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX75, i32 0)
  %OF80 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %64, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF81 = icmp eq i32 %69, 0
  %CmpZF_JE = icmp eq i1 %ZF77, true
  br i1 %CmpZF_JE, label %bb.10, label %bb.9

bb.9:                                             ; preds = %bb.8
  store i32 0, ptr %RBP_N.52, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.8, %bb.7
  br label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload82 = load i32, ptr %RBP_N.76, align 1
  %EAX89 = add i32 %memload82, 1
  %70 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload82, i32 1)
  %CF83 = extractvalue { i32, i1 } %70, 1
  %71 = and i32 %EAX89, 255
  %72 = call i32 @llvm.ctpop.i32(i32 %71)
  %73 = and i32 %72, 1
  %PF84 = icmp eq i32 %73, 0
  %ZF85 = icmp eq i32 %EAX89, 0
  %highbit86 = and i32 -2147483648, %EAX89
  %SF87 = icmp ne i32 %highbit86, 0
  %74 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload82, i32 1)
  %OF88 = extractvalue { i32, i1 } %74, 1
  store i32 %EAX89, ptr %RBP_N.76, align 1
  br label %bb.6

bb.12:                                            ; preds = %bb.6
  br label %bb.13

bb.13:                                            ; preds = %bb.12
  %memload90 = load i32, ptr %RBP_N.60, align 1
  %EAX97 = add i32 %memload90, 1
  %75 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload90, i32 1)
  %CF91 = extractvalue { i32, i1 } %75, 1
  %76 = and i32 %EAX97, 255
  %77 = call i32 @llvm.ctpop.i32(i32 %76)
  %78 = and i32 %77, 1
  %PF92 = icmp eq i32 %78, 0
  %ZF93 = icmp eq i32 %EAX97, 0
  %highbit94 = and i32 -2147483648, %EAX97
  %SF95 = icmp ne i32 %highbit94, 0
  %79 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload90, i32 1)
  %OF96 = extractvalue { i32, i1 } %79, 1
  store i32 %EAX97, ptr %RBP_N.60, align 1
  br label %bb.4

bb.14:                                            ; preds = %bb.4
  %EAX98 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 56))
  %80 = load i32, ptr %RBP_N.52, align 1
  %81 = zext i32 %80 to i64
  %82 = zext i32 0 to i64
  %83 = sub i64 %81, %82
  %84 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %81, i64 %82)
  %CF99 = extractvalue { i64, i1 } %84, 1
  %ZF100 = icmp eq i64 %83, 0
  %highbit101 = and i64 -9223372036854775808, %83
  %SF102 = icmp ne i64 %highbit101, 0
  %85 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %81, i64 %82)
  %OF103 = extractvalue { i64, i1 } %85, 1
  %86 = and i64 %83, 255
  %87 = call i64 @llvm.ctpop.i64(i64 %86)
  %88 = and i64 %87, 1
  %PF104 = icmp eq i64 %88, 0
  %CmpZF_JNE = icmp eq i1 %ZF100, false
  br i1 %CmpZF_JNE, label %bb.16, label %bb.15

bb.15:                                            ; preds = %bb.14
  %EAX105 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 62))
  br label %bb.16

bb.16:                                            ; preds = %bb.15, %bb.14
  %memload106 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload106
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([130 x i8], ptr @rodata_15, i32 0, i32 19)}
