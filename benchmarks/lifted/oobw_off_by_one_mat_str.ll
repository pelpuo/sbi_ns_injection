; ModuleID = './bin/oobw_off_by_one_mat_str'
source_filename = "./bin/oobw_off_by_one_mat_str"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00abcdefghijklmnopqrPrinting mat 1\0A\00%c\00Printing mat 2\0A\00Test Failed: Off by One in string matrix manipulation leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.52 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 28
  %RBP_N.44 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 36
  %RBP_N.36 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 40
  %RBP_N.32 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 44
  %RBP_N.28 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 50
  %RBP_N.22 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 58
  %RBP_N.14 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 59
  %RBP_N.13 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 67
  %RBP_N.5 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %11 to ptr
  %12 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %12 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.13, align 1
  %memload1 = load i8, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  store i8 %memload1, ptr %RBP_N.5, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 13), align 1, !ROData_Content !3
  store i64 %memload2, ptr %RBP_N.22, align 1
  %memload3 = load i8, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 21), align 1, !ROData_Content !4
  store i8 %memload3, ptr %RBP_N.14, align 1
  store i32 0, ptr %RBP_N.28, align 1
  store i32 0, ptr %RBP_N.32, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.5
  %13 = load i32, ptr %RBP_N.32, align 1
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
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.4
  %22 = load i32, ptr %RBP_N.36, align 1
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
  %memload10 = load i64, ptr %RBP_N.32, align 1
  %31 = trunc i64 %memload10 to i32
  %RCX = sext i32 %31 to i64
  %RAX = ptrtoint ptr %RBP_N.13 to i64
  %RCX12 = mul i64 %RCX, 3
  %32 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 3)
  %OF11 = extractvalue { i64, i1 } %32, 1
  %RAX16 = add nsw i64 %RAX, %RCX12
  %highbit13 = and i64 -9223372036854775808, %RAX16
  %SF14 = icmp ne i64 %highbit13, 0
  %ZF15 = icmp eq i64 %RAX16, 0
  %memload17 = load i64, ptr %RBP_N.36, align 1
  %33 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %33 to i64
  %memref-basereg = add i64 %RAX16, %RCX18
  %34 = inttoptr i64 %memref-basereg to ptr
  store i8 120, ptr %34, align 1
  %memload19 = load i32, ptr %RBP_N.36, align 1
  %EAX = add i32 %memload19, 1
  %35 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload19, i32 1)
  %CF20 = extractvalue { i32, i1 } %35, 1
  %36 = and i32 %EAX, 255
  %37 = call i32 @llvm.ctpop.i32(i32 %36)
  %38 = and i32 %37, 1
  %PF21 = icmp eq i32 %38, 0
  %ZF22 = icmp eq i32 %EAX, 0
  %highbit23 = and i32 -2147483648, %EAX
  %SF24 = icmp ne i32 %highbit23, 0
  %39 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload19, i32 1)
  %OF25 = extractvalue { i32, i1 } %39, 1
  store i32 %EAX, ptr %RBP_N.36, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  %EAX26 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 36))
  %memload27 = load i32, ptr %RBP_N.32, align 1
  %EAX34 = add i32 %memload27, 1
  %40 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload27, i32 1)
  %CF28 = extractvalue { i32, i1 } %40, 1
  %41 = and i32 %EAX34, 255
  %42 = call i32 @llvm.ctpop.i32(i32 %41)
  %43 = and i32 %42, 1
  %PF29 = icmp eq i32 %43, 0
  %ZF30 = icmp eq i32 %EAX34, 0
  %highbit31 = and i32 -2147483648, %EAX34
  %SF32 = icmp ne i32 %highbit31, 0
  %44 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload27, i32 1)
  %OF33 = extractvalue { i32, i1 } %44, 1
  store i32 %EAX34, ptr %RBP_N.32, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
  %EAX35 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 22))
  store i32 0, ptr %RBP_N.40, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.11
  %45 = load i32, ptr %RBP_N.40, align 1
  %46 = zext i32 %45 to i64
  %47 = zext i32 3 to i64
  %48 = sub i64 %46, %47
  %49 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %46, i64 %47)
  %CF36 = extractvalue { i64, i1 } %49, 1
  %ZF37 = icmp eq i64 %48, 0
  %highbit38 = and i64 -9223372036854775808, %48
  %SF39 = icmp ne i64 %highbit38, 0
  %50 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %46, i64 %47)
  %OF40 = extractvalue { i64, i1 } %50, 1
  %51 = and i64 %48, 255
  %52 = call i64 @llvm.ctpop.i64(i64 %51)
  %53 = and i64 %52, 1
  %PF41 = icmp eq i64 %53, 0
  %CmpSFOF_JGE = icmp eq i1 %SF39, %OF40
  br i1 %CmpSFOF_JGE, label %bb.12, label %bb.8

bb.8:                                             ; preds = %bb.7
  store i32 0, ptr %RBP_N.44, align 1
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.10
  %54 = load i32, ptr %RBP_N.44, align 1
  %55 = zext i32 %54 to i64
  %56 = zext i32 3 to i64
  %57 = sub i64 %55, %56
  %58 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %55, i64 %56)
  %CF42 = extractvalue { i64, i1 } %58, 1
  %ZF43 = icmp eq i64 %57, 0
  %highbit44 = and i64 -9223372036854775808, %57
  %SF45 = icmp ne i64 %highbit44, 0
  %59 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %55, i64 %56)
  %OF46 = extractvalue { i64, i1 } %59, 1
  %60 = and i64 %57, 255
  %61 = call i64 @llvm.ctpop.i64(i64 %60)
  %62 = and i64 %61, 1
  %PF47 = icmp eq i64 %62, 0
  %CmpSFOF_JGE155 = icmp eq i1 %SF45, %OF46
  br i1 %CmpSFOF_JGE155, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %memload48 = load i64, ptr %RBP_N.40, align 1
  %63 = trunc i64 %memload48 to i32
  %RCX49 = sext i32 %63 to i64
  %RAX50 = ptrtoint ptr %RBP_N.13 to i64
  %RCX52 = mul i64 %RCX49, 3
  %64 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX49, i64 3)
  %OF51 = extractvalue { i64, i1 } %64, 1
  %RAX56 = add nsw i64 %RAX50, %RCX52
  %highbit53 = and i64 -9223372036854775808, %RAX56
  %SF54 = icmp ne i64 %highbit53, 0
  %ZF55 = icmp eq i64 %RAX56, 0
  %memload57 = load i64, ptr %RBP_N.44, align 1
  %65 = trunc i64 %memload57 to i32
  %RCX58 = sext i32 %65 to i64
  %memref-basereg59 = add i64 %RAX56, %RCX58
  %66 = inttoptr i64 %memref-basereg59 to ptr
  %memload60 = load i32, ptr %66, align 1
  %67 = trunc i32 %memload60 to i8
  %ESI = sext i8 %67 to i32
  %EAX61 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 38), i32 %ESI)
  %memload62 = load i32, ptr %RBP_N.44, align 1
  %EAX69 = add i32 %memload62, 1
  %68 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload62, i32 1)
  %CF63 = extractvalue { i32, i1 } %68, 1
  %69 = and i32 %EAX69, 255
  %70 = call i32 @llvm.ctpop.i32(i32 %69)
  %71 = and i32 %70, 1
  %PF64 = icmp eq i32 %71, 0
  %ZF65 = icmp eq i32 %EAX69, 0
  %highbit66 = and i32 -2147483648, %EAX69
  %SF67 = icmp ne i32 %highbit66, 0
  %72 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload62, i32 1)
  %OF68 = extractvalue { i32, i1 } %72, 1
  store i32 %EAX69, ptr %RBP_N.44, align 1
  br label %bb.9

bb.11:                                            ; preds = %bb.9
  %EAX70 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 36))
  %memload71 = load i32, ptr %RBP_N.40, align 1
  %EAX78 = add i32 %memload71, 1
  %73 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload71, i32 1)
  %CF72 = extractvalue { i32, i1 } %73, 1
  %74 = and i32 %EAX78, 255
  %75 = call i32 @llvm.ctpop.i32(i32 %74)
  %76 = and i32 %75, 1
  %PF73 = icmp eq i32 %76, 0
  %ZF74 = icmp eq i32 %EAX78, 0
  %highbit75 = and i32 -2147483648, %EAX78
  %SF76 = icmp ne i32 %highbit75, 0
  %77 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload71, i32 1)
  %OF77 = extractvalue { i32, i1 } %77, 1
  store i32 %EAX78, ptr %RBP_N.40, align 1
  br label %bb.7

bb.12:                                            ; preds = %bb.7
  %EAX79 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 41))
  store i32 0, ptr %RBP_N.48, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.12, %bb.20
  %78 = load i32, ptr %RBP_N.48, align 1
  %79 = zext i32 %78 to i64
  %80 = zext i32 3 to i64
  %81 = sub i64 %79, %80
  %82 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %79, i64 %80)
  %CF80 = extractvalue { i64, i1 } %82, 1
  %ZF81 = icmp eq i64 %81, 0
  %highbit82 = and i64 -9223372036854775808, %81
  %SF83 = icmp ne i64 %highbit82, 0
  %83 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %79, i64 %80)
  %OF84 = extractvalue { i64, i1 } %83, 1
  %84 = and i64 %81, 255
  %85 = call i64 @llvm.ctpop.i64(i64 %84)
  %86 = and i64 %85, 1
  %PF85 = icmp eq i64 %86, 0
  %CmpSFOF_JGE156 = icmp eq i1 %SF83, %OF84
  br i1 %CmpSFOF_JGE156, label %bb.21, label %bb.14

bb.14:                                            ; preds = %bb.13
  store i32 0, ptr %RBP_N.52, align 1
  br label %bb.15

bb.15:                                            ; preds = %bb.14, %bb.19
  %87 = load i32, ptr %RBP_N.52, align 1
  %88 = zext i32 %87 to i64
  %89 = zext i32 3 to i64
  %90 = sub i64 %88, %89
  %91 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %88, i64 %89)
  %CF86 = extractvalue { i64, i1 } %91, 1
  %ZF87 = icmp eq i64 %90, 0
  %highbit88 = and i64 -9223372036854775808, %90
  %SF89 = icmp ne i64 %highbit88, 0
  %92 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %88, i64 %89)
  %OF90 = extractvalue { i64, i1 } %92, 1
  %93 = and i64 %90, 255
  %94 = call i64 @llvm.ctpop.i64(i64 %93)
  %95 = and i64 %94, 1
  %PF91 = icmp eq i64 %95, 0
  %CmpSFOF_JGE157 = icmp eq i1 %SF89, %OF90
  br i1 %CmpSFOF_JGE157, label %bb.20, label %bb.16

bb.16:                                            ; preds = %bb.15
  %memload92 = load i64, ptr %RBP_N.48, align 1
  %96 = trunc i64 %memload92 to i32
  %RCX93 = sext i32 %96 to i64
  %RAX94 = ptrtoint ptr %RBP_N.22 to i64
  %RCX96 = mul i64 %RCX93, 3
  %97 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX93, i64 3)
  %OF95 = extractvalue { i64, i1 } %97, 1
  %RAX100 = add nsw i64 %RAX94, %RCX96
  %highbit97 = and i64 -9223372036854775808, %RAX100
  %SF98 = icmp ne i64 %highbit97, 0
  %ZF99 = icmp eq i64 %RAX100, 0
  %memload101 = load i64, ptr %RBP_N.52, align 1
  %98 = trunc i64 %memload101 to i32
  %RCX102 = sext i32 %98 to i64
  %memref-basereg103 = add i64 %RAX100, %RCX102
  %99 = inttoptr i64 %memref-basereg103 to ptr
  %memload104 = load i32, ptr %99, align 1
  %100 = trunc i32 %memload104 to i8
  %ESI105 = sext i8 %100 to i32
  %EAX106 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 38), i32 %ESI105)
  %memload107 = load i64, ptr %RBP_N.48, align 1
  %101 = trunc i64 %memload107 to i32
  %RCX108 = sext i32 %101 to i64
  %RAX109 = ptrtoint ptr %RBP_N.22 to i64
  %RCX111 = mul i64 %RCX108, 3
  %102 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX108, i64 3)
  %OF110 = extractvalue { i64, i1 } %102, 1
  %RAX115 = add nsw i64 %RAX109, %RCX111
  %highbit112 = and i64 -9223372036854775808, %RAX115
  %SF113 = icmp ne i64 %highbit112, 0
  %ZF114 = icmp eq i64 %RAX115, 0
  %memload116 = load i64, ptr %RBP_N.52, align 1
  %103 = trunc i64 %memload116 to i32
  %RCX117 = sext i32 %103 to i64
  %memref-basereg118 = add i64 %RAX115, %RCX117
  %104 = inttoptr i64 %memref-basereg118 to ptr
  %memload119 = load i32, ptr %104, align 1
  %105 = trunc i32 %memload119 to i8
  %EAX120 = sext i8 %105 to i32
  %106 = sub i32 %EAX120, 120
  %107 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX120, i32 120)
  %CF121 = extractvalue { i32, i1 } %107, 1
  %ZF122 = icmp eq i32 %106, 0
  %highbit123 = and i32 -2147483648, %106
  %SF124 = icmp ne i32 %highbit123, 0
  %108 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX120, i32 120)
  %OF125 = extractvalue { i32, i1 } %108, 1
  %109 = and i32 %106, 255
  %110 = call i32 @llvm.ctpop.i32(i32 %109)
  %111 = and i32 %110, 1
  %PF126 = icmp eq i32 %111, 0
  %CmpZF_JNE = icmp eq i1 %ZF122, false
  br i1 %CmpZF_JNE, label %bb.18, label %bb.17

bb.17:                                            ; preds = %bb.16
  store i32 1, ptr %RBP_N.28, align 1
  br label %bb.18

bb.18:                                            ; preds = %bb.17, %bb.16
  br label %bb.19

bb.19:                                            ; preds = %bb.18
  %memload127 = load i32, ptr %RBP_N.52, align 1
  %EAX134 = add i32 %memload127, 1
  %112 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload127, i32 1)
  %CF128 = extractvalue { i32, i1 } %112, 1
  %113 = and i32 %EAX134, 255
  %114 = call i32 @llvm.ctpop.i32(i32 %113)
  %115 = and i32 %114, 1
  %PF129 = icmp eq i32 %115, 0
  %ZF130 = icmp eq i32 %EAX134, 0
  %highbit131 = and i32 -2147483648, %EAX134
  %SF132 = icmp ne i32 %highbit131, 0
  %116 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload127, i32 1)
  %OF133 = extractvalue { i32, i1 } %116, 1
  store i32 %EAX134, ptr %RBP_N.52, align 1
  br label %bb.15

bb.20:                                            ; preds = %bb.15
  %EAX135 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 36))
  %memload136 = load i32, ptr %RBP_N.48, align 1
  %EAX143 = add i32 %memload136, 1
  %117 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload136, i32 1)
  %CF137 = extractvalue { i32, i1 } %117, 1
  %118 = and i32 %EAX143, 255
  %119 = call i32 @llvm.ctpop.i32(i32 %118)
  %120 = and i32 %119, 1
  %PF138 = icmp eq i32 %120, 0
  %ZF139 = icmp eq i32 %EAX143, 0
  %highbit140 = and i32 -2147483648, %EAX143
  %SF141 = icmp ne i32 %highbit140, 0
  %121 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload136, i32 1)
  %OF142 = extractvalue { i32, i1 } %121, 1
  store i32 %EAX143, ptr %RBP_N.48, align 1
  br label %bb.13

bb.21:                                            ; preds = %bb.13
  %122 = load i32, ptr %RBP_N.28, align 1
  %123 = zext i32 %122 to i64
  %124 = zext i32 1 to i64
  %125 = sub i64 %123, %124
  %126 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %123, i64 %124)
  %CF144 = extractvalue { i64, i1 } %126, 1
  %ZF145 = icmp eq i64 %125, 0
  %highbit146 = and i64 -9223372036854775808, %125
  %SF147 = icmp ne i64 %highbit146, 0
  %127 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %123, i64 %124)
  %OF148 = extractvalue { i64, i1 } %127, 1
  %128 = and i64 %125, 255
  %129 = call i64 @llvm.ctpop.i64(i64 %128)
  %130 = and i64 %129, 1
  %PF149 = icmp eq i64 %130, 0
  %CmpZF_JNE158 = icmp eq i1 %ZF145, false
  br i1 %CmpZF_JNE158, label %bb.23, label %bb.22

bb.22:                                            ; preds = %bb.21
  %EAX150 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 57))
  br label %bb.23

bb.23:                                            ; preds = %bb.22, %bb.21
  %memload151 = load i32, ptr %RBP_N.4, align 1
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
!1 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 13)}
!4 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 21)}
