; ModuleID = './protected_bc/oobr_off_by_one_mat.bc'
source_filename = "./bin/oobr_off_by_one_mat"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00%d \00\0ATest Failed: Off by one in integer matrix manipulation leads to Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i8* @memcpy(i8*, i8*, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 68
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i64* %ns_ptr6 to i8*
  %1 = zext i32 36 to i64
  %2 = call i8* @zeno_memcpy(i8* %0, i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 16), i64 %1)
  %RAX = ptrtoint i8* %2 to i64
  store i32 0, i32* %ns_ptr9, align 1
  store i32 0, i32* %ns_ptr12, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.9, %entry
  %3 = load i32, i32* %ns_ptr12, align 1
  %4 = zext i32 %3 to i64
  %5 = zext i32 3 to i64
  %6 = sub i64 %4, %5
  %7 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %4, i64 %5)
  %CF = extractvalue { i64, i1 } %7, 1
  %ZF = icmp eq i64 %6, 0
  %highbit = and i64 -9223372036854775808, %6
  %SF = icmp ne i64 %highbit, 0
  %8 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %4, i64 %5)
  %OF = extractvalue { i64, i1 } %8, 1
  %9 = and i64 %6, 255
  %10 = call i64 @llvm.ctpop.i64(i64 %9)
  %11 = and i64 %10, 1
  %PF = icmp eq i64 %11, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.10, label %bb.2

bb.2:                                             ; preds = %bb.1
  %12 = bitcast i64* %RSPAdj_N.64 to i8*
  %13 = getelementptr i8, i8* %12, i64 4
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.8, %bb.2
  %15 = bitcast i64* %RSPAdj_N.64 to i8*
  %16 = getelementptr i8, i8* %15, i64 4
  %17 = bitcast i8* %16 to i32*
  %18 = load i32, i32* %17, align 1
  %19 = zext i32 %18 to i64
  %20 = zext i32 3 to i64
  %21 = sub i64 %19, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %19, i64 %20)
  %CF1 = extractvalue { i64, i1 } %22, 1
  %ZF2 = icmp eq i64 %21, 0
  %highbit3 = and i64 -9223372036854775808, %21
  %SF4 = icmp ne i64 %highbit3, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %19, i64 %20)
  %OF5 = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF6 = icmp eq i64 %26, 0
  %ZFCmp_JG68 = icmp eq i1 %ZF2, false
  %SFOFCmp_JG69 = icmp eq i1 %SF4, %OF5
  %ZFAndSFOF_JG70 = and i1 %ZFCmp_JG68, %SFOFCmp_JG69
  br i1 %ZFAndSFOF_JG70, label %bb.9, label %bb.4

bb.4:                                             ; preds = %bb.3
  %27 = bitcast i32* %ns_ptr12 to i64*
  %memload = load i64, i64* %27, align 1
  %28 = trunc i64 %memload to i32
  %RCX = sext i32 %28 to i64
  %RAX7 = ptrtoint i64* %ns_ptr6 to i64
  %RCX9 = mul i64 %RCX, 12
  %29 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 12)
  %OF8 = extractvalue { i64, i1 } %29, 1
  %RAX13 = add nsw i64 %RAX7, %RCX9
  %highbit10 = and i64 -9223372036854775808, %RAX13
  %SF11 = icmp ne i64 %highbit10, 0
  %ZF12 = icmp eq i64 %RAX13, 0
  %30 = bitcast i64* %RSPAdj_N.64 to i8*
  %31 = getelementptr i8, i8* %30, i64 4
  %32 = bitcast i8* %31 to i64*
  %memload14 = load i64, i64* %32, align 1
  %33 = trunc i64 %memload14 to i32
  %RCX15 = sext i32 %33 to i64
  %memref-idxreg = mul i64 4, %RCX15
  %memref-basereg = add i64 %RAX13, %memref-idxreg
  %34 = inttoptr i64 %memref-basereg to i32*
  %memload16 = load i32, i32* %34, align 1
  %35 = bitcast i64* %RSPAdj_N.64 to i32*
  store i32 %memload16, i32* %35, align 1
  %36 = bitcast i32* %ns_ptr12 to i64*
  %memload17 = load i64, i64* %36, align 1
  %37 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %37 to i64
  %RAX19 = ptrtoint i64* %ns_ptr6 to i64
  %RCX21 = mul i64 %RCX18, 12
  %38 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX18, i64 12)
  %OF20 = extractvalue { i64, i1 } %38, 1
  %RAX25 = add nsw i64 %RAX19, %RCX21
  %highbit22 = and i64 -9223372036854775808, %RAX25
  %SF23 = icmp ne i64 %highbit22, 0
  %ZF24 = icmp eq i64 %RAX25, 0
  %39 = bitcast i64* %RSPAdj_N.64 to i8*
  %40 = getelementptr i8, i8* %39, i64 4
  %41 = bitcast i8* %40 to i64*
  %memload26 = load i64, i64* %41, align 1
  %42 = trunc i64 %memload26 to i32
  %RCX27 = sext i32 %42 to i64
  %memref-idxreg28 = mul i64 4, %RCX27
  %memref-basereg29 = add i64 %RAX25, %memref-idxreg28
  %43 = inttoptr i64 %memref-basereg29 to i32*
  %memload30 = load i32, i32* %43, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 52), i32 %memload30)
  %44 = load i64, i64* %RSPAdj_N.64, align 1
  %45 = sub i64 %44, 9
  %46 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %44, i64 9)
  %CF31 = extractvalue { i64, i1 } %46, 1
  %ZF32 = icmp eq i64 %45, 0
  %highbit33 = and i64 -9223372036854775808, %45
  %SF34 = icmp ne i64 %highbit33, 0
  %47 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %44, i64 9)
  %OF35 = extractvalue { i64, i1 } %47, 1
  %48 = and i64 %45, 255
  %49 = call i64 @llvm.ctpop.i64(i64 %48)
  %50 = and i64 %49, 1
  %PF36 = icmp eq i64 %50, 0
  %ZFCmp_JG71 = icmp eq i1 %ZF32, false
  %SFOFCmp_JG72 = icmp eq i1 %SF34, %OF35
  %ZFAndSFOF_JG73 = and i1 %ZFCmp_JG71, %SFOFCmp_JG72
  br i1 %ZFAndSFOF_JG73, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %51 = load i64, i64* %RSPAdj_N.64, align 1
  %52 = sub i64 %51, 1
  %53 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %51, i64 1)
  %CF37 = extractvalue { i64, i1 } %53, 1
  %ZF38 = icmp eq i64 %52, 0
  %highbit39 = and i64 -9223372036854775808, %52
  %SF40 = icmp ne i64 %highbit39, 0
  %54 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %51, i64 1)
  %OF41 = extractvalue { i64, i1 } %54, 1
  %55 = and i64 %52, 255
  %56 = call i64 @llvm.ctpop.i64(i64 %55)
  %57 = and i64 %56, 1
  %PF42 = icmp eq i64 %57, 0
  %CmpSFOF_JGE = icmp eq i1 %SF40, %OF41
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  store i32 1, i32* %ns_ptr9, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %58 = bitcast i64* %RSPAdj_N.64 to i8*
  %59 = getelementptr i8, i8* %58, i64 4
  %60 = bitcast i8* %59 to i32*
  %memload43 = load i32, i32* %60, align 1
  %EAX50 = add i32 %memload43, 1
  %61 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload43, i32 1)
  %CF44 = extractvalue { i32, i1 } %61, 1
  %62 = and i32 %EAX50, 255
  %63 = call i32 @llvm.ctpop.i32(i32 %62)
  %64 = and i32 %63, 1
  %PF45 = icmp eq i32 %64, 0
  %ZF46 = icmp eq i32 %EAX50, 0
  %highbit47 = and i32 -2147483648, %EAX50
  %SF48 = icmp ne i32 %highbit47, 0
  %65 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload43, i32 1)
  %OF49 = extractvalue { i32, i1 } %65, 1
  %66 = bitcast i64* %RSPAdj_N.64 to i8*
  %67 = getelementptr i8, i8* %66, i64 4
  %68 = bitcast i8* %67 to i32*
  store i32 %EAX50, i32* %68, align 1
  br label %bb.3

bb.9:                                             ; preds = %bb.3
  %EAX51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 139))
  %memload52 = load i32, i32* %ns_ptr12, align 1
  %EAX59 = add i32 %memload52, 1
  %69 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload52, i32 1)
  %CF53 = extractvalue { i32, i1 } %69, 1
  %70 = and i32 %EAX59, 255
  %71 = call i32 @llvm.ctpop.i32(i32 %70)
  %72 = and i32 %71, 1
  %PF54 = icmp eq i32 %72, 0
  %ZF55 = icmp eq i32 %EAX59, 0
  %highbit56 = and i32 -2147483648, %EAX59
  %SF57 = icmp ne i32 %highbit56, 0
  %73 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload52, i32 1)
  %OF58 = extractvalue { i32, i1 } %73, 1
  store i32 %EAX59, i32* %ns_ptr12, align 1
  br label %bb.1

bb.10:                                            ; preds = %bb.1
  %74 = load i32, i32* %ns_ptr9, align 1
  %75 = zext i32 %74 to i64
  %76 = zext i32 1 to i64
  %77 = sub i64 %75, %76
  %78 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %75, i64 %76)
  %CF60 = extractvalue { i64, i1 } %78, 1
  %ZF61 = icmp eq i64 %77, 0
  %highbit62 = and i64 -9223372036854775808, %77
  %SF63 = icmp ne i64 %highbit62, 0
  %79 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %75, i64 %76)
  %OF64 = extractvalue { i64, i1 } %79, 1
  %80 = and i64 %77, 255
  %81 = call i64 @llvm.ctpop.i64(i64 %80)
  %82 = and i64 %81, 1
  %PF65 = icmp eq i64 %82, 0
  %CmpZF_JNE = icmp eq i1 %ZF61, false
  br i1 %CmpZF_JNE, label %bb.12, label %bb.11

bb.11:                                            ; preds = %bb.10
  %EAX66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 56))
  br label %bb.12

bb.12:                                            ; preds = %bb.11, %bb.10
  %memload67 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload67
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_memcpy(i8*, i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
