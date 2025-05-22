; ModuleID = './bin/sbo_int_buffer_in_struct'
source_filename = "./bin/sbo_int_buffer_in_struct"

@rodata_15 = private unnamed_addr constant [134 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\0090\00\00Test Failed: Stack Buffer Overflow within struct elements of int datatype\0A\00Trigger Check intact.\0A\00", align 16, !ROData_SecInfo !0

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
  %RBP_N.32 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.20 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 64
  %RBP_N.8 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %6 to i32*
  %7 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %7 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 0, i32* %RBP_N.8, align 1
  %8 = bitcast i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %8, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.48, align 1
  %9 = bitcast i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %9, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.40, align 1
  %10 = bitcast i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* %10, align 1, !ROData_Content !6
  store i32 %memload2, i32* %RBP_N.32, align 1
  %11 = sext i32 0 to i64
  store i64 %11, i64* %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %12 = load i64, i64* %RBP_N.56, align 1
  %13 = sub i64 %12, 5
  %14 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %12, i64 5)
  %CF = extractvalue { i64, i1 } %14, 1
  %ZF = icmp eq i64 %13, 0
  %highbit = and i64 -9223372036854775808, %13
  %SF = icmp ne i64 %highbit, 0
  %15 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %12, i64 5)
  %OF = extractvalue { i64, i1 } %15, 1
  %16 = and i64 %13, 255
  %17 = call i64 @llvm.ctpop.i64(i64 %16)
  %18 = and i64 %17, 1
  %PF = icmp eq i64 %18, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload3 = load i64, i64* %RBP_N.56, align 1
  %sc-m = mul i64 4, %memload3
  %19 = bitcast i64* %RBP_N.48 to i8*
  %20 = getelementptr i8, i8* %19, i64 %sc-m
  %21 = bitcast i8* %20 to i64*
  %22 = bitcast i64* %21 to i32*
  %memload4 = load i32, i32* %22, align 1
  %memload5 = load i64, i64* %RBP_N.56, align 1
  %sc-m6 = mul i64 4, %memload5
  %23 = bitcast i32* %RBP_N.20 to i8*
  %24 = getelementptr i8, i8* %23, i64 %sc-m6
  %25 = bitcast i8* %24 to i32*
  store i32 %memload4, i32* %25, align 1
  %memload8 = load i64, i64* %RBP_N.56, align 1
  %RAX = add i64 %memload8, 1
  %26 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload8, i64 1)
  %CF9 = extractvalue { i64, i1 } %26, 1
  %27 = and i64 %RAX, 255
  %28 = call i64 @llvm.ctpop.i64(i64 %27)
  %29 = and i64 %28, 1
  %PF10 = icmp eq i64 %29, 0
  %ZF11 = icmp eq i64 %RAX, 0
  %highbit12 = and i64 -9223372036854775808, %RAX
  %SF13 = icmp ne i64 %highbit12, 0
  %30 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload8, i64 1)
  %OF14 = extractvalue { i64, i1 } %30, 1
  store i64 %RAX, i64* %RBP_N.56, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %31 = load i32, i32* %RBP_N.8, align 1
  %32 = zext i32 %31 to i64
  %33 = zext i32 0 to i64
  %34 = sub i64 %32, %33
  %35 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %32, i64 %33)
  %CF15 = extractvalue { i64, i1 } %35, 1
  %ZF16 = icmp eq i64 %34, 0
  %highbit17 = and i64 -9223372036854775808, %34
  %SF18 = icmp ne i64 %highbit17, 0
  %36 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %32, i64 %33)
  %OF19 = extractvalue { i64, i1 } %36, 1
  %37 = and i64 %34, 255
  %38 = call i64 @llvm.ctpop.i64(i64 %37)
  %39 = and i64 %38, 1
  %PF20 = icmp eq i64 %39, 0
  %CmpZF_JE = icmp eq i1 %ZF16, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 36))
  br label %bb.6

bb.5:                                             ; preds = %bb.3
  %EAX21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 111))
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
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
!1 = !{i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([134 x i8], [134 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
