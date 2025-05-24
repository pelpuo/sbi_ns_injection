; ModuleID = 'rodata_test.bc'
source_filename = "./bin/oobr_direct_index_string"

@rodata_15 = private unnamed_addr constant [154 x i8] c"\01\00\02\00abcde\00fghij\00Last element of string 1 is: %c\0A\00Null terminator for string 1: %d\0A\00Out of bounds read: %c\0A\00Test Failed: Simple String Out of Bounds Read\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.24 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.16 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.4 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %3 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %4 = ptrtoint i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %4, i64* %RBP_N.16, align 1
  %5 = ptrtoint i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 10) to i64, !ROData_Index !2
  store i64 %5, i64* %RBP_N.24, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %memref-disp = add i64 %memload, 4
  %6 = inttoptr i64 %memref-disp to i32*
  %memload1 = load i32, i32* %6, align 1
  %7 = trunc i32 %memload1 to i8
  %ESI = sext i8 %7 to i32
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 16), i32 %ESI)
  %memload2 = load i64, i64* %RBP_N.16, align 1
  %memref-disp3 = add i64 %memload2, 5
  %8 = inttoptr i64 %memref-disp3 to i32*
  %memload4 = load i32, i32* %8, align 1
  %9 = trunc i32 %memload4 to i8
  %ESI5 = sext i8 %9 to i32
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 49), i32 %ESI5)
  %memload7 = load i64, i64* %RBP_N.16, align 1
  %memref-disp8 = add i64 %memload7, 6
  %10 = inttoptr i64 %memref-disp8 to i32*
  %memload9 = load i32, i32* %10, align 1
  %11 = trunc i32 %memload9 to i8
  %ESI10 = sext i8 %11 to i32
  %EAX11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 83), i32 %ESI10)
  %memload12 = load i64, i64* %RBP_N.16, align 1
  %memref-disp13 = add i64 %memload12, 6
  %12 = inttoptr i64 %memref-disp13 to i32*
  %memload14 = load i32, i32* %12, align 1
  %13 = trunc i32 %memload14 to i8
  %EAX15 = sext i8 %13 to i32
  %14 = sub i32 %EAX15, 0
  %15 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX15, i32 0)
  %CF = extractvalue { i32, i1 } %15, 1
  %ZF = icmp eq i32 %14, 0
  %highbit = and i32 -2147483648, %14
  %SF = icmp ne i32 %highbit, 0
  %16 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX15, i32 0)
  %OF = extractvalue { i32, i1 } %16, 1
  %17 = and i32 %14, 255
  %18 = call i32 @llvm.ctpop.i32(i32 %17)
  %19 = and i32 %18, 1
  %PF = icmp eq i32 %19, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 107))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 10)}
