; ModuleID = './protected_bc/oobr_overflow_into_adjacent_mem.bc'
source_filename = "./bin/oobr_overflow_into_adjacent_mem"

@rodata_15 = private unnamed_addr constant [197 x i8] c"\01\00\02\00c: %p\0A\00d: %p\0A\00e: %p\0A\0A\00This is a secret!!!\0011111111111111111111111111111111\00c: %s\0A\00Test Failed: Out of Bounds Read caused by string null terminator corruption\0A\001111111111111111111111111\00\00\00\00\00\00\00A\00", align 4, !ROData_SecInfo !0
@rodata_15_26 = private constant i64 2338328219631577172
@rodata_15_54 = private constant i64 3544668469065756977
@rodata_15_42 = private constant i64 3544668468242620705
@rodata_15_70 = private constant i64 3544668469065756977
@rodata_15_46 = private constant i64 3544668469065756977
@rodata_15_34 = private constant i64 8387235652276789345
@rodata_15_62 = private constant i64 3544668469065756977
@rodata_15_50 = private constant i64 3544668469065756977

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

declare dso_local i8* @memcpy(i8*, i8*, i64)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %2 = zext i32 32 to i64
  %3 = call i8* @zeno_malloc(i64 %2)
  %RAX1 = ptrtoint i8* %3 to i64
  store i64 %RAX1, i64* %ns_ptr9, align 1
  %4 = zext i32 16 to i64
  %5 = call i8* @zeno_malloc(i64 %4)
  %RAX2 = ptrtoint i8* %5 to i64
  store i64 %RAX2, i64* %ns_ptr12, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload3 = load i64, i64* %ns_ptr9, align 1
  %EAX4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload5 = load i64, i64* %ns_ptr12, align 1
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 18), i64 %memload5)
  %memload7 = load i64, i64* %ns_ptr9, align 1
  %6 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 26) to i64*, !ROData_Index !1
  %memload8 = load i64, i64* @rodata_15_26, align 1, !ROData_Content !2
  %7 = inttoptr i64 %memload7 to i64*
  store i64 %memload8, i64* %7, align 1
  %8 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 34) to i64*, !ROData_Index !3
  %memload9 = load i64, i64* @rodata_15_34, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload7, 8
  %9 = inttoptr i64 %memref-disp to i64*
  store i64 %memload9, i64* %9, align 1
  %10 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 42) to i64*, !ROData_Index !5
  %memload10 = load i64, i64* @rodata_15_42, align 1, !ROData_Content !6
  %memref-disp11 = add i64 %memload7, 16
  %11 = inttoptr i64 %memref-disp11 to i64*
  store i64 %memload10, i64* %11, align 1
  %12 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 50) to i64*, !ROData_Index !7
  %memload12 = load i64, i64* @rodata_15_50, align 1, !ROData_Content !8
  %memref-disp13 = add i64 %memload7, 24
  %13 = inttoptr i64 %memref-disp13 to i64*
  store i64 %memload12, i64* %13, align 1
  %memload14 = load i64, i64* %ns_ptr6, align 1
  %14 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 46) to i64*, !ROData_Index !9
  %memload15 = load i64, i64* @rodata_15_46, align 1, !ROData_Content !10
  %15 = inttoptr i64 %memload14 to i64*
  store i64 %memload15, i64* %15, align 1
  %16 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 54) to i64*, !ROData_Index !11
  %memload16 = load i64, i64* @rodata_15_54, align 1, !ROData_Content !12
  %memref-disp17 = add i64 %memload14, 8
  %17 = inttoptr i64 %memref-disp17 to i64*
  store i64 %memload16, i64* %17, align 1
  %18 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 62) to i64*, !ROData_Index !13
  %memload18 = load i64, i64* @rodata_15_62, align 1, !ROData_Content !14
  %memref-disp19 = add i64 %memload14, 16
  %19 = inttoptr i64 %memref-disp19 to i64*
  store i64 %memload18, i64* %19, align 1
  %20 = bitcast i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 70) to i64*, !ROData_Index !15
  %memload20 = load i64, i64* @rodata_15_70, align 1, !ROData_Content !16
  %memref-disp21 = add i64 %memload14, 24
  %21 = inttoptr i64 %memref-disp21 to i64*
  store i64 %memload20, i64* %21, align 1
  %memload22 = load i64, i64* %ns_ptr6, align 1
  %EAX23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 79), i64 %memload22)
  store i32 0, i32* %ns_ptr15, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.4, %entry
  %memload24 = load i64, i64* %ns_ptr6, align 1
  %22 = bitcast i32* %ns_ptr15 to i64*
  %memload25 = load i64, i64* %22, align 1
  %23 = trunc i64 %memload25 to i32
  %RCX = sext i32 %23 to i64
  %memref-basereg = add i64 %memload24, %RCX
  %24 = inttoptr i64 %memref-basereg to i32*
  %memload26 = load i32, i32* %24, align 1
  %25 = trunc i32 %memload26 to i8
  %EAX27 = sext i8 %25 to i32
  %26 = sub i32 %EAX27, 0
  %27 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX27, i32 0)
  %CF = extractvalue { i32, i1 } %27, 1
  %ZF = icmp eq i32 %26, 0
  %highbit = and i32 -2147483648, %26
  %SF = icmp ne i32 %highbit, 0
  %28 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX27, i32 0)
  %OF = extractvalue { i32, i1 } %28, 1
  %29 = and i32 %26, 255
  %30 = call i32 @llvm.ctpop.i32(i32 %29)
  %31 = and i32 %30, 1
  %PF = icmp eq i32 %31, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload28 = load i64, i64* %ns_ptr6, align 1
  %32 = bitcast i32* %ns_ptr15 to i64*
  %memload29 = load i64, i64* %32, align 1
  %33 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %33 to i64
  %memref-basereg31 = add i64 %memload28, %RCX30
  %34 = inttoptr i64 %memref-basereg31 to i32*
  %memload32 = load i32, i32* %34, align 1
  %35 = trunc i32 %memload32 to i8
  %EAX33 = sext i8 %35 to i32
  %36 = sub i32 %EAX33, 49
  %37 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX33, i32 49)
  %CF34 = extractvalue { i32, i1 } %37, 1
  %ZF35 = icmp eq i32 %36, 0
  %highbit36 = and i32 -2147483648, %36
  %SF37 = icmp ne i32 %highbit36, 0
  %38 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX33, i32 49)
  %OF38 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %36, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF39 = icmp eq i32 %41, 0
  %CmpZF_JE54 = icmp eq i1 %ZF35, true
  br i1 %CmpZF_JE54, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 86))
  br label %bb.5

bb.4:                                             ; preds = %bb.2
  %memload41 = load i32, i32* %ns_ptr15, align 1
  %EAX48 = add i32 %memload41, 1
  %42 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload41, i32 1)
  %CF42 = extractvalue { i32, i1 } %42, 1
  %43 = and i32 %EAX48, 255
  %44 = call i32 @llvm.ctpop.i32(i32 %43)
  %45 = and i32 %44, 1
  %PF43 = icmp eq i32 %45, 0
  %ZF44 = icmp eq i32 %EAX48, 0
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %46 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload41, i32 1)
  %OF47 = extractvalue { i32, i1 } %46, 1
  store i32 %EAX48, i32* %ns_ptr15, align 1
  br label %bb.1

bb.5:                                             ; preds = %bb.3, %bb.1
  %memload49 = load i64, i64* %ns_ptr6, align 1
  %47 = inttoptr i64 %memload49 to i8*
  call void @zeno_free(i8* %47)
  %memload50 = load i64, i64* %ns_ptr6, align 1
  %48 = inttoptr i64 %memload50 to i8*
  %49 = zext i32 48 to i64
  %50 = call i8* @zeno_memcpy(i8* %48, i8* getelementptr inbounds ([197 x i8], [197 x i8]* @rodata_15, i32 0, i32 163), i64 %49)
  %RAX51 = ptrtoint i8* %50 to i64
  %memload52 = load i64, i64* %ns_ptr9, align 1
  %51 = inttoptr i64 %memload52 to i8*
  call void @zeno_free(i8* %51)
  %memload53 = load i32, i32* %ns_ptr3, align 1
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

declare i8* @zeno_memcpy(i8*, i8*, i64)

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
