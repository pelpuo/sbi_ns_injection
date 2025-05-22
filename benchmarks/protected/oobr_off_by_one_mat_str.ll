; ModuleID = './protected_bc/oobr_off_by_one_mat_str.bc'
source_filename = "./bin/oobr_off_by_one_mat_str"

@rodata_15 = private unnamed_addr constant [99 x i8] c"\01\00\02\00abcdefghijklmnopqr%c\00\0ATest Failed: Off by One in string matrix manipulation leaks information\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_21 = private constant i8 114
@rodata_15_4 = private constant i64 7523094288207667809
@rodata_15_13 = private constant i64 8174155843750357866
@rodata_15_12 = private constant i8 105

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 43
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 34
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
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 19
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %RBP_N.37 = getelementptr i8, i8* %stktop_8, i64 19
  %RBP_N.14 = getelementptr i8, i8* %stktop_8, i64 42
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 51
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr6, align 1
  %memload1 = load i8, i8* @rodata_15_12, align 1, !ROData_Content !3
  store i8 %memload1, i8* %RBP_N.5, align 1
  %1 = bitcast i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 13) to i64*, !ROData_Index !4
  %memload2 = load i64, i64* @rodata_15_13, align 1, !ROData_Content !5
  store i64 %memload2, i64* %ns_ptr9, align 1
  %memload3 = load i8, i8* @rodata_15_21, align 1, !ROData_Content !6
  store i8 %memload3, i8* %RBP_N.14, align 1
  store i32 0, i32* %ns_ptr12, align 1
  store i32 0, i32* %ns_ptr15, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.8, %entry
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
  br i1 %ZFAndSFOF_JG, label %bb.9, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %ns_ptr18, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.7, %bb.2
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
  %ZFCmp_JG66 = icmp eq i1 %ZF5, false
  %SFOFCmp_JG67 = icmp eq i1 %SF7, %OF8
  %ZFAndSFOF_JG68 = and i1 %ZFCmp_JG66, %SFOFCmp_JG67
  br i1 %ZFAndSFOF_JG68, label %bb.8, label %bb.4

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
  %memload19 = load i8, i8* %25, align 1
  store i8 %memload19, i8* %RBP_N.37, align 1
  %26 = bitcast i32* %ns_ptr15 to i64*
  %memload20 = load i64, i64* %26, align 1
  %27 = trunc i64 %memload20 to i32
  %RCX21 = sext i32 %27 to i64
  %RAX22 = ptrtoint i64* %ns_ptr6 to i64
  %RCX24 = mul i64 %RCX21, 3
  %28 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX21, i64 3)
  %OF23 = extractvalue { i64, i1 } %28, 1
  %RAX28 = add nsw i64 %RAX22, %RCX24
  %highbit25 = and i64 -9223372036854775808, %RAX28
  %SF26 = icmp ne i64 %highbit25, 0
  %ZF27 = icmp eq i64 %RAX28, 0
  %29 = bitcast i32* %ns_ptr18 to i64*
  %memload29 = load i64, i64* %29, align 1
  %30 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %30 to i64
  %memref-basereg31 = add i64 %RAX28, %RCX30
  %31 = inttoptr i64 %memref-basereg31 to i32*
  %memload32 = load i32, i32* %31, align 1
  %32 = trunc i32 %memload32 to i8
  %ESI = sext i8 %32 to i32
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 22), i32 %ESI)
  %memload33 = load i32, i32* %ns_ptr21, align 1
  %33 = trunc i32 %memload33 to i8
  %EAX34 = sext i8 %33 to i32
  %34 = sub i32 %EAX34, 106
  %35 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX34, i32 106)
  %CF35 = extractvalue { i32, i1 } %35, 1
  %ZF36 = icmp eq i32 %34, 0
  %highbit37 = and i32 -2147483648, %34
  %SF38 = icmp ne i32 %highbit37, 0
  %36 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX34, i32 106)
  %OF39 = extractvalue { i32, i1 } %36, 1
  %37 = and i32 %34, 255
  %38 = call i32 @llvm.ctpop.i32(i32 %37)
  %39 = and i32 %38, 1
  %PF40 = icmp eq i32 %39, 0
  %CmpZF_JNE = icmp eq i1 %ZF36, false
  br i1 %CmpZF_JNE, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  store i32 1, i32* %ns_ptr12, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  br label %bb.7

bb.7:                                             ; preds = %bb.6
  %memload41 = load i32, i32* %ns_ptr18, align 1
  %EAX48 = add i32 %memload41, 1
  %40 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload41, i32 1)
  %CF42 = extractvalue { i32, i1 } %40, 1
  %41 = and i32 %EAX48, 255
  %42 = call i32 @llvm.ctpop.i32(i32 %41)
  %43 = and i32 %42, 1
  %PF43 = icmp eq i32 %43, 0
  %ZF44 = icmp eq i32 %EAX48, 0
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %44 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload41, i32 1)
  %OF47 = extractvalue { i32, i1 } %44, 1
  store i32 %EAX48, i32* %ns_ptr18, align 1
  br label %bb.3

bb.8:                                             ; preds = %bb.3
  %EAX49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 97))
  %memload50 = load i32, i32* %ns_ptr15, align 1
  %EAX57 = add i32 %memload50, 1
  %45 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload50, i32 1)
  %CF51 = extractvalue { i32, i1 } %45, 1
  %46 = and i32 %EAX57, 255
  %47 = call i32 @llvm.ctpop.i32(i32 %46)
  %48 = and i32 %47, 1
  %PF52 = icmp eq i32 %48, 0
  %ZF53 = icmp eq i32 %EAX57, 0
  %highbit54 = and i32 -2147483648, %EAX57
  %SF55 = icmp ne i32 %highbit54, 0
  %49 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload50, i32 1)
  %OF56 = extractvalue { i32, i1 } %49, 1
  store i32 %EAX57, i32* %ns_ptr15, align 1
  br label %bb.1

bb.9:                                             ; preds = %bb.1
  %50 = load i32, i32* %ns_ptr12, align 1
  %51 = zext i32 %50 to i64
  %52 = zext i32 1 to i64
  %53 = sub i64 %51, %52
  %54 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %51, i64 %52)
  %CF58 = extractvalue { i64, i1 } %54, 1
  %ZF59 = icmp eq i64 %53, 0
  %highbit60 = and i64 -9223372036854775808, %53
  %SF61 = icmp ne i64 %highbit60, 0
  %55 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %51, i64 %52)
  %OF62 = extractvalue { i64, i1 } %55, 1
  %56 = and i64 %53, 255
  %57 = call i64 @llvm.ctpop.i64(i64 %56)
  %58 = and i64 %57, 1
  %PF63 = icmp eq i64 %58, 0
  %CmpZF_JNE69 = icmp eq i1 %ZF59, false
  br i1 %CmpZF_JNE69, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 25))
  br label %bb.11

bb.11:                                            ; preds = %bb.10, %bb.9
  %memload65 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload65
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
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 13)}
!5 = !{!4}
!6 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 21)}
