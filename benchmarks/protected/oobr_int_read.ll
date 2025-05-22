; ModuleID = './protected_bc/oobr_int_read.bc'
source_filename = "./bin/oobr_int_read"

@rodata_15 = private unnamed_addr constant [116 x i8] c"\01\00\02\00PUBLIC\00VALUABLE DATA\00String 1: %s\0A\00String 2: %s\0A\0A\00%x\0A\00Test Failed: Out of Bounds Read using pointer conversion\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_23 = private constant i16 65
@rodata_15_4 = private constant i32 1279415632
@rodata_15_11 = private constant i64 4993438935218405718
@rodata_15_8 = private constant i16 17225
@rodata_15_10 = private constant i8 0
@rodata_15_19 = private constant i32 1413563424

define dso_local void @choice(i64 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 16, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %RBP_N.8 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i64 %arg1, i64* %RBP_N.8, align 1
  ret void
}

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 65
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 2)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i16*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 61
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 59
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 2)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i16*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 55
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 47
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 8)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i64*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 8)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i64*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 4)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i32*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 67
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* @rodata_15_4, align 1, !ROData_Content !2
  store i32 %memload, i32* %ns_ptr9, align 1
  %1 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* @rodata_15_8, align 1, !ROData_Content !4
  store i16 %memload1, i16* %ns_ptr6, align 1
  %memload2 = load i8, i8* @rodata_15_10, align 1, !ROData_Content !5
  store i8 %memload2, i8* %RBP_N.5, align 1
  %2 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 11) to i64*, !ROData_Index !6
  %memload3 = load i64, i64* @rodata_15_11, align 1, !ROData_Content !7
  store i64 %memload3, i64* %ns_ptr18, align 1
  %3 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 19) to i32*, !ROData_Index !8
  %memload4 = load i32, i32* @rodata_15_19, align 1, !ROData_Content !9
  store i32 %memload4, i32* %ns_ptr15, align 1
  %4 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 23) to i16*, !ROData_Index !10
  %memload5 = load i16, i16* @rodata_15_23, align 1, !ROData_Content !11
  store i16 %memload5, i16* %ns_ptr12, align 1
  %RAX = ptrtoint i32* %ns_ptr9 to i64
  store i64 %RAX, i64* %ns_ptr21, align 1
  %RAX6 = ptrtoint i64* %ns_ptr18 to i64
  store i64 %RAX6, i64* %ns_ptr24, align 1
  %memload7 = load i64, i64* %ns_ptr21, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 25), i64 %memload7)
  %memload8 = load i64, i64* %ns_ptr24, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 39), i64 %memload8)
  store i32 0, i32* %ns_ptr27, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %5 = load i32, i32* %ns_ptr27, align 1
  %6 = zext i32 %5 to i64
  %7 = zext i32 6 to i64
  %8 = sub i64 %6, %7
  %9 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %6, i64 %7)
  %CF = extractvalue { i64, i1 } %9, 1
  %ZF = icmp eq i64 %8, 0
  %highbit = and i64 -9223372036854775808, %8
  %SF = icmp ne i64 %highbit, 0
  %10 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %6, i64 %7)
  %OF = extractvalue { i64, i1 } %10, 1
  %11 = and i64 %8, 255
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = and i64 %12, 1
  %PF = icmp eq i64 %13, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload10 = load i64, i64* %ns_ptr21, align 1
  %14 = bitcast i32* %ns_ptr27 to i64*
  %memload11 = load i64, i64* %14, align 1
  %15 = trunc i64 %memload11 to i32
  %RCX = sext i32 %15 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload10, %memref-idxreg
  %16 = inttoptr i64 %memref-basereg to i32*
  %memload12 = load i32, i32* %16, align 1
  %EAX13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 54), i32 %memload12)
  %memload14 = load i32, i32* %ns_ptr27, align 1
  %EAX21 = add i32 %memload14, 1
  %17 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload14, i32 1)
  %CF15 = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %EAX21, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF16 = icmp eq i32 %20, 0
  %ZF17 = icmp eq i32 %EAX21, 0
  %highbit18 = and i32 -2147483648, %EAX21
  %SF19 = icmp ne i32 %highbit18, 0
  %21 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload14, i32 1)
  %OF20 = extractvalue { i32, i1 } %21, 1
  store i32 %EAX21, i32* %ns_ptr27, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %memload22 = load i64, i64* %ns_ptr21, align 1
  %memref-disp = add i64 %memload22, 8
  %22 = inttoptr i64 %memref-disp to i32*
  %23 = load i32, i32* %22, align 1
  %24 = zext i32 %23 to i64
  %25 = zext i32 1096109121 to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF23 = extractvalue { i64, i1 } %27, 1
  %ZF24 = icmp eq i64 %26, 0
  %highbit25 = and i64 -9223372036854775808, %26
  %SF26 = icmp ne i64 %highbit25, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF27 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF28 = icmp eq i64 %31, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 58))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 11)}
!7 = !{!6}
!8 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 19)}
!9 = !{!8}
!10 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 23)}
!11 = !{!10}
