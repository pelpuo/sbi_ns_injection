; ModuleID = './bin/oobr_off_by_one_mat'
source_filename = "./bin/oobr_off_by_one_mat"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00%d \00\0ATest Failed: Off by one in integer matrix manipulation leads to Out of Bounds Read\0A\00", align 16, !ROData_SecInfo !0

declare dso_local ptr @memcpy(ptr, ptr, i64)

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
  %3 = inttoptr i64 %2 to ptr
  %4 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %5 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %6 = zext i32 36 to i64
  %7 = call ptr @memcpy(ptr %3, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 16), i64 %6)
  %RAX = ptrtoint ptr %7 to i64
  store i32 0, ptr %RBP_N.52, align 1
  store i32 0, ptr %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.9
  %8 = load i32, ptr %RBP_N.56, align 1
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
  %17 = ptrtoint ptr %stktop_8 to i64
  %18 = add i64 %17, 4
  %19 = inttoptr i64 %18 to ptr
  store i32 0, ptr %19, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.8
  %20 = ptrtoint ptr %stktop_8 to i64
  %21 = add i64 %20, 4
  %22 = inttoptr i64 %21 to ptr
  %23 = load i32, ptr %22, align 1
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
  %memload = load i64, ptr %RBP_N.56, align 1
  %32 = trunc i64 %memload to i32
  %RCX = sext i32 %32 to i64
  %RAX7 = ptrtoint ptr %3 to i64
  %RCX9 = mul i64 %RCX, 12
  %33 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 12)
  %OF8 = extractvalue { i64, i1 } %33, 1
  %RAX13 = add nsw i64 %RAX7, %RCX9
  %highbit10 = and i64 -9223372036854775808, %RAX13
  %SF11 = icmp ne i64 %highbit10, 0
  %ZF12 = icmp eq i64 %RAX13, 0
  %34 = ptrtoint ptr %stktop_8 to i64
  %35 = add i64 %34, 4
  %36 = inttoptr i64 %35 to ptr
  %memload14 = load i64, ptr %36, align 1
  %37 = trunc i64 %memload14 to i32
  %RCX15 = sext i32 %37 to i64
  %memref-idxreg = mul i64 4, %RCX15
  %memref-basereg = add i64 %RAX13, %memref-idxreg
  %38 = inttoptr i64 %memref-basereg to ptr
  %memload16 = load i32, ptr %38, align 1
  store i32 %memload16, ptr %stktop_8, align 1
  %memload17 = load i64, ptr %RBP_N.56, align 1
  %39 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %39 to i64
  %RAX19 = ptrtoint ptr %3 to i64
  %RCX21 = mul i64 %RCX18, 12
  %40 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX18, i64 12)
  %OF20 = extractvalue { i64, i1 } %40, 1
  %RAX25 = add nsw i64 %RAX19, %RCX21
  %highbit22 = and i64 -9223372036854775808, %RAX25
  %SF23 = icmp ne i64 %highbit22, 0
  %ZF24 = icmp eq i64 %RAX25, 0
  %41 = ptrtoint ptr %stktop_8 to i64
  %42 = add i64 %41, 4
  %43 = inttoptr i64 %42 to ptr
  %memload26 = load i64, ptr %43, align 1
  %44 = trunc i64 %memload26 to i32
  %RCX27 = sext i32 %44 to i64
  %memref-idxreg28 = mul i64 4, %RCX27
  %memref-basereg29 = add i64 %RAX25, %memref-idxreg28
  %45 = inttoptr i64 %memref-basereg29 to ptr
  %memload30 = load i32, ptr %45, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 52), i32 %memload30)
  %46 = load i32, ptr %stktop_8, align 1
  %47 = zext i32 %46 to i64
  %48 = zext i32 9 to i64
  %49 = sub i64 %47, %48
  %50 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %47, i64 %48)
  %CF31 = extractvalue { i64, i1 } %50, 1
  %ZF32 = icmp eq i64 %49, 0
  %highbit33 = and i64 -9223372036854775808, %49
  %SF34 = icmp ne i64 %highbit33, 0
  %51 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %47, i64 %48)
  %OF35 = extractvalue { i64, i1 } %51, 1
  %52 = and i64 %49, 255
  %53 = call i64 @llvm.ctpop.i64(i64 %52)
  %54 = and i64 %53, 1
  %PF36 = icmp eq i64 %54, 0
  %ZFCmp_JG71 = icmp eq i1 %ZF32, false
  %SFOFCmp_JG72 = icmp eq i1 %SF34, %OF35
  %ZFAndSFOF_JG73 = and i1 %ZFCmp_JG71, %SFOFCmp_JG72
  br i1 %ZFAndSFOF_JG73, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %55 = load i32, ptr %stktop_8, align 1
  %56 = zext i32 %55 to i64
  %57 = zext i32 1 to i64
  %58 = sub i64 %56, %57
  %59 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %56, i64 %57)
  %CF37 = extractvalue { i64, i1 } %59, 1
  %ZF38 = icmp eq i64 %58, 0
  %highbit39 = and i64 -9223372036854775808, %58
  %SF40 = icmp ne i64 %highbit39, 0
  %60 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %56, i64 %57)
  %OF41 = extractvalue { i64, i1 } %60, 1
  %61 = and i64 %58, 255
  %62 = call i64 @llvm.ctpop.i64(i64 %61)
  %63 = and i64 %62, 1
  %PF42 = icmp eq i64 %63, 0
  %CmpSFOF_JGE = icmp eq i1 %SF40, %OF41
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  store i32 1, ptr %RBP_N.52, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %64 = ptrtoint ptr %stktop_8 to i64
  %65 = add i64 %64, 4
  %66 = inttoptr i64 %65 to ptr
  %memload43 = load i32, ptr %66, align 1
  %EAX50 = add i32 %memload43, 1
  %67 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload43, i32 1)
  %CF44 = extractvalue { i32, i1 } %67, 1
  %68 = and i32 %EAX50, 255
  %69 = call i32 @llvm.ctpop.i32(i32 %68)
  %70 = and i32 %69, 1
  %PF45 = icmp eq i32 %70, 0
  %ZF46 = icmp eq i32 %EAX50, 0
  %highbit47 = and i32 -2147483648, %EAX50
  %SF48 = icmp ne i32 %highbit47, 0
  %71 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload43, i32 1)
  %OF49 = extractvalue { i32, i1 } %71, 1
  %72 = ptrtoint ptr %stktop_8 to i64
  %73 = add i64 %72, 4
  %74 = inttoptr i64 %73 to ptr
  store i32 %EAX50, ptr %74, align 1
  br label %bb.3

bb.9:                                             ; preds = %bb.3
  %EAX51 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 139))
  %memload52 = load i32, ptr %RBP_N.56, align 1
  %EAX59 = add i32 %memload52, 1
  %75 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload52, i32 1)
  %CF53 = extractvalue { i32, i1 } %75, 1
  %76 = and i32 %EAX59, 255
  %77 = call i32 @llvm.ctpop.i32(i32 %76)
  %78 = and i32 %77, 1
  %PF54 = icmp eq i32 %78, 0
  %ZF55 = icmp eq i32 %EAX59, 0
  %highbit56 = and i32 -2147483648, %EAX59
  %SF57 = icmp ne i32 %highbit56, 0
  %79 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload52, i32 1)
  %OF58 = extractvalue { i32, i1 } %79, 1
  store i32 %EAX59, ptr %RBP_N.56, align 1
  br label %bb.1

bb.10:                                            ; preds = %bb.1
  %80 = load i32, ptr %RBP_N.52, align 1
  %81 = zext i32 %80 to i64
  %82 = zext i32 1 to i64
  %83 = sub i64 %81, %82
  %84 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %81, i64 %82)
  %CF60 = extractvalue { i64, i1 } %84, 1
  %ZF61 = icmp eq i64 %83, 0
  %highbit62 = and i64 -9223372036854775808, %83
  %SF63 = icmp ne i64 %highbit62, 0
  %85 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %81, i64 %82)
  %OF64 = extractvalue { i64, i1 } %85, 1
  %86 = and i64 %83, 255
  %87 = call i64 @llvm.ctpop.i64(i64 %86)
  %88 = and i64 %87, 1
  %PF65 = icmp eq i64 %88, 0
  %CmpZF_JNE = icmp eq i1 %ZF61, false
  br i1 %CmpZF_JNE, label %bb.12, label %bb.11

bb.11:                                            ; preds = %bb.10
  %EAX66 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 56))
  br label %bb.12

bb.12:                                            ; preds = %bb.11, %bb.10
  %memload67 = load i32, ptr %RBP_N.4, align 1
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
