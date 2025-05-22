; ModuleID = './bin/oobr_overflow_into_adjacent_mem'
source_filename = "./bin/oobr_overflow_into_adjacent_mem"

@rodata_15 = private unnamed_addr constant [197 x i8] c"\01\00\02\00c: %p\0A\00d: %p\0A\00e: %p\0A\0A\00This is a secret!!!\0011111111111111111111111111111111\00c: %s\0A\00Test Failed: Out of Bounds Read caused by string null terminator corruption\0A\001111111111111111111111111\00\00\00\00\00\00\00A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

declare dso_local i8* @memcpy(i8*, i8*, i64)

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
  %8 = zext i32 32 to i64
  %9 = call i8* @malloc(i64 %8)
  %RAX1 = ptrtoint i8* %9 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  %10 = zext i32 16 to i64
  %11 = call i8* @malloc(i64 %10)
  %RAX2 = ptrtoint i8* %11 to i64
  store i64 %RAX2, i64* %RBP_N.32, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload3 = load i64, i64* %RBP_N.24, align 1
  %EAX4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload5 = load i64, i64* %RBP_N.32, align 1
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 18), i64 %memload5)
  %memload7 = load i64, i64* %RBP_N.24, align 1
  %12 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 26) to i64*, !ROData_Index !1
  %memload8 = load i64, i64* %12, align 1, !ROData_Content !2
  %13 = inttoptr i64 %memload7 to i64*
  store i64 %memload8, i64* %13, align 1
  %14 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 34) to i64*, !ROData_Index !3
  %memload9 = load i64, i64* %14, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload7, 8
  %15 = inttoptr i64 %memref-disp to i64*
  store i64 %memload9, i64* %15, align 1
  %16 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 42) to i64*, !ROData_Index !5
  %memload10 = load i64, i64* %16, align 1, !ROData_Content !6
  %memref-disp11 = add i64 %memload7, 16
  %17 = inttoptr i64 %memref-disp11 to i64*
  store i64 %memload10, i64* %17, align 1
  %18 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 50) to i64*, !ROData_Index !7
  %memload12 = load i64, i64* %18, align 1, !ROData_Content !8
  %memref-disp13 = add i64 %memload7, 24
  %19 = inttoptr i64 %memref-disp13 to i64*
  store i64 %memload12, i64* %19, align 1
  %memload14 = load i64, i64* %RBP_N.16, align 1
  %20 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 46) to i64*, !ROData_Index !9
  %memload15 = load i64, i64* %20, align 1, !ROData_Content !10
  %21 = inttoptr i64 %memload14 to i64*
  store i64 %memload15, i64* %21, align 1
  %22 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 54) to i64*, !ROData_Index !11
  %memload16 = load i64, i64* %22, align 1, !ROData_Content !12
  %memref-disp17 = add i64 %memload14, 8
  %23 = inttoptr i64 %memref-disp17 to i64*
  store i64 %memload16, i64* %23, align 1
  %24 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 62) to i64*, !ROData_Index !13
  %memload18 = load i64, i64* %24, align 1, !ROData_Content !14
  %memref-disp19 = add i64 %memload14, 16
  %25 = inttoptr i64 %memref-disp19 to i64*
  store i64 %memload18, i64* %25, align 1
  %26 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 70) to i64*, !ROData_Index !15
  %memload20 = load i64, i64* %26, align 1, !ROData_Content !16
  %memref-disp21 = add i64 %memload14, 24
  %27 = inttoptr i64 %memref-disp21 to i64*
  store i64 %memload20, i64* %27, align 1
  %memload22 = load i64, i64* %RBP_N.16, align 1
  %EAX23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 79), i64 %memload22)
  store i32 0, i32* %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.4
  %memload24 = load i64, i64* %RBP_N.16, align 1
  %28 = bitcast i32* %RBP_N.36 to i64*
  %memload25 = load i64, i64* %28, align 1
  %29 = trunc i64 %memload25 to i32
  %RCX = sext i32 %29 to i64
  %memref-basereg = add i64 %memload24, %RCX
  %30 = inttoptr i64 %memref-basereg to i32*
  %memload26 = load i32, i32* %30, align 1
  %31 = trunc i32 %memload26 to i8
  %EAX27 = sext i8 %31 to i32
  %32 = sub i32 %EAX27, 0
  %33 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX27, i32 0)
  %CF = extractvalue { i32, i1 } %33, 1
  %ZF = icmp eq i32 %32, 0
  %highbit = and i32 -2147483648, %32
  %SF = icmp ne i32 %highbit, 0
  %34 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX27, i32 0)
  %OF = extractvalue { i32, i1 } %34, 1
  %35 = and i32 %32, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %35)
  %37 = and i32 %36, 1
  %PF = icmp eq i32 %37, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload28 = load i64, i64* %RBP_N.16, align 1
  %38 = bitcast i32* %RBP_N.36 to i64*
  %memload29 = load i64, i64* %38, align 1
  %39 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %39 to i64
  %memref-basereg31 = add i64 %memload28, %RCX30
  %40 = inttoptr i64 %memref-basereg31 to i32*
  %memload32 = load i32, i32* %40, align 1
  %41 = trunc i32 %memload32 to i8
  %EAX33 = sext i8 %41 to i32
  %42 = sub i32 %EAX33, 49
  %43 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX33, i32 49)
  %CF34 = extractvalue { i32, i1 } %43, 1
  %ZF35 = icmp eq i32 %42, 0
  %highbit36 = and i32 -2147483648, %42
  %SF37 = icmp ne i32 %highbit36, 0
  %44 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX33, i32 49)
  %OF38 = extractvalue { i32, i1 } %44, 1
  %45 = and i32 %42, 255
  %46 = call i32 @llvm.ctpop.i32(i32 %45)
  %47 = and i32 %46, 1
  %PF39 = icmp eq i32 %47, 0
  %CmpZF_JE54 = icmp eq i1 %ZF35, true
  br i1 %CmpZF_JE54, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 86))
  br label %bb.5

bb.4:                                             ; preds = %bb.2
  %memload41 = load i32, i32* %RBP_N.36, align 1
  %EAX48 = add i32 %memload41, 1
  %48 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload41, i32 1)
  %CF42 = extractvalue { i32, i1 } %48, 1
  %49 = and i32 %EAX48, 255
  %50 = call i32 @llvm.ctpop.i32(i32 %49)
  %51 = and i32 %50, 1
  %PF43 = icmp eq i32 %51, 0
  %ZF44 = icmp eq i32 %EAX48, 0
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %52 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload41, i32 1)
  %OF47 = extractvalue { i32, i1 } %52, 1
  store i32 %EAX48, i32* %RBP_N.36, align 1
  br label %bb.1

bb.5:                                             ; preds = %bb.3, %bb.1
  %memload49 = load i64, i64* %RBP_N.16, align 1
  %53 = inttoptr i64 %memload49 to i8*
  call void @free(i8* %53)
  %memload50 = load i64, i64* %RBP_N.16, align 1
  %54 = inttoptr i64 %memload50 to i8*
  %55 = zext i32 48 to i64
  %56 = call i8* @memcpy(i8* %54, i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 163), i64 %55)
  %RAX51 = ptrtoint i8* %56 to i64
  %memload52 = load i64, i64* %RBP_N.24, align 1
  %57 = inttoptr i64 %memload52 to i8*
  call void @free(i8* %57)
  %memload53 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload53
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 26)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 34)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 42)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 50)}
!8 = !{!7}
!9 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 46)}
!10 = !{!9}
!11 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 54)}
!12 = !{!11}
!13 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 62)}
!14 = !{!13}
!15 = !{i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 70)}
!16 = !{!15}
