; ModuleID = './bin/oobr_do_while'
source_filename = "./bin/oobr_do_while"

@rodata_15 = private unnamed_addr constant [112 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00i: %d \09val: %d\0A\00Test Failed: Integer Array Out of Bounds - Loop Off by One\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.36 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.32 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.24 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.16 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 48
  %RBP_N.8 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i32 5, ptr %RBP_N.8, align 1
  %memload = load i64, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  store i64 %memload, ptr %RBP_N.32, align 1
  %memload1 = load i64, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  store i64 %memload1, ptr %RBP_N.24, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 32), align 1, !ROData_Content !3
  store i32 %memload2, ptr %RBP_N.16, align 1
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.4
  %memload3 = load i32, ptr %RBP_N.36, align 1
  %EAX = add i32 %memload3, 1
  %7 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload3, i32 1)
  %CF = extractvalue { i32, i1 } %7, 1
  %8 = and i32 %EAX, 255
  %9 = call i32 @llvm.ctpop.i32(i32 %8)
  %10 = and i32 %9, 1
  %PF = icmp eq i32 %10, 0
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %11 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload3, i32 1)
  %OF = extractvalue { i32, i1 } %11, 1
  store i32 %EAX, ptr %RBP_N.36, align 1
  %memload4 = load i32, ptr %RBP_N.36, align 1
  %memload5 = load i64, ptr %RBP_N.36, align 1
  %12 = trunc i64 %memload5 to i32
  %RAX = sext i32 %12 to i64
  %sc-m = mul i64 4, %RAX
  %13 = getelementptr i8, ptr %RBP_N.32, i64 %sc-m
  %memload6 = load i32, ptr %13, align 1
  %EAX7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 36), i32 %memload4, i32 %memload6)
  %memload8 = load i32, ptr %RBP_N.36, align 1
  %14 = load i32, ptr %RBP_N.8, align 1
  %15 = sub i32 %memload8, %14
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload8, i32 %14)
  %CF9 = extractvalue { i32, i1 } %16, 1
  %ZF10 = icmp eq i32 %15, 0
  %highbit11 = and i32 -2147483648, %15
  %SF12 = icmp ne i32 %highbit11, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload8, i32 %14)
  %OF13 = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF14 = icmp eq i32 %20, 0
  %SFAndOF_JL = icmp ne i1 %SF12, %OF13
  br i1 %SFAndOF_JL, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX15 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 52))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload16 = load i32, ptr %RBP_N.36, align 1
  %21 = load i32, ptr %RBP_N.8, align 1
  %22 = sub i32 %memload16, %21
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload16, i32 %21)
  %CF17 = extractvalue { i32, i1 } %23, 1
  %ZF18 = icmp eq i32 %22, 0
  %highbit19 = and i32 -2147483648, %22
  %SF20 = icmp ne i32 %highbit19, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload16, i32 %21)
  %OF21 = extractvalue { i32, i1 } %24, 1
  %25 = and i32 %22, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %25)
  %27 = and i32 %26, 1
  %PF22 = icmp eq i32 %27, 0
  %SFAndOF_JL24 = icmp ne i1 %SF20, %OF21
  br i1 %SFAndOF_JL24, label %bb.1, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload23 = load i32, ptr %RBP_N.4, align 1
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
!1 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 24)}
!3 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 32)}
