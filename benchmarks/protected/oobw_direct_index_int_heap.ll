; ModuleID = './protected_bc/oobw_direct_index_int_heap.bc'
source_filename = "./bin/oobw_direct_index_int_heap"

@rodata_15 = private unnamed_addr constant [76 x i8] c"\01\00\02\00%p\0A\00%p\0A\0A\00%d \00Test Failed: Direct int array on heap Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 32 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %2 = zext i32 32 to i64
  %3 = call i8* @zeno_malloc(i64 %2)
  %RAX1 = ptrtoint i8* %3 to i64
  store i64 %RAX1, i64* %ns_ptr9, align 1
  store i32 0, i32* %ns_ptr12, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %4 = load i32, i32* %ns_ptr12, align 1
  %5 = zext i32 %4 to i64
  %6 = zext i32 5 to i64
  %7 = sub i64 %5, %6
  %8 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %5, i64 %6)
  %CF = extractvalue { i64, i1 } %8, 1
  %ZF = icmp eq i64 %7, 0
  %highbit = and i64 -9223372036854775808, %7
  %SF = icmp ne i64 %highbit, 0
  %9 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %5, i64 %6)
  %OF = extractvalue { i64, i1 } %9, 1
  %10 = and i64 %7, 255
  %11 = call i64 @llvm.ctpop.i64(i64 %10)
  %12 = and i64 %11, 1
  %PF = icmp eq i64 %12, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload = load i32, i32* %ns_ptr12, align 1
  %EDX = add i32 %memload, 1
  %13 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload, i32 1)
  %CF2 = extractvalue { i32, i1 } %13, 1
  %14 = and i32 %EDX, 255
  %15 = call i32 @llvm.ctpop.i32(i32 %14)
  %16 = and i32 %15, 1
  %PF3 = icmp eq i32 %16, 0
  %ZF4 = icmp eq i32 %EDX, 0
  %highbit5 = and i32 -2147483648, %EDX
  %SF6 = icmp ne i32 %highbit5, 0
  %17 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload, i32 1)
  %OF7 = extractvalue { i32, i1 } %17, 1
  %EDX11 = shl i32 %EDX, 1
  %ZF8 = icmp eq i32 %EDX11, 0
  %highbit9 = and i32 -2147483648, %EDX11
  %SF10 = icmp ne i32 %highbit9, 0
  %memload12 = load i64, i64* %ns_ptr6, align 1
  %18 = bitcast i32* %ns_ptr12 to i64*
  %memload13 = load i64, i64* %18, align 1
  %19 = trunc i64 %memload13 to i32
  %RCX = sext i32 %19 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload12, %memref-idxreg
  %20 = inttoptr i64 %memref-basereg to i32*
  store i32 %EDX11, i32* %20, align 1
  %memload14 = load i32, i32* %ns_ptr12, align 1
  %EAX = add i32 %memload14, 1
  %21 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload14, i32 1)
  %CF15 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %EAX, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF16 = icmp eq i32 %24, 0
  %ZF17 = icmp eq i32 %EAX, 0
  %highbit18 = and i32 -2147483648, %EAX
  %SF19 = icmp ne i32 %highbit18, 0
  %25 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload14, i32 1)
  %OF20 = extractvalue { i32, i1 } %25, 1
  store i32 %EAX, i32* %ns_ptr12, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  store i32 0, i32* %ns_ptr15, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.5, %bb.3
  %26 = load i32, i32* %ns_ptr15, align 1
  %27 = zext i32 %26 to i64
  %28 = zext i32 5 to i64
  %29 = sub i64 %27, %28
  %30 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %27, i64 %28)
  %CF21 = extractvalue { i64, i1 } %30, 1
  %ZF22 = icmp eq i64 %29, 0
  %highbit23 = and i64 -9223372036854775808, %29
  %SF24 = icmp ne i64 %highbit23, 0
  %31 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %27, i64 %28)
  %OF25 = extractvalue { i64, i1 } %31, 1
  %32 = and i64 %29, 255
  %33 = call i64 @llvm.ctpop.i64(i64 %32)
  %34 = and i64 %33, 1
  %PF26 = icmp eq i64 %34, 0
  %CmpSFOF_JGE101 = icmp eq i1 %SF24, %OF25
  br i1 %CmpSFOF_JGE101, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload27 = load i32, i32* %ns_ptr15, align 1
  %EDX34 = add i32 %memload27, 1
  %35 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload27, i32 1)
  %CF28 = extractvalue { i32, i1 } %35, 1
  %36 = and i32 %EDX34, 255
  %37 = call i32 @llvm.ctpop.i32(i32 %36)
  %38 = and i32 %37, 1
  %PF29 = icmp eq i32 %38, 0
  %ZF30 = icmp eq i32 %EDX34, 0
  %highbit31 = and i32 -2147483648, %EDX34
  %SF32 = icmp ne i32 %highbit31, 0
  %39 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload27, i32 1)
  %OF33 = extractvalue { i32, i1 } %39, 1
  %memload35 = load i64, i64* %ns_ptr9, align 1
  %40 = bitcast i32* %ns_ptr15 to i64*
  %memload36 = load i64, i64* %40, align 1
  %41 = trunc i64 %memload36 to i32
  %RCX37 = sext i32 %41 to i64
  %memref-idxreg38 = mul i64 4, %RCX37
  %memref-basereg39 = add i64 %memload35, %memref-idxreg38
  %42 = inttoptr i64 %memref-basereg39 to i32*
  store i32 %EDX34, i32* %42, align 1
  %memload40 = load i32, i32* %ns_ptr15, align 1
  %EAX47 = add i32 %memload40, 1
  %43 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload40, i32 1)
  %CF41 = extractvalue { i32, i1 } %43, 1
  %44 = and i32 %EAX47, 255
  %45 = call i32 @llvm.ctpop.i32(i32 %44)
  %46 = and i32 %45, 1
  %PF42 = icmp eq i32 %46, 0
  %ZF43 = icmp eq i32 %EAX47, 0
  %highbit44 = and i32 -2147483648, %EAX47
  %SF45 = icmp ne i32 %highbit44, 0
  %47 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload40, i32 1)
  %OF46 = extractvalue { i32, i1 } %47, 1
  store i32 %EAX47, i32* %ns_ptr15, align 1
  br label %bb.4

bb.6:                                             ; preds = %bb.4
  %memload48 = load i64, i64* %ns_ptr6, align 1
  %EAX49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 4), i64 %memload48)
  %memload50 = load i64, i64* %ns_ptr9, align 1
  %EAX51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 8), i64 %memload50)
  %memload52 = load i64, i64* %ns_ptr6, align 1
  %memref-disp = add i64 %memload52, 48
  %48 = inttoptr i64 %memref-disp to i32*
  store i32 420, i32* %48, align 1
  store i32 0, i32* %ns_ptr18, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.8, %bb.6
  %49 = load i32, i32* %ns_ptr18, align 1
  %50 = zext i32 %49 to i64
  %51 = zext i32 5 to i64
  %52 = sub i64 %50, %51
  %53 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %50, i64 %51)
  %CF53 = extractvalue { i64, i1 } %53, 1
  %ZF54 = icmp eq i64 %52, 0
  %highbit55 = and i64 -9223372036854775808, %52
  %SF56 = icmp ne i64 %highbit55, 0
  %54 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %50, i64 %51)
  %OF57 = extractvalue { i64, i1 } %54, 1
  %55 = and i64 %52, 255
  %56 = call i64 @llvm.ctpop.i64(i64 %55)
  %57 = and i64 %56, 1
  %PF58 = icmp eq i64 %57, 0
  %CmpSFOF_JGE102 = icmp eq i1 %SF56, %OF57
  br i1 %CmpSFOF_JGE102, label %bb.9, label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload59 = load i64, i64* %ns_ptr9, align 1
  %58 = bitcast i32* %ns_ptr18 to i64*
  %memload60 = load i64, i64* %58, align 1
  %59 = trunc i64 %memload60 to i32
  %RCX61 = sext i32 %59 to i64
  %memref-idxreg62 = mul i64 4, %RCX61
  %memref-basereg63 = add i64 %memload59, %memref-idxreg62
  %60 = inttoptr i64 %memref-basereg63 to i32*
  %memload64 = load i32, i32* %60, align 1
  %EAX65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 13), i32 %memload64)
  %memload66 = load i32, i32* %ns_ptr18, align 1
  %EAX73 = add i32 %memload66, 1
  %61 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload66, i32 1)
  %CF67 = extractvalue { i32, i1 } %61, 1
  %62 = and i32 %EAX73, 255
  %63 = call i32 @llvm.ctpop.i32(i32 %62)
  %64 = and i32 %63, 1
  %PF68 = icmp eq i32 %64, 0
  %ZF69 = icmp eq i32 %EAX73, 0
  %highbit70 = and i32 -2147483648, %EAX73
  %SF71 = icmp ne i32 %highbit70, 0
  %65 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload66, i32 1)
  %OF72 = extractvalue { i32, i1 } %65, 1
  store i32 %EAX73, i32* %ns_ptr18, align 1
  br label %bb.7

bb.9:                                             ; preds = %bb.7
  %EAX74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 11))
  store i32 0, i32* %ns_ptr21, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.14, %bb.9
  %66 = load i32, i32* %ns_ptr21, align 1
  %67 = zext i32 %66 to i64
  %68 = zext i32 5 to i64
  %69 = sub i64 %67, %68
  %70 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %67, i64 %68)
  %CF75 = extractvalue { i64, i1 } %70, 1
  %ZF76 = icmp eq i64 %69, 0
  %highbit77 = and i64 -9223372036854775808, %69
  %SF78 = icmp ne i64 %highbit77, 0
  %71 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %67, i64 %68)
  %OF79 = extractvalue { i64, i1 } %71, 1
  %72 = and i64 %69, 255
  %73 = call i64 @llvm.ctpop.i64(i64 %72)
  %74 = and i64 %73, 1
  %PF80 = icmp eq i64 %74, 0
  %CmpSFOF_JGE103 = icmp eq i1 %SF78, %OF79
  br i1 %CmpSFOF_JGE103, label %bb.15, label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload81 = load i64, i64* %ns_ptr9, align 1
  %75 = bitcast i32* %ns_ptr21 to i64*
  %memload82 = load i64, i64* %75, align 1
  %76 = trunc i64 %memload82 to i32
  %RCX83 = sext i32 %76 to i64
  %memref-idxreg84 = mul i64 4, %RCX83
  %memref-basereg85 = add i64 %memload81, %memref-idxreg84
  %77 = inttoptr i64 %memref-basereg85 to i32*
  %78 = load i32, i32* %77, align 1
  %79 = zext i32 %78 to i64
  %80 = zext i32 9 to i64
  %81 = sub i64 %79, %80
  %82 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %79, i64 %80)
  %CF86 = extractvalue { i64, i1 } %82, 1
  %ZF87 = icmp eq i64 %81, 0
  %highbit88 = and i64 -9223372036854775808, %81
  %SF89 = icmp ne i64 %highbit88, 0
  %83 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %79, i64 %80)
  %OF90 = extractvalue { i64, i1 } %83, 1
  %84 = and i64 %81, 255
  %85 = call i64 @llvm.ctpop.i64(i64 %84)
  %86 = and i64 %85, 1
  %PF91 = icmp eq i64 %86, 0
  %CmpZF_JLE = icmp eq i1 %ZF87, true
  %CmpOF_JLE = icmp ne i1 %SF89, %OF90
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.13, label %bb.12

bb.12:                                            ; preds = %bb.11
  %EAX92 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @rodata_15, i32 0, i32 17))
  br label %bb.15

bb.13:                                            ; preds = %bb.11
  br label %bb.14

bb.14:                                            ; preds = %bb.13
  %memload93 = load i32, i32* %ns_ptr21, align 1
  %EAX100 = add i32 %memload93, 1
  %87 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload93, i32 1)
  %CF94 = extractvalue { i32, i1 } %87, 1
  %88 = and i32 %EAX100, 255
  %89 = call i32 @llvm.ctpop.i32(i32 %88)
  %90 = and i32 %89, 1
  %PF95 = icmp eq i32 %90, 0
  %ZF96 = icmp eq i32 %EAX100, 0
  %highbit97 = and i32 -2147483648, %EAX100
  %SF98 = icmp ne i32 %highbit97, 0
  %91 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload93, i32 1)
  %OF99 = extractvalue { i32, i1 } %91, 1
  store i32 %EAX100, i32* %ns_ptr21, align 1
  br label %bb.10

bb.15:                                            ; preds = %bb.12, %bb.10
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
