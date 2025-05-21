; ModuleID = './bin/sbo_struct_array'
source_filename = "./bin/sbo_struct_array"

@rodata_15 = private unnamed_addr constant [117 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00axax0xaffdeff\00Test Failed: Employee %zu ID altered due to overflow!\0A\00", align 16, !ROData_SecInfo !0

declare dso_local ptr @strcpy(ptr, ptr)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.56 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.32 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 48
  %RBP_N.24 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i64, ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.48, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.40, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i64 %memload2, ptr %RBP_N.32, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 40), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.24, align 1
  %7 = sext i32 0 to i64
  store i64 %7, ptr %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %8 = load i64, ptr %RBP_N.56, align 1
  %9 = sub i64 %8, 2
  %10 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %8, i64 2)
  %CF = extractvalue { i64, i1 } %10, 1
  %ZF = icmp eq i64 %9, 0
  %highbit = and i64 -9223372036854775808, %9
  %SF = icmp ne i64 %highbit, 0
  %11 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 2)
  %OF = extractvalue { i64, i1 } %11, 1
  %12 = and i64 %9, 255
  %13 = call i64 @llvm.ctpop.i64(i64 %12)
  %14 = and i64 %13, 1
  %PF = icmp eq i64 %14, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i64, ptr %RBP_N.56, align 1
  %RDI = ptrtoint ptr %RBP_N.48 to i64
  %RAX = shl i64 %memload4, 4
  %ZF5 = icmp eq i64 %RAX, 0
  %highbit6 = and i64 -9223372036854775808, %RAX
  %SF7 = icmp ne i64 %highbit6, 0
  %RDI11 = add nsw i64 %RDI, %RAX
  %highbit8 = and i64 -9223372036854775808, %RDI11
  %SF9 = icmp ne i64 %highbit8, 0
  %ZF10 = icmp eq i64 %RDI11, 0
  %RDI18 = add i64 %RDI11, 4
  %15 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %RDI11, i64 4)
  %CF12 = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %RDI18, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF13 = icmp eq i64 %18, 0
  %ZF14 = icmp eq i64 %RDI18, 0
  %highbit15 = and i64 -9223372036854775808, %RDI18
  %SF16 = icmp ne i64 %highbit15, 0
  %19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %RDI11, i64 4)
  %OF17 = extractvalue { i64, i1 } %19, 1
  %20 = inttoptr i64 %RDI18 to ptr
  %21 = call ptr @strcpy(ptr %20, ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 48))
  %RAX19 = ptrtoint ptr %21 to i64
  %memload20 = load i64, ptr %RBP_N.56, align 1
  %RAX27 = add i64 %memload20, 1
  %22 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload20, i64 1)
  %CF21 = extractvalue { i64, i1 } %22, 1
  %23 = and i64 %RAX27, 255
  %24 = call i64 @llvm.ctpop.i64(i64 %23)
  %25 = and i64 %24, 1
  %PF22 = icmp eq i64 %25, 0
  %ZF23 = icmp eq i64 %RAX27, 0
  %highbit24 = and i64 -9223372036854775808, %RAX27
  %SF25 = icmp ne i64 %highbit24, 0
  %26 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload20, i64 1)
  %OF26 = extractvalue { i64, i1 } %26, 1
  store i64 %RAX27, ptr %RBP_N.56, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %27 = sext i32 0 to i64
  store i64 %27, ptr %stktop_8, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.8
  %28 = load i64, ptr %stktop_8, align 1
  %29 = sub i64 %28, 2
  %30 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %28, i64 2)
  %CF28 = extractvalue { i64, i1 } %30, 1
  %ZF29 = icmp eq i64 %29, 0
  %highbit30 = and i64 -9223372036854775808, %29
  %SF31 = icmp ne i64 %highbit30, 0
  %31 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %28, i64 2)
  %OF32 = extractvalue { i64, i1 } %31, 1
  %32 = and i64 %29, 255
  %33 = call i64 @llvm.ctpop.i64(i64 %32)
  %34 = and i64 %33, 1
  %PF33 = icmp eq i64 %34, 0
  %CFCmp_JAE66 = icmp eq i1 %CF28, false
  br i1 %CFCmp_JAE66, label %bb.9, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload34 = load i64, ptr %stktop_8, align 1
  %RAX35 = ptrtoint ptr %RBP_N.48 to i64
  %RCX = shl i64 %memload34, 4
  %ZF36 = icmp eq i64 %RCX, 0
  %highbit37 = and i64 -9223372036854775808, %RCX
  %SF38 = icmp ne i64 %highbit37, 0
  %RAX42 = add nsw i64 %RAX35, %RCX
  %highbit39 = and i64 -9223372036854775808, %RAX42
  %SF40 = icmp ne i64 %highbit39, 0
  %ZF41 = icmp eq i64 %RAX42, 0
  %35 = getelementptr i8, ptr %RBP_N.48, i64 %RCX
  %memload43 = load i64, ptr %35, align 1
  %36 = trunc i64 %memload43 to i32
  %RAX44 = sext i32 %36 to i64
  %37 = load i64, ptr %stktop_8, align 1
  %38 = sub i64 %RAX44, %37
  %39 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX44, i64 %37)
  %CF45 = extractvalue { i64, i1 } %39, 1
  %ZF46 = icmp eq i64 %38, 0
  %highbit47 = and i64 -9223372036854775808, %38
  %SF48 = icmp ne i64 %highbit47, 0
  %40 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX44, i64 %37)
  %OF49 = extractvalue { i64, i1 } %40, 1
  %41 = and i64 %38, 255
  %42 = call i64 @llvm.ctpop.i64(i64 %41)
  %43 = and i64 %42, 1
  %PF50 = icmp eq i64 %43, 0
  %CmpZF_JE = icmp eq i1 %ZF46, true
  br i1 %CmpZF_JE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %memload51 = load i64, ptr %stktop_8, align 1
  %RSI = add i64 %memload51, 1
  %44 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload51, i64 1)
  %CF52 = extractvalue { i64, i1 } %44, 1
  %45 = and i64 %RSI, 255
  %46 = call i64 @llvm.ctpop.i64(i64 %45)
  %47 = and i64 %46, 1
  %PF53 = icmp eq i64 %47, 0
  %ZF54 = icmp eq i64 %RSI, 0
  %highbit55 = and i64 -9223372036854775808, %RSI
  %SF56 = icmp ne i64 %highbit55, 0
  %48 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload51, i64 1)
  %OF57 = extractvalue { i64, i1 } %48, 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 62), i64 %RSI)
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  br label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload58 = load i64, ptr %stktop_8, align 1
  %RAX65 = add i64 %memload58, 1
  %49 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload58, i64 1)
  %CF59 = extractvalue { i64, i1 } %49, 1
  %50 = and i64 %RAX65, 255
  %51 = call i64 @llvm.ctpop.i64(i64 %50)
  %52 = and i64 %51, 1
  %PF60 = icmp eq i64 %52, 0
  %ZF61 = icmp eq i64 %RAX65, 0
  %highbit62 = and i64 -9223372036854775808, %RAX65
  %SF63 = icmp ne i64 %highbit62, 0
  %53 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload58, i64 1)
  %OF64 = extractvalue { i64, i1 } %53, 1
  store i64 %RAX65, ptr %stktop_8, align 1
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
!1 = !{ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 32)}
!4 = !{ptr getelementptr inbounds ([117 x i8], ptr @rodata_15, i32 0, i32 40)}
