; ModuleID = './bin/sbo_int_buffer_in_struct'
source_filename = "./bin/sbo_int_buffer_in_struct"

@rodata_15 = private unnamed_addr constant [134 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\0090\00\00Test Failed: Stack Buffer Overflow within struct elements of int datatype\0A\00Trigger Check intact.\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.56 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.32 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 52
  %RBP_N.20 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 64
  %RBP_N.8 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %7 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i32 0, ptr %RBP_N.8, align 1
  %memload = load i64, ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.48, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.40, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i32 %memload2, ptr %RBP_N.32, align 1
  %8 = sext i32 0 to i64
  store i64 %8, ptr %RBP_N.56, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %9 = load i64, ptr %RBP_N.56, align 1
  %10 = sub i64 %9, 5
  %11 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %9, i64 5)
  %CF = extractvalue { i64, i1 } %11, 1
  %ZF = icmp eq i64 %10, 0
  %highbit = and i64 -9223372036854775808, %10
  %SF = icmp ne i64 %highbit, 0
  %12 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %9, i64 5)
  %OF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %10, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload3 = load i64, ptr %RBP_N.56, align 1
  %sc-m = mul i64 4, %memload3
  %16 = getelementptr i8, ptr %RBP_N.48, i64 %sc-m
  %memload4 = load i32, ptr %16, align 1
  %memload5 = load i64, ptr %RBP_N.56, align 1
  %sc-m6 = mul i64 4, %memload5
  %17 = getelementptr i8, ptr %RBP_N.20, i64 %sc-m6
  store i32 %memload4, ptr %17, align 1
  %memload8 = load i64, ptr %RBP_N.56, align 1
  %RAX = add i64 %memload8, 1
  %18 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload8, i64 1)
  %CF9 = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %RAX, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF10 = icmp eq i64 %21, 0
  %ZF11 = icmp eq i64 %RAX, 0
  %highbit12 = and i64 -9223372036854775808, %RAX
  %SF13 = icmp ne i64 %highbit12, 0
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload8, i64 1)
  %OF14 = extractvalue { i64, i1 } %22, 1
  store i64 %RAX, ptr %RBP_N.56, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %23 = load i32, ptr %RBP_N.8, align 1
  %24 = zext i32 %23 to i64
  %25 = zext i32 0 to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF15 = extractvalue { i64, i1 } %27, 1
  %ZF16 = icmp eq i64 %26, 0
  %highbit17 = and i64 -9223372036854775808, %26
  %SF18 = icmp ne i64 %highbit17, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF19 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF20 = icmp eq i64 %31, 0
  %CmpZF_JE = icmp eq i1 %ZF16, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 36))
  br label %bb.6

bb.5:                                             ; preds = %bb.3
  %EAX21 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 111))
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
!1 = !{ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([134 x i8], ptr @rodata_15, i32 0, i32 32)}
