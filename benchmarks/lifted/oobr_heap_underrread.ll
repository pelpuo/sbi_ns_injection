; ModuleID = './bin/oobr_heap_underrread'
source_filename = "./bin/oobr_heap_underrread"

@rodata_15 = private unnamed_addr constant [61 x i8] c"\01\00\02\00hello secret!!!!\00%s\0A\00Test Failed: Heap Buffer Underread\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX1 = ptrtoint ptr %7 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([61 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %8 = inttoptr i64 %memload to ptr
  store i64 %memload2, ptr %8, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([61 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %9 = inttoptr i64 %memref-disp to ptr
  store i64 %memload3, ptr %9, align 1
  %memload4 = load i64, ptr %RBP_N.24, align 1
  %RSI = add i64 %memload4, -32
  %10 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload4, i64 -32)
  %CF = extractvalue { i64, i1 } %10, 1
  %11 = and i64 %RSI, 255
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = and i64 %12, 1
  %PF = icmp eq i64 %13, 0
  %ZF = icmp eq i64 %RSI, 0
  %highbit = and i64 -9223372036854775808, %RSI
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload4, i64 -32)
  %OF = extractvalue { i64, i1 } %14, 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([61 x i8], ptr @rodata_15, i32 0, i32 21), i64 %RSI)
  %memload5 = load i64, ptr %RBP_N.24, align 1
  %memref-disp6 = add i64 %memload5, -32
  %15 = inttoptr i64 %memref-disp6 to ptr
  %memload7 = load i32, ptr %15, align 1
  %16 = trunc i32 %memload7 to i8
  %EAX8 = sext i8 %16 to i32
  %17 = sub i32 %EAX8, 0
  %18 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX8, i32 0)
  %CF9 = extractvalue { i32, i1 } %18, 1
  %ZF10 = icmp eq i32 %17, 0
  %highbit11 = and i32 -2147483648, %17
  %SF12 = icmp ne i32 %highbit11, 0
  %19 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX8, i32 0)
  %OF13 = extractvalue { i32, i1 } %19, 1
  %20 = and i32 %17, 255
  %21 = call i32 @llvm.ctpop.i32(i32 %20)
  %22 = and i32 %21, 1
  %PF14 = icmp eq i32 %22, 0
  %CmpZF_JE = icmp eq i1 %ZF10, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX15 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([61 x i8], ptr @rodata_15, i32 0, i32 25))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload16 = load i32, ptr %RBP_N.4, align 1
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
!1 = !{ptr getelementptr inbounds ([61 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([61 x i8], ptr @rodata_15, i32 0, i32 12)}
