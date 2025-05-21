; ModuleID = './bin/uaf_wrong_branching'
source_filename = "./bin/uaf_wrong_branching"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00VALUABLE VALUE\00NOT HELLO\00pointer changed to %s\0A\00NOT WORLD\00NOT EMPTY\00Test Failed: Repeated free operations caused by incorrect branching\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.20 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %6 = inttoptr i64 %memload to ptr
  store i64 %memload1, ptr %6, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %7 = inttoptr i64 %memref-disp to ptr
  store i64 %memload2, ptr %7, align 1
  store i32 0, ptr %RBP_N.20, align 1
  %8 = load i64, ptr %RBP_N.16, align 1
  %9 = ptrtoint ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 23) to i64
  %10 = sub i64 %8, %9
  %11 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %8, i64 %9)
  %CF = extractvalue { i64, i1 } %11, 1
  %ZF = icmp eq i64 %10, 0
  %highbit = and i64 -9223372036854775808, %10
  %SF = icmp ne i64 %highbit, 0
  %12 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 %9)
  %OF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %10, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, ptr %RBP_N.16, align 1
  %memload4 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 19), align 1, !ROData_Content !3
  %16 = inttoptr i64 %memload3 to ptr
  store i64 %memload4, ptr %16, align 1
  %memload5 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 27), align 1, !ROData_Content !4
  %memref-disp6 = add i64 %memload3, 8
  %17 = inttoptr i64 %memref-disp6 to ptr
  store i64 %memload5, ptr %17, align 1
  %memload7 = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 29), i64 %memload7)
  %memload8 = load i64, ptr %RBP_N.16, align 1
  %18 = inttoptr i64 %memload8 to ptr
  call void @free(ptr %18)
  %memload9 = load i32, ptr %RBP_N.20, align 1
  %EAX16 = add i32 %memload9, 1
  %19 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload9, i32 1)
  %CF10 = extractvalue { i32, i1 } %19, 1
  %20 = and i32 %EAX16, 255
  %21 = call i32 @llvm.ctpop.i32(i32 %20)
  %22 = and i32 %21, 1
  %PF11 = icmp eq i32 %22, 0
  %ZF12 = icmp eq i32 %EAX16, 0
  %highbit13 = and i32 -2147483648, %EAX16
  %SF14 = icmp ne i32 %highbit13, 0
  %23 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload9, i32 1)
  %OF15 = extractvalue { i32, i1 } %23, 1
  store i32 %EAX16, ptr %RBP_N.20, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %24 = load i64, ptr %RBP_N.16, align 1
  %25 = ptrtoint ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 56) to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF17 = extractvalue { i64, i1 } %27, 1
  %ZF18 = icmp eq i64 %26, 0
  %highbit19 = and i64 -9223372036854775808, %26
  %SF20 = icmp ne i64 %highbit19, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF21 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF22 = icmp eq i64 %31, 0
  %CmpZF_JE66 = icmp eq i1 %ZF18, true
  br i1 %CmpZF_JE66, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %memload23 = load i64, ptr %RBP_N.16, align 1
  %memload24 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 52), align 1, !ROData_Content !5
  %32 = inttoptr i64 %memload23 to ptr
  store i64 %memload24, ptr %32, align 1
  %memload25 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 60), align 1, !ROData_Content !6
  %memref-disp26 = add i64 %memload23, 8
  %33 = inttoptr i64 %memref-disp26 to ptr
  store i64 %memload25, ptr %33, align 1
  %memload27 = load i64, ptr %RBP_N.16, align 1
  %EAX28 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 29), i64 %memload27)
  %memload29 = load i64, ptr %RBP_N.16, align 1
  %34 = inttoptr i64 %memload29 to ptr
  call void @free(ptr %34)
  %memload30 = load i32, ptr %RBP_N.20, align 1
  %EAX37 = add i32 %memload30, 1
  %35 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload30, i32 1)
  %CF31 = extractvalue { i32, i1 } %35, 1
  %36 = and i32 %EAX37, 255
  %37 = call i32 @llvm.ctpop.i32(i32 %36)
  %38 = and i32 %37, 1
  %PF32 = icmp eq i32 %38, 0
  %ZF33 = icmp eq i32 %EAX37, 0
  %highbit34 = and i32 -2147483648, %EAX37
  %SF35 = icmp ne i32 %highbit34, 0
  %39 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload30, i32 1)
  %OF36 = extractvalue { i32, i1 } %39, 1
  store i32 %EAX37, ptr %RBP_N.20, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %40 = load i64, ptr %RBP_N.16, align 1
  %41 = ptrtoint ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 140) to i64
  %42 = sub i64 %40, %41
  %43 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %40, i64 %41)
  %CF38 = extractvalue { i64, i1 } %43, 1
  %ZF39 = icmp eq i64 %42, 0
  %highbit40 = and i64 -9223372036854775808, %42
  %SF41 = icmp ne i64 %highbit40, 0
  %44 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %40, i64 %41)
  %OF42 = extractvalue { i64, i1 } %44, 1
  %45 = and i64 %42, 255
  %46 = call i64 @llvm.ctpop.i64(i64 %45)
  %47 = and i64 %46, 1
  %PF43 = icmp eq i64 %47, 0
  %CmpZF_JE67 = icmp eq i1 %ZF39, true
  br i1 %CmpZF_JE67, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload44 = load i64, ptr %RBP_N.16, align 1
  %memload45 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 62), align 1, !ROData_Content !7
  %48 = inttoptr i64 %memload44 to ptr
  store i64 %memload45, ptr %48, align 1
  %memload46 = load i64, ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 70), align 1, !ROData_Content !8
  %memref-disp47 = add i64 %memload44, 8
  %49 = inttoptr i64 %memref-disp47 to ptr
  store i64 %memload46, ptr %49, align 1
  %memload48 = load i64, ptr %RBP_N.16, align 1
  %EAX49 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 29), i64 %memload48)
  %memload50 = load i64, ptr %RBP_N.16, align 1
  %50 = inttoptr i64 %memload50 to ptr
  call void @free(ptr %50)
  %memload51 = load i32, ptr %RBP_N.20, align 1
  %EAX58 = add i32 %memload51, 1
  %51 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload51, i32 1)
  %CF52 = extractvalue { i32, i1 } %51, 1
  %52 = and i32 %EAX58, 255
  %53 = call i32 @llvm.ctpop.i32(i32 %52)
  %54 = and i32 %53, 1
  %PF53 = icmp eq i32 %54, 0
  %ZF54 = icmp eq i32 %EAX58, 0
  %highbit55 = and i32 -2147483648, %EAX58
  %SF56 = icmp ne i32 %highbit55, 0
  %55 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload51, i32 1)
  %OF57 = extractvalue { i32, i1 } %55, 1
  store i32 %EAX58, ptr %RBP_N.20, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %56 = load i32, ptr %RBP_N.20, align 1
  %57 = zext i32 %56 to i64
  %58 = zext i32 1 to i64
  %59 = sub i64 %57, %58
  %60 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %57, i64 %58)
  %CF59 = extractvalue { i64, i1 } %60, 1
  %ZF60 = icmp eq i64 %59, 0
  %highbit61 = and i64 -9223372036854775808, %59
  %SF62 = icmp ne i64 %highbit61, 0
  %61 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %57, i64 %58)
  %OF63 = extractvalue { i64, i1 } %61, 1
  %62 = and i64 %59, 255
  %63 = call i64 @llvm.ctpop.i64(i64 %62)
  %64 = and i64 %63, 1
  %PF64 = icmp eq i64 %64, 0
  %CmpZF_JLE = icmp eq i1 %ZF60, true
  %CmpOF_JLE = icmp ne i1 %SF62, %OF63
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  %EAX65 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 72))
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 19)}
!4 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 27)}
!5 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 52)}
!6 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 60)}
!7 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 62)}
!8 = !{ptr getelementptr inbounds ([141 x i8], ptr @rodata_15, i32 0, i32 70)}
