; ModuleID = './protected_bc/uaf_wrong_branching.bc'
source_filename = "./bin/uaf_wrong_branching"

@rodata_15 = private unnamed_addr constant [141 x i8] c"\01\00\02\00VALUABLE VALUE\00NOT HELLO\00pointer changed to %s\0A\00NOT WORLD\00NOT EMPTY\00Test Failed: Repeated free operations caused by incorrect branching\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_52 = private constant i64 5499545330595942222
@rodata_15_4 = private constant i64 4993438935218405718
@rodata_15_70 = private constant i64 5053166820879761497
@rodata_15_27 = private constant i64 7310589494249390159
@rodata_15_60 = private constant i64 5567892060793339972
@rodata_15_62 = private constant i64 6075440856613277518
@rodata_15_12 = private constant i64 5620568567612266016
@rodata_15_19 = private constant i64 5497845421194891086

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 4)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i32*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %2 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %3 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %3, align 1
  %4 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %5 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %5, align 1
  store i32 0, i32* %ns_ptr9, align 1
  %6 = load i64, i64* %ns_ptr6, align 1
  %7 = ptrtoint i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 23) to i64
  %8 = sub i64 %6, %7
  %9 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %6, i64 %7)
  %CF = extractvalue { i64, i1 } %9, 1
  %ZF = icmp eq i64 %8, 0
  %highbit = and i64 -9223372036854775808, %8
  %SF = icmp ne i64 %highbit, 0
  %10 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %6, i64 %7)
  %OF = extractvalue { i64, i1 } %10, 1
  %11 = and i64 %8, 255
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = and i64 %12, 1
  %PF = icmp eq i64 %13, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, i64* %ns_ptr6, align 1
  %14 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 19) to i64*, !ROData_Index !5
  %memload4 = load i64, i64* @rodata_15_19, align 1, !ROData_Content !6
  %15 = inttoptr i64 %memload3 to i64*
  store i64 %memload4, i64* %15, align 1
  %16 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 27) to i64*, !ROData_Index !7
  %memload5 = load i64, i64* @rodata_15_27, align 1, !ROData_Content !8
  %memref-disp6 = add i64 %memload3, 8
  %17 = inttoptr i64 %memref-disp6 to i64*
  store i64 %memload5, i64* %17, align 1
  %memload7 = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 29), i64 %memload7)
  %memload8 = load i64, i64* %ns_ptr6, align 1
  %18 = inttoptr i64 %memload8 to i8*
  call void @zeno_free(i8* %18)
  %memload9 = load i32, i32* %ns_ptr9, align 1
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
  store i32 %EAX16, i32* %ns_ptr9, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %24 = load i64, i64* %ns_ptr6, align 1
  %25 = ptrtoint i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 56) to i64
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
  %memload23 = load i64, i64* %ns_ptr6, align 1
  %32 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 52) to i64*, !ROData_Index !9
  %memload24 = load i64, i64* @rodata_15_52, align 1, !ROData_Content !10
  %33 = inttoptr i64 %memload23 to i64*
  store i64 %memload24, i64* %33, align 1
  %34 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 60) to i64*, !ROData_Index !11
  %memload25 = load i64, i64* @rodata_15_60, align 1, !ROData_Content !12
  %memref-disp26 = add i64 %memload23, 8
  %35 = inttoptr i64 %memref-disp26 to i64*
  store i64 %memload25, i64* %35, align 1
  %memload27 = load i64, i64* %ns_ptr6, align 1
  %EAX28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 29), i64 %memload27)
  %memload29 = load i64, i64* %ns_ptr6, align 1
  %36 = inttoptr i64 %memload29 to i8*
  call void @zeno_free(i8* %36)
  %memload30 = load i32, i32* %ns_ptr9, align 1
  %EAX37 = add i32 %memload30, 1
  %37 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload30, i32 1)
  %CF31 = extractvalue { i32, i1 } %37, 1
  %38 = and i32 %EAX37, 255
  %39 = call i32 @llvm.ctpop.i32(i32 %38)
  %40 = and i32 %39, 1
  %PF32 = icmp eq i32 %40, 0
  %ZF33 = icmp eq i32 %EAX37, 0
  %highbit34 = and i32 -2147483648, %EAX37
  %SF35 = icmp ne i32 %highbit34, 0
  %41 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload30, i32 1)
  %OF36 = extractvalue { i32, i1 } %41, 1
  store i32 %EAX37, i32* %ns_ptr9, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %42 = load i64, i64* %ns_ptr6, align 1
  %43 = ptrtoint i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 140) to i64
  %44 = sub i64 %42, %43
  %45 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %42, i64 %43)
  %CF38 = extractvalue { i64, i1 } %45, 1
  %ZF39 = icmp eq i64 %44, 0
  %highbit40 = and i64 -9223372036854775808, %44
  %SF41 = icmp ne i64 %highbit40, 0
  %46 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %42, i64 %43)
  %OF42 = extractvalue { i64, i1 } %46, 1
  %47 = and i64 %44, 255
  %48 = call i64 @llvm.ctpop.i64(i64 %47)
  %49 = and i64 %48, 1
  %PF43 = icmp eq i64 %49, 0
  %CmpZF_JE67 = icmp eq i1 %ZF39, true
  br i1 %CmpZF_JE67, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload44 = load i64, i64* %ns_ptr6, align 1
  %50 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 62) to i64*, !ROData_Index !13
  %memload45 = load i64, i64* @rodata_15_62, align 1, !ROData_Content !14
  %51 = inttoptr i64 %memload44 to i64*
  store i64 %memload45, i64* %51, align 1
  %52 = bitcast i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 70) to i64*, !ROData_Index !15
  %memload46 = load i64, i64* @rodata_15_70, align 1, !ROData_Content !16
  %memref-disp47 = add i64 %memload44, 8
  %53 = inttoptr i64 %memref-disp47 to i64*
  store i64 %memload46, i64* %53, align 1
  %memload48 = load i64, i64* %ns_ptr6, align 1
  %EAX49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([141 x i8], [141 x i8]* @rodata_15, i32 0, i32 29), i64 %memload48)
  %memload50 = load i64, i64* %ns_ptr6, align 1
  %54 = inttoptr i64 %memload50 to i8*
  call void @zeno_free(i8* %54)
  %memload51 = load i32, i32* %ns_ptr9, align 1
  %EAX58 = add i32 %memload51, 1
  %55 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload51, i32 1)
  %CF52 = extractvalue { i32, i1 } %55, 1
  %56 = and i32 %EAX58, 255
  %57 = call i32 @llvm.ctpop.i32(i32 %56)
  %58 = and i32 %57, 1
  %PF53 = icmp eq i32 %58, 0
  %ZF54 = icmp eq i32 %EAX58, 0
  %highbit55 = and i32 -2147483648, %EAX58
  %SF56 = icmp ne i32 %highbit55, 0
  %59 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload51, i32 1)
  %OF57 = extractvalue { i32, i1 } %59, 1
  store i32 %EAX58, i32* %ns_ptr9, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %60 = load i32, i32* %ns_ptr9, align 1
  %61 = zext i32 %60 to i64
  %62 = zext i32 1 to i64
  %63 = sub i64 %61, %62
  %64 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %61, i64 %62)
  %CF59 = extractvalue { i64, i1 } %64, 1
  %ZF60 = icmp eq i64 %63, 0
  %highbit61 = and i64 -9223372036854775808, %63
  %SF62 = icmp ne i64 %highbit61, 0
  %65 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %61, i64 %62)
  %OF63 = extractvalue { i64, i1 } %65, 1
  %66 = and i64 %63, 255
  %67 = call i64 @llvm.ctpop.i64(i64 %66)
  %68 = and i64 %67, 1
  %PF64 = icmp eq i64 %68, 0
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

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
