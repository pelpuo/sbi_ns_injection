; ModuleID = './protected_bc/oobr_direct_index_string.bc'
source_filename = "./bin/oobr_direct_index_string"

@rodata_15 = private unnamed_addr constant [154 x i8] c"\01\00\02\00abcde\00fghij\00Last element of string 1 is: %c\0A\00Null terminator for string 1: %d\0A\00Out of bounds read: %c\0A\00Test Failed: Simple String Out of Bounds Read\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = ptrtoint i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %0, i64* %ns_ptr6, align 1
  %1 = ptrtoint i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 10) to i64, !ROData_Index !2
  store i64 %1, i64* %ns_ptr9, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %memref-disp = add i64 %memload, 4
  %2 = inttoptr i64 %memref-disp to i32*
  %memload1 = load i32, i32* %2, align 1
  %3 = trunc i32 %memload1 to i8
  %ESI = sext i8 %3 to i32
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 16), i32 %ESI)
  %memload2 = load i64, i64* %ns_ptr6, align 1
  %memref-disp3 = add i64 %memload2, 5
  %4 = inttoptr i64 %memref-disp3 to i32*
  %memload4 = load i32, i32* %4, align 1
  %5 = trunc i32 %memload4 to i8
  %ESI5 = sext i8 %5 to i32
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 49), i32 %ESI5)
  %memload7 = load i64, i64* %ns_ptr6, align 1
  %memref-disp8 = add i64 %memload7, 6
  %6 = inttoptr i64 %memref-disp8 to i32*
  %memload9 = load i32, i32* %6, align 1
  %7 = trunc i32 %memload9 to i8
  %ESI10 = sext i8 %7 to i32
  %EAX11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 83), i32 %ESI10)
  %memload12 = load i64, i64* %ns_ptr6, align 1
  %memref-disp13 = add i64 %memload12, 6
  %8 = inttoptr i64 %memref-disp13 to i32*
  %memload14 = load i32, i32* %8, align 1
  %9 = trunc i32 %memload14 to i8
  %EAX15 = sext i8 %9 to i32
  %10 = sub i32 %EAX15, 0
  %11 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX15, i32 0)
  %CF = extractvalue { i32, i1 } %11, 1
  %ZF = icmp eq i32 %10, 0
  %highbit = and i32 -2147483648, %10
  %SF = icmp ne i32 %highbit, 0
  %12 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX15, i32 0)
  %OF = extractvalue { i32, i1 } %12, 1
  %13 = and i32 %10, 255
  %14 = call i32 @llvm.ctpop.i32(i32 %13)
  %15 = and i32 %14, 1
  %PF = icmp eq i32 %15, 0
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

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 10)}
