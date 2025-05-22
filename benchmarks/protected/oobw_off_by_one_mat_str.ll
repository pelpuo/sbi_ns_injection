; ModuleID = './protected_bc/oobw_off_by_one_mat_str.bc'
source_filename = "./bin/oobw_off_by_one_mat_str"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00abcdefghijklmnopqrPrinting mat 1\0A\00%c\00Printing mat 2\0A\00Test Failed: Off by One in string matrix manipulation leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_21 = private constant i8 114
@rodata_15_4 = private constant i64 7523094288207667809
@rodata_15_13 = private constant i64 8174155843750357866
@rodata_15_12 = private constant i8 105

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 59
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 50
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 44
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 4)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i32*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 4)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i32*
  %ns_base28 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot29 = call i8* @zeno_protect(i8* %ns_base28, i64 4)
  %ns_ptr30 = bitcast i8* %ns_prot29 to i32*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %RBP_N.14 = getelementptr i8, i8* %stktop_8, i64 58
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 67
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr6, align 1
  %memload1 = load i8, i8* @rodata_15_12, align 1, !ROData_Content !3
  store i8 %memload1, i8* %RBP_N.5, align 1
  %1 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 13) to i64*, !ROData_Index !4
  %memload2 = load i64, i64* @rodata_15_13, align 1, !ROData_Content !5
  store i64 %memload2, i64* %ns_ptr9, align 1
  %memload3 = load i8, i8* @rodata_15_21, align 1, !ROData_Content !6
  store i8 %memload3, i8* %RBP_N.14, align 1
  store i32 0, i32* %ns_ptr12, align 1
  store i32 0, i32* %ns_ptr15, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.5, %entry
  %2 = load i32, i32* %ns_ptr15, align 1
  %3 = zext i32 %2 to i64
  %4 = zext i32 3 to i64
  %5 = sub i64 %3, %4
  %6 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %3, i64 %4)
  %CF = extractvalue { i64, i1 } %6, 1
  %ZF = icmp eq i64 %5, 0
  %highbit = and i64 -9223372036854775808, %5
  %SF = icmp ne i64 %highbit, 0
  %7 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %3, i64 %4)
  %OF = extractvalue { i64, i1 } %7, 1
  %8 = and i64 %5, 255
  %9 = call i64 @llvm.ctpop.i64(i64 %8)
  %10 = and i64 %9, 1
  %PF = icmp eq i64 %10, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %ns_ptr18, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.4, %bb.2
  %11 = load i32, i32* %ns_ptr18, align 1
  %12 = zext i32 %11 to i64
  %13 = zext i32 3 to i64
  %14 = sub i64 %12, %13
  %15 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %12, i64 %13)
  %CF4 = extractvalue { i64, i1 } %15, 1
  %ZF5 = icmp eq i64 %14, 0
  %highbit6 = and i64 -9223372036854775808, %14
  %SF7 = icmp ne i64 %highbit6, 0
  %16 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %12, i64 %13)
  %OF8 = extractvalue { i64, i1 } %16, 1
  %17 = and i64 %14, 255
  %18 = call i64 @llvm.ctpop.i64(i64 %17)
  %19 = and i64 %18, 1
  %PF9 = icmp eq i64 %19, 0
  %ZFCmp_JG152 = icmp eq i1 %ZF5, false
  %SFOFCmp_JG153 = icmp eq i1 %SF7, %OF8
  %ZFAndSFOF_JG154 = and i1 %ZFCmp_JG152, %SFOFCmp_JG153
  br i1 %ZFAndSFOF_JG154, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %20 = bitcast i32* %ns_ptr15 to i64*
  %memload10 = load i64, i64* %20, align 1
  %21 = trunc i64 %memload10 to i32
  %RCX = sext i32 %21 to i64
  %RAX = ptrtoint i64* %ns_ptr6 to i64
  %RCX12 = mul i64 %RCX, 3
  %22 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 3)
  %OF11 = extractvalue { i64, i1 } %22, 1
  %RAX16 = add nsw i64 %RAX, %RCX12
  %highbit13 = and i64 -9223372036854775808, %RAX16
  %SF14 = icmp ne i64 %highbit13, 0
  %ZF15 = icmp eq i64 %RAX16, 0
  %23 = bitcast i32* %ns_ptr18 to i64*
  %memload17 = load i64, i64* %23, align 1
  %24 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %24 to i64
  %memref-basereg = add i64 %RAX16, %RCX18
  %25 = inttoptr i64 %memref-basereg to i8*
  store i8 120, i8* %25, align 1
  %memload19 = load i32, i32* %ns_ptr18, align 1
  %EAX = add i32 %memload19, 1
  %26 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload19, i32 1)
  %CF20 = extractvalue { i32, i1 } %26, 1
  %27 = and i32 %EAX, 255
  %28 = call i32 @llvm.ctpop.i32(i32 %27)
  %29 = and i32 %28, 1
  %PF21 = icmp eq i32 %29, 0
  %ZF22 = icmp eq i32 %EAX, 0
  %highbit23 = and i32 -2147483648, %EAX
  %SF24 = icmp ne i32 %highbit23, 0
  %30 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload19, i32 1)
  %OF25 = extractvalue { i32, i1 } %30, 1
  store i32 %EAX, i32* %ns_ptr18, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  %EAX26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 36))
  %memload27 = load i32, i32* %ns_ptr15, align 1
  %EAX34 = add i32 %memload27, 1
  %31 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload27, i32 1)
  %CF28 = extractvalue { i32, i1 } %31, 1
  %32 = and i32 %EAX34, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %32)
  %34 = and i32 %33, 1
  %PF29 = icmp eq i32 %34, 0
  %ZF30 = icmp eq i32 %EAX34, 0
  %highbit31 = and i32 -2147483648, %EAX34
  %SF32 = icmp ne i32 %highbit31, 0
  %35 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload27, i32 1)
  %OF33 = extractvalue { i32, i1 } %35, 1
  store i32 %EAX34, i32* %ns_ptr15, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
  %EAX35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 22))
  store i32 0, i32* %ns_ptr21, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.11, %bb.6
  %36 = load i32, i32* %ns_ptr21, align 1
  %37 = zext i32 %36 to i64
  %38 = zext i32 3 to i64
  %39 = sub i64 %37, %38
  %40 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %37, i64 %38)
  %CF36 = extractvalue { i64, i1 } %40, 1
  %ZF37 = icmp eq i64 %39, 0
  %highbit38 = and i64 -9223372036854775808, %39
  %SF39 = icmp ne i64 %highbit38, 0
  %41 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %37, i64 %38)
  %OF40 = extractvalue { i64, i1 } %41, 1
  %42 = and i64 %39, 255
  %43 = call i64 @llvm.ctpop.i64(i64 %42)
  %44 = and i64 %43, 1
  %PF41 = icmp eq i64 %44, 0
  %CmpSFOF_JGE = icmp eq i1 %SF39, %OF40
  br i1 %CmpSFOF_JGE, label %bb.12, label %bb.8

bb.8:                                             ; preds = %bb.7
  store i32 0, i32* %ns_ptr24, align 1
  br label %bb.9

bb.9:                                             ; preds = %bb.10, %bb.8
  %45 = load i32, i32* %ns_ptr24, align 1
  %46 = zext i32 %45 to i64
  %47 = zext i32 3 to i64
  %48 = sub i64 %46, %47
  %49 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %46, i64 %47)
  %CF42 = extractvalue { i64, i1 } %49, 1
  %ZF43 = icmp eq i64 %48, 0
  %highbit44 = and i64 -9223372036854775808, %48
  %SF45 = icmp ne i64 %highbit44, 0
  %50 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %46, i64 %47)
  %OF46 = extractvalue { i64, i1 } %50, 1
  %51 = and i64 %48, 255
  %52 = call i64 @llvm.ctpop.i64(i64 %51)
  %53 = and i64 %52, 1
  %PF47 = icmp eq i64 %53, 0
  %CmpSFOF_JGE155 = icmp eq i1 %SF45, %OF46
  br i1 %CmpSFOF_JGE155, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %54 = bitcast i32* %ns_ptr21 to i64*
  %memload48 = load i64, i64* %54, align 1
  %55 = trunc i64 %memload48 to i32
  %RCX49 = sext i32 %55 to i64
  %RAX50 = ptrtoint i64* %ns_ptr6 to i64
  %RCX52 = mul i64 %RCX49, 3
  %56 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX49, i64 3)
  %OF51 = extractvalue { i64, i1 } %56, 1
  %RAX56 = add nsw i64 %RAX50, %RCX52
  %highbit53 = and i64 -9223372036854775808, %RAX56
  %SF54 = icmp ne i64 %highbit53, 0
  %ZF55 = icmp eq i64 %RAX56, 0
  %57 = bitcast i32* %ns_ptr24 to i64*
  %memload57 = load i64, i64* %57, align 1
  %58 = trunc i64 %memload57 to i32
  %RCX58 = sext i32 %58 to i64
  %memref-basereg59 = add i64 %RAX56, %RCX58
  %59 = inttoptr i64 %memref-basereg59 to i32*
  %memload60 = load i32, i32* %59, align 1
  %60 = trunc i32 %memload60 to i8
  %ESI = sext i8 %60 to i32
  %EAX61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 38), i32 %ESI)
  %memload62 = load i32, i32* %ns_ptr24, align 1
  %EAX69 = add i32 %memload62, 1
  %61 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload62, i32 1)
  %CF63 = extractvalue { i32, i1 } %61, 1
  %62 = and i32 %EAX69, 255
  %63 = call i32 @llvm.ctpop.i32(i32 %62)
  %64 = and i32 %63, 1
  %PF64 = icmp eq i32 %64, 0
  %ZF65 = icmp eq i32 %EAX69, 0
  %highbit66 = and i32 -2147483648, %EAX69
  %SF67 = icmp ne i32 %highbit66, 0
  %65 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload62, i32 1)
  %OF68 = extractvalue { i32, i1 } %65, 1
  store i32 %EAX69, i32* %ns_ptr24, align 1
  br label %bb.9

bb.11:                                            ; preds = %bb.9
  %EAX70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 36))
  %memload71 = load i32, i32* %ns_ptr21, align 1
  %EAX78 = add i32 %memload71, 1
  %66 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload71, i32 1)
  %CF72 = extractvalue { i32, i1 } %66, 1
  %67 = and i32 %EAX78, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF73 = icmp eq i32 %69, 0
  %ZF74 = icmp eq i32 %EAX78, 0
  %highbit75 = and i32 -2147483648, %EAX78
  %SF76 = icmp ne i32 %highbit75, 0
  %70 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload71, i32 1)
  %OF77 = extractvalue { i32, i1 } %70, 1
  store i32 %EAX78, i32* %ns_ptr21, align 1
  br label %bb.7

bb.12:                                            ; preds = %bb.7
  %EAX79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 41))
  store i32 0, i32* %ns_ptr27, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.20, %bb.12
  %71 = load i32, i32* %ns_ptr27, align 1
  %72 = zext i32 %71 to i64
  %73 = zext i32 3 to i64
  %74 = sub i64 %72, %73
  %75 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %72, i64 %73)
  %CF80 = extractvalue { i64, i1 } %75, 1
  %ZF81 = icmp eq i64 %74, 0
  %highbit82 = and i64 -9223372036854775808, %74
  %SF83 = icmp ne i64 %highbit82, 0
  %76 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %72, i64 %73)
  %OF84 = extractvalue { i64, i1 } %76, 1
  %77 = and i64 %74, 255
  %78 = call i64 @llvm.ctpop.i64(i64 %77)
  %79 = and i64 %78, 1
  %PF85 = icmp eq i64 %79, 0
  %CmpSFOF_JGE156 = icmp eq i1 %SF83, %OF84
  br i1 %CmpSFOF_JGE156, label %bb.21, label %bb.14

bb.14:                                            ; preds = %bb.13
  store i32 0, i32* %ns_ptr30, align 1
  br label %bb.15

bb.15:                                            ; preds = %bb.19, %bb.14
  %80 = load i32, i32* %ns_ptr30, align 1
  %81 = zext i32 %80 to i64
  %82 = zext i32 3 to i64
  %83 = sub i64 %81, %82
  %84 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %81, i64 %82)
  %CF86 = extractvalue { i64, i1 } %84, 1
  %ZF87 = icmp eq i64 %83, 0
  %highbit88 = and i64 -9223372036854775808, %83
  %SF89 = icmp ne i64 %highbit88, 0
  %85 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %81, i64 %82)
  %OF90 = extractvalue { i64, i1 } %85, 1
  %86 = and i64 %83, 255
  %87 = call i64 @llvm.ctpop.i64(i64 %86)
  %88 = and i64 %87, 1
  %PF91 = icmp eq i64 %88, 0
  %CmpSFOF_JGE157 = icmp eq i1 %SF89, %OF90
  br i1 %CmpSFOF_JGE157, label %bb.20, label %bb.16

bb.16:                                            ; preds = %bb.15
  %89 = bitcast i32* %ns_ptr27 to i64*
  %memload92 = load i64, i64* %89, align 1
  %90 = trunc i64 %memload92 to i32
  %RCX93 = sext i32 %90 to i64
  %RAX94 = ptrtoint i64* %ns_ptr9 to i64
  %RCX96 = mul i64 %RCX93, 3
  %91 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX93, i64 3)
  %OF95 = extractvalue { i64, i1 } %91, 1
  %RAX100 = add nsw i64 %RAX94, %RCX96
  %highbit97 = and i64 -9223372036854775808, %RAX100
  %SF98 = icmp ne i64 %highbit97, 0
  %ZF99 = icmp eq i64 %RAX100, 0
  %92 = bitcast i32* %ns_ptr30 to i64*
  %memload101 = load i64, i64* %92, align 1
  %93 = trunc i64 %memload101 to i32
  %RCX102 = sext i32 %93 to i64
  %memref-basereg103 = add i64 %RAX100, %RCX102
  %94 = inttoptr i64 %memref-basereg103 to i32*
  %memload104 = load i32, i32* %94, align 1
  %95 = trunc i32 %memload104 to i8
  %ESI105 = sext i8 %95 to i32
  %EAX106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 38), i32 %ESI105)
  %96 = bitcast i32* %ns_ptr27 to i64*
  %memload107 = load i64, i64* %96, align 1
  %97 = trunc i64 %memload107 to i32
  %RCX108 = sext i32 %97 to i64
  %RAX109 = ptrtoint i64* %ns_ptr9 to i64
  %RCX111 = mul i64 %RCX108, 3
  %98 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX108, i64 3)
  %OF110 = extractvalue { i64, i1 } %98, 1
  %RAX115 = add nsw i64 %RAX109, %RCX111
  %highbit112 = and i64 -9223372036854775808, %RAX115
  %SF113 = icmp ne i64 %highbit112, 0
  %ZF114 = icmp eq i64 %RAX115, 0
  %99 = bitcast i32* %ns_ptr30 to i64*
  %memload116 = load i64, i64* %99, align 1
  %100 = trunc i64 %memload116 to i32
  %RCX117 = sext i32 %100 to i64
  %memref-basereg118 = add i64 %RAX115, %RCX117
  %101 = inttoptr i64 %memref-basereg118 to i32*
  %memload119 = load i32, i32* %101, align 1
  %102 = trunc i32 %memload119 to i8
  %EAX120 = sext i8 %102 to i32
  %103 = sub i32 %EAX120, 120
  %104 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX120, i32 120)
  %CF121 = extractvalue { i32, i1 } %104, 1
  %ZF122 = icmp eq i32 %103, 0
  %highbit123 = and i32 -2147483648, %103
  %SF124 = icmp ne i32 %highbit123, 0
  %105 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX120, i32 120)
  %OF125 = extractvalue { i32, i1 } %105, 1
  %106 = and i32 %103, 255
  %107 = call i32 @llvm.ctpop.i32(i32 %106)
  %108 = and i32 %107, 1
  %PF126 = icmp eq i32 %108, 0
  %CmpZF_JNE = icmp eq i1 %ZF122, false
  br i1 %CmpZF_JNE, label %bb.18, label %bb.17

bb.17:                                            ; preds = %bb.16
  store i32 1, i32* %ns_ptr12, align 1
  br label %bb.18

bb.18:                                            ; preds = %bb.17, %bb.16
  br label %bb.19

bb.19:                                            ; preds = %bb.18
  %memload127 = load i32, i32* %ns_ptr30, align 1
  %EAX134 = add i32 %memload127, 1
  %109 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload127, i32 1)
  %CF128 = extractvalue { i32, i1 } %109, 1
  %110 = and i32 %EAX134, 255
  %111 = call i32 @llvm.ctpop.i32(i32 %110)
  %112 = and i32 %111, 1
  %PF129 = icmp eq i32 %112, 0
  %ZF130 = icmp eq i32 %EAX134, 0
  %highbit131 = and i32 -2147483648, %EAX134
  %SF132 = icmp ne i32 %highbit131, 0
  %113 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload127, i32 1)
  %OF133 = extractvalue { i32, i1 } %113, 1
  store i32 %EAX134, i32* %ns_ptr30, align 1
  br label %bb.15

bb.20:                                            ; preds = %bb.15
  %EAX135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 36))
  %memload136 = load i32, i32* %ns_ptr27, align 1
  %EAX143 = add i32 %memload136, 1
  %114 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload136, i32 1)
  %CF137 = extractvalue { i32, i1 } %114, 1
  %115 = and i32 %EAX143, 255
  %116 = call i32 @llvm.ctpop.i32(i32 %115)
  %117 = and i32 %116, 1
  %PF138 = icmp eq i32 %117, 0
  %ZF139 = icmp eq i32 %EAX143, 0
  %highbit140 = and i32 -2147483648, %EAX143
  %SF141 = icmp ne i32 %highbit140, 0
  %118 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload136, i32 1)
  %OF142 = extractvalue { i32, i1 } %118, 1
  store i32 %EAX143, i32* %ns_ptr27, align 1
  br label %bb.13

bb.21:                                            ; preds = %bb.13
  %119 = load i32, i32* %ns_ptr12, align 1
  %120 = zext i32 %119 to i64
  %121 = zext i32 1 to i64
  %122 = sub i64 %120, %121
  %123 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %120, i64 %121)
  %CF144 = extractvalue { i64, i1 } %123, 1
  %ZF145 = icmp eq i64 %122, 0
  %highbit146 = and i64 -9223372036854775808, %122
  %SF147 = icmp ne i64 %highbit146, 0
  %124 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %120, i64 %121)
  %OF148 = extractvalue { i64, i1 } %124, 1
  %125 = and i64 %122, 255
  %126 = call i64 @llvm.ctpop.i64(i64 %125)
  %127 = and i64 %126, 1
  %PF149 = icmp eq i64 %127, 0
  %CmpZF_JNE158 = icmp eq i1 %ZF145, false
  br i1 %CmpZF_JNE158, label %bb.23, label %bb.22

bb.22:                                            ; preds = %bb.21
  %EAX150 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 57))
  br label %bb.23

bb.23:                                            ; preds = %bb.22, %bb.21
  %memload151 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload151
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 13)}
!5 = !{!4}
!6 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 21)}
