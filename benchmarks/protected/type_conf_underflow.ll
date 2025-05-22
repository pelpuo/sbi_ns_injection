; ModuleID = './protected_bc/type_conf_underflow.bc'
source_filename = "./bin/type_conf_underflow"

@rodata_15 = private unnamed_addr constant [145 x i8] c"\01\00\02\00AAAAAA\00Public\00Fetching char at index %d\0A\00Fetched char: %c\0A\00Test Failed: OOB access caused by int->short overflow leading to array underread\0A\00", align 4, !ROData_SecInfo !0

define dso_local i32 @get_char(i16 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 32, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 30
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 2)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i16*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %RBP_N.24 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i16 %arg1, i16* %ns_ptr3, align 1
  %0 = ptrtoint i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %0, i64* %ns_ptr6, align 1
  %1 = ptrtoint i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 11) to i64, !ROData_Index !2
  store i64 %1, i64* %RBP_N.24, align 1
  %memload = load i64, i64* %RBP_N.24, align 1
  %2 = bitcast i16* %ns_ptr3 to i64*
  %memload1 = load i64, i64* %2, align 1
  %3 = trunc i64 %memload1 to i16
  %RCX = sext i16 %3 to i64
  %memref-basereg = add i64 %memload, %RCX
  %4 = inttoptr i64 %memref-basereg to i32*
  %memload2 = load i32, i32* %4, align 1
  %5 = trunc i32 %memload2 to i8
  %EAX = sext i8 %5 to i32
  ret i32 %EAX
}

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 4)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i32*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 23
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 23
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %RBP_N.17 = getelementptr i8, i8* %stktop_8, i64 23
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i32 65536, i32* %ns_ptr6, align 1
  store i32 2, i32* %ns_ptr9, align 1
  %memload = load i32, i32* %ns_ptr9, align 1
  %memload1 = load i32, i32* %ns_ptr6, align 1
  %EAX = sub i32 %memload1, %memload
  %0 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload1, i32 %memload)
  %CF = extractvalue { i32, i1 } %0, 1
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %1 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload1, i32 %memload)
  %OF = extractvalue { i32, i1 } %1, 1
  %2 = and i32 %EAX, 255
  %3 = call i32 @llvm.ctpop.i32(i32 %2)
  %4 = and i32 %3, 1
  %PF = icmp eq i32 %4, 0
  store i32 %EAX, i32* %ns_ptr6, align 1
  store i32 1, i32* %ns_ptr12, align 1
  %memload2 = load i32, i32* %ns_ptr6, align 1
  %EAX3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 18), i32 %memload2)
  %memload4 = load i32, i32* %ns_ptr6, align 1
  %5 = trunc i32 %memload4 to i16
  %EDI = sext i16 %5 to i32
  %6 = trunc i32 %EDI to i16
  %EAX5 = call i32 @get_char(i16 %6)
  %7 = trunc i32 %EAX5 to i8
  store i8 %7, i8* %RBP_N.17, align 1
  %memload6 = load i32, i32* %ns_ptr18, align 1
  %8 = trunc i32 %memload6 to i8
  %ESI = sext i8 %8 to i32
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 45), i32 %ESI)
  %memload8 = load i32, i32* %ns_ptr15, align 1
  %9 = trunc i32 %memload8 to i8
  %EAX9 = sext i8 %9 to i32
  %10 = sub i32 %EAX9, 65
  %11 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX9, i32 65)
  %CF10 = extractvalue { i32, i1 } %11, 1
  %ZF11 = icmp eq i32 %10, 0
  %highbit12 = and i32 -2147483648, %10
  %SF13 = icmp ne i32 %highbit12, 0
  %12 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX9, i32 65)
  %OF14 = extractvalue { i32, i1 } %12, 1
  %13 = and i32 %10, 255
  %14 = call i32 @llvm.ctpop.i32(i32 %13)
  %15 = and i32 %14, 1
  %PF15 = icmp eq i32 %15, 0
  %CmpZF_JNE = icmp eq i1 %ZF11, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  store i32 0, i32* %ns_ptr12, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %16 = load i32, i32* %ns_ptr12, align 1
  %17 = zext i32 %16 to i64
  %18 = zext i32 0 to i64
  %19 = sub i64 %17, %18
  %20 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %17, i64 %18)
  %CF16 = extractvalue { i64, i1 } %20, 1
  %ZF17 = icmp eq i64 %19, 0
  %highbit18 = and i64 -9223372036854775808, %19
  %SF19 = icmp ne i64 %highbit18, 0
  %21 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %17, i64 %18)
  %OF20 = extractvalue { i64, i1 } %21, 1
  %22 = and i64 %19, 255
  %23 = call i64 @llvm.ctpop.i64(i64 %22)
  %24 = and i64 %23, 1
  %PF21 = icmp eq i64 %24, 0
  %CmpZF_JNE24 = icmp eq i1 %ZF17, false
  br i1 %CmpZF_JNE24, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 63))
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %memload23 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload23
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 11)}
