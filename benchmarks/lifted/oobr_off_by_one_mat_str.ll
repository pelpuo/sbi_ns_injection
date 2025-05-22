; ModuleID = './bin/oobr_off_by_one_mat_str'
source_filename = "./bin/oobr_off_by_one_mat_str"

@rodata_15 = private unnamed_addr constant [99 x i8] c"\01\00\02\00abcdefghijklmnopqr%c\00\0ATest Failed: Off by One in string matrix manipulation leaks information\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %RBP_N.37 = getelementptr i8, i8* %stktop_8, i64 19
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.36 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.32 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.28 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 34
  %RBP_N.22 = bitcast i8* %3 to i64*
  %RBP_N.14 = getelementptr i8, i8* %stktop_8, i64 42
  %4 = getelementptr i8, i8* %stktop_8, i64 43
  %RBP_N.13 = bitcast i8* %4 to i64*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 51
  %5 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.4 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %6 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %7 = bitcast i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload = load i64, i64* %7, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.13, align 1
  %memload1 = load i8, i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 12), align 1, !ROData_Content !3
  store i8 %memload1, i8* %RBP_N.5, align 1
  %8 = bitcast i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 13) to i64*, !ROData_Index !4
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !5
  store i64 %memload2, i64* %RBP_N.22, align 1
  %memload3 = load i8, i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 21), align 1, !ROData_Content !6
  store i8 %memload3, i8* %RBP_N.14, align 1
  store i32 0, i32* %RBP_N.28, align 1
  store i32 0, i32* %RBP_N.32, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.8
  %9 = load i32, i32* %RBP_N.32, align 1
  %10 = zext i32 %9 to i64
  %11 = zext i32 3 to i64
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
  %ZFCmp_JG = icmp eq i1 %ZF, false
  %SFOFCmp_JG = icmp eq i1 %SF, %OF
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.9, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, i32* %RBP_N.36, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.7
  %18 = load i32, i32* %RBP_N.36, align 1
  %19 = zext i32 %18 to i64
  %20 = zext i32 3 to i64
  %21 = sub i64 %19, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %19, i64 %20)
  %CF4 = extractvalue { i64, i1 } %22, 1
  %ZF5 = icmp eq i64 %21, 0
  %highbit6 = and i64 -9223372036854775808, %21
  %SF7 = icmp ne i64 %highbit6, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %19, i64 %20)
  %OF8 = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF9 = icmp eq i64 %26, 0
  %ZFCmp_JG66 = icmp eq i1 %ZF5, false
  %SFOFCmp_JG67 = icmp eq i1 %SF7, %OF8
  %ZFAndSFOF_JG68 = and i1 %ZFCmp_JG66, %SFOFCmp_JG67
  br i1 %ZFAndSFOF_JG68, label %bb.8, label %bb.4

bb.4:                                             ; preds = %bb.3
  %27 = bitcast i32* %RBP_N.32 to i64*
  %memload10 = load i64, i64* %27, align 1
  %28 = trunc i64 %memload10 to i32
  %RCX = sext i32 %28 to i64
  %RAX = ptrtoint i64* %RBP_N.13 to i64
  %RCX12 = mul i64 %RCX, 3
  %29 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX, i64 3)
  %OF11 = extractvalue { i64, i1 } %29, 1
  %RAX16 = add nsw i64 %RAX, %RCX12
  %highbit13 = and i64 -9223372036854775808, %RAX16
  %SF14 = icmp ne i64 %highbit13, 0
  %ZF15 = icmp eq i64 %RAX16, 0
  %30 = bitcast i32* %RBP_N.36 to i64*
  %memload17 = load i64, i64* %30, align 1
  %31 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %31 to i64
  %memref-basereg = add i64 %RAX16, %RCX18
  %32 = inttoptr i64 %memref-basereg to i8*
  %memload19 = load i8, i8* %32, align 1
  store i8 %memload19, i8* %RBP_N.37, align 1
  %33 = bitcast i32* %RBP_N.32 to i64*
  %memload20 = load i64, i64* %33, align 1
  %34 = trunc i64 %memload20 to i32
  %RCX21 = sext i32 %34 to i64
  %RAX22 = ptrtoint i64* %RBP_N.13 to i64
  %RCX24 = mul i64 %RCX21, 3
  %35 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RCX21, i64 3)
  %OF23 = extractvalue { i64, i1 } %35, 1
  %RAX28 = add nsw i64 %RAX22, %RCX24
  %highbit25 = and i64 -9223372036854775808, %RAX28
  %SF26 = icmp ne i64 %highbit25, 0
  %ZF27 = icmp eq i64 %RAX28, 0
  %36 = bitcast i32* %RBP_N.36 to i64*
  %memload29 = load i64, i64* %36, align 1
  %37 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %37 to i64
  %memref-basereg31 = add i64 %RAX28, %RCX30
  %38 = inttoptr i64 %memref-basereg31 to i32*
  %memload32 = load i32, i32* %38, align 1
  %39 = trunc i32 %memload32 to i8
  %ESI = sext i8 %39 to i32
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 22), i32 %ESI)
  %40 = bitcast i8* %RBP_N.37 to i32*
  %memload33 = load i32, i32* %40, align 1
  %41 = trunc i32 %memload33 to i8
  %EAX34 = sext i8 %41 to i32
  %42 = sub i32 %EAX34, 106
  %43 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX34, i32 106)
  %CF35 = extractvalue { i32, i1 } %43, 1
  %ZF36 = icmp eq i32 %42, 0
  %highbit37 = and i32 -2147483648, %42
  %SF38 = icmp ne i32 %highbit37, 0
  %44 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX34, i32 106)
  %OF39 = extractvalue { i32, i1 } %44, 1
  %45 = and i32 %42, 255
  %46 = call i32 @llvm.ctpop.i32(i32 %45)
  %47 = and i32 %46, 1
  %PF40 = icmp eq i32 %47, 0
  %CmpZF_JNE = icmp eq i1 %ZF36, false
  br i1 %CmpZF_JNE, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  store i32 1, i32* %RBP_N.28, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  br label %bb.7

bb.7:                                             ; preds = %bb.6
  %memload41 = load i32, i32* %RBP_N.36, align 1
  %EAX48 = add i32 %memload41, 1
  %48 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload41, i32 1)
  %CF42 = extractvalue { i32, i1 } %48, 1
  %49 = and i32 %EAX48, 255
  %50 = call i32 @llvm.ctpop.i32(i32 %49)
  %51 = and i32 %50, 1
  %PF43 = icmp eq i32 %51, 0
  %ZF44 = icmp eq i32 %EAX48, 0
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %52 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload41, i32 1)
  %OF47 = extractvalue { i32, i1 } %52, 1
  store i32 %EAX48, i32* %RBP_N.36, align 1
  br label %bb.3

bb.8:                                             ; preds = %bb.3
  %EAX49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 97))
  %memload50 = load i32, i32* %RBP_N.32, align 1
  %EAX57 = add i32 %memload50, 1
  %53 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload50, i32 1)
  %CF51 = extractvalue { i32, i1 } %53, 1
  %54 = and i32 %EAX57, 255
  %55 = call i32 @llvm.ctpop.i32(i32 %54)
  %56 = and i32 %55, 1
  %PF52 = icmp eq i32 %56, 0
  %ZF53 = icmp eq i32 %EAX57, 0
  %highbit54 = and i32 -2147483648, %EAX57
  %SF55 = icmp ne i32 %highbit54, 0
  %57 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload50, i32 1)
  %OF56 = extractvalue { i32, i1 } %57, 1
  store i32 %EAX57, i32* %RBP_N.32, align 1
  br label %bb.1

bb.9:                                             ; preds = %bb.1
  %58 = load i32, i32* %RBP_N.28, align 1
  %59 = zext i32 %58 to i64
  %60 = zext i32 1 to i64
  %61 = sub i64 %59, %60
  %62 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %59, i64 %60)
  %CF58 = extractvalue { i64, i1 } %62, 1
  %ZF59 = icmp eq i64 %61, 0
  %highbit60 = and i64 -9223372036854775808, %61
  %SF61 = icmp ne i64 %highbit60, 0
  %63 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %59, i64 %60)
  %OF62 = extractvalue { i64, i1 } %63, 1
  %64 = and i64 %61, 255
  %65 = call i64 @llvm.ctpop.i64(i64 %64)
  %66 = and i64 %65, 1
  %PF63 = icmp eq i64 %66, 0
  %CmpZF_JNE69 = icmp eq i1 %ZF59, false
  br i1 %CmpZF_JNE69, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 25))
  br label %bb.11

bb.11:                                            ; preds = %bb.10, %bb.9
  %memload65 = load i32, i32* %RBP_N.4, align 1
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 13)}
!5 = !{!4}
!6 = !{i8* getelementptr inbounds ([99 x i8], [99 x i8]* @rodata_15, i32 0, i32 21)}
