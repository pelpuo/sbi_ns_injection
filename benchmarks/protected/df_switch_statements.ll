; ModuleID = './protected_bc/df_switch_statements.bc'
source_filename = "./bin/df_switch_statements"

@rodata_15 = private unnamed_addr constant [126 x i8] c"\01\00\02\00Char is %s\0A\00DEFAULT\00\0Aa: %p\0A\00b: %p\0A\00c: %p\0A\00Test Failed: Switch fallthrough with metadata overwrite leading to Double Free\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_16 = private constant i64 23727827094750532
@rodata_15_24 = private constant i64 2938054523904266

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %2 = inttoptr i64 %memload to i8*
  store i8 67, i8* %2, align 1
  %memload1 = load i64, i64* %ns_ptr6, align 1
  %3 = inttoptr i64 %memload1 to i32*
  %memload2 = load i32, i32* %3, align 1
  %4 = trunc i32 %memload2 to i8
  %EAX = sext i8 %4 to i32
  store i32 %EAX, i32* %ns_ptr15, align 1
  %EAX3 = sub i32 %EAX, 65
  %5 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX, i32 65)
  %CF = extractvalue { i32, i1 } %5, 1
  %6 = and i32 %EAX3, 255
  %7 = call i32 @llvm.ctpop.i32(i32 %6)
  %8 = and i32 %7, 1
  %PF = icmp eq i32 %8, 0
  %ZF = icmp eq i32 %EAX3, 0
  %highbit = and i32 -2147483648, %EAX3
  %SF = icmp ne i32 %highbit, 0
  %9 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX, i32 65)
  %OF = extractvalue { i32, i1 } %9, 1
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.6, label %bb.1

bb.1:                                             ; preds = %entry
  br label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i32, i32* %ns_ptr15, align 1
  %EAX11 = sub i32 %memload4, 66
  %10 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload4, i32 66)
  %CF5 = extractvalue { i32, i1 } %10, 1
  %11 = and i32 %EAX11, 255
  %12 = call i32 @llvm.ctpop.i32(i32 %11)
  %13 = and i32 %12, 1
  %PF6 = icmp eq i32 %13, 0
  %ZF7 = icmp eq i32 %EAX11, 0
  %highbit8 = and i32 -2147483648, %EAX11
  %SF9 = icmp ne i32 %highbit8, 0
  %14 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload4, i32 66)
  %OF10 = extractvalue { i32, i1 } %14, 1
  %CmpZF_JE52 = icmp eq i1 %ZF7, true
  br i1 %CmpZF_JE52, label %bb.7, label %bb.3

bb.3:                                             ; preds = %bb.2
  br label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload12 = load i32, i32* %ns_ptr15, align 1
  %EAX19 = sub i32 %memload12, 67
  %15 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload12, i32 67)
  %CF13 = extractvalue { i32, i1 } %15, 1
  %16 = and i32 %EAX19, 255
  %17 = call i32 @llvm.ctpop.i32(i32 %16)
  %18 = and i32 %17, 1
  %PF14 = icmp eq i32 %18, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %19 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload12, i32 67)
  %OF18 = extractvalue { i32, i1 } %19, 1
  %CmpZF_JE53 = icmp eq i1 %ZF15, true
  br i1 %CmpZF_JE53, label %bb.8, label %bb.5

bb.5:                                             ; preds = %bb.4
  br label %bb.9

bb.6:                                             ; preds = %entry
  %memload20 = load i64, i64* %ns_ptr6, align 1
  %EAX21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 4), i64 %memload20)
  %memload22 = load i64, i64* %ns_ptr6, align 1
  %20 = inttoptr i64 %memload22 to i8*
  call void @zeno_free(i8* %20)
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.2
  %memload23 = load i64, i64* %ns_ptr6, align 1
  %EAX24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 4), i64 %memload23)
  %memload25 = load i64, i64* %ns_ptr6, align 1
  %21 = inttoptr i64 %memload25 to i8*
  call void @zeno_free(i8* %21)
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.4
  %memload26 = load i64, i64* %ns_ptr6, align 1
  %EAX27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 4), i64 %memload26)
  %memload28 = load i64, i64* %ns_ptr6, align 1
  %22 = inttoptr i64 %memload28 to i8*
  call void @zeno_free(i8* %22)
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.5
  %memload29 = load i64, i64* %ns_ptr6, align 1
  %23 = bitcast i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload30 = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  %24 = inttoptr i64 %memload29 to i64*
  store i64 %memload30, i64* %24, align 1
  %25 = bitcast i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload31 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload29, 8
  %26 = inttoptr i64 %memref-disp to i64*
  store i64 %memload31, i64* %26, align 1
  %memload32 = load i64, i64* %ns_ptr6, align 1
  %EAX33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 4), i64 %memload32)
  %memload34 = load i64, i64* %ns_ptr6, align 1
  %27 = inttoptr i64 %memload34 to i8*
  call void @zeno_free(i8* %27)
  %28 = zext i32 16 to i64
  %29 = call i8* @zeno_malloc(i64 %28)
  %RAX35 = ptrtoint i8* %29 to i64
  store i64 %RAX35, i64* %ns_ptr9, align 1
  %30 = zext i32 16 to i64
  %31 = call i8* @zeno_malloc(i64 %30)
  %RAX36 = ptrtoint i8* %31 to i64
  store i64 %RAX36, i64* %ns_ptr12, align 1
  %memload37 = load i64, i64* %ns_ptr6, align 1
  %EAX38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 24), i64 %memload37)
  %memload39 = load i64, i64* %ns_ptr9, align 1
  %EAX40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 32), i64 %memload39)
  %memload41 = load i64, i64* %ns_ptr12, align 1
  %EAX42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 39), i64 %memload41)
  %memload43 = load i64, i64* %ns_ptr9, align 1
  %32 = load i64, i64* %ns_ptr12, align 1
  %33 = sub i64 %memload43, %32
  %34 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload43, i64 %32)
  %CF44 = extractvalue { i64, i1 } %34, 1
  %ZF45 = icmp eq i64 %33, 0
  %highbit46 = and i64 -9223372036854775808, %33
  %SF47 = icmp ne i64 %highbit46, 0
  %35 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload43, i64 %32)
  %OF48 = extractvalue { i64, i1 } %35, 1
  %36 = and i64 %33, 255
  %37 = call i64 @llvm.ctpop.i64(i64 %36)
  %38 = and i64 %37, 1
  %PF49 = icmp eq i64 %38, 0
  %CmpZF_JNE = icmp eq i1 %ZF45, false
  br i1 %CmpZF_JNE, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 46))
  br label %bb.11

bb.11:                                            ; preds = %bb.10, %bb.9
  %memload51 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload51
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([126 x i8], [126 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
