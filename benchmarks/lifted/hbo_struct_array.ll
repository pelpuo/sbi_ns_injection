; ModuleID = './bin/hbo_struct_array'
source_filename = "./bin/hbo_struct_array"

@rodata_15 = private unnamed_addr constant [152 x i8] c"\01\00\02\00Name%d\00b[0].name = %s, b[0].id = %d\0A\00Name0\00b[0].name is equal to \22Name0\22.\0A\00Test Failed: b[0].name is not equal to \22Name0\22.\0A\00aalkdaweouiadfkajdfk\0F'\00\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @snprintf(i8*, i64, i8*, ...)

declare dso_local i32 @printf(i8*, ...)

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i8* @memcpy(i8*, i8*, i64)

declare dso_local i32 @strcmp(i8*, i8*)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %RCX-SKT-LOC = alloca i64, align 8
  %stktop_8 = alloca i8, i32 88, align 1
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.72 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.64 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.56 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.48 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.40 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 60
  %RBP_N.28 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.24 = bitcast i8* %6 to i64*
  %7 = getelementptr i8, i8* %stktop_8, i64 72
  %RBP_N.16 = bitcast i8* %7 to i64*
  %8 = getelementptr i8, i8* %stktop_8, i64 84
  %RBP_N.4 = bitcast i8* %8 to i32*
  %9 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %9 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %10 = zext i32 120 to i64
  %11 = call i8* @malloc(i64 %10)
  %RAX = ptrtoint i8* %11 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %12 = zext i32 120 to i64
  %13 = call i8* @malloc(i64 %12)
  %RAX1 = ptrtoint i8* %13 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  store i32 0, i32* %RBP_N.28, align 1
  store i64 0, i64* %RCX-SKT-LOC, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %14 = load i32, i32* %RBP_N.28, align 1
  %15 = zext i32 %14 to i64
  %16 = zext i32 5 to i64
  %17 = sub i64 %15, %16
  %18 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %15, i64 %16)
  %CF = extractvalue { i64, i1 } %18, 1
  %ZF = icmp eq i64 %17, 0
  %highbit = and i64 -9223372036854775808, %17
  %SF = icmp ne i64 %highbit, 0
  %19 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %15, i64 %16)
  %OF = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %17, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF = icmp eq i64 %22, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload = load i64, i64* %RBP_N.24, align 1
  %23 = bitcast i32* %RBP_N.28 to i64*
  %memload2 = load i64, i64* %23, align 1
  %24 = trunc i64 %memload2 to i32
  %RAX3 = sext i32 %24 to i64
  %RAX5 = mul i64 %RAX3, 24
  %25 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RAX3, i64 24)
  %OF4 = extractvalue { i64, i1 } %25, 1
  %RDI = add nsw i64 %memload, %RAX5
  %highbit6 = and i64 -9223372036854775808, %RDI
  %SF7 = icmp ne i64 %highbit6, 0
  %ZF8 = icmp eq i64 %RDI, 0
  %memload9 = load i32, i32* %RBP_N.28, align 1
  %26 = inttoptr i64 %RDI to i8*
  %27 = zext i32 20 to i64
  %EAX = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %26, i64 %27, i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 4), i32 %memload9)
  %memload10 = load i32, i32* %RBP_N.28, align 1
  %memload11 = load i64, i64* %RBP_N.24, align 1
  %28 = bitcast i32* %RBP_N.28 to i64*
  %memload12 = load i64, i64* %28, align 1
  %29 = trunc i64 %memload12 to i32
  %RDX = sext i32 %29 to i64
  %RDX14 = mul i64 %RDX, 24
  %30 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %RDX, i64 24)
  %OF13 = extractvalue { i64, i1 } %30, 1
  %RAX18 = add nsw i64 %memload11, %RDX14
  %highbit15 = and i64 -9223372036854775808, %RAX18
  %SF16 = icmp ne i64 %highbit15, 0
  %ZF17 = icmp eq i64 %RAX18, 0
  %memref-disp = add i64 %RAX18, 20
  %31 = inttoptr i64 %memref-disp to i32*
  store i32 %memload10, i32* %31, align 1
  %memload19 = load i32, i32* %RBP_N.28, align 1
  %EAX26 = add i32 %memload19, 1
  %32 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload19, i32 1)
  %CF20 = extractvalue { i32, i1 } %32, 1
  %33 = and i32 %EAX26, 255
  %34 = call i32 @llvm.ctpop.i32(i32 %33)
  %35 = and i32 %34, 1
  %PF21 = icmp eq i32 %35, 0
  %ZF22 = icmp eq i32 %EAX26, 0
  %highbit23 = and i32 -2147483648, %EAX26
  %SF24 = icmp ne i32 %highbit23, 0
  %36 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload19, i32 1)
  %OF25 = extractvalue { i32, i1 } %36, 1
  store i32 %EAX26, i32* %RBP_N.28, align 1
  %37 = zext i32 %memload10 to i64
  store i64 %37, i64* %RCX-SKT-LOC, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %memload27 = load i64, i64* %RBP_N.24, align 1
  %memload28 = load i64, i64* %RBP_N.24, align 1
  %memref-disp29 = add i64 %memload28, 20
  %38 = inttoptr i64 %memref-disp29 to i32*
  %memload30 = load i32, i32* %38, align 1
  %RCX = load i64, i64* %RCX-SKT-LOC, align 1
  %EAX31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 11), i64 %memload27, i32 %memload30, i64 %RCX)
  %memload32 = load i64, i64* %RBP_N.24, align 1
  %memload33 = load i64, i64* %RBP_N.16, align 1
  %RCX40 = add i64 %memload33, 96
  %39 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload33, i64 96)
  %CF34 = extractvalue { i64, i1 } %39, 1
  %40 = and i64 %RCX40, 255
  %41 = call i64 @llvm.ctpop.i64(i64 %40)
  %42 = and i64 %41, 1
  %PF35 = icmp eq i64 %42, 0
  %ZF36 = icmp eq i64 %RCX40, 0
  %highbit37 = and i64 -9223372036854775808, %RCX40
  %SF38 = icmp ne i64 %highbit37, 0
  %43 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload33, i64 96)
  %OF39 = extractvalue { i64, i1 } %43, 1
  %RAX41 = sub i64 %memload32, %RCX40
  %44 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload32, i64 %RCX40)
  %CF42 = extractvalue { i64, i1 } %44, 1
  %ZF43 = icmp eq i64 %RAX41, 0
  %highbit44 = and i64 -9223372036854775808, %RAX41
  %SF45 = icmp ne i64 %highbit44, 0
  %45 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload32, i64 %RCX40)
  %OF46 = extractvalue { i64, i1 } %45, 1
  %46 = and i64 %RAX41, 255
  %47 = call i64 @llvm.ctpop.i64(i64 %46)
  %48 = and i64 %47, 1
  %PF47 = icmp eq i64 %48, 0
  %RAX54 = sub i64 %RAX41, 16
  %49 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX41, i64 16)
  %CF48 = extractvalue { i64, i1 } %49, 1
  %50 = and i64 %RAX54, 255
  %51 = call i64 @llvm.ctpop.i64(i64 %50)
  %52 = and i64 %51, 1
  %PF49 = icmp eq i64 %52, 0
  %ZF50 = icmp eq i64 %RAX54, 0
  %highbit51 = and i64 -9223372036854775808, %RAX54
  %SF52 = icmp ne i64 %highbit51, 0
  %53 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX41, i64 16)
  %OF53 = extractvalue { i64, i1 } %53, 1
  store i64 %RAX54, i64* %RBP_N.40, align 1
  %memload55 = load i64, i64* %RBP_N.40, align 1
  %RDI62 = add i64 %memload55, 24
  %54 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload55, i64 24)
  %CF56 = extractvalue { i64, i1 } %54, 1
  %55 = and i64 %RDI62, 255
  %56 = call i64 @llvm.ctpop.i64(i64 %55)
  %57 = and i64 %56, 1
  %PF57 = icmp eq i64 %57, 0
  %ZF58 = icmp eq i64 %RDI62, 0
  %highbit59 = and i64 -9223372036854775808, %RDI62
  %SF60 = icmp ne i64 %highbit59, 0
  %58 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload55, i64 24)
  %OF61 = extractvalue { i64, i1 } %58, 1
  %RDI69 = add i64 %RDI62, 16
  %59 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI62, i64 16)
  %CF63 = extractvalue { i64, i1 } %59, 1
  %60 = and i64 %RDI69, 255
  %61 = call i64 @llvm.ctpop.i64(i64 %60)
  %62 = and i64 %61, 1
  %PF64 = icmp eq i64 %62, 0
  %ZF65 = icmp eq i64 %RDI69, 0
  %highbit66 = and i64 -9223372036854775808, %RDI69
  %SF67 = icmp ne i64 %highbit66, 0
  %63 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI62, i64 16)
  %OF68 = extractvalue { i64, i1 } %63, 1
  %64 = call i8* @malloc(i64 %RDI69)
  %RAX70 = ptrtoint i8* %64 to i64
  store i64 %RAX70, i64* %RBP_N.48, align 1
  %memload71 = load i64, i64* %RBP_N.48, align 1
  %memload72 = load i64, i64* %RBP_N.40, align 1
  %65 = inttoptr i64 %memload71 to i8*
  %66 = call i8* @memset(i8* %65, i32 65, i64 %memload72)
  %RAX73 = ptrtoint i8* %66 to i64
  %memload74 = load i64, i64* %RBP_N.48, align 1
  %memload75 = load i64, i64* %RBP_N.40, align 1
  %memload76 = load i64, i64* %RBP_N.24, align 1
  %memref-disp77 = add i64 %memload76, -16
  %67 = inttoptr i64 %memref-disp77 to i64*
  %memload78 = load i64, i64* %67, align 1
  %memref-basereg = add i64 %memload74, %memload75
  %68 = inttoptr i64 %memref-basereg to i64*
  store i64 %memload78, i64* %68, align 1
  %memref-disp79 = add i64 %memload76, -8
  %69 = inttoptr i64 %memref-disp79 to i64*
  %memload80 = load i64, i64* %69, align 1
  %memref-basereg81 = add i64 %memload74, %memload75
  %memref-disp82 = add i64 %memref-basereg81, 8
  %70 = inttoptr i64 %memref-disp82 to i64*
  store i64 %memload80, i64* %70, align 1
  %71 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 128) to i64*, !ROData_Index !1
  %memload83 = load i64, i64* %71, align 1, !ROData_Content !2
  store i64 %memload83, i64* %RBP_N.72, align 1
  %72 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 136) to i64*, !ROData_Index !3
  %memload84 = load i64, i64* %72, align 1, !ROData_Content !4
  store i64 %memload84, i64* %RBP_N.64, align 1
  %73 = bitcast i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 144) to i64*, !ROData_Index !5
  %memload85 = load i64, i64* %73, align 1, !ROData_Content !6
  store i64 %memload85, i64* %RBP_N.56, align 1
  %memload86 = load i64, i64* %RBP_N.48, align 1
  %memload87 = load i64, i64* %RBP_N.40, align 1
  %memload88 = load i64, i64* %RBP_N.72, align 1
  %memref-basereg89 = add i64 %memload86, %memload87
  %memref-disp90 = add i64 %memref-basereg89, 16
  %74 = inttoptr i64 %memref-disp90 to i64*
  store i64 %memload88, i64* %74, align 1
  %memload91 = load i64, i64* %RBP_N.64, align 1
  %memref-basereg92 = add i64 %memload86, %memload87
  %memref-disp93 = add i64 %memref-basereg92, 24
  %75 = inttoptr i64 %memref-disp93 to i64*
  store i64 %memload91, i64* %75, align 1
  %memload94 = load i64, i64* %RBP_N.56, align 1
  %memref-basereg95 = add i64 %memload86, %memload87
  %memref-disp96 = add i64 %memref-basereg95, 32
  %76 = inttoptr i64 %memref-disp96 to i64*
  store i64 %memload94, i64* %76, align 1
  %memload97 = load i64, i64* %RBP_N.16, align 1
  %RDI104 = add i64 %memload97, 96
  %77 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload97, i64 96)
  %CF98 = extractvalue { i64, i1 } %77, 1
  %78 = and i64 %RDI104, 255
  %79 = call i64 @llvm.ctpop.i64(i64 %78)
  %80 = and i64 %79, 1
  %PF99 = icmp eq i64 %80, 0
  %ZF100 = icmp eq i64 %RDI104, 0
  %highbit101 = and i64 -9223372036854775808, %RDI104
  %SF102 = icmp ne i64 %highbit101, 0
  %81 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload97, i64 96)
  %OF103 = extractvalue { i64, i1 } %81, 1
  %memload105 = load i64, i64* %RBP_N.48, align 1
  %memload106 = load i64, i64* %RBP_N.40, align 1
  %RDX113 = add i64 %memload106, 24
  %82 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload106, i64 24)
  %CF107 = extractvalue { i64, i1 } %82, 1
  %83 = and i64 %RDX113, 255
  %84 = call i64 @llvm.ctpop.i64(i64 %83)
  %85 = and i64 %84, 1
  %PF108 = icmp eq i64 %85, 0
  %ZF109 = icmp eq i64 %RDX113, 0
  %highbit110 = and i64 -9223372036854775808, %RDX113
  %SF111 = icmp ne i64 %highbit110, 0
  %86 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload106, i64 24)
  %OF112 = extractvalue { i64, i1 } %86, 1
  %RDX120 = add i64 %RDX113, 16
  %87 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDX113, i64 16)
  %CF114 = extractvalue { i64, i1 } %87, 1
  %88 = and i64 %RDX120, 255
  %89 = call i64 @llvm.ctpop.i64(i64 %88)
  %90 = and i64 %89, 1
  %PF115 = icmp eq i64 %90, 0
  %ZF116 = icmp eq i64 %RDX120, 0
  %highbit117 = and i64 -9223372036854775808, %RDX120
  %SF118 = icmp ne i64 %highbit117, 0
  %91 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDX113, i64 16)
  %OF119 = extractvalue { i64, i1 } %91, 1
  %92 = inttoptr i64 %RDI104 to i8*
  %93 = inttoptr i64 %memload105 to i8*
  %94 = call i8* @memcpy(i8* %92, i8* %93, i64 %RDX120)
  %RAX121 = ptrtoint i8* %94 to i64
  %memload122 = load i64, i64* %RBP_N.24, align 1
  %memload123 = load i64, i64* %RBP_N.24, align 1
  %memref-disp124 = add i64 %memload123, 20
  %95 = inttoptr i64 %memref-disp124 to i32*
  %memload125 = load i32, i32* %95, align 1
  %EAX126 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 11), i64 %memload122, i32 %memload125)
  %memload127 = load i64, i64* %RBP_N.24, align 1
  %96 = inttoptr i64 %memload127 to i8*
  %EAX128 = call i32 @strcmp(i8* %96, i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 41))
  %97 = sub i32 %EAX128, 0
  %98 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX128, i32 0)
  %CF129 = extractvalue { i32, i1 } %98, 1
  %ZF130 = icmp eq i32 %97, 0
  %highbit131 = and i32 -2147483648, %97
  %SF132 = icmp ne i32 %highbit131, 0
  %99 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX128, i32 0)
  %OF133 = extractvalue { i32, i1 } %99, 1
  %100 = and i32 %97, 255
  %101 = call i32 @llvm.ctpop.i32(i32 %100)
  %102 = and i32 %101, 1
  %PF134 = icmp eq i32 %102, 0
  %CmpZF_JNE = icmp eq i1 %ZF130, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 47))
  br label %bb.6

bb.5:                                             ; preds = %bb.3
  %EAX136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 79))
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %memload137 = load i64, i64* %RBP_N.16, align 1
  %103 = inttoptr i64 %memload137 to i8*
  call void @free(i8* %103)
  %memload138 = load i64, i64* %RBP_N.24, align 1
  %104 = inttoptr i64 %memload138 to i8*
  call void @free(i8* %104)
  %memload139 = load i64, i64* %RBP_N.48, align 1
  %105 = inttoptr i64 %memload139 to i8*
  call void @free(i8* %105)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 128)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 136)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([152 x i8], [152 x i8]* @rodata_15, i32 0, i32 144)}
!6 = !{!5}
