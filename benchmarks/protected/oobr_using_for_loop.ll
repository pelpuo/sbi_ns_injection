; ModuleID = './protected_bc/oobr_using_for_loop.bc'
source_filename = "./bin/oobr_using_for_loop"

@rodata_15 = private unnamed_addr constant [154 x i8] c"\01\00\02\00random\00String 1 length is: %d\0A\00String 2 length is: %d\0A\00%c\00Test Failed: Out of Bounds Read using simple for loop\0A\00\00\00\00\00\00\00\00\00\00\00\00This is the second string\00", align 16, !ROData_SecInfo !0
@rodata_15_128 = private constant i64 2338328219631577172
@rodata_15_144 = private constant i64 7956016061199967342
@rodata_15_4 = private constant i32 1684955506
@rodata_15_8 = private constant i16 28015
@rodata_15_136 = private constant i64 8026370506043517044
@rodata_15_10 = private constant i8 0
@rodata_15_152 = private constant i16 103

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
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 2)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i16*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 8)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i64*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 4)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i32*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 4)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i32*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 67
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4) to i32*, !ROData_Index !1
  %memload = load i32, i32* @rodata_15_4, align 1, !ROData_Content !2
  store i32 %memload, i32* %ns_ptr9, align 1
  %1 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 8) to i16*, !ROData_Index !3
  %memload1 = load i16, i16* @rodata_15_8, align 1, !ROData_Content !4
  store i16 %memload1, i16* %ns_ptr6, align 1
  %memload2 = load i8, i8* @rodata_15_10, align 1, !ROData_Content !5
  store i8 %memload2, i8* %RBP_N.5, align 1
  %2 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 128) to i64*, !ROData_Index !6
  %memload3 = load i64, i64* @rodata_15_128, align 1, !ROData_Content !7
  store i64 %memload3, i64* %ns_ptr21, align 1
  %3 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 136) to i64*, !ROData_Index !8
  %memload4 = load i64, i64* @rodata_15_136, align 1, !ROData_Content !9
  store i64 %memload4, i64* %ns_ptr18, align 1
  %4 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 144) to i64*, !ROData_Index !10
  %memload5 = load i64, i64* @rodata_15_144, align 1, !ROData_Content !11
  store i64 %memload5, i64* %ns_ptr15, align 1
  %5 = bitcast i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 152) to i16*, !ROData_Index !12
  %memload6 = load i16, i16* @rodata_15_152, align 1, !ROData_Content !13
  store i16 %memload6, i16* %ns_ptr12, align 1
  store i32 7, i32* %ns_ptr24, align 1
  store i32 26, i32* %ns_ptr27, align 1
  %memload7 = load i32, i32* %ns_ptr24, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 11), i32 %memload7)
  %memload8 = load i32, i32* %ns_ptr27, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 35), i32 %memload8)
  %6 = bitcast i64* %RSPAdj_N.64 to i8*
  %7 = getelementptr i8, i8* %6, i64 4
  %8 = bitcast i8* %7 to i32*
  store i32 0, i32* %8, align 1
  %9 = bitcast i64* %RSPAdj_N.64 to i32*
  store i32 0, i32* %9, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.6, %entry
  %10 = bitcast i64* %RSPAdj_N.64 to i32*
  %memload10 = load i32, i32* %10, align 1
  %11 = load i32, i32* %ns_ptr27, align 1
  %12 = sub i32 %memload10, %11
  %13 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %11)
  %CF = extractvalue { i32, i1 } %13, 1
  %ZF = icmp eq i32 %12, 0
  %highbit = and i32 -2147483648, %12
  %SF = icmp ne i32 %highbit, 0
  %14 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %11)
  %OF = extractvalue { i32, i1 } %14, 1
  %15 = and i32 %12, 255
  %16 = call i32 @llvm.ctpop.i32(i32 %15)
  %17 = and i32 %16, 1
  %PF = icmp eq i32 %17, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload11 = load i64, i64* %RSPAdj_N.64, align 1
  %18 = trunc i64 %memload11 to i32
  %RAX = sext i32 %18 to i64
  %19 = bitcast i32* %ns_ptr9 to i8*
  %20 = getelementptr i8, i8* %19, i64 %RAX
  %21 = bitcast i8* %20 to i32*
  %memload12 = load i32, i32* %21, align 1
  %22 = trunc i32 %memload12 to i8
  %ESI = sext i8 %22 to i32
  %EAX13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 59), i32 %ESI)
  %23 = bitcast i64* %RSPAdj_N.64 to i32*
  %memload14 = load i32, i32* %23, align 1
  %24 = load i32, i32* %ns_ptr24, align 1
  %25 = sub i32 %memload14, %24
  %26 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload14, i32 %24)
  %CF15 = extractvalue { i32, i1 } %26, 1
  %ZF16 = icmp eq i32 %25, 0
  %highbit17 = and i32 -2147483648, %25
  %SF18 = icmp ne i32 %highbit17, 0
  %27 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload14, i32 %24)
  %OF19 = extractvalue { i32, i1 } %27, 1
  %28 = and i32 %25, 255
  %29 = call i32 @llvm.ctpop.i32(i32 %28)
  %30 = and i32 %29, 1
  %PF20 = icmp eq i32 %30, 0
  %SFAndOF_JL = icmp ne i1 %SF18, %OF19
  br i1 %SFAndOF_JL, label %bb.5, label %bb.3

bb.3:                                             ; preds = %bb.2
  %memload21 = load i64, i64* %RSPAdj_N.64, align 1
  %31 = trunc i64 %memload21 to i32
  %RAX22 = sext i32 %31 to i64
  %32 = bitcast i32* %ns_ptr9 to i8*
  %33 = getelementptr i8, i8* %32, i64 %RAX22
  %34 = bitcast i8* %33 to i32*
  %memload24 = load i32, i32* %34, align 1
  %35 = trunc i32 %memload24 to i8
  %EAX25 = sext i8 %35 to i32
  %36 = sub i32 %EAX25, 0
  %37 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX25, i32 0)
  %CF26 = extractvalue { i32, i1 } %37, 1
  %ZF27 = icmp eq i32 %36, 0
  %highbit28 = and i32 -2147483648, %36
  %SF29 = icmp ne i32 %highbit28, 0
  %38 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX25, i32 0)
  %OF30 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %36, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF31 = icmp eq i32 %41, 0
  %CmpZF_JE = icmp eq i1 %ZF27, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %42 = bitcast i64* %RSPAdj_N.64 to i8*
  %43 = getelementptr i8, i8* %42, i64 4
  %44 = bitcast i8* %43 to i32*
  store i32 1, i32* %44, align 1
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3, %bb.2
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %45 = bitcast i64* %RSPAdj_N.64 to i32*
  %memload32 = load i32, i32* %45, align 1
  %EAX39 = add i32 %memload32, 1
  %46 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload32, i32 1)
  %CF33 = extractvalue { i32, i1 } %46, 1
  %47 = and i32 %EAX39, 255
  %48 = call i32 @llvm.ctpop.i32(i32 %47)
  %49 = and i32 %48, 1
  %PF34 = icmp eq i32 %49, 0
  %ZF35 = icmp eq i32 %EAX39, 0
  %highbit36 = and i32 -2147483648, %EAX39
  %SF37 = icmp ne i32 %highbit36, 0
  %50 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload32, i32 1)
  %OF38 = extractvalue { i32, i1 } %50, 1
  %51 = bitcast i64* %RSPAdj_N.64 to i32*
  store i32 %EAX39, i32* %51, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  %EAX40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 33))
  %52 = bitcast i64* %RSPAdj_N.64 to i8*
  %53 = getelementptr i8, i8* %52, i64 4
  %54 = bitcast i8* %53 to i32*
  %55 = load i32, i32* %54, align 1
  %56 = zext i32 %55 to i64
  %57 = zext i32 1 to i64
  %58 = sub i64 %56, %57
  %59 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %56, i64 %57)
  %CF41 = extractvalue { i64, i1 } %59, 1
  %ZF42 = icmp eq i64 %58, 0
  %highbit43 = and i64 -9223372036854775808, %58
  %SF44 = icmp ne i64 %highbit43, 0
  %60 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %56, i64 %57)
  %OF45 = extractvalue { i64, i1 } %60, 1
  %61 = and i64 %58, 255
  %62 = call i64 @llvm.ctpop.i64(i64 %61)
  %63 = and i64 %62, 1
  %PF46 = icmp eq i64 %63, 0
  %CmpZF_JNE = icmp eq i1 %ZF42, false
  br i1 %CmpZF_JNE, label %bb.9, label %bb.8

bb.8:                                             ; preds = %bb.7
  %EAX47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 62))
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.7
  ret i32 0
}

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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

declare i8* @zeno_protect(i8*, i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 8)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 128)}
!7 = !{!6}
!8 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 136)}
!9 = !{!8}
!10 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 144)}
!11 = !{!10}
!12 = !{i8* getelementptr inbounds ([154 x i8], [154 x i8]* @rodata_15, i32 0, i32 152)}
!13 = !{!12}
