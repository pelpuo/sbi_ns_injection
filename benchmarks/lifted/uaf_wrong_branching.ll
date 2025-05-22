; ModuleID = './bin/uaf_wrong_branching'
source_filename = "./bin/uaf_wrong_branching"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00VALUABLE VALUE\00NOT HELLO\00pointer changed to %s\0A\00NOT WORLD\00NOT EMPTY\00Test Failed: Repeated free operations caused by incorrect branching\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.20 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.16 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.4 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %3 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %4 = zext i32 16 to i64
  %5 = call i8* @malloc(i64 %4)
  %RAX = ptrtoint i8* %5 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %6 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* %6, align 1, !ROData_Content !2
  %7 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %7, align 1
  %8 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %9 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %9, align 1
  store i32 0, i32* %RBP_N.20, align 1
  %10 = load i64, i64* %RBP_N.16, align 1
  %11 = ptrtoint i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 23) to i64
  %12 = sub i64 %10, %11
  %13 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %10, i64 %11)
  %CF = extractvalue { i64, i1 } %13, 1
  %ZF = icmp eq i64 %12, 0
  %highbit = and i64 -9223372036854775808, %12
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %10, i64 %11)
  %OF = extractvalue { i64, i1 } %14, 1
  %15 = and i64 %12, 255
  %16 = call i64 @llvm.ctpop.i64(i64 %15)
  %17 = and i64 %16, 1
  %PF = icmp eq i64 %17, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, i64* %RBP_N.16, align 1
  %18 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 19) to i64*, !ROData_Index !5
  %memload4 = load i64, i64* %18, align 1, !ROData_Content !6
  %19 = inttoptr i64 %memload3 to i64*
  store i64 %memload4, i64* %19, align 1
  %20 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 27) to i64*, !ROData_Index !7
  %memload5 = load i64, i64* %20, align 1, !ROData_Content !8
  %memref-disp6 = add i64 %memload3, 8
  %21 = inttoptr i64 %memref-disp6 to i64*
  store i64 %memload5, i64* %21, align 1
  %memload7 = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 29), i64 %memload7)
  %memload8 = load i64, i64* %RBP_N.16, align 1
  %22 = inttoptr i64 %memload8 to i8*
  call void @free(i8* %22)
  %memload9 = load i32, i32* %RBP_N.20, align 1
  %EAX16 = add i32 %memload9, 1
  %23 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload9, i32 1)
  %CF10 = extractvalue { i32, i1 } %23, 1
  %24 = and i32 %EAX16, 255
  %25 = call i32 @llvm.ctpop.i32(i32 %24)
  %26 = and i32 %25, 1
  %PF11 = icmp eq i32 %26, 0
  %ZF12 = icmp eq i32 %EAX16, 0
  %highbit13 = and i32 -2147483648, %EAX16
  %SF14 = icmp ne i32 %highbit13, 0
  %27 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload9, i32 1)
  %OF15 = extractvalue { i32, i1 } %27, 1
  store i32 %EAX16, i32* %RBP_N.20, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %28 = load i64, i64* %RBP_N.16, align 1
  %29 = ptrtoint i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 56) to i64
  %30 = sub i64 %28, %29
  %31 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %28, i64 %29)
  %CF17 = extractvalue { i64, i1 } %31, 1
  %ZF18 = icmp eq i64 %30, 0
  %highbit19 = and i64 -9223372036854775808, %30
  %SF20 = icmp ne i64 %highbit19, 0
  %32 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %28, i64 %29)
  %OF21 = extractvalue { i64, i1 } %32, 1
  %33 = and i64 %30, 255
  %34 = call i64 @llvm.ctpop.i64(i64 %33)
  %35 = and i64 %34, 1
  %PF22 = icmp eq i64 %35, 0
  %CmpZF_JE66 = icmp eq i1 %ZF18, true
  br i1 %CmpZF_JE66, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %memload23 = load i64, i64* %RBP_N.16, align 1
  %36 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 52) to i64*, !ROData_Index !9
  %memload24 = load i64, i64* %36, align 1, !ROData_Content !10
  %37 = inttoptr i64 %memload23 to i64*
  store i64 %memload24, i64* %37, align 1
  %38 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 60) to i64*, !ROData_Index !11
  %memload25 = load i64, i64* %38, align 1, !ROData_Content !12
  %memref-disp26 = add i64 %memload23, 8
  %39 = inttoptr i64 %memref-disp26 to i64*
  store i64 %memload25, i64* %39, align 1
  %memload27 = load i64, i64* %RBP_N.16, align 1
  %EAX28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 29), i64 %memload27)
  %memload29 = load i64, i64* %RBP_N.16, align 1
  %40 = inttoptr i64 %memload29 to i8*
  call void @free(i8* %40)
  %memload30 = load i32, i32* %RBP_N.20, align 1
  %EAX37 = add i32 %memload30, 1
  %41 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload30, i32 1)
  %CF31 = extractvalue { i32, i1 } %41, 1
  %42 = and i32 %EAX37, 255
  %43 = call i32 @llvm.ctpop.i32(i32 %42)
  %44 = and i32 %43, 1
  %PF32 = icmp eq i32 %44, 0
  %ZF33 = icmp eq i32 %EAX37, 0
  %highbit34 = and i32 -2147483648, %EAX37
  %SF35 = icmp ne i32 %highbit34, 0
  %45 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload30, i32 1)
  %OF36 = extractvalue { i32, i1 } %45, 1
  store i32 %EAX37, i32* %RBP_N.20, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %46 = load i64, i64* %RBP_N.16, align 1
  %47 = ptrtoint i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 140) to i64
  %48 = sub i64 %46, %47
  %49 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %46, i64 %47)
  %CF38 = extractvalue { i64, i1 } %49, 1
  %ZF39 = icmp eq i64 %48, 0
  %highbit40 = and i64 -9223372036854775808, %48
  %SF41 = icmp ne i64 %highbit40, 0
  %50 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %46, i64 %47)
  %OF42 = extractvalue { i64, i1 } %50, 1
  %51 = and i64 %48, 255
  %52 = call i64 @llvm.ctpop.i64(i64 %51)
  %53 = and i64 %52, 1
  %PF43 = icmp eq i64 %53, 0
  %CmpZF_JE67 = icmp eq i1 %ZF39, true
  br i1 %CmpZF_JE67, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload44 = load i64, i64* %RBP_N.16, align 1
  %54 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 62) to i64*, !ROData_Index !13
  %memload45 = load i64, i64* %54, align 1, !ROData_Content !14
  %55 = inttoptr i64 %memload44 to i64*
  store i64 %memload45, i64* %55, align 1
  %56 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 70) to i64*, !ROData_Index !15
  %memload46 = load i64, i64* %56, align 1, !ROData_Content !16
  %memref-disp47 = add i64 %memload44, 8
  %57 = inttoptr i64 %memref-disp47 to i64*
  store i64 %memload46, i64* %57, align 1
  %memload48 = load i64, i64* %RBP_N.16, align 1
  %EAX49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 29), i64 %memload48)
  %memload50 = load i64, i64* %RBP_N.16, align 1
  %58 = inttoptr i64 %memload50 to i8*
  call void @free(i8* %58)
  %memload51 = load i32, i32* %RBP_N.20, align 1
  %EAX58 = add i32 %memload51, 1
  %59 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload51, i32 1)
  %CF52 = extractvalue { i32, i1 } %59, 1
  %60 = and i32 %EAX58, 255
  %61 = call i32 @llvm.ctpop.i32(i32 %60)
  %62 = and i32 %61, 1
  %PF53 = icmp eq i32 %62, 0
  %ZF54 = icmp eq i32 %EAX58, 0
  %highbit55 = and i32 -2147483648, %EAX58
  %SF56 = icmp ne i32 %highbit55, 0
  %63 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload51, i32 1)
  %OF57 = extractvalue { i32, i1 } %63, 1
  store i32 %EAX58, i32* %RBP_N.20, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %64 = load i32, i32* %RBP_N.20, align 1
  %65 = zext i32 %64 to i64
  %66 = zext i32 1 to i64
  %67 = sub i64 %65, %66
  %68 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %65, i64 %66)
  %CF59 = extractvalue { i64, i1 } %68, 1
  %ZF60 = icmp eq i64 %67, 0
  %highbit61 = and i64 -9223372036854775808, %67
  %SF62 = icmp ne i64 %highbit61, 0
  %69 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %65, i64 %66)
  %OF63 = extractvalue { i64, i1 } %69, 1
  %70 = and i64 %67, 255
  %71 = call i64 @llvm.ctpop.i64(i64 %70)
  %72 = and i64 %71, 1
  %PF64 = icmp eq i64 %72, 0
  %CmpZF_JLE = icmp eq i1 %ZF60, true
  %CmpOF_JLE = icmp ne i1 %SF62, %OF63
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  %EAX65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 72))
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
!1 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 19)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 27)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 52)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 60)}
!12 = !{!11}
!13 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 62)}
!14 = !{!13}
!15 = !{i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 70)}
!16 = !{!15}
