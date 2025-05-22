; ModuleID = './bin/oobr_char_to_int_conversion_advanced'
source_filename = "./bin/oobr_char_to_int_conversion_advanced"

@rodata_15 = private unnamed_addr constant [130 x i8] c"\01\00\02\00public string\00\00This is the secret in memory\00\00%p \00%c \0A\00%c\0A\00Test Failed: Out of Bounds Read by Char to Int Conversion Advanced\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 104, align 1
  %RSPAdj_N.96 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.88 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.76 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.72 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 44
  %RBP_N.60 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.56 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.52 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.48 = bitcast i8* %6 to i64*
  %7 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.40 = bitcast i8* %7 to i64*
  %8 = getelementptr i8, i8* %stktop_8, i64 76
  %RBP_N.28 = bitcast i8* %8 to i32*
  %9 = getelementptr i8, i8* %stktop_8, i64 80
  %RBP_N.24 = bitcast i8* %9 to i64*
  %10 = getelementptr i8, i8* %stktop_8, i64 88
  %RBP_N.16 = bitcast i8* %10 to i64*
  %11 = getelementptr i8, i8* %stktop_8, i64 100
  %RBP_N.4 = bitcast i8* %11 to i32*
  %12 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %12 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %13 = ptrtoint i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %13, i64* %RBP_N.16, align 1
  %14 = ptrtoint i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 19) to i64, !ROData_Index !2
  store i64 %14, i64* %RBP_N.24, align 1
  store i32 8, i32* %RBP_N.28, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  store i64 %memload, i64* %RBP_N.40, align 1
  %memload1 = load i64, i64* %RBP_N.40, align 1
  store i64 %memload1, i64* %RBP_N.48, align 1
  store i32 1, i32* %RBP_N.52, align 1
  store i32 0, i32* %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload2 = load i32, i32* %RBP_N.56, align 1
  %15 = load i32, i32* %RBP_N.28, align 1
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
  %memload3 = load i64, i64* %RBP_N.40, align 1
  %22 = bitcast i32* %RBP_N.56 to i64*
  %memload4 = load i64, i64* %22, align 1
  %23 = trunc i64 %memload4 to i32
  %RAX = sext i32 %23 to i64
  %RSI = add nsw i64 %memload3, %RAX
  %highbit5 = and i64 -9223372036854775808, %RSI
  %SF6 = icmp ne i64 %highbit5, 0
  %ZF7 = icmp eq i64 %RSI, 0
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 49), i64 %RSI)
  %memload8 = load i64, i64* %RBP_N.40, align 1
  %24 = bitcast i32* %RBP_N.56 to i64*
  %memload9 = load i64, i64* %24, align 1
  %25 = trunc i64 %memload9 to i32
  %RCX = sext i32 %25 to i64
  %memref-basereg = add i64 %memload8, %RCX
  %26 = inttoptr i64 %memref-basereg to i32*
  %memload10 = load i32, i32* %26, align 1
  %27 = trunc i32 %memload10 to i8
  %ESI = sext i8 %27 to i32
  %EAX11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 53), i32 %ESI)
  %memload12 = load i32, i32* %RBP_N.56, align 1
  %EAX19 = add i32 %memload12, 1
  %28 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload12, i32 1)
  %CF13 = extractvalue { i32, i1 } %28, 1
  %29 = and i32 %EAX19, 255
  %30 = call i32 @llvm.ctpop.i32(i32 %29)
  %31 = and i32 %30, 1
  %PF14 = icmp eq i32 %31, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %32 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload12, i32 1)
  %OF18 = extractvalue { i32, i1 } %32, 1
  store i32 %EAX19, i32* %RBP_N.56, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 56))
  store i32 0, i32* %RBP_N.60, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.13
  %memload21 = load i32, i32* %RBP_N.60, align 1
  %33 = load i32, i32* %RBP_N.28, align 1
  %34 = sub i32 %memload21, %33
  %35 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload21, i32 %33)
  %CF22 = extractvalue { i32, i1 } %35, 1
  %ZF23 = icmp eq i32 %34, 0
  %highbit24 = and i32 -2147483648, %34
  %SF25 = icmp ne i32 %highbit24, 0
  %36 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload21, i32 %33)
  %OF26 = extractvalue { i32, i1 } %36, 1
  %37 = and i32 %34, 255
  %38 = call i32 @llvm.ctpop.i32(i32 %37)
  %39 = and i32 %38, 1
  %PF27 = icmp eq i32 %39, 0
  %CmpSFOF_JGE107 = icmp eq i1 %SF25, %OF26
  br i1 %CmpSFOF_JGE107, label %bb.14, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload28 = load i64, i64* %RBP_N.40, align 1
  %40 = bitcast i32* %RBP_N.60 to i64*
  %memload29 = load i64, i64* %40, align 1
  %41 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %41 to i64
  %RCX34 = shl i64 %RCX30, 2
  %ZF31 = icmp eq i64 %RCX34, 0
  %highbit32 = and i64 -9223372036854775808, %RCX34
  %SF33 = icmp ne i64 %highbit32, 0
  %RAX38 = add nsw i64 %memload28, %RCX34
  %highbit35 = and i64 -9223372036854775808, %RAX38
  %SF36 = icmp ne i64 %highbit35, 0
  %ZF37 = icmp eq i64 %RAX38, 0
  store i64 %RAX38, i64* %RBP_N.72, align 1
  store i32 0, i32* %RBP_N.76, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.11
  %42 = load i32, i32* %RBP_N.76, align 1
  %43 = zext i32 %42 to i64
  %44 = zext i32 4 to i64
  %45 = sub i64 %43, %44
  %46 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %43, i64 %44)
  %CF39 = extractvalue { i64, i1 } %46, 1
  %ZF40 = icmp eq i64 %45, 0
  %highbit41 = and i64 -9223372036854775808, %45
  %SF42 = icmp ne i64 %highbit41, 0
  %47 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %43, i64 %44)
  %OF43 = extractvalue { i64, i1 } %47, 1
  %48 = and i64 %45, 255
  %49 = call i64 @llvm.ctpop.i64(i64 %48)
  %50 = and i64 %49, 1
  %PF44 = icmp eq i64 %50, 0
  %CmpSFOF_JGE108 = icmp eq i1 %SF42, %OF43
  br i1 %CmpSFOF_JGE108, label %bb.12, label %bb.7

bb.7:                                             ; preds = %bb.6
  %memload45 = load i64, i64* %RBP_N.72, align 1
  %51 = bitcast i32* %RBP_N.76 to i64*
  %memload46 = load i64, i64* %51, align 1
  %52 = trunc i64 %memload46 to i32
  %RCX47 = sext i32 %52 to i64
  %RAX51 = add nsw i64 %memload45, %RCX47
  %highbit48 = and i64 -9223372036854775808, %RAX51
  %SF49 = icmp ne i64 %highbit48, 0
  %ZF50 = icmp eq i64 %RAX51, 0
  store i64 %RAX51, i64* %RBP_N.88, align 1
  %memload52 = load i64, i64* %RBP_N.88, align 1
  %EAX53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 49), i64 %memload52)
  %memload54 = load i64, i64* %RBP_N.88, align 1
  %53 = inttoptr i64 %memload54 to i32*
  %memload55 = load i32, i32* %53, align 1
  %54 = trunc i32 %memload55 to i8
  %ESI56 = sext i8 %54 to i32
  %EAX57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 58), i32 %ESI56)
  %memload58 = load i64, i64* %RBP_N.88, align 1
  %memload59 = load i64, i64* %RBP_N.16, align 1
  %RCX66 = add i64 %memload59, 8
  %55 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload59, i64 8)
  %CF60 = extractvalue { i64, i1 } %55, 1
  %56 = and i64 %RCX66, 255
  %57 = call i64 @llvm.ctpop.i64(i64 %56)
  %58 = and i64 %57, 1
  %PF61 = icmp eq i64 %58, 0
  %ZF62 = icmp eq i64 %RCX66, 0
  %highbit63 = and i64 -9223372036854775808, %RCX66
  %SF64 = icmp ne i64 %highbit63, 0
  %59 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload59, i64 8)
  %OF65 = extractvalue { i64, i1 } %59, 1
  %60 = sub i64 %memload58, %RCX66
  %61 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload58, i64 %RCX66)
  %CF67 = extractvalue { i64, i1 } %61, 1
  %ZF68 = icmp eq i64 %60, 0
  %highbit69 = and i64 -9223372036854775808, %60
  %SF70 = icmp ne i64 %highbit69, 0
  %62 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload58, i64 %RCX66)
  %OF71 = extractvalue { i64, i1 } %62, 1
  %63 = and i64 %60, 255
  %64 = call i64 @llvm.ctpop.i64(i64 %63)
  %65 = and i64 %64, 1
  %PF72 = icmp eq i64 %65, 0
  %CFCmp_JBE = icmp eq i1 %CF67, true
  %ZFCmp_JBE = icmp eq i1 %ZF68, true
  %CFAndZF_JBE = or i1 %ZFCmp_JBE, %CFCmp_JBE
  br i1 %CFAndZF_JBE, label %bb.10, label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload73 = load i64, i64* %RBP_N.88, align 1
  %66 = inttoptr i64 %memload73 to i32*
  %memload74 = load i32, i32* %66, align 1
  %67 = trunc i32 %memload74 to i8
  %EAX75 = sext i8 %67 to i32
  %68 = sub i32 %EAX75, 0
  %69 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX75, i32 0)
  %CF76 = extractvalue { i32, i1 } %69, 1
  %ZF77 = icmp eq i32 %68, 0
  %highbit78 = and i32 -2147483648, %68
  %SF79 = icmp ne i32 %highbit78, 0
  %70 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX75, i32 0)
  %OF80 = extractvalue { i32, i1 } %70, 1
  %71 = and i32 %68, 255
  %72 = call i32 @llvm.ctpop.i32(i32 %71)
  %73 = and i32 %72, 1
  %PF81 = icmp eq i32 %73, 0
  %CmpZF_JE = icmp eq i1 %ZF77, true
  br i1 %CmpZF_JE, label %bb.10, label %bb.9

bb.9:                                             ; preds = %bb.8
  store i32 0, i32* %RBP_N.52, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.8, %bb.7
  br label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload82 = load i32, i32* %RBP_N.76, align 1
  %EAX89 = add i32 %memload82, 1
  %74 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload82, i32 1)
  %CF83 = extractvalue { i32, i1 } %74, 1
  %75 = and i32 %EAX89, 255
  %76 = call i32 @llvm.ctpop.i32(i32 %75)
  %77 = and i32 %76, 1
  %PF84 = icmp eq i32 %77, 0
  %ZF85 = icmp eq i32 %EAX89, 0
  %highbit86 = and i32 -2147483648, %EAX89
  %SF87 = icmp ne i32 %highbit86, 0
  %78 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload82, i32 1)
  %OF88 = extractvalue { i32, i1 } %78, 1
  store i32 %EAX89, i32* %RBP_N.76, align 1
  br label %bb.6

bb.12:                                            ; preds = %bb.6
  br label %bb.13

bb.13:                                            ; preds = %bb.12
  %memload90 = load i32, i32* %RBP_N.60, align 1
  %EAX97 = add i32 %memload90, 1
  %79 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload90, i32 1)
  %CF91 = extractvalue { i32, i1 } %79, 1
  %80 = and i32 %EAX97, 255
  %81 = call i32 @llvm.ctpop.i32(i32 %80)
  %82 = and i32 %81, 1
  %PF92 = icmp eq i32 %82, 0
  %ZF93 = icmp eq i32 %EAX97, 0
  %highbit94 = and i32 -2147483648, %EAX97
  %SF95 = icmp ne i32 %highbit94, 0
  %83 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload90, i32 1)
  %OF96 = extractvalue { i32, i1 } %83, 1
  store i32 %EAX97, i32* %RBP_N.60, align 1
  br label %bb.4

bb.14:                                            ; preds = %bb.4
  %EAX98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 56))
  %84 = load i32, i32* %RBP_N.52, align 1
  %85 = zext i32 %84 to i64
  %86 = zext i32 0 to i64
  %87 = sub i64 %85, %86
  %88 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %85, i64 %86)
  %CF99 = extractvalue { i64, i1 } %88, 1
  %ZF100 = icmp eq i64 %87, 0
  %highbit101 = and i64 -9223372036854775808, %87
  %SF102 = icmp ne i64 %highbit101, 0
  %89 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %85, i64 %86)
  %OF103 = extractvalue { i64, i1 } %89, 1
  %90 = and i64 %87, 255
  %91 = call i64 @llvm.ctpop.i64(i64 %90)
  %92 = and i64 %91, 1
  %PF104 = icmp eq i64 %92, 0
  %CmpZF_JNE = icmp eq i1 %ZF100, false
  br i1 %CmpZF_JNE, label %bb.16, label %bb.15

bb.15:                                            ; preds = %bb.14
  %EAX105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 62))
  br label %bb.16

bb.16:                                            ; preds = %bb.15, %bb.14
  %memload106 = load i32, i32* %RBP_N.4, align 1
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
!1 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 19)}
