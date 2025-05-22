; ModuleID = './bin/oobw_char_to_int_conversion_basic'
source_filename = "./bin/oobw_char_to_int_conversion_basic"

@rodata_15 = private unnamed_addr constant [163 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00public string\00\00\00This is the secret in memory\00\00%s\0A\00Test Failed: Out of Bounds Write to adjacent array using char to int pointer conversion - Basic\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 104, align 1
  %RSPAdj_N.96 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.88 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.80 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.68 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.64 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.56 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.48 = bitcast i8* %5 to i64*
  %6 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.40 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.36 = bitcast i8* %7 to i16*
  %8 = getelementptr i8, i8* %stktop_8, i64 85
  %RBP_N.19 = bitcast i8* %8 to i64*
  %9 = getelementptr i8, i8* %stktop_8, i64 93
  %RBP_N.11 = bitcast i8* %9 to i32*
  %10 = getelementptr i8, i8* %stktop_8, i64 97
  %RBP_N.7 = bitcast i8* %10 to i16*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 99
  %11 = getelementptr i8, i8* %stktop_8, i64 100
  %RBP_N.4 = bitcast i8* %11 to i32*
  %12 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %12 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %13 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %13, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.19, align 1
  %14 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 24) to i32*, !ROData_Index !3
  %memload1 = load i32, i32* %14, align 1, !ROData_Content !4
  store i32 %memload1, i32* %RBP_N.11, align 1
  %15 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 28) to i16*, !ROData_Index !5
  %memload2 = load i16, i16* %15, align 1, !ROData_Content !6
  store i16 %memload2, i16* %RBP_N.7, align 1
  %memload3 = load i8, i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 30), align 1, !ROData_Content !7
  store i8 %memload3, i8* %RBP_N.5, align 1
  %16 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !8
  %memload4 = load i64, i64* %16, align 1, !ROData_Content !9
  store i64 %memload4, i64* %RBP_N.64, align 1
  %17 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !10
  %memload5 = load i64, i64* %17, align 1, !ROData_Content !11
  store i64 %memload5, i64* %RBP_N.56, align 1
  %18 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !12
  %memload6 = load i64, i64* %18, align 1, !ROData_Content !13
  store i64 %memload6, i64* %RBP_N.48, align 1
  %19 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 56) to i32*, !ROData_Index !14
  %memload7 = load i32, i32* %19, align 1, !ROData_Content !15
  store i32 %memload7, i32* %RBP_N.40, align 1
  %20 = bitcast i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 60) to i16*, !ROData_Index !16
  %memload8 = load i16, i16* %20, align 1, !ROData_Content !17
  store i16 %memload8, i16* %RBP_N.36, align 1
  store i32 15, i32* %RBP_N.68, align 1
  %RAX = ptrtoint i64* %RBP_N.19 to i64
  store i64 %RAX, i64* %RBP_N.80, align 1
  %memload9 = load i64, i64* %RBP_N.80, align 1
  store i64 %memload9, i64* %RBP_N.88, align 1
  %21 = bitcast i64* %RSPAdj_N.96 to i8*
  %22 = getelementptr i8, i8* %21, i64 4
  %23 = bitcast i8* %22 to i32*
  store i32 0, i32* %23, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %24 = bitcast i64* %RSPAdj_N.96 to i8*
  %25 = getelementptr i8, i8* %24, i64 4
  %26 = bitcast i8* %25 to i32*
  %memload10 = load i32, i32* %26, align 1
  %memload11 = load i32, i32* %RBP_N.68, align 1
  %ECX = sub i32 %memload11, 2
  %27 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload11, i32 2)
  %CF = extractvalue { i32, i1 } %27, 1
  %28 = and i32 %ECX, 255
  %29 = call i32 @llvm.ctpop.i32(i32 %28)
  %30 = and i32 %29, 1
  %PF = icmp eq i32 %30, 0
  %ZF = icmp eq i32 %ECX, 0
  %highbit = and i32 -2147483648, %ECX
  %SF = icmp ne i32 %highbit, 0
  %31 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload11, i32 2)
  %OF = extractvalue { i32, i1 } %31, 1
  %32 = sub i32 %memload10, %ECX
  %33 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %CF12 = extractvalue { i32, i1 } %33, 1
  %ZF13 = icmp eq i32 %32, 0
  %highbit14 = and i32 -2147483648, %32
  %SF15 = icmp ne i32 %highbit14, 0
  %34 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %OF16 = extractvalue { i32, i1 } %34, 1
  %35 = and i32 %32, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %35)
  %37 = and i32 %36, 1
  %PF17 = icmp eq i32 %37, 0
  %CmpSFOF_JGE = icmp eq i1 %SF15, %OF16
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload18 = load i64, i64* %RBP_N.88, align 1
  %38 = bitcast i64* %RSPAdj_N.96 to i8*
  %39 = getelementptr i8, i8* %38, i64 4
  %40 = bitcast i8* %39 to i64*
  %memload19 = load i64, i64* %40, align 1
  %41 = trunc i64 %memload19 to i32
  %RCX = sext i32 %41 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload18, %memref-idxreg
  %42 = inttoptr i64 %memref-basereg to i8*
  store i8 65, i8* %42, align 1
  %43 = bitcast i64* %RSPAdj_N.96 to i8*
  %44 = getelementptr i8, i8* %43, i64 4
  %45 = bitcast i8* %44 to i32*
  %memload20 = load i32, i32* %45, align 1
  %EAX = add i32 %memload20, 1
  %46 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload20, i32 1)
  %CF21 = extractvalue { i32, i1 } %46, 1
  %47 = and i32 %EAX, 255
  %48 = call i32 @llvm.ctpop.i32(i32 %47)
  %49 = and i32 %48, 1
  %PF22 = icmp eq i32 %49, 0
  %ZF23 = icmp eq i32 %EAX, 0
  %highbit24 = and i32 -2147483648, %EAX
  %SF25 = icmp ne i32 %highbit24, 0
  %50 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload20, i32 1)
  %OF26 = extractvalue { i32, i1 } %50, 1
  %51 = bitcast i64* %RSPAdj_N.96 to i8*
  %52 = getelementptr i8, i8* %51, i64 4
  %53 = bitcast i8* %52 to i32*
  store i32 %EAX, i32* %53, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RSI = ptrtoint i64* %RBP_N.19 to i64
  %EAX27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI)
  %RSI28 = ptrtoint i64* %RBP_N.64 to i64
  %EAX29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI28)
  %54 = bitcast i64* %RSPAdj_N.96 to i32*
  store i32 0, i32* %54, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.8
  %55 = load i64, i64* %RSPAdj_N.96, align 1
  %56 = sub i64 %55, 28
  %57 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %55, i64 28)
  %CF30 = extractvalue { i64, i1 } %57, 1
  %ZF31 = icmp eq i64 %56, 0
  %highbit32 = and i64 -9223372036854775808, %56
  %SF33 = icmp ne i64 %highbit32, 0
  %58 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %55, i64 28)
  %OF34 = extractvalue { i64, i1 } %58, 1
  %59 = and i64 %56, 255
  %60 = call i64 @llvm.ctpop.i64(i64 %59)
  %61 = and i64 %60, 1
  %PF35 = icmp eq i64 %61, 0
  %CmpSFOF_JGE56 = icmp eq i1 %SF33, %OF34
  br i1 %CmpSFOF_JGE56, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload36 = load i64, i64* %RSPAdj_N.96, align 1
  %62 = trunc i64 %memload36 to i32
  %RAX37 = sext i32 %62 to i64
  %63 = bitcast i64* %RBP_N.64 to i8*
  %64 = getelementptr i8, i8* %63, i64 %RAX37
  %65 = bitcast i8* %64 to i64*
  %66 = bitcast i64* %65 to i32*
  %memload38 = load i32, i32* %66, align 1
  %67 = trunc i32 %memload38 to i8
  %EAX39 = sext i8 %67 to i32
  %68 = sub i32 %EAX39, 65
  %69 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX39, i32 65)
  %CF40 = extractvalue { i32, i1 } %69, 1
  %ZF41 = icmp eq i32 %68, 0
  %highbit42 = and i32 -2147483648, %68
  %SF43 = icmp ne i32 %highbit42, 0
  %70 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX39, i32 65)
  %OF44 = extractvalue { i32, i1 } %70, 1
  %71 = and i32 %68, 255
  %72 = call i32 @llvm.ctpop.i32(i32 %71)
  %73 = and i32 %72, 1
  %PF45 = icmp eq i32 %73, 0
  %CmpZF_JNE = icmp eq i1 %ZF41, false
  br i1 %CmpZF_JNE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([163 x i8], [163 x i8]* @rodata_15, i32 0, i32 66))
  br label %bb.9

bb.7:                                             ; preds = %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %74 = bitcast i64* %RSPAdj_N.96 to i32*
  %memload47 = load i32, i32* %74, align 1
  %EAX54 = add i32 %memload47, 1
  %75 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload47, i32 1)
  %CF48 = extractvalue { i32, i1 } %75, 1
  %76 = and i32 %EAX54, 255
  %77 = call i32 @llvm.ctpop.i32(i32 %76)
  %78 = and i32 %77, 1
  %PF49 = icmp eq i32 %78, 0
  %ZF50 = icmp eq i32 %EAX54, 0
  %highbit51 = and i32 -2147483648, %EAX54
  %SF52 = icmp ne i32 %highbit51, 0
  %79 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload47, i32 1)
  %OF53 = extractvalue { i32, i1 } %79, 1
  %80 = bitcast i64* %RSPAdj_N.96 to i32*
  store i32 %EAX54, i32* %80, align 1
  br label %bb.4

bb.9:                                             ; preds = %bb.6, %bb.4
  %memload55 = load i32, i32* %RBP_N.4, align 1
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
