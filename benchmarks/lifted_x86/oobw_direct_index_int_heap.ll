; ModuleID = './bin/oobw_direct_index_int_heap'
source_filename = "./bin/oobw_direct_index_int_heap"

@rodata_18 = private unnamed_addr constant [82 x i8] c"\01\00\02\00\00\00\00\00%p\0A\00%p\0A\0A\00%d \00\00\00\00Test Failed: Direct int array on heap Out of Bounds Write\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @putchar(i32)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %RCX-SKT-LOC = alloca i64, align 8
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.20 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %4 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %5 = zext i32 32 to i64
  %6 = call ptr @malloc(i64 %5)
  %RAX = ptrtoint ptr %6 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %7 = zext i32 32 to i64
  %8 = call ptr @malloc(i64 %7)
  %RAX1 = ptrtoint ptr %8 to i64
  store i64 %RAX1, ptr %RBP_N.8, align 1
  store i32 0, ptr %stktop_8, align 1
  store i64 0, ptr %RCX-SKT-LOC, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %9 = load i32, ptr %stktop_8, align 1
  %10 = zext i32 %9 to i64
  %11 = zext i32 4 to i64
  %12 = sub i64 %10, %11
  %13 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %10, i64 %11)
  %CF = extractvalue { i64, i1 } %13, 1
  %ZF = icmp eq i64 %12, 0
  %highbit = and i64 -9223372036854775808, %12
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %10, i64 %11)
  %OF = extractvalue { i64, i1 } %14, 1
  %15 = and i64 %12, 255
  %16 = call i64 @llvm.ctpop.i64(i64 %15)
  %17 = and i64 %16, 1
  %PF = icmp eq i64 %17, 0
  %CmpZF_JLE = icmp eq i1 %ZF, true
  %CmpOF_JLE = icmp ne i1 %SF, %OF
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.1, label %bb.3

bb.3:                                             ; preds = %bb.2
  %18 = ptrtoint ptr %stktop_8 to i64
  %19 = add i64 %18, 4
  %20 = inttoptr i64 %19 to ptr
  store i32 0, ptr %20, align 1
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %21 = ptrtoint ptr %stktop_8 to i64
  %22 = add i64 %21, 4
  %23 = inttoptr i64 %22 to ptr
  %24 = load i32, ptr %23, align 1
  %25 = zext i32 %24 to i64
  %26 = zext i32 4 to i64
  %27 = sub i64 %25, %26
  %28 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %25, i64 %26)
  %CF2 = extractvalue { i64, i1 } %28, 1
  %ZF3 = icmp eq i64 %27, 0
  %highbit4 = and i64 -9223372036854775808, %27
  %SF5 = icmp ne i64 %highbit4, 0
  %29 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %25, i64 %26)
  %OF6 = extractvalue { i64, i1 } %29, 1
  %30 = and i64 %27, 255
  %31 = call i64 @llvm.ctpop.i64(i64 %30)
  %32 = and i64 %31, 1
  %PF7 = icmp eq i64 %32, 0
  %CmpZF_JLE92 = icmp eq i1 %ZF3, true
  %CmpOF_JLE93 = icmp ne i1 %SF5, %OF6
  %ZFOrSF_JLE94 = or i1 %CmpZF_JLE92, %CmpOF_JLE93
  br i1 %ZFOrSF_JLE94, label %bb.4, label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([82 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload)
  %memload9 = load i64, ptr %RBP_N.8, align 1
  %EAX11 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([82 x i8], ptr @rodata_18, i32 0, i32 12), i64 %memload9)
  %memload12 = load i64, ptr %RBP_N.16, align 1
  %RAX19 = add i64 %memload12, 48
  %33 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload12, i64 48)
  %CF13 = extractvalue { i64, i1 } %33, 1
  %34 = and i64 %RAX19, 255
  %35 = call i64 @llvm.ctpop.i64(i64 %34)
  %36 = and i64 %35, 1
  %PF14 = icmp eq i64 %36, 0
  %ZF15 = icmp eq i64 %RAX19, 0
  %highbit16 = and i64 -9223372036854775808, %RAX19
  %SF17 = icmp ne i64 %highbit16, 0
  %37 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload12, i64 48)
  %OF18 = extractvalue { i64, i1 } %37, 1
  %38 = inttoptr i64 %RAX19 to ptr
  store i32 420, ptr %38, align 1
  store i32 0, ptr %RBP_N.24, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6
  %39 = load i32, ptr %RBP_N.24, align 1
  %40 = zext i32 %39 to i64
  %41 = zext i32 4 to i64
  %42 = sub i64 %40, %41
  %43 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %40, i64 %41)
  %CF20 = extractvalue { i64, i1 } %43, 1
  %ZF21 = icmp eq i64 %42, 0
  %highbit22 = and i64 -9223372036854775808, %42
  %SF23 = icmp ne i64 %highbit22, 0
  %44 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %40, i64 %41)
  %OF24 = extractvalue { i64, i1 } %44, 1
  %45 = and i64 %42, 255
  %46 = call i64 @llvm.ctpop.i64(i64 %45)
  %47 = and i64 %46, 1
  %PF25 = icmp eq i64 %47, 0
  %CmpZF_JLE95 = icmp eq i1 %ZF21, true
  %CmpOF_JLE96 = icmp ne i1 %SF23, %OF24
  %ZFOrSF_JLE97 = or i1 %CmpZF_JLE95, %CmpOF_JLE96
  br i1 %ZFOrSF_JLE97, label %bb.7, label %bb.9

bb.9:                                             ; preds = %bb.8
  %EAX26 = call i32 @putchar(i32 10)
  store i32 0, ptr %RBP_N.20, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.12, %bb.9
  %48 = load i32, ptr %RBP_N.20, align 1
  %49 = zext i32 %48 to i64
  %50 = zext i32 4 to i64
  %51 = sub i64 %49, %50
  %52 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %49, i64 %50)
  %CF27 = extractvalue { i64, i1 } %52, 1
  %ZF28 = icmp eq i64 %51, 0
  %highbit29 = and i64 -9223372036854775808, %51
  %SF30 = icmp ne i64 %highbit29, 0
  %53 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %49, i64 %50)
  %OF31 = extractvalue { i64, i1 } %53, 1
  %54 = and i64 %51, 255
  %55 = call i64 @llvm.ctpop.i64(i64 %54)
  %56 = and i64 %55, 1
  %PF32 = icmp eq i64 %56, 0
  %CmpZF_JLE98 = icmp eq i1 %ZF28, true
  %CmpOF_JLE99 = icmp ne i1 %SF30, %OF31
  %ZFOrSF_JLE100 = or i1 %CmpZF_JLE98, %CmpOF_JLE99
  br i1 %ZFOrSF_JLE100, label %bb.10, label %bb.14

bb.10:                                            ; preds = %bb.13
  %memload33 = load i32, ptr %RBP_N.20, align 1
  %RAX34 = sext i32 %memload33 to i64
  %memref-idxreg = mul i64 4, %RAX34
  %memload35 = load i64, ptr %RBP_N.8, align 1
  %RAX39 = add nsw i64 %memload35, %memref-idxreg
  %highbit36 = and i64 -9223372036854775808, %RAX39
  %SF37 = icmp ne i64 %highbit36, 0
  %ZF38 = icmp eq i64 %RAX39, 0
  %57 = inttoptr i64 %RAX39 to ptr
  %memload40 = load i32, ptr %57, align 1
  %58 = sub i32 %memload40, 9
  %59 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload40, i32 9)
  %CF41 = extractvalue { i32, i1 } %59, 1
  %ZF42 = icmp eq i32 %58, 0
  %highbit43 = and i32 -2147483648, %58
  %SF44 = icmp ne i32 %highbit43, 0
  %60 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload40, i32 9)
  %OF45 = extractvalue { i32, i1 } %60, 1
  %61 = and i32 %58, 255
  %62 = call i32 @llvm.ctpop.i32(i32 %61)
  %63 = and i32 %62, 1
  %PF46 = icmp eq i32 %63, 0
  %CmpZF_JLE101 = icmp eq i1 %ZF42, true
  %CmpOF_JLE102 = icmp ne i1 %SF44, %OF45
  %ZFOrSF_JLE103 = or i1 %CmpZF_JLE101, %CmpOF_JLE102
  br i1 %ZFOrSF_JLE103, label %bb.12, label %bb.11

bb.11:                                            ; preds = %bb.10
  %EAX48 = call i32 @puts(ptr getelementptr inbounds ([82 x i8], ptr @rodata_18, i32 0, i32 24))
  br label %bb.14

bb.14:                                            ; preds = %bb.11, %bb.13
  ret i32 0

bb.12:                                            ; preds = %bb.10
  %64 = zext i8 1 to i32
  %65 = load i32, ptr %RBP_N.20, align 1
  %66 = add i32 %65, %64
  %67 = and i32 %66, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF49 = icmp eq i32 %69, 0
  store i32 %66, ptr %RBP_N.20, align 1
  br label %bb.13

bb.7:                                             ; preds = %bb.8
  %memload50 = load i32, ptr %RBP_N.24, align 1
  %RAX51 = sext i32 %memload50 to i64
  %memref-idxreg52 = mul i64 4, %RAX51
  %memload53 = load i64, ptr %RBP_N.8, align 1
  %RAX57 = add nsw i64 %memload53, %memref-idxreg52
  %highbit54 = and i64 -9223372036854775808, %RAX57
  %SF55 = icmp ne i64 %highbit54, 0
  %ZF56 = icmp eq i64 %RAX57, 0
  %70 = inttoptr i64 %RAX57 to ptr
  %memload58 = load i32, ptr %70, align 1
  %RCX = load i64, ptr %RCX-SKT-LOC, align 1
  %EAX60 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([82 x i8], ptr @rodata_18, i32 0, i32 17), i32 %memload58, i64 %memref-idxreg52, i64 %RCX)
  %71 = zext i8 1 to i32
  %72 = load i32, ptr %RBP_N.24, align 1
  %73 = add i32 %72, %71
  %74 = and i32 %73, 255
  %75 = call i32 @llvm.ctpop.i32(i32 %74)
  %76 = and i32 %75, 1
  %PF61 = icmp eq i32 %76, 0
  store i32 %73, ptr %RBP_N.24, align 1
  br label %bb.8

bb.4:                                             ; preds = %bb.5
  %77 = ptrtoint ptr %stktop_8 to i64
  %78 = add i64 %77, 4
  %79 = inttoptr i64 %78 to ptr
  %memload62 = load i32, ptr %79, align 1
  %RAX63 = sext i32 %memload62 to i64
  %memref-idxreg64 = mul i64 4, %RAX63
  %memload65 = load i64, ptr %RBP_N.8, align 1
  %RAX69 = add nsw i64 %memload65, %memref-idxreg64
  %highbit66 = and i64 -9223372036854775808, %RAX69
  %SF67 = icmp ne i64 %highbit66, 0
  %ZF68 = icmp eq i64 %RAX69, 0
  %80 = ptrtoint ptr %stktop_8 to i64
  %81 = add i64 %80, 4
  %82 = inttoptr i64 %81 to ptr
  %memload70 = load i32, ptr %82, align 1
  %EDX = add i32 %memload70, 1
  %83 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload70, i32 1)
  %CF71 = extractvalue { i32, i1 } %83, 1
  %84 = and i32 %EDX, 255
  %85 = call i32 @llvm.ctpop.i32(i32 %84)
  %86 = and i32 %85, 1
  %PF72 = icmp eq i32 %86, 0
  %ZF73 = icmp eq i32 %EDX, 0
  %highbit74 = and i32 -2147483648, %EDX
  %SF75 = icmp ne i32 %highbit74, 0
  %87 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload70, i32 1)
  %OF76 = extractvalue { i32, i1 } %87, 1
  %88 = inttoptr i64 %RAX69 to ptr
  store i32 %EDX, ptr %88, align 1
  %89 = ptrtoint ptr %stktop_8 to i64
  %90 = add i64 %89, 4
  %91 = inttoptr i64 %90 to ptr
  %92 = zext i8 1 to i32
  %93 = load i32, ptr %91, align 1
  %94 = add i32 %93, %92
  %95 = and i32 %94, 255
  %96 = call i32 @llvm.ctpop.i32(i32 %95)
  %97 = and i32 %96, 1
  %PF77 = icmp eq i32 %97, 0
  store i32 %94, ptr %91, align 1
  br label %bb.5

bb.1:                                             ; preds = %bb.2
  %memload78 = load i32, ptr %stktop_8, align 1
  %memref-disp = add i32 %memload78, 1
  %memload79 = load i32, ptr %stktop_8, align 1
  %RAX80 = sext i32 %memload79 to i64
  %memref-idxreg81 = mul i64 4, %RAX80
  %memload82 = load i64, ptr %RBP_N.16, align 1
  %RAX86 = add nsw i64 %memload82, %memref-idxreg81
  %highbit83 = and i64 -9223372036854775808, %RAX86
  %SF84 = icmp ne i64 %highbit83, 0
  %ZF85 = icmp eq i64 %RAX86, 0
  %EDX90 = add nsw i32 %memref-disp, %memref-disp
  %highbit87 = and i32 -2147483648, %EDX90
  %SF88 = icmp ne i32 %highbit87, 0
  %ZF89 = icmp eq i32 %EDX90, 0
  %98 = inttoptr i64 %RAX86 to ptr
  store i32 %EDX90, ptr %98, align 1
  %99 = zext i8 1 to i32
  %100 = load i32, ptr %stktop_8, align 1
  %101 = add i32 %100, %99
  %102 = and i32 %101, 255
  %103 = call i32 @llvm.ctpop.i32(i32 %102)
  %104 = and i32 %103, 1
  %PF91 = icmp eq i32 %104, 0
  store i32 %101, ptr %stktop_8, align 1
  store i64 %memref-idxreg81, ptr %RCX-SKT-LOC, align 1
  br label %bb.2
}

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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
