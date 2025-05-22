; ModuleID = './bin/oobw_char_to_int_conversion_advanced'
source_filename = "./bin/oobw_char_to_int_conversion_advanced"

@rodata_15 = private unnamed_addr constant [166 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00public string\00\00\00This is the secret in memory\00\00%s\0A\00Test Failed: Out of Bounds Write to adjacent array using char to int pointer conversion - Advanced\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 120, align 1
  %RSPAdj_N.112 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.104 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.92 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.88 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.80 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.68 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.64 = bitcast i8* %5 to i64*
  %6 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.56 = bitcast i8* %6 to i64*
  %7 = getelementptr i8, i8* %stktop_8, i64 72
  %RBP_N.48 = bitcast i8* %7 to i64*
  %8 = getelementptr i8, i8* %stktop_8, i64 80
  %RBP_N.40 = bitcast i8* %8 to i32*
  %9 = getelementptr i8, i8* %stktop_8, i64 84
  %RBP_N.36 = bitcast i8* %9 to i16*
  %10 = getelementptr i8, i8* %stktop_8, i64 101
  %RBP_N.19 = bitcast i8* %10 to i64*
  %11 = getelementptr i8, i8* %stktop_8, i64 109
  %RBP_N.11 = bitcast i8* %11 to i32*
  %12 = getelementptr i8, i8* %stktop_8, i64 113
  %RBP_N.7 = bitcast i8* %12 to i16*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 115
  %13 = getelementptr i8, i8* %stktop_8, i64 116
  %RBP_N.4 = bitcast i8* %13 to i32*
  %14 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %14 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %15 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %15, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.19, align 1
  %16 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 24) to i32*, !ROData_Index !3
  %memload1 = load i32, i32* %16, align 1, !ROData_Content !4
  store i32 %memload1, i32* %RBP_N.11, align 1
  %17 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 28) to i16*, !ROData_Index !5
  %memload2 = load i16, i16* %17, align 1, !ROData_Content !6
  store i16 %memload2, i16* %RBP_N.7, align 1
  %memload3 = load i8, i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 30), align 1, !ROData_Content !7
  store i8 %memload3, i8* %RBP_N.5, align 1
  %18 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !8
  %memload4 = load i64, i64* %18, align 1, !ROData_Content !9
  store i64 %memload4, i64* %RBP_N.64, align 1
  %19 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !10
  %memload5 = load i64, i64* %19, align 1, !ROData_Content !11
  store i64 %memload5, i64* %RBP_N.56, align 1
  %20 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !12
  %memload6 = load i64, i64* %20, align 1, !ROData_Content !13
  store i64 %memload6, i64* %RBP_N.48, align 1
  %21 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 56) to i32*, !ROData_Index !14
  %memload7 = load i32, i32* %21, align 1, !ROData_Content !15
  store i32 %memload7, i32* %RBP_N.40, align 1
  %22 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 60) to i16*, !ROData_Index !16
  %memload8 = load i16, i16* %22, align 1, !ROData_Content !17
  store i16 %memload8, i16* %RBP_N.36, align 1
  store i32 15, i32* %RBP_N.68, align 1
  %RAX = ptrtoint i64* %RBP_N.19 to i64
  store i64 %RAX, i64* %RBP_N.80, align 1
  %memload9 = load i64, i64* %RBP_N.80, align 1
  store i64 %memload9, i64* %RBP_N.88, align 1
  store i32 0, i32* %RBP_N.92, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.6
  %memload10 = load i32, i32* %RBP_N.92, align 1
  %memload11 = load i32, i32* %RBP_N.68, align 1
  %ECX = sub i32 %memload11, 2
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload11, i32 2)
  %CF = extractvalue { i32, i1 } %23, 1
  %24 = and i32 %ECX, 255
  %25 = call i32 @llvm.ctpop.i32(i32 %24)
  %26 = and i32 %25, 1
  %PF = icmp eq i32 %26, 0
  %ZF = icmp eq i32 %ECX, 0
  %highbit = and i32 -2147483648, %ECX
  %SF = icmp ne i32 %highbit, 0
  %27 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload11, i32 2)
  %OF = extractvalue { i32, i1 } %27, 1
  %28 = sub i32 %memload10, %ECX
  %29 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %CF12 = extractvalue { i32, i1 } %29, 1
  %ZF13 = icmp eq i32 %28, 0
  %highbit14 = and i32 -2147483648, %28
  %SF15 = icmp ne i32 %highbit14, 0
  %30 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %OF16 = extractvalue { i32, i1 } %30, 1
  %31 = and i32 %28, 255
  %32 = call i32 @llvm.ctpop.i32(i32 %31)
  %33 = and i32 %32, 1
  %PF17 = icmp eq i32 %33, 0
  %CmpSFOF_JGE = icmp eq i1 %SF15, %OF16
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload18 = load i64, i64* %RBP_N.80, align 1
  %34 = bitcast i32* %RBP_N.92 to i64*
  %memload19 = load i64, i64* %34, align 1
  %35 = trunc i64 %memload19 to i32
  %RCX = sext i32 %35 to i64
  %RCX23 = shl i64 %RCX, 2
  %ZF20 = icmp eq i64 %RCX23, 0
  %highbit21 = and i64 -9223372036854775808, %RCX23
  %SF22 = icmp ne i64 %highbit21, 0
  %RAX27 = add nsw i64 %memload18, %RCX23
  %highbit24 = and i64 -9223372036854775808, %RAX27
  %SF25 = icmp ne i64 %highbit24, 0
  %ZF26 = icmp eq i64 %RAX27, 0
  store i64 %RAX27, i64* %RBP_N.104, align 1
  %36 = bitcast i64* %RSPAdj_N.112 to i8*
  %37 = getelementptr i8, i8* %36, i64 4
  %38 = bitcast i8* %37 to i32*
  store i32 0, i32* %38, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.4
  %39 = bitcast i64* %RSPAdj_N.112 to i8*
  %40 = getelementptr i8, i8* %39, i64 4
  %41 = bitcast i8* %40 to i32*
  %42 = load i32, i32* %41, align 1
  %43 = zext i32 %42 to i64
  %44 = zext i32 4 to i64
  %45 = sub i64 %43, %44
  %46 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %43, i64 %44)
  %CF28 = extractvalue { i64, i1 } %46, 1
  %ZF29 = icmp eq i64 %45, 0
  %highbit30 = and i64 -9223372036854775808, %45
  %SF31 = icmp ne i64 %highbit30, 0
  %47 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %43, i64 %44)
  %OF32 = extractvalue { i64, i1 } %47, 1
  %48 = and i64 %45, 255
  %49 = call i64 @llvm.ctpop.i64(i64 %48)
  %50 = and i64 %49, 1
  %PF33 = icmp eq i64 %50, 0
  %CmpSFOF_JGE81 = icmp eq i1 %SF31, %OF32
  br i1 %CmpSFOF_JGE81, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload34 = load i64, i64* %RBP_N.104, align 1
  %51 = bitcast i64* %RSPAdj_N.112 to i8*
  %52 = getelementptr i8, i8* %51, i64 4
  %53 = bitcast i8* %52 to i64*
  %memload35 = load i64, i64* %53, align 1
  %54 = trunc i64 %memload35 to i32
  %RCX36 = sext i32 %54 to i64
  %memref-basereg = add i64 %memload34, %RCX36
  %55 = inttoptr i64 %memref-basereg to i8*
  store i8 65, i8* %55, align 1
  %56 = bitcast i64* %RSPAdj_N.112 to i8*
  %57 = getelementptr i8, i8* %56, i64 4
  %58 = bitcast i8* %57 to i32*
  %memload37 = load i32, i32* %58, align 1
  %EAX = add i32 %memload37, 1
  %59 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload37, i32 1)
  %CF38 = extractvalue { i32, i1 } %59, 1
  %60 = and i32 %EAX, 255
  %61 = call i32 @llvm.ctpop.i32(i32 %60)
  %62 = and i32 %61, 1
  %PF39 = icmp eq i32 %62, 0
  %ZF40 = icmp eq i32 %EAX, 0
  %highbit41 = and i32 -2147483648, %EAX
  %SF42 = icmp ne i32 %highbit41, 0
  %63 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload37, i32 1)
  %OF43 = extractvalue { i32, i1 } %63, 1
  %64 = bitcast i64* %RSPAdj_N.112 to i8*
  %65 = getelementptr i8, i8* %64, i64 4
  %66 = bitcast i8* %65 to i32*
  store i32 %EAX, i32* %66, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload44 = load i32, i32* %RBP_N.92, align 1
  %EAX51 = add i32 %memload44, 1
  %67 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload44, i32 1)
  %CF45 = extractvalue { i32, i1 } %67, 1
  %68 = and i32 %EAX51, 255
  %69 = call i32 @llvm.ctpop.i32(i32 %68)
  %70 = and i32 %69, 1
  %PF46 = icmp eq i32 %70, 0
  %ZF47 = icmp eq i32 %EAX51, 0
  %highbit48 = and i32 -2147483648, %EAX51
  %SF49 = icmp ne i32 %highbit48, 0
  %71 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload44, i32 1)
  %OF50 = extractvalue { i32, i1 } %71, 1
  store i32 %EAX51, i32* %RBP_N.92, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  %RSI = ptrtoint i64* %RBP_N.19 to i64
  %EAX52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI)
  %RSI53 = ptrtoint i64* %RBP_N.64 to i64
  %EAX54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI53)
  %72 = bitcast i64* %RSPAdj_N.112 to i32*
  store i32 0, i32* %72, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.12
  %73 = load i64, i64* %RSPAdj_N.112, align 1
  %74 = sub i64 %73, 28
  %75 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %73, i64 28)
  %CF55 = extractvalue { i64, i1 } %75, 1
  %ZF56 = icmp eq i64 %74, 0
  %highbit57 = and i64 -9223372036854775808, %74
  %SF58 = icmp ne i64 %highbit57, 0
  %76 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %73, i64 28)
  %OF59 = extractvalue { i64, i1 } %76, 1
  %77 = and i64 %74, 255
  %78 = call i64 @llvm.ctpop.i64(i64 %77)
  %79 = and i64 %78, 1
  %PF60 = icmp eq i64 %79, 0
  %CmpSFOF_JGE82 = icmp eq i1 %SF58, %OF59
  br i1 %CmpSFOF_JGE82, label %bb.13, label %bb.9

bb.9:                                             ; preds = %bb.8
  %memload61 = load i64, i64* %RSPAdj_N.112, align 1
  %80 = trunc i64 %memload61 to i32
  %RAX62 = sext i32 %80 to i64
  %81 = bitcast i64* %RBP_N.64 to i8*
  %82 = getelementptr i8, i8* %81, i64 %RAX62
  %83 = bitcast i8* %82 to i64*
  %84 = bitcast i64* %83 to i32*
  %memload63 = load i32, i32* %84, align 1
  %85 = trunc i32 %memload63 to i8
  %EAX64 = sext i8 %85 to i32
  %86 = sub i32 %EAX64, 65
  %87 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX64, i32 65)
  %CF65 = extractvalue { i32, i1 } %87, 1
  %ZF66 = icmp eq i32 %86, 0
  %highbit67 = and i32 -2147483648, %86
  %SF68 = icmp ne i32 %highbit67, 0
  %88 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX64, i32 65)
  %OF69 = extractvalue { i32, i1 } %88, 1
  %89 = and i32 %86, 255
  %90 = call i32 @llvm.ctpop.i32(i32 %89)
  %91 = and i32 %90, 1
  %PF70 = icmp eq i32 %91, 0
  %CmpZF_JNE = icmp eq i1 %ZF66, false
  br i1 %CmpZF_JNE, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 66))
  br label %bb.13

bb.11:                                            ; preds = %bb.9
  br label %bb.12

bb.12:                                            ; preds = %bb.11
  %92 = bitcast i64* %RSPAdj_N.112 to i32*
  %memload72 = load i32, i32* %92, align 1
  %EAX79 = add i32 %memload72, 1
  %93 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload72, i32 1)
  %CF73 = extractvalue { i32, i1 } %93, 1
  %94 = and i32 %EAX79, 255
  %95 = call i32 @llvm.ctpop.i32(i32 %94)
  %96 = and i32 %95, 1
  %PF74 = icmp eq i32 %96, 0
  %ZF75 = icmp eq i32 %EAX79, 0
  %highbit76 = and i32 -2147483648, %EAX79
  %SF77 = icmp ne i32 %highbit76, 0
  %97 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload72, i32 1)
  %OF78 = extractvalue { i32, i1 } %97, 1
  %98 = bitcast i64* %RSPAdj_N.112 to i32*
  store i32 %EAX79, i32* %98, align 1
  br label %bb.8

bb.13:                                            ; preds = %bb.10, %bb.8
  %memload80 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload80
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 28)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 30)}
!8 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 32)}
!9 = !{!8}
!10 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 40)}
!11 = !{!10}
!12 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 48)}
!13 = !{!12}
!14 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 56)}
!15 = !{!14}
!16 = !{i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 60)}
!17 = !{!16}
