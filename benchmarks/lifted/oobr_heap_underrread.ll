; ModuleID = './bin/oobr_heap_underrread'
source_filename = "./bin/oobr_heap_underrread"

@rodata_15 = private unnamed_addr constant [61 x i8] c"\01\00\02\00hello secret!!!!\00%s\0A\00Test Failed: Heap Buffer Underread\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.24 = bitcast i8* %0 to i64*
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
  %6 = zext i32 16 to i64
  %7 = call i8* @malloc(i64 %6)
  %RAX1 = ptrtoint i8* %7 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %8 = bitcast i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !2
  %9 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %9, align 1
  %10 = bitcast i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* %10, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %11 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %11, align 1
  %memload4 = load i64, i64* %RBP_N.24, align 1
  %RSI = add i64 %memload4, -32
  %12 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload4, i64 -32)
  %CF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RSI, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %ZF = icmp eq i64 %RSI, 0
  %highbit = and i64 -9223372036854775808, %RSI
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload4, i64 -32)
  %OF = extractvalue { i64, i1 } %16, 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 21), i64 %RSI)
  %memload5 = load i64, i64* %RBP_N.24, align 1
  %memref-disp6 = add i64 %memload5, -32
  %17 = inttoptr i64 %memref-disp6 to i32*
  %memload7 = load i32, i32* %17, align 1
  %18 = trunc i32 %memload7 to i8
  %EAX8 = sext i8 %18 to i32
  %19 = sub i32 %EAX8, 0
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX8, i32 0)
  %CF9 = extractvalue { i32, i1 } %20, 1
  %ZF10 = icmp eq i32 %19, 0
  %highbit11 = and i32 -2147483648, %19
  %SF12 = icmp ne i32 %highbit11, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX8, i32 0)
  %OF13 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF14 = icmp eq i32 %24, 0
  %CmpZF_JE = icmp eq i1 %ZF10, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 25))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload16 = load i32, i32* %RBP_N.4, align 1
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

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([61 x i8], [61 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
