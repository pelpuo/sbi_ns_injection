; ModuleID = './bin/hm_parent_and_child_chunk'
source_filename = "./bin/hm_parent_and_child_chunk"

@rodata_15 = private unnamed_addr constant [130 x i8] c"\01\00\02\00victim's data\00d: %p\0A\00e: %p\0A\0A\00g: %p -> %p\0A\00h: %p\0A\00h: %s\0A\00Test Failed: Heap manipulation leading to overlapping memory regions\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local void @free(i8*)

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.40 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.32 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.24 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.16 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.4 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %5 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %6 = zext i32 16 to i64
  %7 = call i8* @malloc(i64 %6)
  %RAX = ptrtoint i8* %7 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %8 = zext i32 16 to i64
  %9 = call i8* @malloc(i64 %8)
  %RAX1 = ptrtoint i8* %9 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  %10 = zext i32 16 to i64
  %11 = call i8* @malloc(i64 %10)
  %RAX2 = ptrtoint i8* %11 to i64
  store i64 %RAX2, i64* %RBP_N.32, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %memref-disp = add i64 %memload, 24
  %12 = inttoptr i64 %memref-disp to i8*
  store i8 97, i8* %12, align 1
  %memload3 = load i64, i64* %RBP_N.24, align 1
  %13 = inttoptr i64 %memload3 to i8*
  call void @free(i8* %13)
  %memload4 = load i64, i64* %RBP_N.32, align 1
  %14 = inttoptr i64 %memload4 to i8*
  call void @free(i8* %14)
  %15 = zext i32 80 to i64
  %16 = call i8* @malloc(i64 %15)
  %RAX5 = ptrtoint i8* %16 to i64
  store i64 %RAX5, i64* %RBP_N.40, align 1
  %17 = zext i32 16 to i64
  %18 = call i8* @malloc(i64 %17)
  %RAX6 = ptrtoint i8* %18 to i64
  store i64 %RAX6, i64* %RSPAdj_N.48, align 1
  %memload7 = load i64, i64* %RSPAdj_N.48, align 1
  %19 = bitcast i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload8 = load i64, i64* %19, align 1, !ROData_Content !2
  %20 = inttoptr i64 %memload7 to i64*
  store i64 %memload8, i64* %20, align 1
  %21 = bitcast i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 12) to i32*, !ROData_Index !3
  %memload9 = load i32, i32* %21, align 1, !ROData_Content !4
  %memref-disp10 = add i64 %memload7, 8
  %22 = inttoptr i64 %memref-disp10 to i32*
  store i32 %memload9, i32* %22, align 1
  %23 = bitcast i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 16) to i16*, !ROData_Index !5
  %memload11 = load i16, i16* %23, align 1, !ROData_Content !6
  %memref-disp12 = add i64 %memload7, 12
  %24 = inttoptr i64 %memref-disp12 to i16*
  store i16 %memload11, i16* %24, align 1
  %memload13 = load i64, i64* %RBP_N.40, align 1
  %RDI = add i64 %memload13, 32
  %25 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload13, i64 32)
  %CF = extractvalue { i64, i1 } %25, 1
  %26 = and i64 %RDI, 255
  %27 = call i64 @llvm.ctpop.i64(i64 %26)
  %28 = and i64 %27, 1
  %PF = icmp eq i64 %28, 0
  %ZF = icmp eq i64 %RDI, 0
  %highbit = and i64 -9223372036854775808, %RDI
  %SF = icmp ne i64 %highbit, 0
  %29 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload13, i64 32)
  %OF = extractvalue { i64, i1 } %29, 1
  %30 = inttoptr i64 %RDI to i8*
  %31 = zext i32 15 to i64
  %32 = call i8* @memset(i8* %30, i32 65, i64 %31)
  %RAX14 = ptrtoint i8* %32 to i64
  %memload15 = load i64, i64* %RBP_N.24, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 18), i64 %memload15)
  %memload16 = load i64, i64* %RBP_N.32, align 1
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 25), i64 %memload16)
  %memload18 = load i64, i64* %RBP_N.40, align 1
  %memload19 = load i64, i64* %RBP_N.40, align 1
  %RDX = add i64 %memload19, 80
  %33 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload19, i64 80)
  %CF20 = extractvalue { i64, i1 } %33, 1
  %34 = and i64 %RDX, 255
  %35 = call i64 @llvm.ctpop.i64(i64 %34)
  %36 = and i64 %35, 1
  %PF21 = icmp eq i64 %36, 0
  %ZF22 = icmp eq i64 %RDX, 0
  %highbit23 = and i64 -9223372036854775808, %RDX
  %SF24 = icmp ne i64 %highbit23, 0
  %37 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload19, i64 80)
  %OF25 = extractvalue { i64, i1 } %37, 1
  %EAX26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 33), i64 %memload18, i64 %RDX)
  %memload27 = load i64, i64* %RSPAdj_N.48, align 1
  %EAX28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 46), i64 %memload27)
  %memload29 = load i64, i64* %RSPAdj_N.48, align 1
  %EAX30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 53), i64 %memload29)
  %memload31 = load i64, i64* %RSPAdj_N.48, align 1
  %38 = inttoptr i64 %memload31 to i32*
  %memload32 = load i32, i32* %38, align 1
  %39 = trunc i32 %memload32 to i8
  %EAX33 = sext i8 %39 to i32
  %40 = sub i32 %EAX33, 65
  %41 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX33, i32 65)
  %CF34 = extractvalue { i32, i1 } %41, 1
  %ZF35 = icmp eq i32 %40, 0
  %highbit36 = and i32 -2147483648, %40
  %SF37 = icmp ne i32 %highbit36, 0
  %42 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX33, i32 65)
  %OF38 = extractvalue { i32, i1 } %42, 1
  %43 = and i32 %40, 255
  %44 = call i32 @llvm.ctpop.i32(i32 %43)
  %45 = and i32 %44, 1
  %PF39 = icmp eq i32 %45, 0
  %CmpZF_JNE = icmp eq i1 %ZF35, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 60))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload41 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload41
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 16)}
!6 = !{!5}
