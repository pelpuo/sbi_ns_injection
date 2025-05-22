; ModuleID = './protected_bc/hbo_char_array.bc'
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
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 68
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 47
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 4)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i32*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %ns_base19 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot20 = call i8* @zeno_protect(i8* %ns_base19, i64 4)
  %ns_ptr21 = bitcast i8* %ns_prot20 to i32*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %RBP_N.25 = getelementptr i8, i8* %stktop_8, i64 47
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 32 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %2 = zext i32 32 to i64
  %3 = call i8* @zeno_malloc(i64 %2)
  %RAX1 = ptrtoint i8* %3 to i64
  store i64 %RAX1, i64* %ns_ptr9, align 1
  %memload = load i64, i64* %ns_ptr9, align 1
  %4 = inttoptr i64 %memload to i8*
  %memload2 = load i8, i8* %4, align 1
  store i8 %memload2, i8* %RBP_N.25, align 1
  %memload3 = load i64, i64* %ns_ptr9, align 1
  %5 = inttoptr i64 %memload3 to i8*
  %6 = call i8* @zeno_strcpy(i8* %5, i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 4))
  %RAX4 = ptrtoint i8* %6 to i64
  %memload5 = load i64, i64* %ns_ptr9, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 21), i64 %memload5)
  %memload6 = load i64, i64* %ns_ptr9, align 1
  %memload7 = load i64, i64* %ns_ptr6, align 1
  %RAX8 = sub i64 %memload6, %memload7
  %7 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload6, i64 %memload7)
  %CF = extractvalue { i64, i1 } %7, 1
  %ZF = icmp eq i64 %RAX8, 0
  %highbit = and i64 -9223372036854775808, %RAX8
  %SF = icmp ne i64 %highbit, 0
  %8 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload6, i64 %memload7)
  %OF = extractvalue { i64, i1 } %8, 1
  %9 = and i64 %RAX8, 255
  %10 = call i64 @llvm.ctpop.i64(i64 %9)
  %11 = and i64 %10, 1
  %PF = icmp eq i64 %11, 0
  %RAX15 = sub i64 %RAX8, 16
  %12 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX8, i64 16)
  %CF9 = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RAX15, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF10 = icmp eq i64 %15, 0
  %ZF11 = icmp eq i64 %RAX15, 0
  %highbit12 = and i64 -9223372036854775808, %RAX15
  %SF13 = icmp ne i64 %highbit12, 0
  %16 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX8, i64 16)
  %OF14 = extractvalue { i64, i1 } %16, 1
  store i64 %RAX15, i64* %ns_ptr15, align 1
  %memload16 = load i64, i64* %ns_ptr15, align 1
  %RDI = add i64 %memload16, 16
  %17 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload16, i64 16)
  %CF17 = extractvalue { i64, i1 } %17, 1
  %18 = and i64 %RDI, 255
  %19 = call i64 @llvm.ctpop.i64(i64 %18)
  %20 = and i64 %19, 1
  %PF18 = icmp eq i64 %20, 0
  %ZF19 = icmp eq i64 %RDI, 0
  %highbit20 = and i64 -9223372036854775808, %RDI
  %SF21 = icmp ne i64 %highbit20, 0
  %21 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload16, i64 16)
  %OF22 = extractvalue { i64, i1 } %21, 1
  %RDI29 = add i64 %RDI, 2
  %22 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI, i64 2)
  %CF23 = extractvalue { i64, i1 } %22, 1
  %23 = and i64 %RDI29, 255
  %24 = call i64 @llvm.ctpop.i64(i64 %23)
  %25 = and i64 %24, 1
  %PF24 = icmp eq i64 %25, 0
  %ZF25 = icmp eq i64 %RDI29, 0
  %highbit26 = and i64 -9223372036854775808, %RDI29
  %SF27 = icmp ne i64 %highbit26, 0
  %26 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI, i64 2)
  %OF28 = extractvalue { i64, i1 } %26, 1
  %27 = call i8* @zeno_malloc(i64 %RDI29)
  %RAX30 = ptrtoint i8* %27 to i64
  store i64 %RAX30, i64* %ns_ptr18, align 1
  %memload31 = load i64, i64* %ns_ptr18, align 1
  %memload32 = load i64, i64* %ns_ptr15, align 1
  %28 = inttoptr i64 %memload31 to i8*
  %29 = call i8* @memset(i8* %28, i32 65, i64 %memload32)
  %RAX33 = ptrtoint i8* %29 to i64
  %memload34 = load i64, i64* %ns_ptr18, align 1
  %memload35 = load i64, i64* %ns_ptr15, align 1
  %memload36 = load i64, i64* %ns_ptr6, align 1
  %memload37 = load i64, i64* %ns_ptr15, align 1
  %memref-basereg = add i64 %memload36, %memload37
  %30 = inttoptr i64 %memref-basereg to i64*
  %memload38 = load i64, i64* %30, align 1
  %memref-basereg39 = add i64 %memload34, %memload35
  %31 = inttoptr i64 %memref-basereg39 to i64*
  store i64 %memload38, i64* %31, align 1
  %memref-basereg40 = add i64 %memload36, %memload37
  %memref-disp = add i64 %memref-basereg40, 8
  %32 = inttoptr i64 %memref-disp to i64*
  %memload41 = load i64, i64* %32, align 1
  %memref-basereg42 = add i64 %memload34, %memload35
  %memref-disp43 = add i64 %memref-basereg42, 8
  %33 = inttoptr i64 %memref-disp43 to i64*
  store i64 %memload41, i64* %33, align 1
  %memref-basereg44 = add i64 %memload36, %memload37
  %memref-disp45 = add i64 %memref-basereg44, 16
  %34 = inttoptr i64 %memref-disp45 to i16*
  %memload46 = load i16, i16* %34, align 1
  %memref-basereg47 = add i64 %memload34, %memload35
  %memref-disp48 = add i64 %memref-basereg47, 16
  %35 = inttoptr i64 %memref-disp48 to i16*
  store i16 %memload46, i16* %35, align 1
  %memload49 = load i64, i64* %ns_ptr18, align 1
  %memload50 = load i64, i64* %ns_ptr15, align 1
  %RDI52 = add i64 %memload49, %memload50
  %36 = and i64 %RDI52, 255
  %37 = call i64 @llvm.ctpop.i64(i64 %36)
  %38 = and i64 %37, 1
  %PF51 = icmp eq i64 %38, 0
  %RDI59 = add i64 %RDI52, 16
  %39 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI52, i64 16)
  %CF53 = extractvalue { i64, i1 } %39, 1
  %40 = and i64 %RDI59, 255
  %41 = call i64 @llvm.ctpop.i64(i64 %40)
  %42 = and i64 %41, 1
  %PF54 = icmp eq i64 %42, 0
  %ZF55 = icmp eq i64 %RDI59, 0
  %highbit56 = and i64 -9223372036854775808, %RDI59
  %SF57 = icmp ne i64 %highbit56, 0
  %43 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI52, i64 16)
  %OF58 = extractvalue { i64, i1 } %43, 1
  %44 = inttoptr i64 %RDI59 to i8*
  %45 = zext i32 2 to i64
  %46 = call i8* @memset(i8* %44, i32 66, i64 %45)
  %RAX60 = ptrtoint i8* %46 to i64
  %memload61 = load i64, i64* %ns_ptr6, align 1
  %memload62 = load i64, i64* %ns_ptr18, align 1
  %memload63 = load i64, i64* %ns_ptr15, align 1
  %RDX = add i64 %memload63, 16
  %47 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload63, i64 16)
  %CF64 = extractvalue { i64, i1 } %47, 1
  %48 = and i64 %RDX, 255
  %49 = call i64 @llvm.ctpop.i64(i64 %48)
  %50 = and i64 %49, 1
  %PF65 = icmp eq i64 %50, 0
  %ZF66 = icmp eq i64 %RDX, 0
  %highbit67 = and i64 -9223372036854775808, %RDX
  %SF68 = icmp ne i64 %highbit67, 0
  %51 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload63, i64 16)
  %OF69 = extractvalue { i64, i1 } %51, 1
  %RDX76 = add i64 %RDX, 2
  %52 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDX, i64 2)
  %CF70 = extractvalue { i64, i1 } %52, 1
  %53 = and i64 %RDX76, 255
  %54 = call i64 @llvm.ctpop.i64(i64 %53)
  %55 = and i64 %54, 1
  %PF71 = icmp eq i64 %55, 0
  %ZF72 = icmp eq i64 %RDX76, 0
  %highbit73 = and i64 -9223372036854775808, %RDX76
  %SF74 = icmp ne i64 %highbit73, 0
  %56 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDX, i64 2)
  %OF75 = extractvalue { i64, i1 } %56, 1
  %57 = inttoptr i64 %memload61 to i8*
  %58 = inttoptr i64 %memload62 to i8*
  %59 = call i8* @zeno_memcpy(i8* %57, i8* %58, i64 %RDX76)
  %RAX77 = ptrtoint i8* %59 to i64
  store i32 0, i32* %ns_ptr21, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %60 = bitcast i32* %ns_ptr21 to i64*
  %memload78 = load i64, i64* %60, align 1
  %61 = trunc i64 %memload78 to i32
  %RAX79 = sext i32 %61 to i64
  %memload80 = load i64, i64* %ns_ptr15, align 1
  %RCX = add i64 %memload80, 16
  %62 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload80, i64 16)
  %CF81 = extractvalue { i64, i1 } %62, 1
  %63 = and i64 %RCX, 255
  %64 = call i64 @llvm.ctpop.i64(i64 %63)
  %65 = and i64 %64, 1
  %PF82 = icmp eq i64 %65, 0
  %ZF83 = icmp eq i64 %RCX, 0
  %highbit84 = and i64 -9223372036854775808, %RCX
  %SF85 = icmp ne i64 %highbit84, 0
  %66 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload80, i64 16)
  %OF86 = extractvalue { i64, i1 } %66, 1
  %RCX93 = add i64 %RCX, 2
  %67 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RCX, i64 2)
  %CF87 = extractvalue { i64, i1 } %67, 1
  %68 = and i64 %RCX93, 255
  %69 = call i64 @llvm.ctpop.i64(i64 %68)
  %70 = and i64 %69, 1
  %PF88 = icmp eq i64 %70, 0
  %ZF89 = icmp eq i64 %RCX93, 0
  %highbit90 = and i64 -9223372036854775808, %RCX93
  %SF91 = icmp ne i64 %highbit90, 0
  %71 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RCX, i64 2)
  %OF92 = extractvalue { i64, i1 } %71, 1
  %72 = sub i64 %RAX79, %RCX93
  %73 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX79, i64 %RCX93)
  %CF94 = extractvalue { i64, i1 } %73, 1
  %ZF95 = icmp eq i64 %72, 0
  %highbit96 = and i64 -9223372036854775808, %72
  %SF97 = icmp ne i64 %highbit96, 0
  %74 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX79, i64 %RCX93)
  %OF98 = extractvalue { i64, i1 } %74, 1
  %75 = and i64 %72, 255
  %76 = call i64 @llvm.ctpop.i64(i64 %75)
  %77 = and i64 %76, 1
  %PF99 = icmp eq i64 %77, 0
  %CFCmp_JAE = icmp eq i1 %CF94, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload100 = load i64, i64* %ns_ptr6, align 1
  %78 = bitcast i32* %ns_ptr21 to i64*
  %memload101 = load i64, i64* %78, align 1
  %79 = trunc i64 %memload101 to i32
  %RCX102 = sext i32 %79 to i64
  %memref-basereg103 = add i64 %memload100, %RCX102
  %80 = inttoptr i64 %memref-basereg103 to i32*
  %memload104 = load i32, i32* %80, align 1
  %81 = trunc i32 %memload104 to i8
  %ESI = sext i8 %81 to i32
  %EAX105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 48), i32 %ESI)
  %memload106 = load i32, i32* %ns_ptr21, align 1
  %EAX113 = add i32 %memload106, 1
  %82 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload106, i32 1)
  %CF107 = extractvalue { i32, i1 } %82, 1
  %83 = and i32 %EAX113, 255
  %84 = call i32 @llvm.ctpop.i32(i32 %83)
  %85 = and i32 %84, 1
  %PF108 = icmp eq i32 %85, 0
  %ZF109 = icmp eq i32 %EAX113, 0
  %highbit110 = and i32 -2147483648, %EAX113
  %SF111 = icmp ne i32 %highbit110, 0
  %86 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload106, i32 1)
  %OF112 = extractvalue { i32, i1 } %86, 1
  store i32 %EAX113, i32* %ns_ptr21, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 125))
  %memload115 = load i64, i64* %ns_ptr9, align 1
  %EAX116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 51), i64 %memload115)
  %memload117 = load i32, i32* %ns_ptr12, align 1
  %87 = trunc i32 %memload117 to i8
  %EAX118 = sext i8 %87 to i32
  %memload119 = load i64, i64* %ns_ptr9, align 1
  %88 = inttoptr i64 %memload119 to i32*
  %memload120 = load i32, i32* %88, align 1
  %89 = trunc i32 %memload120 to i8
  %ECX = sext i8 %89 to i32
  %90 = sub i32 %EAX118, %ECX
  %91 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX118, i32 %ECX)
  %CF121 = extractvalue { i32, i1 } %91, 1
  %ZF122 = icmp eq i32 %90, 0
  %highbit123 = and i32 -2147483648, %90
  %SF124 = icmp ne i32 %highbit123, 0
  %92 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX118, i32 %ECX)
  %OF125 = extractvalue { i32, i1 } %92, 1
  %93 = and i32 %90, 255
  %94 = call i32 @llvm.ctpop.i32(i32 %93)
  %95 = and i32 %94, 1
  %PF126 = icmp eq i32 %95, 0
  %CmpZF_JE = icmp eq i1 %ZF122, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @rodata_15, i32 0, i32 84))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload128 = load i64, i64* %ns_ptr6, align 1
  %96 = inttoptr i64 %memload128 to i8*
  call void @zeno_free(i8* %96)
  %memload129 = load i64, i64* %ns_ptr9, align 1
  %97 = inttoptr i64 %memload129 to i8*
  call void @zeno_free(i8* %97)
  %memload130 = load i64, i64* %ns_ptr18, align 1
  %98 = inttoptr i64 %memload130 to i8*
  call void @zeno_free(i8* %98)
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare i8* @zeno_strcpy(i8*, i8*)

declare i8* @zeno_memcpy(i8*, i8*, i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
