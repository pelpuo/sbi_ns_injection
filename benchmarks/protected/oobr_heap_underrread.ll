; ModuleID = './protected_bc/oobr_heap_underrread.bc'
source_filename = "./bin/oobr_heap_underrread"

@rodata_15 = private unnamed_addr constant [61 x i8] c"\01\00\02\00hello secret!!!!\00%s\0A\00Test Failed: Heap Buffer Underread\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i64 7310222283084948840
@rodata_15_12 = private constant i64 2387225705053516387

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

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
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
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
  %memload = load i64, i64* %ns_ptr6, align 1
  %4 = bitcast i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %5 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %5, align 1
  %6 = bitcast i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %7 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %7, align 1
  %memload4 = load i64, i64* %ns_ptr9, align 1
  %RSI = add i64 %memload4, -32
  %8 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload4, i64 -32)
  %CF = extractvalue { i64, i1 } %8, 1
  %9 = and i64 %RSI, 255
  %10 = call i64 @llvm.ctpop.i64(i64 %9)
  %11 = and i64 %10, 1
  %PF = icmp eq i64 %11, 0
  %ZF = icmp eq i64 %RSI, 0
  %highbit = and i64 -9223372036854775808, %RSI
  %SF = icmp ne i64 %highbit, 0
  %12 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload4, i64 -32)
  %OF = extractvalue { i64, i1 } %12, 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 21), i64 %RSI)
  %memload5 = load i64, i64* %ns_ptr9, align 1
  %memref-disp6 = add i64 %memload5, -32
  %13 = inttoptr i64 %memref-disp6 to i32*
  %memload7 = load i32, i32* %13, align 1
  %14 = trunc i32 %memload7 to i8
  %EAX8 = sext i8 %14 to i32
  %15 = sub i32 %EAX8, 0
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX8, i32 0)
  %CF9 = extractvalue { i32, i1 } %16, 1
  %ZF10 = icmp eq i32 %15, 0
  %highbit11 = and i32 -2147483648, %15
  %SF12 = icmp ne i32 %highbit11, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX8, i32 0)
  %OF13 = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF14 = icmp eq i32 %20, 0
  %CmpZF_JE = icmp eq i1 %ZF10, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 25))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload16 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload16
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
