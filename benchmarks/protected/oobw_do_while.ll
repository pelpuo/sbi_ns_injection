; ModuleID = './protected_bc/oobw_do_while.bc'
source_filename = "./bin/oobw_do_while"

@rodata_15 = private unnamed_addr constant [98 x i8] c"\01\00\02\00i: %d \09val: %d\0A\00Test Failed: Incorrect usage of do-while loop leading to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 44
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i32 5, i32* %ns_ptr6, align 1
  %0 = bitcast i64* %ns_ptr12 to i8*
  %1 = zext i32 20 to i64
  %2 = call i8* @memset(i8* %0, i32 0, i64 %1)
  %RAX = ptrtoint i8* %2 to i64
  store i32 0, i32* %ns_ptr15, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.1, %entry
  %memload = load i32, i32* %ns_ptr15, align 1
  %EAX = add i32 %memload, 1
  %3 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload, i32 1)
  %CF = extractvalue { i32, i1 } %3, 1
  %4 = and i32 %EAX, 255
  %5 = call i32 @llvm.ctpop.i32(i32 %4)
  %6 = and i32 %5, 1
  %PF = icmp eq i32 %6, 0
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %7 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload, i32 1)
  %OF = extractvalue { i32, i1 } %7, 1
  store i32 %EAX, i32* %ns_ptr15, align 1
  %memload1 = load i32, i32* %ns_ptr15, align 1
  %ECX = shl i32 %memload1, 1
  %ZF2 = icmp eq i32 %ECX, 0
  %highbit3 = and i32 -2147483648, %ECX
  %SF4 = icmp ne i32 %highbit3, 0
  %8 = bitcast i32* %ns_ptr15 to i64*
  %memload5 = load i64, i64* %8, align 1
  %9 = trunc i64 %memload5 to i32
  %RAX6 = sext i32 %9 to i64
  %sc-m = mul i64 4, %RAX6
  %10 = bitcast i64* %ns_ptr12 to i8*
  %11 = getelementptr i8, i8* %10, i64 %sc-m
  %12 = bitcast i8* %11 to i64*
  %13 = bitcast i64* %12 to i32*
  store i32 %ECX, i32* %13, align 1
  %memload7 = load i32, i32* %ns_ptr15, align 1
  %14 = load i32, i32* %ns_ptr6, align 1
  %15 = sub i32 %memload7, %14
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload7, i32 %14)
  %CF8 = extractvalue { i32, i1 } %16, 1
  %ZF9 = icmp eq i32 %15, 0
  %highbit10 = and i32 -2147483648, %15
  %SF11 = icmp ne i32 %highbit10, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload7, i32 %14)
  %OF12 = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF13 = icmp eq i32 %20, 0
  %SFAndOF_JL = icmp ne i1 %SF11, %OF12
  br i1 %SFAndOF_JL, label %bb.1, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %ns_ptr18, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.4, %bb.2
  %memload14 = load i32, i32* %ns_ptr18, align 1
  %21 = load i32, i32* %ns_ptr6, align 1
  %22 = sub i32 %memload14, %21
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload14, i32 %21)
  %CF15 = extractvalue { i32, i1 } %23, 1
  %ZF16 = icmp eq i32 %22, 0
  %highbit17 = and i32 -2147483648, %22
  %SF18 = icmp ne i32 %highbit17, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload14, i32 %21)
  %OF19 = extractvalue { i32, i1 } %24, 1
  %25 = and i32 %22, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %25)
  %27 = and i32 %26, 1
  %PF20 = icmp eq i32 %27, 0
  %ZFCmp_JG = icmp eq i1 %ZF16, false
  %SFOFCmp_JG = icmp eq i1 %SF18, %OF19
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload21 = load i32, i32* %ns_ptr18, align 1
  %28 = bitcast i32* %ns_ptr18 to i64*
  %memload22 = load i64, i64* %28, align 1
  %29 = trunc i64 %memload22 to i32
  %RAX23 = sext i32 %29 to i64
  %sc-m24 = mul i64 4, %RAX23
  %30 = bitcast i64* %ns_ptr12 to i8*
  %31 = getelementptr i8, i8* %30, i64 %sc-m24
  %32 = bitcast i8* %31 to i64*
  %33 = bitcast i64* %32 to i32*
  %memload26 = load i32, i32* %33, align 1
  %EAX27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([98 x i8], [98 x i8]* @rodata_15, i32 0, i32 4), i32 %memload21, i32 %memload26, i32 %ECX)
  %memload28 = load i32, i32* %ns_ptr18, align 1
  %EAX35 = add i32 %memload28, 1
  %34 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload28, i32 1)
  %CF29 = extractvalue { i32, i1 } %34, 1
  %35 = and i32 %EAX35, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %35)
  %37 = and i32 %36, 1
  %PF30 = icmp eq i32 %37, 0
  %ZF31 = icmp eq i32 %EAX35, 0
  %highbit32 = and i32 -2147483648, %EAX35
  %SF33 = icmp ne i32 %highbit32, 0
  %38 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload28, i32 1)
  %OF34 = extractvalue { i32, i1 } %38, 1
  store i32 %EAX35, i32* %ns_ptr18, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  %39 = load i32, i32* %ns_ptr9, align 1
  %40 = zext i32 %39 to i64
  %41 = zext i32 10 to i64
  %42 = sub i64 %40, %41
  %43 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %40, i64 %41)
  %CF36 = extractvalue { i64, i1 } %43, 1
  %ZF37 = icmp eq i64 %42, 0
  %highbit38 = and i64 -9223372036854775808, %42
  %SF39 = icmp ne i64 %highbit38, 0
  %44 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %40, i64 %41)
  %OF40 = extractvalue { i64, i1 } %44, 1
  %45 = and i64 %42, 255
  %46 = call i64 @llvm.ctpop.i64(i64 %45)
  %47 = and i64 %46, 1
  %PF41 = icmp eq i64 %47, 0
  %CmpZF_JNE = icmp eq i1 %ZF37, false
  br i1 %CmpZF_JNE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([98 x i8], [98 x i8]* @rodata_15, i32 0, i32 20))
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  %memload43 = load i32, i32* %ns_ptr3, align 1
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

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
