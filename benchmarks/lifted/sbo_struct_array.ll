; ModuleID = './bin/sbo_struct_array'
source_filename = "./bin/sbo_struct_array"

@rodata_15 = private unnamed_addr constant [117 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00axax0xaffdeff\00Test Failed: Employee %zu ID altered due to overflow!\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i8* @strcpy(i8*, i8*)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.56 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.40 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.32 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.24 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %6 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %7 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %7, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.48, align 1
  %8 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %8, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.40, align 1
  %9 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 32) to i64*, !ROData_Index !5
  %memload2 = load i64, i64* %9, align 1, !ROData_Content !6
  store i64 %memload2, i64* %RBP_N.32, align 1
  %10 = bitcast i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 40) to i64*, !ROData_Index !7
  %memload3 = load i64, i64* %10, align 1, !ROData_Content !8
  store i64 %memload3, i64* %RBP_N.24, align 1
  %11 = sext i32 0 to i64
  store i64 %11, i64* %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %12 = load i64, i64* %RBP_N.56, align 1
  %13 = sub i64 %12, 2
  %14 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %12, i64 2)
  %CF = extractvalue { i64, i1 } %14, 1
  %ZF = icmp eq i64 %13, 0
  %highbit = and i64 -9223372036854775808, %13
  %SF = icmp ne i64 %highbit, 0
  %15 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %12, i64 2)
  %OF = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %13, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF = icmp eq i64 %18, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i64, i64* %RBP_N.56, align 1
  %RDI = ptrtoint i64* %RBP_N.48 to i64
  %RAX = shl i64 %memload4, 4
  %ZF5 = icmp eq i64 %RAX, 0
  %highbit6 = and i64 -9223372036854775808, %RAX
  %SF7 = icmp ne i64 %highbit6, 0
  %RDI11 = add nsw i64 %RDI, %RAX
  %highbit8 = and i64 -9223372036854775808, %RDI11
  %SF9 = icmp ne i64 %highbit8, 0
  %ZF10 = icmp eq i64 %RDI11, 0
  %RDI18 = add i64 %RDI11, 4
  %19 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI11, i64 4)
  %CF12 = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %RDI18, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF13 = icmp eq i64 %22, 0
  %ZF14 = icmp eq i64 %RDI18, 0
  %highbit15 = and i64 -9223372036854775808, %RDI18
  %SF16 = icmp ne i64 %highbit15, 0
  %23 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI11, i64 4)
  %OF17 = extractvalue { i64, i1 } %23, 1
  %24 = inttoptr i64 %RDI18 to i8*
  %25 = call i8* @strcpy(i8* %24, i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 48))
  %RAX19 = ptrtoint i8* %25 to i64
  %memload20 = load i64, i64* %RBP_N.56, align 1
  %RAX27 = add i64 %memload20, 1
  %26 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload20, i64 1)
  %CF21 = extractvalue { i64, i1 } %26, 1
  %27 = and i64 %RAX27, 255
  %28 = call i64 @llvm.ctpop.i64(i64 %27)
  %29 = and i64 %28, 1
  %PF22 = icmp eq i64 %29, 0
  %ZF23 = icmp eq i64 %RAX27, 0
  %highbit24 = and i64 -9223372036854775808, %RAX27
  %SF25 = icmp ne i64 %highbit24, 0
  %30 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload20, i64 1)
  %OF26 = extractvalue { i64, i1 } %30, 1
  store i64 %RAX27, i64* %RBP_N.56, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %31 = sext i32 0 to i64
  store i64 %31, i64* %RSPAdj_N.64, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.8
  %32 = load i64, i64* %RSPAdj_N.64, align 1
  %33 = sub i64 %32, 2
  %34 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %32, i64 2)
  %CF28 = extractvalue { i64, i1 } %34, 1
  %ZF29 = icmp eq i64 %33, 0
  %highbit30 = and i64 -9223372036854775808, %33
  %SF31 = icmp ne i64 %highbit30, 0
  %35 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %32, i64 2)
  %OF32 = extractvalue { i64, i1 } %35, 1
  %36 = and i64 %33, 255
  %37 = call i64 @llvm.ctpop.i64(i64 %36)
  %38 = and i64 %37, 1
  %PF33 = icmp eq i64 %38, 0
  %CFCmp_JAE66 = icmp eq i1 %CF28, false
  br i1 %CFCmp_JAE66, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload34 = load i64, i64* %RSPAdj_N.64, align 1
  %RAX35 = ptrtoint i64* %RBP_N.48 to i64
  %RCX = shl i64 %memload34, 4
  %ZF36 = icmp eq i64 %RCX, 0
  %highbit37 = and i64 -9223372036854775808, %RCX
  %SF38 = icmp ne i64 %highbit37, 0
  %RAX42 = add nsw i64 %RAX35, %RCX
  %highbit39 = and i64 -9223372036854775808, %RAX42
  %SF40 = icmp ne i64 %highbit39, 0
  %ZF41 = icmp eq i64 %RAX42, 0
  %39 = bitcast i64* %RBP_N.48 to i8*
  %40 = getelementptr i8, i8* %39, i64 %RCX
  %41 = bitcast i8* %40 to i64*
  %memload43 = load i64, i64* %41, align 1
  %42 = trunc i64 %memload43 to i32
  %RAX44 = sext i32 %42 to i64
  %43 = load i64, i64* %RSPAdj_N.64, align 1
  %44 = sub i64 %RAX44, %43
  %45 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX44, i64 %43)
  %CF45 = extractvalue { i64, i1 } %45, 1
  %ZF46 = icmp eq i64 %44, 0
  %highbit47 = and i64 -9223372036854775808, %44
  %SF48 = icmp ne i64 %highbit47, 0
  %46 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX44, i64 %43)
  %OF49 = extractvalue { i64, i1 } %46, 1
  %47 = and i64 %44, 255
  %48 = call i64 @llvm.ctpop.i64(i64 %47)
  %49 = and i64 %48, 1
  %PF50 = icmp eq i64 %49, 0
  %CmpZF_JE = icmp eq i1 %ZF46, true
  br i1 %CmpZF_JE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload51 = load i64, i64* %RSPAdj_N.64, align 1
  %RSI = add i64 %memload51, 1
  %50 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload51, i64 1)
  %CF52 = extractvalue { i64, i1 } %50, 1
  %51 = and i64 %RSI, 255
  %52 = call i64 @llvm.ctpop.i64(i64 %51)
  %53 = and i64 %52, 1
  %PF53 = icmp eq i64 %53, 0
  %ZF54 = icmp eq i64 %RSI, 0
  %highbit55 = and i64 -9223372036854775808, %RSI
  %SF56 = icmp ne i64 %highbit55, 0
  %54 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload51, i64 1)
  %OF57 = extractvalue { i64, i1 } %54, 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([117 x i8], [117 x i8]* @rodata_15, i32 0, i32 62), i64 %RSI)
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload58 = load i64, i64* %RSPAdj_N.64, align 1
  %RAX65 = add i64 %memload58, 1
  %55 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload58, i64 1)
  %CF59 = extractvalue { i64, i1 } %55, 1
  %56 = and i64 %RAX65, 255
  %57 = call i64 @llvm.ctpop.i64(i64 %56)
  %58 = and i64 %57, 1
  %PF60 = icmp eq i64 %58, 0
  %ZF61 = icmp eq i64 %RAX65, 0
  %highbit62 = and i64 -9223372036854775808, %RAX65
  %SF63 = icmp ne i64 %highbit62, 0
  %59 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload58, i64 1)
  %OF64 = extractvalue { i64, i1 } %59, 1
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
