; ModuleID = './protected_bc/sbo_struct_array.bc'
source_filename = "./bin/sbo_struct_array"

@rodata_15 = private unnamed_addr constant [117 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00axax0xaffdeff\00Test Failed: Employee %zu ID altered due to overflow!\0A\00", align 16, !ROData_SecInfo !0
@rodata_15_40 = private constant i64 0
@rodata_15_16 = private constant i64 0
@rodata_15_32 = private constant i64 1
@rodata_15_24 = private constant i64 0

declare dso_local i8* @strcpy(i8*, i8*)

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
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* @rodata_15_16, align 1, !ROData_Content !2
  store i64 %memload, i64* %ns_ptr15, align 1
  %1 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* @rodata_15_24, align 1, !ROData_Content !4
  store i64 %memload1, i64* %ns_ptr12, align 1
  %2 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* @rodata_15_32, align 1, !ROData_Content !6
  store i64 %memload2, i64* %ns_ptr9, align 1
  %3 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* @rodata_15_40, align 1, !ROData_Content !8
  store i64 %memload3, i64* %ns_ptr6, align 1
  %4 = sext i32 0 to i64
  store i64 %4, i64* %ns_ptr18, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %5 = load i64, i64* %ns_ptr18, align 1
  %6 = sub i64 %5, 2
  %7 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %5, i64 2)
  %CF = extractvalue { i64, i1 } %7, 1
  %ZF = icmp eq i64 %6, 0
  %highbit = and i64 -9223372036854775808, %6
  %SF = icmp ne i64 %highbit, 0
  %8 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %5, i64 2)
  %OF = extractvalue { i64, i1 } %8, 1
  %9 = and i64 %6, 255
  %10 = call i64 @llvm.ctpop.i64(i64 %9)
  %11 = and i64 %10, 1
  %PF = icmp eq i64 %11, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i64, i64* %ns_ptr18, align 1
  %RDI = ptrtoint i64* %ns_ptr15 to i64
  %RAX = shl i64 %memload4, 4
  %ZF5 = icmp eq i64 %RAX, 0
  %highbit6 = and i64 -9223372036854775808, %RAX
  %SF7 = icmp ne i64 %highbit6, 0
  %RDI11 = add nsw i64 %RDI, %RAX
  %highbit8 = and i64 -9223372036854775808, %RDI11
  %SF9 = icmp ne i64 %highbit8, 0
  %ZF10 = icmp eq i64 %RDI11, 0
  %RDI18 = add i64 %RDI11, 4
  %12 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI11, i64 4)
  %CF12 = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RDI18, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF13 = icmp eq i64 %15, 0
  %ZF14 = icmp eq i64 %RDI18, 0
  %highbit15 = and i64 -9223372036854775808, %RDI18
  %SF16 = icmp ne i64 %highbit15, 0
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI11, i64 4)
  %OF17 = extractvalue { i64, i1 } %16, 1
  %17 = inttoptr i64 %RDI18 to i8*
  %18 = call i8* @zeno_strcpy(i8* %17, i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 48))
  %RAX19 = ptrtoint i8* %18 to i64
  %memload20 = load i64, i64* %ns_ptr18, align 1
  %RAX27 = add i64 %memload20, 1
  %19 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload20, i64 1)
  %CF21 = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %RAX27, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF22 = icmp eq i64 %22, 0
  %ZF23 = icmp eq i64 %RAX27, 0
  %highbit24 = and i64 -9223372036854775808, %RAX27
  %SF25 = icmp ne i64 %highbit24, 0
  %23 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload20, i64 1)
  %OF26 = extractvalue { i64, i1 } %23, 1
  store i64 %RAX27, i64* %ns_ptr18, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %24 = sext i32 0 to i64
  store i64 %24, i64* %RSPAdj_N.64, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.8, %bb.3
  %25 = load i64, i64* %RSPAdj_N.64, align 1
  %26 = sub i64 %25, 2
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %25, i64 2)
  %CF28 = extractvalue { i64, i1 } %27, 1
  %ZF29 = icmp eq i64 %26, 0
  %highbit30 = and i64 -9223372036854775808, %26
  %SF31 = icmp ne i64 %highbit30, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %25, i64 2)
  %OF32 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF33 = icmp eq i64 %31, 0
  %CFCmp_JAE66 = icmp eq i1 %CF28, false
  br i1 %CFCmp_JAE66, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload34 = load i64, i64* %RSPAdj_N.64, align 1
  %RAX35 = ptrtoint i64* %ns_ptr15 to i64
  %RCX = shl i64 %memload34, 4
  %ZF36 = icmp eq i64 %RCX, 0
  %highbit37 = and i64 -9223372036854775808, %RCX
  %SF38 = icmp ne i64 %highbit37, 0
  %RAX42 = add nsw i64 %RAX35, %RCX
  %highbit39 = and i64 -9223372036854775808, %RAX42
  %SF40 = icmp ne i64 %highbit39, 0
  %ZF41 = icmp eq i64 %RAX42, 0
  %32 = bitcast i64* %ns_ptr15 to i8*
  %33 = getelementptr i8, i8* %32, i64 %RCX
  %34 = bitcast i8* %33 to i64*
  %memload43 = load i64, i64* %34, align 1
  %35 = trunc i64 %memload43 to i32
  %RAX44 = sext i32 %35 to i64
  %36 = load i64, i64* %RSPAdj_N.64, align 1
  %37 = sub i64 %RAX44, %36
  %38 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX44, i64 %36)
  %CF45 = extractvalue { i64, i1 } %38, 1
  %ZF46 = icmp eq i64 %37, 0
  %highbit47 = and i64 -9223372036854775808, %37
  %SF48 = icmp ne i64 %highbit47, 0
  %39 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX44, i64 %36)
  %OF49 = extractvalue { i64, i1 } %39, 1
  %40 = and i64 %37, 255
  %41 = call i64 @llvm.ctpop.i64(i64 %40)
  %42 = and i64 %41, 1
  %PF50 = icmp eq i64 %42, 0
  %CmpZF_JE = icmp eq i1 %ZF46, true
  br i1 %CmpZF_JE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload51 = load i64, i64* %RSPAdj_N.64, align 1
  %RSI = add i64 %memload51, 1
  %43 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload51, i64 1)
  %CF52 = extractvalue { i64, i1 } %43, 1
  %44 = and i64 %RSI, 255
  %45 = call i64 @llvm.ctpop.i64(i64 %44)
  %46 = and i64 %45, 1
  %PF53 = icmp eq i64 %46, 0
  %ZF54 = icmp eq i64 %RSI, 0
  %highbit55 = and i64 -9223372036854775808, %RSI
  %SF56 = icmp ne i64 %highbit55, 0
  %47 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload51, i64 1)
  %OF57 = extractvalue { i64, i1 } %47, 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI)
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload58 = load i64, i64* %RSPAdj_N.64, align 1
  %RAX65 = add i64 %memload58, 1
  %48 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload58, i64 1)
  %CF59 = extractvalue { i64, i1 } %48, 1
  %49 = and i64 %RAX65, 255
  %50 = call i64 @llvm.ctpop.i64(i64 %49)
  %51 = and i64 %50, 1
  %PF60 = icmp eq i64 %51, 0
  %ZF61 = icmp eq i64 %RAX65, 0
  %highbit62 = and i64 -9223372036854775808, %RAX65
  %SF63 = icmp ne i64 %highbit62, 0
  %52 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload58, i64 1)
  %OF64 = extractvalue { i64, i1 } %52, 1
  store i64 %RAX65, i64* %RSPAdj_N.64, align 1
  br label %bb.4

bb.9:                                             ; preds = %bb.4
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_strcpy(i8*, i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 40)}
!8 = !{!7}
