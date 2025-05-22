; ModuleID = './bin/oobr_do_while'
source_filename = "./bin/oobr_do_while"

@rodata_15 = private unnamed_addr constant [112 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00i: %d \09val: %d\0A\00Test Failed: Integer Array Out of Bounds - Loop Off by One\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.36 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.32 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.24 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.16 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.8 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.4 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %6 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 5, i32* %RBP_N.8, align 1
  %7 = bitcast i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 16) to i64*, !ROData_Index !1
  %memload = load i64, i64* %7, align 1, !ROData_Content !2
  store i64 %memload, i64* %RBP_N.32, align 1
  %8 = bitcast i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 24) to i64*, !ROData_Index !3
  %memload1 = load i64, i64* %8, align 1, !ROData_Content !4
  store i64 %memload1, i64* %RBP_N.24, align 1
  %9 = bitcast i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 32) to i32*, !ROData_Index !5
  %memload2 = load i32, i32* %9, align 1, !ROData_Content !6
  store i32 %memload2, i32* %RBP_N.16, align 1
  store i32 0, i32* %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.4
  %memload3 = load i32, i32* %RBP_N.36, align 1
  %EAX = add i32 %memload3, 1
  %10 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload3, i32 1)
  %CF = extractvalue { i32, i1 } %10, 1
  %11 = and i32 %EAX, 255
  %12 = call i32 @llvm.ctpop.i32(i32 %11)
  %13 = and i32 %12, 1
  %PF = icmp eq i32 %13, 0
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %14 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload3, i32 1)
  %OF = extractvalue { i32, i1 } %14, 1
  store i32 %EAX, i32* %RBP_N.36, align 1
  %memload4 = load i32, i32* %RBP_N.36, align 1
  %15 = bitcast i32* %RBP_N.36 to i64*
  %memload5 = load i64, i64* %15, align 1
  %16 = trunc i64 %memload5 to i32
  %RAX = sext i32 %16 to i64
  %sc-m = mul i64 4, %RAX
  %17 = bitcast i64* %RBP_N.32 to i8*
  %18 = getelementptr i8, i8* %17, i64 %sc-m
  %19 = bitcast i8* %18 to i64*
  %20 = bitcast i64* %19 to i32*
  %memload6 = load i32, i32* %20, align 1
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 36), i32 %memload4, i32 %memload6)
  %memload8 = load i32, i32* %RBP_N.36, align 1
  %21 = load i32, i32* %RBP_N.8, align 1
  %22 = sub i32 %memload8, %21
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload8, i32 %21)
  %CF9 = extractvalue { i32, i1 } %23, 1
  %ZF10 = icmp eq i32 %22, 0
  %highbit11 = and i32 -2147483648, %22
  %SF12 = icmp ne i32 %highbit11, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload8, i32 %21)
  %OF13 = extractvalue { i32, i1 } %24, 1
  %25 = and i32 %22, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %25)
  %27 = and i32 %26, 1
  %PF14 = icmp eq i32 %27, 0
  %SFAndOF_JL = icmp ne i1 %SF12, %OF13
  br i1 %SFAndOF_JL, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 52))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload16 = load i32, i32* %RBP_N.36, align 1
  %28 = load i32, i32* %RBP_N.8, align 1
  %29 = sub i32 %memload16, %28
  %30 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload16, i32 %28)
  %CF17 = extractvalue { i32, i1 } %30, 1
  %ZF18 = icmp eq i32 %29, 0
  %highbit19 = and i32 -2147483648, %29
  %SF20 = icmp ne i32 %highbit19, 0
  %31 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload16, i32 %28)
  %OF21 = extractvalue { i32, i1 } %31, 1
  %32 = and i32 %29, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %32)
  %34 = and i32 %33, 1
  %PF22 = icmp eq i32 %34, 0
  %SFAndOF_JL24 = icmp ne i1 %SF20, %OF21
  br i1 %SFAndOF_JL24, label %bb.1, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload23 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload23
}

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
!1 = !{i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 16)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 24)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([112 x i8], [112 x i8]* @rodata_15, i32 0, i32 32)}
!6 = !{!5}
