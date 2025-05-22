; ModuleID = './protected_bc/oobw_char_to_int_conversion_basic.bc'
source_filename = "./bin/oobw_char_to_int_conversion_basic"

@rodata_15 = private unnamed_addr constant [163 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00public string\00\00\00This is the secret in memory\00\00%s\0A\00Test Failed: Out of Bounds Write to adjacent array using char to int pointer conversion - Basic\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_40 = private constant i64 8242543288157300852
@rodata_15_28 = private constant i16 103
@rodata_15_16 = private constant i64 8295739818057561456
@rodata_15_30 = private constant i8 0
@rodata_15_56 = private constant i32 2037542765
@rodata_15_32 = private constant i64 2338328219631577172
@rodata_15_60 = private constant i16 0
@rodata_15_48 = private constant i64 7308533428874409061
@rodata_15_24 = private constant i32 1852404340

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 104, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 100
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 97
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 2)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i16*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 93
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 85
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 68
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 2)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i16*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 64
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 8)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i64*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 8)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i64*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 8)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i64*
  %ns_base28 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot29 = call i8* @zeno_protect(i8* %ns_base28, i64 4)
  %ns_ptr30 = bitcast i8* %ns_prot29 to i32*
  %ns_base31 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot32 = call i8* @zeno_protect(i8* %ns_base31, i64 8)
  %ns_ptr33 = bitcast i8* %ns_prot32 to i64*
  %ns_base34 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot35 = call i8* @zeno_protect(i8* %ns_base34, i64 8)
  %ns_ptr36 = bitcast i8* %ns_prot35 to i64*
  %RSPAdj_N.96 = bitcast i8* %stktop_8 to i64*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 99
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr12, align 1
  %1 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 24) to i32*, !ROData_Index !3
  %memload1 = load i32, i32* @rodata_15_24, align 1, !ROData_Content !4
  store i32 %memload1, i32* %ns_ptr9, align 1
  %2 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 28) to i16*, !ROData_Index !5
  %memload2 = load i16, i16* @rodata_15_28, align 1, !ROData_Content !6
  store i16 %memload2, i16* %ns_ptr6, align 1
  %memload3 = load i8, i8* @rodata_15_30, align 1, !ROData_Content !7
  store i8 %memload3, i8* %RBP_N.5, align 1
  %3 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !8
  %memload4 = load i64, i64* @rodata_15_32, align 1, !ROData_Content !9
  store i64 %memload4, i64* %ns_ptr27, align 1
  %4 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !10
  %memload5 = load i64, i64* @rodata_15_40, align 1, !ROData_Content !11
  store i64 %memload5, i64* %ns_ptr24, align 1
  %5 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !12
  %memload6 = load i64, i64* @rodata_15_48, align 1, !ROData_Content !13
  store i64 %memload6, i64* %ns_ptr21, align 1
  %6 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 56) to i32*, !ROData_Index !14
  %memload7 = load i32, i32* @rodata_15_56, align 1, !ROData_Content !15
  store i32 %memload7, i32* %ns_ptr18, align 1
  %7 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 60) to i16*, !ROData_Index !16
  %memload8 = load i16, i16* @rodata_15_60, align 1, !ROData_Content !17
  store i16 %memload8, i16* %ns_ptr15, align 1
  store i32 15, i32* %ns_ptr30, align 1
  %RAX = ptrtoint i64* %ns_ptr12 to i64
  store i64 %RAX, i64* %ns_ptr33, align 1
  %memload9 = load i64, i64* %ns_ptr33, align 1
  store i64 %memload9, i64* %ns_ptr36, align 1
  %8 = bitcast i64* %RSPAdj_N.96 to i8*
  %9 = getelementptr i8, i8* %8, i64 4
  %10 = bitcast i8* %9 to i32*
  store i32 0, i32* %10, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %11 = bitcast i64* %RSPAdj_N.96 to i8*
  %12 = getelementptr i8, i8* %11, i64 4
  %13 = bitcast i8* %12 to i32*
  %memload10 = load i32, i32* %13, align 1
  %memload11 = load i32, i32* %ns_ptr30, align 1
  %ECX = sub i32 %memload11, 2
  %14 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload11, i32 2)
  %CF = extractvalue { i32, i1 } %14, 1
  %15 = and i32 %ECX, 255
  %16 = call i32 @llvm.ctpop.i32(i32 %15)
  %17 = and i32 %16, 1
  %PF = icmp eq i32 %17, 0
  %ZF = icmp eq i32 %ECX, 0
  %highbit = and i32 -2147483648, %ECX
  %SF = icmp ne i32 %highbit, 0
  %18 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload11, i32 2)
  %OF = extractvalue { i32, i1 } %18, 1
  %19 = sub i32 %memload10, %ECX
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %CF12 = extractvalue { i32, i1 } %20, 1
  %ZF13 = icmp eq i32 %19, 0
  %highbit14 = and i32 -2147483648, %19
  %SF15 = icmp ne i32 %highbit14, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %OF16 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF17 = icmp eq i32 %24, 0
  %CmpSFOF_JGE = icmp eq i1 %SF15, %OF16
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload18 = load i64, i64* %ns_ptr36, align 1
  %25 = bitcast i64* %RSPAdj_N.96 to i8*
  %26 = getelementptr i8, i8* %25, i64 4
  %27 = bitcast i8* %26 to i64*
  %memload19 = load i64, i64* %27, align 1
  %28 = trunc i64 %memload19 to i32
  %RCX = sext i32 %28 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload18, %memref-idxreg
  %29 = inttoptr i64 %memref-basereg to i8*
  store i8 65, i8* %29, align 1
  %30 = bitcast i64* %RSPAdj_N.96 to i8*
  %31 = getelementptr i8, i8* %30, i64 4
  %32 = bitcast i8* %31 to i32*
  %memload20 = load i32, i32* %32, align 1
  %EAX = add i32 %memload20, 1
  %33 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload20, i32 1)
  %CF21 = extractvalue { i32, i1 } %33, 1
  %34 = and i32 %EAX, 255
  %35 = call i32 @llvm.ctpop.i32(i32 %34)
  %36 = and i32 %35, 1
  %PF22 = icmp eq i32 %36, 0
  %ZF23 = icmp eq i32 %EAX, 0
  %highbit24 = and i32 -2147483648, %EAX
  %SF25 = icmp ne i32 %highbit24, 0
  %37 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload20, i32 1)
  %OF26 = extractvalue { i32, i1 } %37, 1
  %38 = bitcast i64* %RSPAdj_N.96 to i8*
  %39 = getelementptr i8, i8* %38, i64 4
  %40 = bitcast i8* %39 to i32*
  store i32 %EAX, i32* %40, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint i64* %ns_ptr12 to i64
  %EAX27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI)
  %RSI28 = ptrtoint i64* %ns_ptr27 to i64
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI28)
  %41 = bitcast i64* %RSPAdj_N.96 to i32*
  store i32 0, i32* %41, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.8, %bb.3
  %42 = load i64, i64* %RSPAdj_N.96, align 1
  %43 = sub i64 %42, 28
  %44 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %42, i64 28)
  %CF30 = extractvalue { i64, i1 } %44, 1
  %ZF31 = icmp eq i64 %43, 0
  %highbit32 = and i64 -9223372036854775808, %43
  %SF33 = icmp ne i64 %highbit32, 0
  %45 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %42, i64 28)
  %OF34 = extractvalue { i64, i1 } %45, 1
  %46 = and i64 %43, 255
  %47 = call i64 @llvm.ctpop.i64(i64 %46)
  %48 = and i64 %47, 1
  %PF35 = icmp eq i64 %48, 0
  %CmpSFOF_JGE56 = icmp eq i1 %SF33, %OF34
  br i1 %CmpSFOF_JGE56, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload36 = load i64, i64* %RSPAdj_N.96, align 1
  %49 = trunc i64 %memload36 to i32
  %RAX37 = sext i32 %49 to i64
  %50 = bitcast i64* %ns_ptr27 to i8*
  %51 = getelementptr i8, i8* %50, i64 %RAX37
  %52 = bitcast i8* %51 to i64*
  %53 = bitcast i64* %52 to i32*
  %memload38 = load i32, i32* %53, align 1
  %54 = trunc i32 %memload38 to i8
  %EAX39 = sext i8 %54 to i32
  %55 = sub i32 %EAX39, 65
  %56 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX39, i32 65)
  %CF40 = extractvalue { i32, i1 } %56, 1
  %ZF41 = icmp eq i32 %55, 0
  %highbit42 = and i32 -2147483648, %55
  %SF43 = icmp ne i32 %highbit42, 0
  %57 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX39, i32 65)
  %OF44 = extractvalue { i32, i1 } %57, 1
  %58 = and i32 %55, 255
  %59 = call i32 @llvm.ctpop.i32(i32 %58)
  %60 = and i32 %59, 1
  %PF45 = icmp eq i32 %60, 0
  %CmpZF_JNE = icmp eq i1 %ZF41, false
  br i1 %CmpZF_JNE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 66))
  br label %bb.9

bb.7:                                             ; preds = %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %61 = bitcast i64* %RSPAdj_N.96 to i32*
  %memload47 = load i32, i32* %61, align 1
  %EAX54 = add i32 %memload47, 1
  %62 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload47, i32 1)
  %CF48 = extractvalue { i32, i1 } %62, 1
  %63 = and i32 %EAX54, 255
  %64 = call i32 @llvm.ctpop.i32(i32 %63)
  %65 = and i32 %64, 1
  %PF49 = icmp eq i32 %65, 0
  %ZF50 = icmp eq i32 %EAX54, 0
  %highbit51 = and i32 -2147483648, %EAX54
  %SF52 = icmp ne i32 %highbit51, 0
  %66 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload47, i32 1)
  %OF53 = extractvalue { i32, i1 } %66, 1
  %67 = bitcast i64* %RSPAdj_N.96 to i32*
  store i32 %EAX54, i32* %67, align 1
  br label %bb.4

bb.9:                                             ; preds = %bb.6, %bb.4
  %memload55 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload55
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

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
!1 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 28)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 30)}
!8 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 32)}
!9 = !{!8}
!10 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 40)}
!11 = !{!10}
!12 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 48)}
!13 = !{!12}
!14 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 56)}
!15 = !{!14}
!16 = !{i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 60)}
!17 = !{!16}
