; ModuleID = './bin/oobr_off_by_one_mat'
source_filename = "./bin/oobr_off_by_one_mat"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00%d \00\0ATest Failed: Off by one in integer matrix manipulation leads to Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i8* @memcpy(i8*, i8*, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.56 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.52 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %4 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %5 = bitcast i64* %RBP_N.48 to i8*
  %6 = zext i32 36 to i64
  %7 = call i8* @memcpy(i8* %5, i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 16), i64 %6)
  %RAX = ptrtoint i8* %7 to i64
  store i32 0, i32* %RBP_N.52, align 1
  store i32 0, i32* %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.9
  %8 = load i32, i32* %RBP_N.56, align 1
  %9 = zext i32 %8 to i64
  %10 = zext i32 3 to i64
  %11 = sub i64 %9, %10
  %12 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %9, i64 %10)
  %CF = extractvalue { i64, i1 } %12, 1
  %ZF = icmp eq i64 %11, 0
  %highbit = and i64 -9223372036854775808, %11
  %SF = icmp ne i64 %highbit, 0
  %13 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %9, i64 %10)
  %OF = extractvalue { i64, i1 } %13, 1
  %14 = and i64 %11, 255
  %15 = call i64 @llvm.ctpop.i64(i64 %14)
  %16 = and i64 %15, 1
  %PF = icmp eq i64 %16, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.10, label %bb.2

bb.2:                                             ; preds = %bb.1
  %17 = bitcast i64* %RSPAdj_N.64 to i8*
  %18 = getelementptr i8, i8* %17, i64 4
  %19 = bitcast i8* %18 to i32*
  store i32 0, i32* %19, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.8
  %20 = bitcast i64* %RSPAdj_N.64 to i8*
  %21 = getelementptr i8, i8* %20, i64 4
  %22 = bitcast i8* %21 to i32*
  %23 = load i32, i32* %22, align 1
  %24 = zext i32 %23 to i64
  %25 = zext i32 3 to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF1 = extractvalue { i64, i1 } %27, 1
  %ZF2 = icmp eq i64 %26, 0
  %highbit3 = and i64 -9223372036854775808, %26
  %SF4 = icmp ne i64 %highbit3, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF5 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF6 = icmp eq i64 %31, 0
  %ZFCmp_JG68 = icmp eq i1 %ZF2, false
  %SFOFCmp_JG69 = icmp eq i1 %SF4, %OF5
  %ZFAndSFOF_JG70 = and i1 %ZFCmp_JG68, %SFOFCmp_JG69
  br i1 %ZFAndSFOF_JG70, label %bb.9, label %bb.4

bb.4:                                             ; preds = %bb.3
  %32 = bitcast i32* %RBP_N.56 to i64*
  %memload = load i64, i64* %32, align 1
  %33 = trunc i64 %memload to i32
  %RCX = sext i32 %33 to i64
  %RAX7 = ptrtoint i64* %RBP_N.48 to i64
  %RCX9 = mul i64 %RCX, 12
  %34 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 12)
  %OF8 = extractvalue { i64, i1 } %34, 1
  %RAX13 = add nsw i64 %RAX7, %RCX9
  %highbit10 = and i64 -9223372036854775808, %RAX13
  %SF11 = icmp ne i64 %highbit10, 0
  %ZF12 = icmp eq i64 %RAX13, 0
  %35 = bitcast i64* %RSPAdj_N.64 to i8*
  %36 = getelementptr i8, i8* %35, i64 4
  %37 = bitcast i8* %36 to i64*
  %memload14 = load i64, i64* %37, align 1
  %38 = trunc i64 %memload14 to i32
  %RCX15 = sext i32 %38 to i64
  %memref-idxreg = mul i64 4, %RCX15
  %memref-basereg = add i64 %RAX13, %memref-idxreg
  %39 = inttoptr i64 %memref-basereg to i32*
  %memload16 = load i32, i32* %39, align 1
  %40 = bitcast i64* %RSPAdj_N.64 to i32*
  store i32 %memload16, i32* %40, align 1
  %41 = bitcast i32* %RBP_N.56 to i64*
  %memload17 = load i64, i64* %41, align 1
  %42 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %42 to i64
  %RAX19 = ptrtoint i64* %RBP_N.48 to i64
  %RCX21 = mul i64 %RCX18, 12
  %43 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX18, i64 12)
  %OF20 = extractvalue { i64, i1 } %43, 1
  %RAX25 = add nsw i64 %RAX19, %RCX21
  %highbit22 = and i64 -9223372036854775808, %RAX25
  %SF23 = icmp ne i64 %highbit22, 0
  %ZF24 = icmp eq i64 %RAX25, 0
  %44 = bitcast i64* %RSPAdj_N.64 to i8*
  %45 = getelementptr i8, i8* %44, i64 4
  %46 = bitcast i8* %45 to i64*
  %memload26 = load i64, i64* %46, align 1
  %47 = trunc i64 %memload26 to i32
  %RCX27 = sext i32 %47 to i64
  %memref-idxreg28 = mul i64 4, %RCX27
  %memref-basereg29 = add i64 %RAX25, %memref-idxreg28
  %48 = inttoptr i64 %memref-basereg29 to i32*
  %memload30 = load i32, i32* %48, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 52), i32 %memload30)
  %49 = load i64, i64* %RSPAdj_N.64, align 1
  %50 = sub i64 %49, 9
  %51 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %49, i64 9)
  %CF31 = extractvalue { i64, i1 } %51, 1
  %ZF32 = icmp eq i64 %50, 0
  %highbit33 = and i64 -9223372036854775808, %50
  %SF34 = icmp ne i64 %highbit33, 0
  %52 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %49, i64 9)
  %OF35 = extractvalue { i64, i1 } %52, 1
  %53 = and i64 %50, 255
  %54 = call i64 @llvm.ctpop.i64(i64 %53)
  %55 = and i64 %54, 1
  %PF36 = icmp eq i64 %55, 0
  %ZFCmp_JG71 = icmp eq i1 %ZF32, false
  %SFOFCmp_JG72 = icmp eq i1 %SF34, %OF35
  %ZFAndSFOF_JG73 = and i1 %ZFCmp_JG71, %SFOFCmp_JG72
  br i1 %ZFAndSFOF_JG73, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %56 = load i64, i64* %RSPAdj_N.64, align 1
  %57 = sub i64 %56, 1
  %58 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %56, i64 1)
  %CF37 = extractvalue { i64, i1 } %58, 1
  %ZF38 = icmp eq i64 %57, 0
  %highbit39 = and i64 -9223372036854775808, %57
  %SF40 = icmp ne i64 %highbit39, 0
  %59 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %56, i64 1)
  %OF41 = extractvalue { i64, i1 } %59, 1
  %60 = and i64 %57, 255
  %61 = call i64 @llvm.ctpop.i64(i64 %60)
  %62 = and i64 %61, 1
  %PF42 = icmp eq i64 %62, 0
  %CmpSFOF_JGE = icmp eq i1 %SF40, %OF41
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  store i32 1, i32* %RBP_N.52, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %63 = bitcast i64* %RSPAdj_N.64 to i8*
  %64 = getelementptr i8, i8* %63, i64 4
  %65 = bitcast i8* %64 to i32*
  %memload43 = load i32, i32* %65, align 1
  %EAX50 = add i32 %memload43, 1
  %66 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload43, i32 1)
  %CF44 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %EAX50, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF45 = icmp eq i32 %69, 0
  %ZF46 = icmp eq i32 %EAX50, 0
  %highbit47 = and i32 -2147483648, %EAX50
  %SF48 = icmp ne i32 %highbit47, 0
  %70 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload43, i32 1)
  %OF49 = extractvalue { i32, i1 } %70, 1
  %71 = bitcast i64* %RSPAdj_N.64 to i8*
  %72 = getelementptr i8, i8* %71, i64 4
  %73 = bitcast i8* %72 to i32*
  store i32 %EAX50, i32* %73, align 1
  br label %bb.3

bb.9:                                             ; preds = %bb.3
  %EAX51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 139))
  %memload52 = load i32, i32* %RBP_N.56, align 1
  %EAX59 = add i32 %memload52, 1
  %74 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload52, i32 1)
  %CF53 = extractvalue { i32, i1 } %74, 1
  %75 = and i32 %EAX59, 255
  %76 = call i32 @llvm.ctpop.i32(i32 %75)
  %77 = and i32 %76, 1
  %PF54 = icmp eq i32 %77, 0
  %ZF55 = icmp eq i32 %EAX59, 0
  %highbit56 = and i32 -2147483648, %EAX59
  %SF57 = icmp ne i32 %highbit56, 0
  %78 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload52, i32 1)
  %OF58 = extractvalue { i32, i1 } %78, 1
  store i32 %EAX59, i32* %RBP_N.56, align 1
  br label %bb.1

bb.10:                                            ; preds = %bb.1
  %79 = load i32, i32* %RBP_N.52, align 1
  %80 = zext i32 %79 to i64
  %81 = zext i32 1 to i64
  %82 = sub i64 %80, %81
  %83 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %80, i64 %81)
  %CF60 = extractvalue { i64, i1 } %83, 1
  %ZF61 = icmp eq i64 %82, 0
  %highbit62 = and i64 -9223372036854775808, %82
  %SF63 = icmp ne i64 %highbit62, 0
  %84 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %80, i64 %81)
  %OF64 = extractvalue { i64, i1 } %84, 1
  %85 = and i64 %82, 255
  %86 = call i64 @llvm.ctpop.i64(i64 %85)
  %87 = and i64 %86, 1
  %PF65 = icmp eq i64 %87, 0
  %CmpZF_JNE = icmp eq i1 %ZF61, false
  br i1 %CmpZF_JNE, label %bb.12, label %bb.11

bb.11:                                            ; preds = %bb.10
  %EAX66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 56))
  br label %bb.12

bb.12:                                            ; preds = %bb.11, %bb.10
  %memload67 = load i32, i32* %RBP_N.4, align 1
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
