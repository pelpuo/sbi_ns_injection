; ModuleID = './protected_bc/oobw_long_write.bc'
source_filename = "./bin/oobw_long_write"

@rodata_15 = private unnamed_addr constant [145 x i8] c"\01\00\02\00PUBLIC\00VALUABLE DATA\00String 1: %s\0A\00String 2: %s\0A\0A\00String 2: %s\0A\00Test Failed: Pointer casting from char to long leads to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0
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
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 8)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i64*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 67
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* @rodata_15_4, align 1, !ROData_Content !2
  store i32 %memload, i32* %ns_ptr9, align 1
  %1 = bitcast i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* @rodata_15_8, align 1, !ROData_Content !4
  store i16 %memload1, i16* %ns_ptr6, align 1
  %memload2 = load i8, i8* @rodata_15_10, align 1, !ROData_Content !5
  store i8 %memload2, i8* %RBP_N.5, align 1
  %2 = bitcast i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 11) to i64*, !ROData_Index !6
  %memload3 = load i64, i64* @rodata_15_11, align 1, !ROData_Content !7
  store i64 %memload3, i64* %ns_ptr18, align 1
  %3 = bitcast i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 19) to i32*, !ROData_Index !8
  %memload4 = load i32, i32* @rodata_15_19, align 1, !ROData_Content !9
  store i32 %memload4, i32* %ns_ptr15, align 1
  %4 = bitcast i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 23) to i16*, !ROData_Index !10
  %memload5 = load i16, i16* @rodata_15_23, align 1, !ROData_Content !11
  store i16 %memload5, i16* %ns_ptr12, align 1
  %RAX = ptrtoint i32* %ns_ptr9 to i64
  store i64 %RAX, i64* %ns_ptr21, align 1
  %RAX6 = ptrtoint i64* %ns_ptr18 to i64
  store i64 %RAX6, i64* %ns_ptr24, align 1
  %memload7 = load i64, i64* %ns_ptr21, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 25), i64 %memload7)
  %memload8 = load i64, i64* %ns_ptr24, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 39), i64 %memload8)
  %memload10 = load i64, i64* %ns_ptr21, align 1
  %RAX11 = add i64 %memload10, 5
  %5 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload10, i64 5)
  %CF = extractvalue { i64, i1 } %5, 1
  %6 = and i64 %RAX11, 255
  %7 = call i64 @llvm.ctpop.i64(i64 %6)
  %8 = and i64 %7, 1
  %PF = icmp eq i64 %8, 0
  %ZF = icmp eq i64 %RAX11, 0
  %highbit = and i64 -9223372036854775808, %RAX11
  %SF = icmp ne i64 %highbit, 0
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload10, i64 5)
  %OF = extractvalue { i64, i1 } %9, 1
  store i64 %RAX11, i64* %ns_ptr27, align 1
  %memload12 = load i64, i64* %ns_ptr27, align 1
  %10 = inttoptr i64 %memload12 to i64*
  store i64 4919420920202273057, i64* %10, align 1
  %memload13 = load i64, i64* %ns_ptr21, align 1
  %EAX14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 25), i64 %memload13)
  %memload15 = load i64, i64* %ns_ptr24, align 1
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 54), i64 %memload15)
  %11 = bitcast i64* %ns_ptr18 to i32*
  %memload17 = load i32, i32* %11, align 1
  %12 = trunc i32 %memload17 to i8
  %EAX18 = sext i8 %12 to i32
  %13 = sub i32 %EAX18, 86
  %14 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX18, i32 86)
  %CF19 = extractvalue { i32, i1 } %14, 1
  %ZF20 = icmp eq i32 %13, 0
  %highbit21 = and i32 -2147483648, %13
  %SF22 = icmp ne i32 %highbit21, 0
  %15 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX18, i32 86)
  %OF23 = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %13, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF24 = icmp eq i32 %18, 0
  %CmpZF_JE = icmp eq i1 %ZF20, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 68))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 11)}
!7 = !{!6}
!8 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 19)}
!9 = !{!8}
!10 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 23)}
!11 = !{!10}
