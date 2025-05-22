; ModuleID = './bin/hbo_char_array'
source_filename = "./bin/hbo_char_array"

@rodata_15 = private unnamed_addr constant [127 x i8] c"\01\00\02\001234567890123456\00Original content of b: %s\0A\00%c\00Content of b after overflow: %s\0A\00Test Failed: Heap buffer overflow occured\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i8* @strcpy(i8*, i8*)

declare dso_local i32 @printf(i8*, ...)

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i8* @memcpy(i8*, i8*, i64)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.52 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.40 = bitcast i8* %2 to i64*
  %RBP_N.25 = getelementptr i8, i8* %stktop_8, i64 47
  %3 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.24 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.16 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %6 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %7 = zext i32 32 to i64
  %8 = call i8* @malloc(i64 %7)
  %RAX = ptrtoint i8* %8 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %9 = zext i32 32 to i64
  %10 = call i8* @malloc(i64 %9)
  %RAX1 = ptrtoint i8* %10 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  %memload = load i64, i64* %RBP_N.24, align 1
  %11 = inttoptr i64 %memload to i8*
  %memload2 = load i8, i8* %11, align 1
  store i8 %memload2, i8* %RBP_N.25, align 1
  %memload3 = load i64, i64* %RBP_N.24, align 1
  %12 = inttoptr i64 %memload3 to i8*
  %13 = call i8* @strcpy(i8* %12, i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 4))
  %RAX4 = ptrtoint i8* %13 to i64
  %memload5 = load i64, i64* %RBP_N.24, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 21), i64 %memload5)
  %memload6 = load i64, i64* %RBP_N.24, align 1
  %memload7 = load i64, i64* %RBP_N.16, align 1
  %RAX8 = sub i64 %memload6, %memload7
  %14 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload6, i64 %memload7)
  %CF = extractvalue { i64, i1 } %14, 1
  %ZF = icmp eq i64 %RAX8, 0
  %highbit = and i64 -9223372036854775808, %RAX8
  %SF = icmp ne i64 %highbit, 0
  %15 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload6, i64 %memload7)
  %OF = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %RAX8, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF = icmp eq i64 %18, 0
  %RAX15 = sub i64 %RAX8, 16
  %19 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX8, i64 16)
  %CF9 = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %RAX15, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF10 = icmp eq i64 %22, 0
  %ZF11 = icmp eq i64 %RAX15, 0
  %highbit12 = and i64 -9223372036854775808, %RAX15
  %SF13 = icmp ne i64 %highbit12, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX8, i64 16)
  %OF14 = extractvalue { i64, i1 } %23, 1
  store i64 %RAX15, i64* %RBP_N.40, align 1
  %memload16 = load i64, i64* %RBP_N.40, align 1
  %RDI = add i64 %memload16, 16
  %24 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload16, i64 16)
  %CF17 = extractvalue { i64, i1 } %24, 1
  %25 = and i64 %RDI, 255
  %26 = call i64 @llvm.ctpop.i64(i64 %25)
  %27 = and i64 %26, 1
  %PF18 = icmp eq i64 %27, 0
  %ZF19 = icmp eq i64 %RDI, 0
  %highbit20 = and i64 -9223372036854775808, %RDI
  %SF21 = icmp ne i64 %highbit20, 0
  %28 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload16, i64 16)
  %OF22 = extractvalue { i64, i1 } %28, 1
  %RDI29 = add i64 %RDI, 2
  %29 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI, i64 2)
  %CF23 = extractvalue { i64, i1 } %29, 1
  %30 = and i64 %RDI29, 255
  %31 = call i64 @llvm.ctpop.i64(i64 %30)
  %32 = and i64 %31, 1
  %PF24 = icmp eq i64 %32, 0
  %ZF25 = icmp eq i64 %RDI29, 0
  %highbit26 = and i64 -9223372036854775808, %RDI29
  %SF27 = icmp ne i64 %highbit26, 0
  %33 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI, i64 2)
  %OF28 = extractvalue { i64, i1 } %33, 1
  %34 = call i8* @malloc(i64 %RDI29)
  %RAX30 = ptrtoint i8* %34 to i64
  store i64 %RAX30, i64* %RBP_N.48, align 1
  %memload31 = load i64, i64* %RBP_N.48, align 1
  %memload32 = load i64, i64* %RBP_N.40, align 1
  %35 = inttoptr i64 %memload31 to i8*
  %36 = call i8* @memset(i8* %35, i32 65, i64 %memload32)
  %RAX33 = ptrtoint i8* %36 to i64
  %memload34 = load i64, i64* %RBP_N.48, align 1
  %memload35 = load i64, i64* %RBP_N.40, align 1
  %memload36 = load i64, i64* %RBP_N.16, align 1
  %memload37 = load i64, i64* %RBP_N.40, align 1
  %memref-basereg = add i64 %memload36, %memload37
  %37 = inttoptr i64 %memref-basereg to i64*
  %memload38 = load i64, i64* %37, align 1
  %memref-basereg39 = add i64 %memload34, %memload35
  %38 = inttoptr i64 %memref-basereg39 to i64*
  store i64 %memload38, i64* %38, align 1
  %memref-basereg40 = add i64 %memload36, %memload37
  %memref-disp = add i64 %memref-basereg40, 8
  %39 = inttoptr i64 %memref-disp to i64*
  %memload41 = load i64, i64* %39, align 1
  %memref-basereg42 = add i64 %memload34, %memload35
  %memref-disp43 = add i64 %memref-basereg42, 8
  %40 = inttoptr i64 %memref-disp43 to i64*
  store i64 %memload41, i64* %40, align 1
  %memref-basereg44 = add i64 %memload36, %memload37
  %memref-disp45 = add i64 %memref-basereg44, 16
  %41 = inttoptr i64 %memref-disp45 to i16*
  %memload46 = load i16, i16* %41, align 1
  %memref-basereg47 = add i64 %memload34, %memload35
  %memref-disp48 = add i64 %memref-basereg47, 16
  %42 = inttoptr i64 %memref-disp48 to i16*
  store i16 %memload46, i16* %42, align 1
  %memload49 = load i64, i64* %RBP_N.48, align 1
  %memload50 = load i64, i64* %RBP_N.40, align 1
  %RDI52 = add i64 %memload49, %memload50
  %43 = and i64 %RDI52, 255
  %44 = call i64 @llvm.ctpop.i64(i64 %43)
  %45 = and i64 %44, 1
  %PF51 = icmp eq i64 %45, 0
  %RDI59 = add i64 %RDI52, 16
  %46 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI52, i64 16)
  %CF53 = extractvalue { i64, i1 } %46, 1
  %47 = and i64 %RDI59, 255
  %48 = call i64 @llvm.ctpop.i64(i64 %47)
  %49 = and i64 %48, 1
  %PF54 = icmp eq i64 %49, 0
  %ZF55 = icmp eq i64 %RDI59, 0
  %highbit56 = and i64 -9223372036854775808, %RDI59
  %SF57 = icmp ne i64 %highbit56, 0
  %50 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI52, i64 16)
  %OF58 = extractvalue { i64, i1 } %50, 1
  %51 = inttoptr i64 %RDI59 to i8*
  %52 = zext i32 2 to i64
  %53 = call i8* @memset(i8* %51, i32 66, i64 %52)
  %RAX60 = ptrtoint i8* %53 to i64
  %memload61 = load i64, i64* %RBP_N.16, align 1
  %memload62 = load i64, i64* %RBP_N.48, align 1
  %memload63 = load i64, i64* %RBP_N.40, align 1
  %RDX = add i64 %memload63, 16
  %54 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload63, i64 16)
  %CF64 = extractvalue { i64, i1 } %54, 1
  %55 = and i64 %RDX, 255
  %56 = call i64 @llvm.ctpop.i64(i64 %55)
  %57 = and i64 %56, 1
  %PF65 = icmp eq i64 %57, 0
  %ZF66 = icmp eq i64 %RDX, 0
  %highbit67 = and i64 -9223372036854775808, %RDX
  %SF68 = icmp ne i64 %highbit67, 0
  %58 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload63, i64 16)
  %OF69 = extractvalue { i64, i1 } %58, 1
  %RDX76 = add i64 %RDX, 2
  %59 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDX, i64 2)
  %CF70 = extractvalue { i64, i1 } %59, 1
  %60 = and i64 %RDX76, 255
  %61 = call i64 @llvm.ctpop.i64(i64 %60)
  %62 = and i64 %61, 1
  %PF71 = icmp eq i64 %62, 0
  %ZF72 = icmp eq i64 %RDX76, 0
  %highbit73 = and i64 -9223372036854775808, %RDX76
  %SF74 = icmp ne i64 %highbit73, 0
  %63 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDX, i64 2)
  %OF75 = extractvalue { i64, i1 } %63, 1
  %64 = inttoptr i64 %memload61 to i8*
  %65 = inttoptr i64 %memload62 to i8*
  %66 = call i8* @memcpy(i8* %64, i8* %65, i64 %RDX76)
  %RAX77 = ptrtoint i8* %66 to i64
  store i32 0, i32* %RBP_N.52, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %67 = bitcast i32* %RBP_N.52 to i64*
  %memload78 = load i64, i64* %67, align 1
  %68 = trunc i64 %memload78 to i32
  %RAX79 = sext i32 %68 to i64
  %memload80 = load i64, i64* %RBP_N.40, align 1
  %RCX = add i64 %memload80, 16
  %69 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload80, i64 16)
  %CF81 = extractvalue { i64, i1 } %69, 1
  %70 = and i64 %RCX, 255
  %71 = call i64 @llvm.ctpop.i64(i64 %70)
  %72 = and i64 %71, 1
  %PF82 = icmp eq i64 %72, 0
  %ZF83 = icmp eq i64 %RCX, 0
  %highbit84 = and i64 -9223372036854775808, %RCX
  %SF85 = icmp ne i64 %highbit84, 0
  %73 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload80, i64 16)
  %OF86 = extractvalue { i64, i1 } %73, 1
  %RCX93 = add i64 %RCX, 2
  %74 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RCX, i64 2)
  %CF87 = extractvalue { i64, i1 } %74, 1
  %75 = and i64 %RCX93, 255
  %76 = call i64 @llvm.ctpop.i64(i64 %75)
  %77 = and i64 %76, 1
  %PF88 = icmp eq i64 %77, 0
  %ZF89 = icmp eq i64 %RCX93, 0
  %highbit90 = and i64 -9223372036854775808, %RCX93
  %SF91 = icmp ne i64 %highbit90, 0
  %78 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RCX, i64 2)
  %OF92 = extractvalue { i64, i1 } %78, 1
  %79 = sub i64 %RAX79, %RCX93
  %80 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX79, i64 %RCX93)
  %CF94 = extractvalue { i64, i1 } %80, 1
  %ZF95 = icmp eq i64 %79, 0
  %highbit96 = and i64 -9223372036854775808, %79
  %SF97 = icmp ne i64 %highbit96, 0
  %81 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX79, i64 %RCX93)
  %OF98 = extractvalue { i64, i1 } %81, 1
  %82 = and i64 %79, 255
  %83 = call i64 @llvm.ctpop.i64(i64 %82)
  %84 = and i64 %83, 1
  %PF99 = icmp eq i64 %84, 0
  %CFCmp_JAE = icmp eq i1 %CF94, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload100 = load i64, i64* %RBP_N.16, align 1
  %85 = bitcast i32* %RBP_N.52 to i64*
  %memload101 = load i64, i64* %85, align 1
  %86 = trunc i64 %memload101 to i32
  %RCX102 = sext i32 %86 to i64
  %memref-basereg103 = add i64 %memload100, %RCX102
  %87 = inttoptr i64 %memref-basereg103 to i32*
  %memload104 = load i32, i32* %87, align 1
  %88 = trunc i32 %memload104 to i8
  %ESI = sext i8 %88 to i32
  %EAX105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 48), i32 %ESI)
  %memload106 = load i32, i32* %RBP_N.52, align 1
  %EAX113 = add i32 %memload106, 1
  %89 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload106, i32 1)
  %CF107 = extractvalue { i32, i1 } %89, 1
  %90 = and i32 %EAX113, 255
  %91 = call i32 @llvm.ctpop.i32(i32 %90)
  %92 = and i32 %91, 1
  %PF108 = icmp eq i32 %92, 0
  %ZF109 = icmp eq i32 %EAX113, 0
  %highbit110 = and i32 -2147483648, %EAX113
  %SF111 = icmp ne i32 %highbit110, 0
  %93 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload106, i32 1)
  %OF112 = extractvalue { i32, i1 } %93, 1
  store i32 %EAX113, i32* %RBP_N.52, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 125))
  %memload115 = load i64, i64* %RBP_N.24, align 1
  %EAX116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 51), i64 %memload115)
  %94 = bitcast i8* %RBP_N.25 to i32*
  %memload117 = load i32, i32* %94, align 1
  %95 = trunc i32 %memload117 to i8
  %EAX118 = sext i8 %95 to i32
  %memload119 = load i64, i64* %RBP_N.24, align 1
  %96 = inttoptr i64 %memload119 to i32*
  %memload120 = load i32, i32* %96, align 1
  %97 = trunc i32 %memload120 to i8
  %ECX = sext i8 %97 to i32
  %98 = sub i32 %EAX118, %ECX
  %99 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX118, i32 %ECX)
  %CF121 = extractvalue { i32, i1 } %99, 1
  %ZF122 = icmp eq i32 %98, 0
  %highbit123 = and i32 -2147483648, %98
  %SF124 = icmp ne i32 %highbit123, 0
  %100 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX118, i32 %ECX)
  %OF125 = extractvalue { i32, i1 } %100, 1
  %101 = and i32 %98, 255
  %102 = call i32 @llvm.ctpop.i32(i32 %101)
  %103 = and i32 %102, 1
  %PF126 = icmp eq i32 %103, 0
  %CmpZF_JE = icmp eq i1 %ZF122, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 84))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload128 = load i64, i64* %RBP_N.16, align 1
  %104 = inttoptr i64 %memload128 to i8*
  call void @free(i8* %104)
  %memload129 = load i64, i64* %RBP_N.24, align 1
  %105 = inttoptr i64 %memload129 to i8*
  call void @free(i8* %105)
  %memload130 = load i64, i64* %RBP_N.48, align 1
  %106 = inttoptr i64 %memload130 to i8*
  call void @free(i8* %106)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
