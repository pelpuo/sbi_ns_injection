; ModuleID = './bin/oobw_do_while'
source_filename = "./bin/oobw_do_while"

@rodata_15 = private unnamed_addr constant [98 x i8] c"\01\00\02\00i: %d \09val: %d\0A\00Test Failed: Incorrect usage of do-while loop leading to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.40 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.36 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.32 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 44
  %RBP_N.12 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.8 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.4 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %6 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 5, i32* %RBP_N.8, align 1
  %7 = bitcast i64* %RBP_N.32 to i8*
  %8 = zext i32 20 to i64
  %9 = call i8* @memset(i8* %7, i32 0, i64 %8)
  %RAX = ptrtoint i8* %9 to i64
  store i32 0, i32* %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.1
  %memload = load i32, i32* %RBP_N.36, align 1
  %EAX = add i32 %memload, 1
  %10 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload, i32 1)
  %CF = extractvalue { i32, i1 } %10, 1
  %11 = and i32 %EAX, 255
  %12 = call i32 @llvm.ctpop.i32(i32 %11)
  %13 = and i32 %12, 1
  %PF = icmp eq i32 %13, 0
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %14 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload, i32 1)
  %OF = extractvalue { i32, i1 } %14, 1
  store i32 %EAX, i32* %RBP_N.36, align 1
  %memload1 = load i32, i32* %RBP_N.36, align 1
  %ECX = shl i32 %memload1, 1
  %ZF2 = icmp eq i32 %ECX, 0
  %highbit3 = and i32 -2147483648, %ECX
  %SF4 = icmp ne i32 %highbit3, 0
  %15 = bitcast i32* %RBP_N.36 to i64*
  %memload5 = load i64, i64* %15, align 1
  %16 = trunc i64 %memload5 to i32
  %RAX6 = sext i32 %16 to i64
  %sc-m = mul i64 4, %RAX6
  %17 = bitcast i64* %RBP_N.32 to i8*
  %18 = getelementptr i8, i8* %17, i64 %sc-m
  %19 = bitcast i8* %18 to i64*
  %20 = bitcast i64* %19 to i32*
  store i32 %ECX, i32* %20, align 1
  %memload7 = load i32, i32* %RBP_N.36, align 1
  %21 = load i32, i32* %RBP_N.8, align 1
  %22 = sub i32 %memload7, %21
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload7, i32 %21)
  %CF8 = extractvalue { i32, i1 } %23, 1
  %ZF9 = icmp eq i32 %22, 0
  %highbit10 = and i32 -2147483648, %22
  %SF11 = icmp ne i32 %highbit10, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload7, i32 %21)
  %OF12 = extractvalue { i32, i1 } %24, 1
  %25 = and i32 %22, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %25)
  %27 = and i32 %26, 1
  %PF13 = icmp eq i32 %27, 0
  %SFAndOF_JL = icmp ne i1 %SF11, %OF12
  br i1 %SFAndOF_JL, label %bb.1, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %RBP_N.40, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.4
  %memload14 = load i32, i32* %RBP_N.40, align 1
  %28 = load i32, i32* %RBP_N.8, align 1
  %29 = sub i32 %memload14, %28
  %30 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload14, i32 %28)
  %CF15 = extractvalue { i32, i1 } %30, 1
  %ZF16 = icmp eq i32 %29, 0
  %highbit17 = and i32 -2147483648, %29
  %SF18 = icmp ne i32 %highbit17, 0
  %31 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload14, i32 %28)
  %OF19 = extractvalue { i32, i1 } %31, 1
  %32 = and i32 %29, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %32)
  %34 = and i32 %33, 1
  %PF20 = icmp eq i32 %34, 0
  %ZFCmp_JG = icmp eq i1 %ZF16, false
  %SFOFCmp_JG = icmp eq i1 %SF18, %OF19
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload21 = load i32, i32* %RBP_N.40, align 1
  %35 = bitcast i32* %RBP_N.40 to i64*
  %memload22 = load i64, i64* %35, align 1
  %36 = trunc i64 %memload22 to i32
  %RAX23 = sext i32 %36 to i64
  %sc-m24 = mul i64 4, %RAX23
  %37 = bitcast i64* %RBP_N.32 to i8*
  %38 = getelementptr i8, i8* %37, i64 %sc-m24
  %39 = bitcast i8* %38 to i64*
  %40 = bitcast i64* %39 to i32*
  %memload26 = load i32, i32* %40, align 1
  %EAX27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([98 x i8], [98 x i8]* @rodata_15, i32 0, i32 4), i32 %memload21, i32 %memload26, i32 %ECX)
  %memload28 = load i32, i32* %RBP_N.40, align 1
  %EAX35 = add i32 %memload28, 1
  %41 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload28, i32 1)
  %CF29 = extractvalue { i32, i1 } %41, 1
  %42 = and i32 %EAX35, 255
  %43 = call i32 @llvm.ctpop.i32(i32 %42)
  %44 = and i32 %43, 1
  %PF30 = icmp eq i32 %44, 0
  %ZF31 = icmp eq i32 %EAX35, 0
  %highbit32 = and i32 -2147483648, %EAX35
  %SF33 = icmp ne i32 %highbit32, 0
  %45 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload28, i32 1)
  %OF34 = extractvalue { i32, i1 } %45, 1
  store i32 %EAX35, i32* %RBP_N.40, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  %46 = load i32, i32* %RBP_N.12, align 1
  %47 = zext i32 %46 to i64
  %48 = zext i32 10 to i64
  %49 = sub i64 %47, %48
  %50 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %47, i64 %48)
  %CF36 = extractvalue { i64, i1 } %50, 1
  %ZF37 = icmp eq i64 %49, 0
  %highbit38 = and i64 -9223372036854775808, %49
  %SF39 = icmp ne i64 %highbit38, 0
  %51 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %47, i64 %48)
  %OF40 = extractvalue { i64, i1 } %51, 1
  %52 = and i64 %49, 255
  %53 = call i64 @llvm.ctpop.i64(i64 %52)
  %54 = and i64 %53, 1
  %PF41 = icmp eq i64 %54, 0
  %CmpZF_JNE = icmp eq i1 %ZF37, false
  br i1 %CmpZF_JNE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([98 x i8], [98 x i8]* @rodata_15, i32 0, i32 20))
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  %memload43 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload43
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
