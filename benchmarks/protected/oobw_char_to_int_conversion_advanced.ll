; ModuleID = './protected_bc/oobw_char_to_int_conversion_advanced.bc'
source_filename = "./bin/oobw_char_to_int_conversion_advanced"

@rodata_15 = private unnamed_addr constant [166 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00public string\00\00\00This is the secret in memory\00\00%s\0A\00Test Failed: Out of Bounds Write to adjacent array using char to int pointer conversion - Advanced\0A\00", align 16, !ROData_SecInfo !0
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
  %stktop_8 = alloca i8, i32 120, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 116
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 113
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 2)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i16*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 109
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 101
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 84
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 2)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i16*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 80
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 4)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i32*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 72
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 8)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i64*
  %ns_base22 = getelementptr i8, i8* %stktop_8, i64 64
  %ns_prot23 = call i8* @zeno_protect(i8* %ns_base22, i64 8)
  %ns_ptr24 = bitcast i8* %ns_prot23 to i64*
  %ns_base25 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot26 = call i8* @zeno_protect(i8* %ns_base25, i64 8)
  %ns_ptr27 = bitcast i8* %ns_prot26 to i64*
  %ns_base28 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot29 = call i8* @zeno_protect(i8* %ns_base28, i64 4)
  %ns_ptr30 = bitcast i8* %ns_prot29 to i32*
  %ns_base31 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot32 = call i8* @zeno_protect(i8* %ns_base31, i64 8)
  %ns_ptr33 = bitcast i8* %ns_prot32 to i64*
  %ns_base34 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot35 = call i8* @zeno_protect(i8* %ns_base34, i64 8)
  %ns_ptr36 = bitcast i8* %ns_prot35 to i64*
  %ns_base37 = getelementptr i8, i8* %stktop_8, i64 28
  %ns_prot38 = call i8* @zeno_protect(i8* %ns_base37, i64 4)
  %ns_ptr39 = bitcast i8* %ns_prot38 to i32*
  %ns_base40 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot41 = call i8* @zeno_protect(i8* %ns_base40, i64 8)
  %ns_ptr42 = bitcast i8* %ns_prot41 to i64*
  %RSPAdj_N.112 = bitcast i8* %stktop_8 to i64*
  %RBP_N.5 = getelementptr i8, i8* %stktop_8, i64 115
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr12, align 1
  %1 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 24) to i32*, !ROData_Index !3
  %memload1 = load i32, i32* @rodata_15_24, align 1, !ROData_Content !4
  store i32 %memload1, i32* %ns_ptr9, align 1
  %2 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 28) to i16*, !ROData_Index !5
  %memload2 = load i16, i16* @rodata_15_28, align 1, !ROData_Content !6
  store i16 %memload2, i16* %ns_ptr6, align 1
  %memload3 = load i8, i8* @rodata_15_30, align 1, !ROData_Content !7
  store i8 %memload3, i8* %RBP_N.5, align 1
  %3 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !8
  %memload4 = load i64, i64* @rodata_15_32, align 1, !ROData_Content !9
  store i64 %memload4, i64* %ns_ptr27, align 1
  %4 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !10
  %memload5 = load i64, i64* @rodata_15_40, align 1, !ROData_Content !11
  store i64 %memload5, i64* %ns_ptr24, align 1
  %5 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 48) to i64*, !ROData_Index !12
  %memload6 = load i64, i64* @rodata_15_48, align 1, !ROData_Content !13
  store i64 %memload6, i64* %ns_ptr21, align 1
  %6 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 56) to i32*, !ROData_Index !14
  %memload7 = load i32, i32* @rodata_15_56, align 1, !ROData_Content !15
  store i32 %memload7, i32* %ns_ptr18, align 1
  %7 = bitcast i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 60) to i16*, !ROData_Index !16
  %memload8 = load i16, i16* @rodata_15_60, align 1, !ROData_Content !17
  store i16 %memload8, i16* %ns_ptr15, align 1
  store i32 15, i32* %ns_ptr30, align 1
  %RAX = ptrtoint i64* %ns_ptr12 to i64
  store i64 %RAX, i64* %ns_ptr33, align 1
  %memload9 = load i64, i64* %ns_ptr33, align 1
  store i64 %memload9, i64* %ns_ptr36, align 1
  store i32 0, i32* %ns_ptr39, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.6, %entry
  %memload10 = load i32, i32* %ns_ptr39, align 1
  %memload11 = load i32, i32* %ns_ptr30, align 1
  %ECX = sub i32 %memload11, 2
  %8 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload11, i32 2)
  %CF = extractvalue { i32, i1 } %8, 1
  %9 = and i32 %ECX, 255
  %10 = call i32 @llvm.ctpop.i32(i32 %9)
  %11 = and i32 %10, 1
  %PF = icmp eq i32 %11, 0
  %ZF = icmp eq i32 %ECX, 0
  %highbit = and i32 -2147483648, %ECX
  %SF = icmp ne i32 %highbit, 0
  %12 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload11, i32 2)
  %OF = extractvalue { i32, i1 } %12, 1
  %13 = sub i32 %memload10, %ECX
  %14 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %CF12 = extractvalue { i32, i1 } %14, 1
  %ZF13 = icmp eq i32 %13, 0
  %highbit14 = and i32 -2147483648, %13
  %SF15 = icmp ne i32 %highbit14, 0
  %15 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload10, i32 %ECX)
  %OF16 = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %13, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF17 = icmp eq i32 %18, 0
  %CmpSFOF_JGE = icmp eq i1 %SF15, %OF16
  br i1 %CmpSFOF_JGE, label %bb.7, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload18 = load i64, i64* %ns_ptr33, align 1
  %19 = bitcast i32* %ns_ptr39 to i64*
  %memload19 = load i64, i64* %19, align 1
  %20 = trunc i64 %memload19 to i32
  %RCX = sext i32 %20 to i64
  %RCX23 = shl i64 %RCX, 2
  %ZF20 = icmp eq i64 %RCX23, 0
  %highbit21 = and i64 -9223372036854775808, %RCX23
  %SF22 = icmp ne i64 %highbit21, 0
  %RAX27 = add nsw i64 %memload18, %RCX23
  %highbit24 = and i64 -9223372036854775808, %RAX27
  %SF25 = icmp ne i64 %highbit24, 0
  %ZF26 = icmp eq i64 %RAX27, 0
  store i64 %RAX27, i64* %ns_ptr42, align 1
  %21 = bitcast i64* %RSPAdj_N.112 to i8*
  %22 = getelementptr i8, i8* %21, i64 4
  %23 = bitcast i8* %22 to i32*
  store i32 0, i32* %23, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.4, %bb.2
  %24 = bitcast i64* %RSPAdj_N.112 to i8*
  %25 = getelementptr i8, i8* %24, i64 4
  %26 = bitcast i8* %25 to i32*
  %27 = load i32, i32* %26, align 1
  %28 = zext i32 %27 to i64
  %29 = zext i32 4 to i64
  %30 = sub i64 %28, %29
  %31 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %28, i64 %29)
  %CF28 = extractvalue { i64, i1 } %31, 1
  %ZF29 = icmp eq i64 %30, 0
  %highbit30 = and i64 -9223372036854775808, %30
  %SF31 = icmp ne i64 %highbit30, 0
  %32 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %28, i64 %29)
  %OF32 = extractvalue { i64, i1 } %32, 1
  %33 = and i64 %30, 255
  %34 = call i64 @llvm.ctpop.i64(i64 %33)
  %35 = and i64 %34, 1
  %PF33 = icmp eq i64 %35, 0
  %CmpSFOF_JGE81 = icmp eq i1 %SF31, %OF32
  br i1 %CmpSFOF_JGE81, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload34 = load i64, i64* %ns_ptr42, align 1
  %36 = bitcast i64* %RSPAdj_N.112 to i8*
  %37 = getelementptr i8, i8* %36, i64 4
  %38 = bitcast i8* %37 to i64*
  %memload35 = load i64, i64* %38, align 1
  %39 = trunc i64 %memload35 to i32
  %RCX36 = sext i32 %39 to i64
  %memref-basereg = add i64 %memload34, %RCX36
  %40 = inttoptr i64 %memref-basereg to i8*
  store i8 65, i8* %40, align 1
  %41 = bitcast i64* %RSPAdj_N.112 to i8*
  %42 = getelementptr i8, i8* %41, i64 4
  %43 = bitcast i8* %42 to i32*
  %memload37 = load i32, i32* %43, align 1
  %EAX = add i32 %memload37, 1
  %44 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload37, i32 1)
  %CF38 = extractvalue { i32, i1 } %44, 1
  %45 = and i32 %EAX, 255
  %46 = call i32 @llvm.ctpop.i32(i32 %45)
  %47 = and i32 %46, 1
  %PF39 = icmp eq i32 %47, 0
  %ZF40 = icmp eq i32 %EAX, 0
  %highbit41 = and i32 -2147483648, %EAX
  %SF42 = icmp ne i32 %highbit41, 0
  %48 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload37, i32 1)
  %OF43 = extractvalue { i32, i1 } %48, 1
  %49 = bitcast i64* %RSPAdj_N.112 to i8*
  %50 = getelementptr i8, i8* %49, i64 4
  %51 = bitcast i8* %50 to i32*
  store i32 %EAX, i32* %51, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  br label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload44 = load i32, i32* %ns_ptr39, align 1
  %EAX51 = add i32 %memload44, 1
  %52 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload44, i32 1)
  %CF45 = extractvalue { i32, i1 } %52, 1
  %53 = and i32 %EAX51, 255
  %54 = call i32 @llvm.ctpop.i32(i32 %53)
  %55 = and i32 %54, 1
  %PF46 = icmp eq i32 %55, 0
  %ZF47 = icmp eq i32 %EAX51, 0
  %highbit48 = and i32 -2147483648, %EAX51
  %SF49 = icmp ne i32 %highbit48, 0
  %56 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload44, i32 1)
  %OF50 = extractvalue { i32, i1 } %56, 1
  store i32 %EAX51, i32* %ns_ptr39, align 1
  br label %bb.1

bb.7:                                             ; preds = %bb.1
  %RSI = ptrtoint i64* %ns_ptr12 to i64
  %EAX52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI)
  %RSI53 = ptrtoint i64* %ns_ptr27 to i64
  %EAX54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI53)
  %57 = bitcast i64* %RSPAdj_N.112 to i32*
  store i32 0, i32* %57, align 1
  br label %bb.8

bb.8:                                             ; preds = %bb.12, %bb.7
  %58 = load i64, i64* %RSPAdj_N.112, align 1
  %59 = sub i64 %58, 28
  %60 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %58, i64 28)
  %CF55 = extractvalue { i64, i1 } %60, 1
  %ZF56 = icmp eq i64 %59, 0
  %highbit57 = and i64 -9223372036854775808, %59
  %SF58 = icmp ne i64 %highbit57, 0
  %61 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %58, i64 28)
  %OF59 = extractvalue { i64, i1 } %61, 1
  %62 = and i64 %59, 255
  %63 = call i64 @llvm.ctpop.i64(i64 %62)
  %64 = and i64 %63, 1
  %PF60 = icmp eq i64 %64, 0
  %CmpSFOF_JGE82 = icmp eq i1 %SF58, %OF59
  br i1 %CmpSFOF_JGE82, label %bb.13, label %bb.9

bb.9:                                             ; preds = %bb.8
  %memload61 = load i64, i64* %RSPAdj_N.112, align 1
  %65 = trunc i64 %memload61 to i32
  %RAX62 = sext i32 %65 to i64
  %66 = bitcast i64* %ns_ptr27 to i8*
  %67 = getelementptr i8, i8* %66, i64 %RAX62
  %68 = bitcast i8* %67 to i64*
  %69 = bitcast i64* %68 to i32*
  %memload63 = load i32, i32* %69, align 1
  %70 = trunc i32 %memload63 to i8
  %EAX64 = sext i8 %70 to i32
  %71 = sub i32 %EAX64, 65
  %72 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX64, i32 65)
  %CF65 = extractvalue { i32, i1 } %72, 1
  %ZF66 = icmp eq i32 %71, 0
  %highbit67 = and i32 -2147483648, %71
  %SF68 = icmp ne i32 %highbit67, 0
  %73 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX64, i32 65)
  %OF69 = extractvalue { i32, i1 } %73, 1
  %74 = and i32 %71, 255
  %75 = call i32 @llvm.ctpop.i32(i32 %74)
  %76 = and i32 %75, 1
  %PF70 = icmp eq i32 %76, 0
  %CmpZF_JNE = icmp eq i1 %ZF66, false
  br i1 %CmpZF_JNE, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @rodata_15, i32 0, i32 66))
  br label %bb.13

bb.11:                                            ; preds = %bb.9
  br label %bb.12

bb.12:                                            ; preds = %bb.11
  %77 = bitcast i64* %RSPAdj_N.112 to i32*
  %memload72 = load i32, i32* %77, align 1
  %EAX79 = add i32 %memload72, 1
  %78 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload72, i32 1)
  %CF73 = extractvalue { i32, i1 } %78, 1
  %79 = and i32 %EAX79, 255
  %80 = call i32 @llvm.ctpop.i32(i32 %79)
  %81 = and i32 %80, 1
  %PF74 = icmp eq i32 %81, 0
  %ZF75 = icmp eq i32 %EAX79, 0
  %highbit76 = and i32 -2147483648, %EAX79
  %SF77 = icmp ne i32 %highbit76, 0
  %82 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload72, i32 1)
  %OF78 = extractvalue { i32, i1 } %82, 1
  %83 = bitcast i64* %RSPAdj_N.112 to i32*
  store i32 %EAX79, i32* %83, align 1
  br label %bb.8

bb.13:                                            ; preds = %bb.10, %bb.8
  %memload80 = load i32, i32* %ns_ptr3, align 1
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

declare i8* @zeno_protect(i8*, i64)

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
