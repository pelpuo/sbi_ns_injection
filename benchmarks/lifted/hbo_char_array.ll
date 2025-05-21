; ModuleID = './bin/hbo_char_array'
source_filename = "./bin/hbo_char_array"

@rodata_15 = private unnamed_addr constant [127 x i8] c"\01\00\02\001234567890123456\00Original content of b: %s\0A\00%c\00Content of b after overflow: %s\0A\00Test Failed: Heap buffer overflow occured\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local ptr @strcpy(ptr, ptr)

declare dso_local i32 @printf(ptr, ...)

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.52 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 47
  %RBP_N.25 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 48
  %RBP_N.24 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 56
  %RBP_N.16 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %7 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %8 = zext i32 32 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX = ptrtoint ptr %9 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %10 = zext i32 32 to i64
  %11 = call ptr @malloc(i64 %10)
  %RAX1 = ptrtoint ptr %11 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %12 = inttoptr i64 %memload to ptr
  %memload2 = load i8, ptr %12, align 1
  store i8 %memload2, ptr %RBP_N.25, align 1
  %memload3 = load i64, ptr %RBP_N.24, align 1
  %13 = inttoptr i64 %memload3 to ptr
  %14 = call ptr @strcpy(ptr %13, ptr getelementptr inbounds ([127 x i8], ptr @rodata_15, i32 0, i32 4))
  %RAX4 = ptrtoint ptr %14 to i64
  %memload5 = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_15, i32 0, i32 21), i64 %memload5)
  %memload6 = load i64, ptr %RBP_N.24, align 1
  %memload7 = load i64, ptr %RBP_N.16, align 1
  %RAX8 = sub i64 %memload6, %memload7
  %15 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload6, i64 %memload7)
  %CF = extractvalue { i64, i1 } %15, 1
  %ZF = icmp eq i64 %RAX8, 0
  %highbit = and i64 -9223372036854775808, %RAX8
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload6, i64 %memload7)
  %OF = extractvalue { i64, i1 } %16, 1
  %17 = and i64 %RAX8, 255
  %18 = call i64 @llvm.ctpop.i64(i64 %17)
  %19 = and i64 %18, 1
  %PF = icmp eq i64 %19, 0
  %RAX15 = sub i64 %RAX8, 16
  %20 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX8, i64 16)
  %CF9 = extractvalue { i64, i1 } %20, 1
  %21 = and i64 %RAX15, 255
  %22 = call i64 @llvm.ctpop.i64(i64 %21)
  %23 = and i64 %22, 1
  %PF10 = icmp eq i64 %23, 0
  %ZF11 = icmp eq i64 %RAX15, 0
  %highbit12 = and i64 -9223372036854775808, %RAX15
  %SF13 = icmp ne i64 %highbit12, 0
  %24 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX8, i64 16)
  %OF14 = extractvalue { i64, i1 } %24, 1
  store i64 %RAX15, ptr %RBP_N.40, align 1
  %memload16 = load i64, ptr %RBP_N.40, align 1
  %RDI = add i64 %memload16, 16
  %25 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload16, i64 16)
  %CF17 = extractvalue { i64, i1 } %25, 1
  %26 = and i64 %RDI, 255
  %27 = call i64 @llvm.ctpop.i64(i64 %26)
  %28 = and i64 %27, 1
  %PF18 = icmp eq i64 %28, 0
  %ZF19 = icmp eq i64 %RDI, 0
  %highbit20 = and i64 -9223372036854775808, %RDI
  %SF21 = icmp ne i64 %highbit20, 0
  %29 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload16, i64 16)
  %OF22 = extractvalue { i64, i1 } %29, 1
  %RDI29 = add i64 %RDI, 2
  %30 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI, i64 2)
  %CF23 = extractvalue { i64, i1 } %30, 1
  %31 = and i64 %RDI29, 255
  %32 = call i64 @llvm.ctpop.i64(i64 %31)
  %33 = and i64 %32, 1
  %PF24 = icmp eq i64 %33, 0
  %ZF25 = icmp eq i64 %RDI29, 0
  %highbit26 = and i64 -9223372036854775808, %RDI29
  %SF27 = icmp ne i64 %highbit26, 0
  %34 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI, i64 2)
  %OF28 = extractvalue { i64, i1 } %34, 1
  %35 = call ptr @malloc(i64 %RDI29)
  %RAX30 = ptrtoint ptr %35 to i64
  store i64 %RAX30, ptr %RBP_N.48, align 1
  %memload31 = load i64, ptr %RBP_N.48, align 1
  %memload32 = load i64, ptr %RBP_N.40, align 1
  %36 = inttoptr i64 %memload31 to ptr
  %37 = call ptr @memset(ptr %36, i32 65, i64 %memload32)
  %RAX33 = ptrtoint ptr %37 to i64
  %memload34 = load i64, ptr %RBP_N.48, align 1
  %memload35 = load i64, ptr %RBP_N.40, align 1
  %memload36 = load i64, ptr %RBP_N.16, align 1
  %memload37 = load i64, ptr %RBP_N.40, align 1
  %memref-basereg = add i64 %memload36, %memload37
  %38 = inttoptr i64 %memref-basereg to ptr
  %memload38 = load i64, ptr %38, align 1
  %memref-basereg39 = add i64 %memload34, %memload35
  %39 = inttoptr i64 %memref-basereg39 to ptr
  store i64 %memload38, ptr %39, align 1
  %memref-basereg40 = add i64 %memload36, %memload37
  %memref-disp = add i64 %memref-basereg40, 8
  %40 = inttoptr i64 %memref-disp to ptr
  %memload41 = load i64, ptr %40, align 1
  %memref-basereg42 = add i64 %memload34, %memload35
  %memref-disp43 = add i64 %memref-basereg42, 8
  %41 = inttoptr i64 %memref-disp43 to ptr
  store i64 %memload41, ptr %41, align 1
  %memref-basereg44 = add i64 %memload36, %memload37
  %memref-disp45 = add i64 %memref-basereg44, 16
  %42 = inttoptr i64 %memref-disp45 to ptr
  %memload46 = load i16, ptr %42, align 1
  %memref-basereg47 = add i64 %memload34, %memload35
  %memref-disp48 = add i64 %memref-basereg47, 16
  %43 = inttoptr i64 %memref-disp48 to ptr
  store i16 %memload46, ptr %43, align 1
  %memload49 = load i64, ptr %RBP_N.48, align 1
  %memload50 = load i64, ptr %RBP_N.40, align 1
  %RDI52 = add i64 %memload49, %memload50
  %44 = and i64 %RDI52, 255
  %45 = call i64 @llvm.ctpop.i64(i64 %44)
  %46 = and i64 %45, 1
  %PF51 = icmp eq i64 %46, 0
  %RDI59 = add i64 %RDI52, 16
  %47 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI52, i64 16)
  %CF53 = extractvalue { i64, i1 } %47, 1
  %48 = and i64 %RDI59, 255
  %49 = call i64 @llvm.ctpop.i64(i64 %48)
  %50 = and i64 %49, 1
  %PF54 = icmp eq i64 %50, 0
  %ZF55 = icmp eq i64 %RDI59, 0
  %highbit56 = and i64 -9223372036854775808, %RDI59
  %SF57 = icmp ne i64 %highbit56, 0
  %51 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI52, i64 16)
  %OF58 = extractvalue { i64, i1 } %51, 1
  %52 = inttoptr i64 %RDI59 to ptr
  %53 = zext i32 2 to i64
  %54 = call ptr @memset(ptr %52, i32 66, i64 %53)
  %RAX60 = ptrtoint ptr %54 to i64
  %memload61 = load i64, ptr %RBP_N.16, align 1
  %memload62 = load i64, ptr %RBP_N.48, align 1
  %memload63 = load i64, ptr %RBP_N.40, align 1
  %RDX = add i64 %memload63, 16
  %55 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload63, i64 16)
  %CF64 = extractvalue { i64, i1 } %55, 1
  %56 = and i64 %RDX, 255
  %57 = call i64 @llvm.ctpop.i64(i64 %56)
  %58 = and i64 %57, 1
  %PF65 = icmp eq i64 %58, 0
  %ZF66 = icmp eq i64 %RDX, 0
  %highbit67 = and i64 -9223372036854775808, %RDX
  %SF68 = icmp ne i64 %highbit67, 0
  %59 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload63, i64 16)
  %OF69 = extractvalue { i64, i1 } %59, 1
  %RDX76 = add i64 %RDX, 2
  %60 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDX, i64 2)
  %CF70 = extractvalue { i64, i1 } %60, 1
  %61 = and i64 %RDX76, 255
  %62 = call i64 @llvm.ctpop.i64(i64 %61)
  %63 = and i64 %62, 1
  %PF71 = icmp eq i64 %63, 0
  %ZF72 = icmp eq i64 %RDX76, 0
  %highbit73 = and i64 -9223372036854775808, %RDX76
  %SF74 = icmp ne i64 %highbit73, 0
  %64 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDX, i64 2)
  %OF75 = extractvalue { i64, i1 } %64, 1
  %65 = inttoptr i64 %memload61 to ptr
  %66 = inttoptr i64 %memload62 to ptr
  %67 = call ptr @memcpy(ptr %65, ptr %66, i64 %RDX76)
  %RAX77 = ptrtoint ptr %67 to i64
  store i32 0, ptr %RBP_N.52, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload78 = load i64, ptr %RBP_N.52, align 1
  %68 = trunc i64 %memload78 to i32
  %RAX79 = sext i32 %68 to i64
  %memload80 = load i64, ptr %RBP_N.40, align 1
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
  %memload100 = load i64, ptr %RBP_N.16, align 1
  %memload101 = load i64, ptr %RBP_N.52, align 1
  %85 = trunc i64 %memload101 to i32
  %RCX102 = sext i32 %85 to i64
  %memref-basereg103 = add i64 %memload100, %RCX102
  %86 = inttoptr i64 %memref-basereg103 to ptr
  %memload104 = load i32, ptr %86, align 1
  %87 = trunc i32 %memload104 to i8
  %ESI = sext i8 %87 to i32
  %EAX105 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_15, i32 0, i32 48), i32 %ESI)
  %memload106 = load i32, ptr %RBP_N.52, align 1
  %EAX113 = add i32 %memload106, 1
  %88 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload106, i32 1)
  %CF107 = extractvalue { i32, i1 } %88, 1
  %89 = and i32 %EAX113, 255
  %90 = call i32 @llvm.ctpop.i32(i32 %89)
  %91 = and i32 %90, 1
  %PF108 = icmp eq i32 %91, 0
  %ZF109 = icmp eq i32 %EAX113, 0
  %highbit110 = and i32 -2147483648, %EAX113
  %SF111 = icmp ne i32 %highbit110, 0
  %92 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload106, i32 1)
  %OF112 = extractvalue { i32, i1 } %92, 1
  store i32 %EAX113, ptr %RBP_N.52, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %EAX114 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_15, i32 0, i32 125))
  %memload115 = load i64, ptr %RBP_N.24, align 1
  %EAX116 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_15, i32 0, i32 51), i64 %memload115)
  %memload117 = load i32, ptr %RBP_N.25, align 1
  %93 = trunc i32 %memload117 to i8
  %EAX118 = sext i8 %93 to i32
  %memload119 = load i64, ptr %RBP_N.24, align 1
  %94 = inttoptr i64 %memload119 to ptr
  %memload120 = load i32, ptr %94, align 1
  %95 = trunc i32 %memload120 to i8
  %ECX = sext i8 %95 to i32
  %96 = sub i32 %EAX118, %ECX
  %97 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX118, i32 %ECX)
  %CF121 = extractvalue { i32, i1 } %97, 1
  %ZF122 = icmp eq i32 %96, 0
  %highbit123 = and i32 -2147483648, %96
  %SF124 = icmp ne i32 %highbit123, 0
  %98 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX118, i32 %ECX)
  %OF125 = extractvalue { i32, i1 } %98, 1
  %99 = and i32 %96, 255
  %100 = call i32 @llvm.ctpop.i32(i32 %99)
  %101 = and i32 %100, 1
  %PF126 = icmp eq i32 %101, 0
  %CmpZF_JE = icmp eq i1 %ZF122, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX127 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([127 x i8], ptr @rodata_15, i32 0, i32 84))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload128 = load i64, ptr %RBP_N.16, align 1
  %102 = inttoptr i64 %memload128 to ptr
  call void @free(ptr %102)
  %memload129 = load i64, ptr %RBP_N.24, align 1
  %103 = inttoptr i64 %memload129 to ptr
  call void @free(ptr %103)
  %memload130 = load i64, ptr %RBP_N.48, align 1
  %104 = inttoptr i64 %memload130 to ptr
  call void @free(ptr %104)
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
