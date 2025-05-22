; ModuleID = './bin/oobw_off_by_one_mat_str'
source_filename = "./bin/oobw_off_by_one_mat_str"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00abcdefghijklmnopqrPrinting mat 1\0A\00%c\00Printing mat 2\0A\00Test Failed: Off by One in string matrix manipulation leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.52 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.44 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.40 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.36 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.32 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 44
  %RBP_N.28 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 50
  %RBP_N.22 = bitcast i8* %7 to i64*
  %RBP_N.14 = getelementptr i8, i8* %stktop_8, i64 58
  %8 = getelementptr i8, i8* %stktop_8, i64 59
  %RBP_N.13 = bitcast i8* %8 to i64*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 67
  %9 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %9 to i32*
  %10 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %10 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %11 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload = load i64, i64* %11, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.13, align 1
  %memload1 = load i8, i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 12), align 1, !ROData_Content !3
  store i8 %memload1, i8* %RBP_N.5, align 1
  %12 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 13) to i64*, !ROData_Index !4
  %memload2 = load i64, i64* %12, align 1, !ROData_Content !5
  store i64 %memload2, i64* %RBP_N.22, align 1
  %memload3 = load i8, i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 21), align 1, !ROData_Content !6
  store i8 %memload3, i8* %RBP_N.14, align 1
  store i32 0, i32* %RBP_N.28, align 1
  store i32 0, i32* %RBP_N.32, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.5
  %13 = load i32, i32* %RBP_N.32, align 1
  %14 = zext i32 %13 to i64
  %15 = zext i32 3 to i64
  %16 = sub i64 %14, %15
  %17 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %14, i64 %15)
  %CF = extractvalue { i64, i1 } %17, 1
  %ZF = icmp eq i64 %16, 0
  %highbit = and i64 -9223372036854775808, %16
  %SF = icmp ne i64 %highbit, 0
  %18 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %14, i64 %15)
  %OF = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %16, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF = icmp eq i64 %21, 0
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %RBP_N.36, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.4
  %22 = load i32, i32* %RBP_N.36, align 1
  %23 = zext i32 %22 to i64
  %24 = zext i32 3 to i64
  %25 = sub i64 %23, %24
  %26 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %23, i64 %24)
  %CF4 = extractvalue { i64, i1 } %26, 1
  %ZF5 = icmp eq i64 %25, 0
  %highbit6 = and i64 -9223372036854775808, %25
  %SF7 = icmp ne i64 %highbit6, 0
  %27 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %23, i64 %24)
  %OF8 = extractvalue { i64, i1 } %27, 1
  %28 = and i64 %25, 255
  %29 = call i64 @llvm.ctpop.i64(i64 %28)
  %30 = and i64 %29, 1
  %PF9 = icmp eq i64 %30, 0
  %ZFCmp_JG152 = icmp eq i1 %ZF5, false
  %SFOFCmp_JG153 = icmp eq i1 %SF7, %OF8
  %ZFAndSFOF_JG154 = and i1 %ZFCmp_JG152, %SFOFCmp_JG153
  br i1 %ZFAndSFOF_JG154, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %31 = bitcast i32* %RBP_N.32 to i64*
  %memload10 = load i64, i64* %31, align 1
  %32 = trunc i64 %memload10 to i32
  %RCX = sext i32 %32 to i64
  %RAX = ptrtoint i64* %RBP_N.13 to i64
  %RCX12 = mul i64 %RCX, 3
  %33 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 3)
  %OF11 = extractvalue { i64, i1 } %33, 1
  %RAX16 = add nsw i64 %RAX, %RCX12
  %highbit13 = and i64 -9223372036854775808, %RAX16
  %SF14 = icmp ne i64 %highbit13, 0
  %ZF15 = icmp eq i64 %RAX16, 0
  %34 = bitcast i32* %RBP_N.36 to i64*
  %memload17 = load i64, i64* %34, align 1
  %35 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %35 to i64
  %memref-basereg = add i64 %RAX16, %RCX18
  %36 = inttoptr i64 %memref-basereg to i8*
  store i8 120, i8* %36, align 1
  %memload19 = load i32, i32* %RBP_N.36, align 1
  %EAX = add i32 %memload19, 1
  %37 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload19, i32 1)
  %CF20 = extractvalue { i32, i1 } %37, 1
  %38 = and i32 %EAX, 255
  %39 = call i32 @llvm.ctpop.i32(i32 %38)
  %40 = and i32 %39, 1
  %PF21 = icmp eq i32 %40, 0
  %ZF22 = icmp eq i32 %EAX, 0
  %highbit23 = and i32 -2147483648, %EAX
  %SF24 = icmp ne i32 %highbit23, 0
  %41 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload19, i32 1)
  %OF25 = extractvalue { i32, i1 } %41, 1
  store i32 %EAX, i32* %RBP_N.36, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  %EAX26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 36))
  %memload27 = load i32, i32* %RBP_N.32, align 1
  %EAX34 = add i32 %memload27, 1
  %42 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload27, i32 1)
  %CF28 = extractvalue { i32, i1 } %42, 1
  %43 = and i32 %EAX34, 255
  %44 = call i32 @llvm.ctpop.i32(i32 %43)
  %45 = and i32 %44, 1
  %PF29 = icmp eq i32 %45, 0
  %ZF30 = icmp eq i32 %EAX34, 0
  %highbit31 = and i32 -2147483648, %EAX34
  %SF32 = icmp ne i32 %highbit31, 0
  %46 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload27, i32 1)
  %OF33 = extractvalue { i32, i1 } %46, 1
  store i32 %EAX34, i32* %RBP_N.32, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
  %EAX35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 22))
  store i32 0, i32* %RBP_N.40, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.11
  %47 = load i32, i32* %RBP_N.40, align 1
  %48 = zext i32 %47 to i64
  %49 = zext i32 3 to i64
  %50 = sub i64 %48, %49
  %51 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %48, i64 %49)
  %CF36 = extractvalue { i64, i1 } %51, 1
  %ZF37 = icmp eq i64 %50, 0
  %highbit38 = and i64 -9223372036854775808, %50
  %SF39 = icmp ne i64 %highbit38, 0
  %52 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %48, i64 %49)
  %OF40 = extractvalue { i64, i1 } %52, 1
  %53 = and i64 %50, 255
  %54 = call i64 @llvm.ctpop.i64(i64 %53)
  %55 = and i64 %54, 1
  %PF41 = icmp eq i64 %55, 0
  %CmpSFOF_JGE = icmp eq i1 %SF39, %OF40
  br i1 %CmpSFOF_JGE, label %bb.12, label %bb.8

bb.8:                                             ; preds = %bb.7
  store i32 0, i32* %RBP_N.44, align 1
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.10
  %56 = load i32, i32* %RBP_N.44, align 1
  %57 = zext i32 %56 to i64
  %58 = zext i32 3 to i64
  %59 = sub i64 %57, %58
  %60 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %57, i64 %58)
  %CF42 = extractvalue { i64, i1 } %60, 1
  %ZF43 = icmp eq i64 %59, 0
  %highbit44 = and i64 -9223372036854775808, %59
  %SF45 = icmp ne i64 %highbit44, 0
  %61 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %57, i64 %58)
  %OF46 = extractvalue { i64, i1 } %61, 1
  %62 = and i64 %59, 255
  %63 = call i64 @llvm.ctpop.i64(i64 %62)
  %64 = and i64 %63, 1
  %PF47 = icmp eq i64 %64, 0
  %CmpSFOF_JGE155 = icmp eq i1 %SF45, %OF46
  br i1 %CmpSFOF_JGE155, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %65 = bitcast i32* %RBP_N.40 to i64*
  %memload48 = load i64, i64* %65, align 1
  %66 = trunc i64 %memload48 to i32
  %RCX49 = sext i32 %66 to i64
  %RAX50 = ptrtoint i64* %RBP_N.13 to i64
  %RCX52 = mul i64 %RCX49, 3
  %67 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX49, i64 3)
  %OF51 = extractvalue { i64, i1 } %67, 1
  %RAX56 = add nsw i64 %RAX50, %RCX52
  %highbit53 = and i64 -9223372036854775808, %RAX56
  %SF54 = icmp ne i64 %highbit53, 0
  %ZF55 = icmp eq i64 %RAX56, 0
  %68 = bitcast i32* %RBP_N.44 to i64*
  %memload57 = load i64, i64* %68, align 1
  %69 = trunc i64 %memload57 to i32
  %RCX58 = sext i32 %69 to i64
  %memref-basereg59 = add i64 %RAX56, %RCX58
  %70 = inttoptr i64 %memref-basereg59 to i32*
  %memload60 = load i32, i32* %70, align 1
  %71 = trunc i32 %memload60 to i8
  %ESI = sext i8 %71 to i32
  %EAX61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 38), i32 %ESI)
  %memload62 = load i32, i32* %RBP_N.44, align 1
  %EAX69 = add i32 %memload62, 1
  %72 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload62, i32 1)
  %CF63 = extractvalue { i32, i1 } %72, 1
  %73 = and i32 %EAX69, 255
  %74 = call i32 @llvm.ctpop.i32(i32 %73)
  %75 = and i32 %74, 1
  %PF64 = icmp eq i32 %75, 0
  %ZF65 = icmp eq i32 %EAX69, 0
  %highbit66 = and i32 -2147483648, %EAX69
  %SF67 = icmp ne i32 %highbit66, 0
  %76 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload62, i32 1)
  %OF68 = extractvalue { i32, i1 } %76, 1
  store i32 %EAX69, i32* %RBP_N.44, align 1
  br label %bb.9

bb.11:                                            ; preds = %bb.9
  %EAX70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 36))
  %memload71 = load i32, i32* %RBP_N.40, align 1
  %EAX78 = add i32 %memload71, 1
  %77 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload71, i32 1)
  %CF72 = extractvalue { i32, i1 } %77, 1
  %78 = and i32 %EAX78, 255
  %79 = call i32 @llvm.ctpop.i32(i32 %78)
  %80 = and i32 %79, 1
  %PF73 = icmp eq i32 %80, 0
  %ZF74 = icmp eq i32 %EAX78, 0
  %highbit75 = and i32 -2147483648, %EAX78
  %SF76 = icmp ne i32 %highbit75, 0
  %81 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload71, i32 1)
  %OF77 = extractvalue { i32, i1 } %81, 1
  store i32 %EAX78, i32* %RBP_N.40, align 1
  br label %bb.7

bb.12:                                            ; preds = %bb.7
  %EAX79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 41))
  store i32 0, i32* %RBP_N.48, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.12, %bb.20
  %82 = load i32, i32* %RBP_N.48, align 1
  %83 = zext i32 %82 to i64
  %84 = zext i32 3 to i64
  %85 = sub i64 %83, %84
  %86 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %83, i64 %84)
  %CF80 = extractvalue { i64, i1 } %86, 1
  %ZF81 = icmp eq i64 %85, 0
  %highbit82 = and i64 -9223372036854775808, %85
  %SF83 = icmp ne i64 %highbit82, 0
  %87 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %83, i64 %84)
  %OF84 = extractvalue { i64, i1 } %87, 1
  %88 = and i64 %85, 255
  %89 = call i64 @llvm.ctpop.i64(i64 %88)
  %90 = and i64 %89, 1
  %PF85 = icmp eq i64 %90, 0
  %CmpSFOF_JGE156 = icmp eq i1 %SF83, %OF84
  br i1 %CmpSFOF_JGE156, label %bb.21, label %bb.14

bb.14:                                            ; preds = %bb.13
  store i32 0, i32* %RBP_N.52, align 1
  br label %bb.15

bb.15:                                            ; preds = %bb.14, %bb.19
  %91 = load i32, i32* %RBP_N.52, align 1
  %92 = zext i32 %91 to i64
  %93 = zext i32 3 to i64
  %94 = sub i64 %92, %93
  %95 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %92, i64 %93)
  %CF86 = extractvalue { i64, i1 } %95, 1
  %ZF87 = icmp eq i64 %94, 0
  %highbit88 = and i64 -9223372036854775808, %94
  %SF89 = icmp ne i64 %highbit88, 0
  %96 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %92, i64 %93)
  %OF90 = extractvalue { i64, i1 } %96, 1
  %97 = and i64 %94, 255
  %98 = call i64 @llvm.ctpop.i64(i64 %97)
  %99 = and i64 %98, 1
  %PF91 = icmp eq i64 %99, 0
  %CmpSFOF_JGE157 = icmp eq i1 %SF89, %OF90
  br i1 %CmpSFOF_JGE157, label %bb.20, label %bb.16

bb.16:                                            ; preds = %bb.15
  %100 = bitcast i32* %RBP_N.48 to i64*
  %memload92 = load i64, i64* %100, align 1
  %101 = trunc i64 %memload92 to i32
  %RCX93 = sext i32 %101 to i64
  %RAX94 = ptrtoint i64* %RBP_N.22 to i64
  %RCX96 = mul i64 %RCX93, 3
  %102 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX93, i64 3)
  %OF95 = extractvalue { i64, i1 } %102, 1
  %RAX100 = add nsw i64 %RAX94, %RCX96
  %highbit97 = and i64 -9223372036854775808, %RAX100
  %SF98 = icmp ne i64 %highbit97, 0
  %ZF99 = icmp eq i64 %RAX100, 0
  %103 = bitcast i32* %RBP_N.52 to i64*
  %memload101 = load i64, i64* %103, align 1
  %104 = trunc i64 %memload101 to i32
  %RCX102 = sext i32 %104 to i64
  %memref-basereg103 = add i64 %RAX100, %RCX102
  %105 = inttoptr i64 %memref-basereg103 to i32*
  %memload104 = load i32, i32* %105, align 1
  %106 = trunc i32 %memload104 to i8
  %ESI105 = sext i8 %106 to i32
  %EAX106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 38), i32 %ESI105)
  %107 = bitcast i32* %RBP_N.48 to i64*
  %memload107 = load i64, i64* %107, align 1
  %108 = trunc i64 %memload107 to i32
  %RCX108 = sext i32 %108 to i64
  %RAX109 = ptrtoint i64* %RBP_N.22 to i64
  %RCX111 = mul i64 %RCX108, 3
  %109 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX108, i64 3)
  %OF110 = extractvalue { i64, i1 } %109, 1
  %RAX115 = add nsw i64 %RAX109, %RCX111
  %highbit112 = and i64 -9223372036854775808, %RAX115
  %SF113 = icmp ne i64 %highbit112, 0
  %ZF114 = icmp eq i64 %RAX115, 0
  %110 = bitcast i32* %RBP_N.52 to i64*
  %memload116 = load i64, i64* %110, align 1
  %111 = trunc i64 %memload116 to i32
  %RCX117 = sext i32 %111 to i64
  %memref-basereg118 = add i64 %RAX115, %RCX117
  %112 = inttoptr i64 %memref-basereg118 to i32*
  %memload119 = load i32, i32* %112, align 1
  %113 = trunc i32 %memload119 to i8
  %EAX120 = sext i8 %113 to i32
  %114 = sub i32 %EAX120, 120
  %115 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX120, i32 120)
  %CF121 = extractvalue { i32, i1 } %115, 1
  %ZF122 = icmp eq i32 %114, 0
  %highbit123 = and i32 -2147483648, %114
  %SF124 = icmp ne i32 %highbit123, 0
  %116 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX120, i32 120)
  %OF125 = extractvalue { i32, i1 } %116, 1
  %117 = and i32 %114, 255
  %118 = call i32 @llvm.ctpop.i32(i32 %117)
  %119 = and i32 %118, 1
  %PF126 = icmp eq i32 %119, 0
  %CmpZF_JNE = icmp eq i1 %ZF122, false
  br i1 %CmpZF_JNE, label %bb.18, label %bb.17

bb.17:                                            ; preds = %bb.16
  store i32 1, i32* %RBP_N.28, align 1
  br label %bb.18

bb.18:                                            ; preds = %bb.17, %bb.16
  br label %bb.19

bb.19:                                            ; preds = %bb.18
  %memload127 = load i32, i32* %RBP_N.52, align 1
  %EAX134 = add i32 %memload127, 1
  %120 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload127, i32 1)
  %CF128 = extractvalue { i32, i1 } %120, 1
  %121 = and i32 %EAX134, 255
  %122 = call i32 @llvm.ctpop.i32(i32 %121)
  %123 = and i32 %122, 1
  %PF129 = icmp eq i32 %123, 0
  %ZF130 = icmp eq i32 %EAX134, 0
  %highbit131 = and i32 -2147483648, %EAX134
  %SF132 = icmp ne i32 %highbit131, 0
  %124 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload127, i32 1)
  %OF133 = extractvalue { i32, i1 } %124, 1
  store i32 %EAX134, i32* %RBP_N.52, align 1
  br label %bb.15

bb.20:                                            ; preds = %bb.15
  %EAX135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 36))
  %memload136 = load i32, i32* %RBP_N.48, align 1
  %EAX143 = add i32 %memload136, 1
  %125 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload136, i32 1)
  %CF137 = extractvalue { i32, i1 } %125, 1
  %126 = and i32 %EAX143, 255
  %127 = call i32 @llvm.ctpop.i32(i32 %126)
  %128 = and i32 %127, 1
  %PF138 = icmp eq i32 %128, 0
  %ZF139 = icmp eq i32 %EAX143, 0
  %highbit140 = and i32 -2147483648, %EAX143
  %SF141 = icmp ne i32 %highbit140, 0
  %129 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload136, i32 1)
  %OF142 = extractvalue { i32, i1 } %129, 1
  store i32 %EAX143, i32* %RBP_N.48, align 1
  br label %bb.13

bb.21:                                            ; preds = %bb.13
  %130 = load i32, i32* %RBP_N.28, align 1
  %131 = zext i32 %130 to i64
  %132 = zext i32 1 to i64
  %133 = sub i64 %131, %132
  %134 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %131, i64 %132)
  %CF144 = extractvalue { i64, i1 } %134, 1
  %ZF145 = icmp eq i64 %133, 0
  %highbit146 = and i64 -9223372036854775808, %133
  %SF147 = icmp ne i64 %highbit146, 0
  %135 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %131, i64 %132)
  %OF148 = extractvalue { i64, i1 } %135, 1
  %136 = and i64 %133, 255
  %137 = call i64 @llvm.ctpop.i64(i64 %136)
  %138 = and i64 %137, 1
  %PF149 = icmp eq i64 %138, 0
  %CmpZF_JNE158 = icmp eq i1 %ZF145, false
  br i1 %CmpZF_JNE158, label %bb.23, label %bb.22

bb.22:                                            ; preds = %bb.21
  %EAX150 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 57))
  br label %bb.23

bb.23:                                            ; preds = %bb.22, %bb.21
  %memload151 = load i32, i32* %RBP_N.4, align 1
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 13)}
!5 = !{!4}
!6 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 21)}
