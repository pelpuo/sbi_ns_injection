; ModuleID = './protected_bc/hm_parent_and_child_chunk.bc'
source_filename = "./bin/hm_parent_and_child_chunk"

@rodata_15 = private unnamed_addr constant [130 x i8] c"\01\00\02\00victim's data\00d: %p\0A\00e: %p\0A\0A\00g: %p -> %p\0A\00h: %p\0A\00h: %s\0A\00Test Failed: Heap manipulation leading to overlapping memory regions\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_16 = private constant i16 97
@rodata_15_4 = private constant i64 8297721138145094006
@rodata_15_12 = private constant i32 1952539680

declare dso_local i8* @malloc(i64)

declare dso_local void @free(i8*)

declare dso_local i8* @memset(i8*, i32, i64)

declare dso_local i32 @printf(i8*, ...)

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
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %2 = zext i32 16 to i64
  %3 = call i8* @zeno_malloc(i64 %2)
  %RAX1 = ptrtoint i8* %3 to i64
  store i64 %RAX1, i64* %ns_ptr9, align 1
  %4 = zext i32 16 to i64
  %5 = call i8* @zeno_malloc(i64 %4)
  %RAX2 = ptrtoint i8* %5 to i64
  store i64 %RAX2, i64* %ns_ptr12, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %memref-disp = add i64 %memload, 24
  %6 = inttoptr i64 %memref-disp to i8*
  store i8 97, i8* %6, align 1
  %memload3 = load i64, i64* %ns_ptr9, align 1
  %7 = inttoptr i64 %memload3 to i8*
  call void @zeno_free(i8* %7)
  %memload4 = load i64, i64* %ns_ptr12, align 1
  %8 = inttoptr i64 %memload4 to i8*
  call void @zeno_free(i8* %8)
  %9 = zext i32 80 to i64
  %10 = call i8* @zeno_malloc(i64 %9)
  %RAX5 = ptrtoint i8* %10 to i64
  store i64 %RAX5, i64* %ns_ptr15, align 1
  %11 = zext i32 16 to i64
  %12 = call i8* @zeno_malloc(i64 %11)
  %RAX6 = ptrtoint i8* %12 to i64
  store i64 %RAX6, i64* %RSPAdj_N.48, align 1
  %memload7 = load i64, i64* %RSPAdj_N.48, align 1
  %13 = bitcast i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload8 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %14 = inttoptr i64 %memload7 to i64*
  store i64 %memload8, i64* %14, align 1
  %15 = bitcast i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 12) to i32*, !ROData_Index !3
  %memload9 = load i32, i32* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp10 = add i64 %memload7, 8
  %16 = inttoptr i64 %memref-disp10 to i32*
  store i32 %memload9, i32* %16, align 1
  %17 = bitcast i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 16) to i16*, !ROData_Index !5
  %memload11 = load i16, i16* @rodata_15_16, align 1, !ROData_Content !6
  %memref-disp12 = add i64 %memload7, 12
  %18 = inttoptr i64 %memref-disp12 to i16*
  store i16 %memload11, i16* %18, align 1
  %memload13 = load i64, i64* %ns_ptr15, align 1
  %RDI = add i64 %memload13, 32
  %19 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload13, i64 32)
  %CF = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %RDI, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF = icmp eq i64 %22, 0
  %ZF = icmp eq i64 %RDI, 0
  %highbit = and i64 -9223372036854775808, %RDI
  %SF = icmp ne i64 %highbit, 0
  %23 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload13, i64 32)
  %OF = extractvalue { i64, i1 } %23, 1
  %24 = inttoptr i64 %RDI to i8*
  %25 = zext i32 15 to i64
  %26 = call i8* @memset(i8* %24, i32 65, i64 %25)
  %RAX14 = ptrtoint i8* %26 to i64
  %memload15 = load i64, i64* %ns_ptr9, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 18), i64 %memload15)
  %memload16 = load i64, i64* %ns_ptr12, align 1
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 25), i64 %memload16)
  %memload18 = load i64, i64* %ns_ptr15, align 1
  %memload19 = load i64, i64* %ns_ptr15, align 1
  %RDX = add i64 %memload19, 80
  %27 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload19, i64 80)
  %CF20 = extractvalue { i64, i1 } %27, 1
  %28 = and i64 %RDX, 255
  %29 = call i64 @llvm.ctpop.i64(i64 %28)
  %30 = and i64 %29, 1
  %PF21 = icmp eq i64 %30, 0
  %ZF22 = icmp eq i64 %RDX, 0
  %highbit23 = and i64 -9223372036854775808, %RDX
  %SF24 = icmp ne i64 %highbit23, 0
  %31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload19, i64 80)
  %OF25 = extractvalue { i64, i1 } %31, 1
  %EAX26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 33), i64 %memload18, i64 %RDX)
  %memload27 = load i64, i64* %RSPAdj_N.48, align 1
  %EAX28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 46), i64 %memload27)
  %memload29 = load i64, i64* %RSPAdj_N.48, align 1
  %EAX30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 53), i64 %memload29)
  %memload31 = load i64, i64* %RSPAdj_N.48, align 1
  %32 = inttoptr i64 %memload31 to i32*
  %memload32 = load i32, i32* %32, align 1
  %33 = trunc i32 %memload32 to i8
  %EAX33 = sext i8 %33 to i32
  %34 = sub i32 %EAX33, 65
  %35 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX33, i32 65)
  %CF34 = extractvalue { i32, i1 } %35, 1
  %ZF35 = icmp eq i32 %34, 0
  %highbit36 = and i32 -2147483648, %34
  %SF37 = icmp ne i32 %highbit36, 0
  %36 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX33, i32 65)
  %OF38 = extractvalue { i32, i1 } %36, 1
  %37 = and i32 %34, 255
  %38 = call i32 @llvm.ctpop.i32(i32 %37)
  %39 = and i32 %38, 1
  %PF39 = icmp eq i32 %39, 0
  %CmpZF_JNE = icmp eq i1 %ZF35, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 60))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload41 = load i32, i32* %ns_ptr3, align 1
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([130 x i8], [130 x i8]* @rodata_15, i32 0, i32 16)}
!6 = !{!5}
