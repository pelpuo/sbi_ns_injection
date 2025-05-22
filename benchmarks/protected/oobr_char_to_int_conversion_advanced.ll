; ModuleID = './protected_bc/oobr_char_to_int_conversion_advanced.bc'
source_filename = "./bin/oobr_char_to_int_conversion_advanced"

@rodata_15 = private unnamed_addr constant [130 x i8] c"\01\00\02\00public string\00\00This is the secret in memory\00\00%p \00%c \0A\00%c\0A\00Test Failed: Out of Bounds Read by Char to Int Conversion Advanced\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 104, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 100
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 88
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 80
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 76
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 64
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 4)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i32*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 44
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 4)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i32*
  %ns_base28 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot29 = call i8* @zeno_protect(i8* %ns_base28, i64 8)
  %ns_ptr30 = bitcast i8* %ns_prot29 to i64*
  %ns_base31 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot32 = call i8* @zeno_protect(i8* %ns_base31, i64 4)
  %ns_ptr33 = bitcast i8* %ns_prot32 to i32*
  %ns_base34 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot35 = call i8* @zeno_protect(i8* %ns_base34, i64 8)
  %ns_ptr36 = bitcast i8* %ns_prot35 to i64*
  %RSPAdj_N.96 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = ptrtoint i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %0, i64* %ns_ptr6, align 1
  %1 = ptrtoint i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 19) to i64, !ROData_Index !2
  store i64 %1, i64* %ns_ptr9, align 1
  store i32 8, i32* %ns_ptr12, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  store i64 %memload, i64* %ns_ptr15, align 1
  %memload1 = load i64, i64* %ns_ptr15, align 1
  store i64 %memload1, i64* %ns_ptr18, align 1
  store i32 1, i32* %ns_ptr21, align 1
  store i32 0, i32* %ns_ptr24, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %memload2 = load i32, i32* %ns_ptr24, align 1
  %2 = load i32, i32* %ns_ptr12, align 1
  %3 = sub i32 %memload2, %2
  %4 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload2, i32 %2)
  %CF = extractvalue { i32, i1 } %4, 1
  %ZF = icmp eq i32 %3, 0
  %highbit = and i32 -2147483648, %3
  %SF = icmp ne i32 %highbit, 0
  %5 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload2, i32 %2)
  %OF = extractvalue { i32, i1 } %5, 1
  %6 = and i32 %3, 255
  %7 = call i32 @llvm.ctpop.i32(i32 %6)
  %8 = and i32 %7, 1
  %PF = icmp eq i32 %8, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload3 = load i64, i64* %ns_ptr15, align 1
  %9 = bitcast i32* %ns_ptr24 to i64*
  %memload4 = load i64, i64* %9, align 1
  %10 = trunc i64 %memload4 to i32
  %RAX = sext i32 %10 to i64
  %RSI = add nsw i64 %memload3, %RAX
  %highbit5 = and i64 -9223372036854775808, %RSI
  %SF6 = icmp ne i64 %highbit5, 0
  %ZF7 = icmp eq i64 %RSI, 0
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 49), i64 %RSI)
  %memload8 = load i64, i64* %ns_ptr15, align 1
  %11 = bitcast i32* %ns_ptr24 to i64*
  %memload9 = load i64, i64* %11, align 1
  %12 = trunc i64 %memload9 to i32
  %RCX = sext i32 %12 to i64
  %memref-basereg = add i64 %memload8, %RCX
  %13 = inttoptr i64 %memref-basereg to i32*
  %memload10 = load i32, i32* %13, align 1
  %14 = trunc i32 %memload10 to i8
  %ESI = sext i8 %14 to i32
  %EAX11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 53), i32 %ESI)
  %memload12 = load i32, i32* %ns_ptr24, align 1
  %EAX19 = add i32 %memload12, 1
  %15 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload12, i32 1)
  %CF13 = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %EAX19, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF14 = icmp eq i32 %18, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %19 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload12, i32 1)
  %OF18 = extractvalue { i32, i1 } %19, 1
  store i32 %EAX19, i32* %ns_ptr24, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 56))
  store i32 0, i32* %ns_ptr27, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.13, %bb.3
  %memload21 = load i32, i32* %ns_ptr27, align 1
  %20 = load i32, i32* %ns_ptr12, align 1
  %21 = sub i32 %memload21, %20
  %22 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload21, i32 %20)
  %CF22 = extractvalue { i32, i1 } %22, 1
  %ZF23 = icmp eq i32 %21, 0
  %highbit24 = and i32 -2147483648, %21
  %SF25 = icmp ne i32 %highbit24, 0
  %23 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload21, i32 %20)
  %OF26 = extractvalue { i32, i1 } %23, 1
  %24 = and i32 %21, 255
  %25 = call i32 @llvm.ctpop.i32(i32 %24)
  %26 = and i32 %25, 1
  %PF27 = icmp eq i32 %26, 0
  %CmpSFOF_JGE107 = icmp eq i1 %SF25, %OF26
  br i1 %CmpSFOF_JGE107, label %bb.14, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload28 = load i64, i64* %ns_ptr15, align 1
  %27 = bitcast i32* %ns_ptr27 to i64*
  %memload29 = load i64, i64* %27, align 1
  %28 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %28 to i64
  %RCX34 = shl i64 %RCX30, 2
  %ZF31 = icmp eq i64 %RCX34, 0
  %highbit32 = and i64 -9223372036854775808, %RCX34
  %SF33 = icmp ne i64 %highbit32, 0
  %RAX38 = add nsw i64 %memload28, %RCX34
  %highbit35 = and i64 -9223372036854775808, %RAX38
  %SF36 = icmp ne i64 %highbit35, 0
  %ZF37 = icmp eq i64 %RAX38, 0
  store i64 %RAX38, i64* %ns_ptr30, align 1
  store i32 0, i32* %ns_ptr33, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.11, %bb.5
  %29 = load i32, i32* %ns_ptr33, align 1
  %30 = zext i32 %29 to i64
  %31 = zext i32 4 to i64
  %32 = sub i64 %30, %31
  %33 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %30, i64 %31)
  %CF39 = extractvalue { i64, i1 } %33, 1
  %ZF40 = icmp eq i64 %32, 0
  %highbit41 = and i64 -9223372036854775808, %32
  %SF42 = icmp ne i64 %highbit41, 0
  %34 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %30, i64 %31)
  %OF43 = extractvalue { i64, i1 } %34, 1
  %35 = and i64 %32, 255
  %36 = call i64 @llvm.ctpop.i64(i64 %35)
  %37 = and i64 %36, 1
  %PF44 = icmp eq i64 %37, 0
  %CmpSFOF_JGE108 = icmp eq i1 %SF42, %OF43
  br i1 %CmpSFOF_JGE108, label %bb.12, label %bb.7

bb.7:                                             ; preds = %bb.6
  %memload45 = load i64, i64* %ns_ptr30, align 1
  %38 = bitcast i32* %ns_ptr33 to i64*
  %memload46 = load i64, i64* %38, align 1
  %39 = trunc i64 %memload46 to i32
  %RCX47 = sext i32 %39 to i64
  %RAX51 = add nsw i64 %memload45, %RCX47
  %highbit48 = and i64 -9223372036854775808, %RAX51
  %SF49 = icmp ne i64 %highbit48, 0
  %ZF50 = icmp eq i64 %RAX51, 0
  store i64 %RAX51, i64* %ns_ptr36, align 1
  %memload52 = load i64, i64* %ns_ptr36, align 1
  %EAX53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 49), i64 %memload52)
  %memload54 = load i64, i64* %ns_ptr36, align 1
  %40 = inttoptr i64 %memload54 to i32*
  %memload55 = load i32, i32* %40, align 1
  %41 = trunc i32 %memload55 to i8
  %ESI56 = sext i8 %41 to i32
  %EAX57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 58), i32 %ESI56)
  %memload58 = load i64, i64* %ns_ptr36, align 1
  %memload59 = load i64, i64* %ns_ptr6, align 1
  %RCX66 = add i64 %memload59, 8
  %42 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload59, i64 8)
  %CF60 = extractvalue { i64, i1 } %42, 1
  %43 = and i64 %RCX66, 255
  %44 = call i64 @llvm.ctpop.i64(i64 %43)
  %45 = and i64 %44, 1
  %PF61 = icmp eq i64 %45, 0
  %ZF62 = icmp eq i64 %RCX66, 0
  %highbit63 = and i64 -9223372036854775808, %RCX66
  %SF64 = icmp ne i64 %highbit63, 0
  %46 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload59, i64 8)
  %OF65 = extractvalue { i64, i1 } %46, 1
  %47 = sub i64 %memload58, %RCX66
  %48 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload58, i64 %RCX66)
  %CF67 = extractvalue { i64, i1 } %48, 1
  %ZF68 = icmp eq i64 %47, 0
  %highbit69 = and i64 -9223372036854775808, %47
  %SF70 = icmp ne i64 %highbit69, 0
  %49 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload58, i64 %RCX66)
  %OF71 = extractvalue { i64, i1 } %49, 1
  %50 = and i64 %47, 255
  %51 = call i64 @llvm.ctpop.i64(i64 %50)
  %52 = and i64 %51, 1
  %PF72 = icmp eq i64 %52, 0
  %CFCmp_JBE = icmp eq i1 %CF67, true
  %ZFCmp_JBE = icmp eq i1 %ZF68, true
  %CFAndZF_JBE = or i1 %ZFCmp_JBE, %CFCmp_JBE
  br i1 %CFAndZF_JBE, label %bb.10, label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload73 = load i64, i64* %ns_ptr36, align 1
  %53 = inttoptr i64 %memload73 to i32*
  %memload74 = load i32, i32* %53, align 1
  %54 = trunc i32 %memload74 to i8
  %EAX75 = sext i8 %54 to i32
  %55 = sub i32 %EAX75, 0
  %56 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX75, i32 0)
  %CF76 = extractvalue { i32, i1 } %56, 1
  %ZF77 = icmp eq i32 %55, 0
  %highbit78 = and i32 -2147483648, %55
  %SF79 = icmp ne i32 %highbit78, 0
  %57 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX75, i32 0)
  %OF80 = extractvalue { i32, i1 } %57, 1
  %58 = and i32 %55, 255
  %59 = call i32 @llvm.ctpop.i32(i32 %58)
  %60 = and i32 %59, 1
  %PF81 = icmp eq i32 %60, 0
  %CmpZF_JE = icmp eq i1 %ZF77, true
  br i1 %CmpZF_JE, label %bb.10, label %bb.9

bb.9:                                             ; preds = %bb.8
  store i32 0, i32* %ns_ptr21, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.8, %bb.7
  br label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload82 = load i32, i32* %ns_ptr33, align 1
  %EAX89 = add i32 %memload82, 1
  %61 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload82, i32 1)
  %CF83 = extractvalue { i32, i1 } %61, 1
  %62 = and i32 %EAX89, 255
  %63 = call i32 @llvm.ctpop.i32(i32 %62)
  %64 = and i32 %63, 1
  %PF84 = icmp eq i32 %64, 0
  %ZF85 = icmp eq i32 %EAX89, 0
  %highbit86 = and i32 -2147483648, %EAX89
  %SF87 = icmp ne i32 %highbit86, 0
  %65 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload82, i32 1)
  %OF88 = extractvalue { i32, i1 } %65, 1
  store i32 %EAX89, i32* %ns_ptr33, align 1
  br label %bb.6

bb.12:                                            ; preds = %bb.6
  br label %bb.13

bb.13:                                            ; preds = %bb.12
  %memload90 = load i32, i32* %ns_ptr27, align 1
  %EAX97 = add i32 %memload90, 1
  %66 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload90, i32 1)
  %CF91 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %EAX97, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF92 = icmp eq i32 %69, 0
  %ZF93 = icmp eq i32 %EAX97, 0
  %highbit94 = and i32 -2147483648, %EAX97
  %SF95 = icmp ne i32 %highbit94, 0
  %70 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload90, i32 1)
  %OF96 = extractvalue { i32, i1 } %70, 1
  store i32 %EAX97, i32* %ns_ptr27, align 1
  br label %bb.4

bb.14:                                            ; preds = %bb.4
  %EAX98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 56))
  %71 = load i32, i32* %ns_ptr21, align 1
  %72 = zext i32 %71 to i64
  %73 = zext i32 0 to i64
  %74 = sub i64 %72, %73
  %75 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %72, i64 %73)
  %CF99 = extractvalue { i64, i1 } %75, 1
  %ZF100 = icmp eq i64 %74, 0
  %highbit101 = and i64 -9223372036854775808, %74
  %SF102 = icmp ne i64 %highbit101, 0
  %76 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %72, i64 %73)
  %OF103 = extractvalue { i64, i1 } %76, 1
  %77 = and i64 %74, 255
  %78 = call i64 @llvm.ctpop.i64(i64 %77)
  %79 = and i64 %78, 1
  %PF104 = icmp eq i64 %79, 0
  %CmpZF_JNE = icmp eq i1 %ZF100, false
  br i1 %CmpZF_JNE, label %bb.16, label %bb.15

bb.15:                                            ; preds = %bb.14
  %EAX105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 62))
  br label %bb.16

bb.16:                                            ; preds = %bb.15, %bb.14
  %memload106 = load i32, i32* %ns_ptr3, align 1
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

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 19)}
