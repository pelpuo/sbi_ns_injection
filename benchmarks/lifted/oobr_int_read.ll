; ModuleID = './bin/oobr_int_read'
source_filename = "./bin/oobr_int_read"

@rodata_15 = private unnamed_addr constant [116 x i8] c"\01\00\02\00PUBLIC\00VALUABLE DATA\00String 1: %s\0A\00String 2: %s\0A\0A\00%x\0A\00Test Failed: Out of Bounds Read using pointer conversion\0A\00", align 4, !ROData_SecInfo !0

define dso_local void @choice(i64 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 16, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %0 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %stktop_8, align 1
  ret void
}

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.52 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.48 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.40 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 47
  %RBP_N.25 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 55
  %RBP_N.17 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 59
  %RBP_N.13 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 61
  %RBP_N.11 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 65
  %RBP_N.7 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 67
  %RBP_N.5 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 68
  %RBP_N.4 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %10 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i32, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i32 %memload, ptr %RBP_N.11, align 1
  %memload1 = load i16, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 8), align 1, !ROData_Content !2
  store i16 %memload1, ptr %RBP_N.7, align 1
  %memload2 = load i8, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  store i8 %memload2, ptr %RBP_N.5, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 11), align 1, !ROData_Content !4
  store i64 %memload3, ptr %RBP_N.25, align 1
  %memload4 = load i32, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 19), align 1, !ROData_Content !5
  store i32 %memload4, ptr %RBP_N.17, align 1
  %memload5 = load i16, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 23), align 1, !ROData_Content !6
  store i16 %memload5, ptr %RBP_N.13, align 1
  %RAX = ptrtoint ptr %RBP_N.11 to i64
  store i64 %RAX, ptr %RBP_N.40, align 1
  %RAX6 = ptrtoint ptr %RBP_N.25 to i64
  store i64 %RAX6, ptr %RBP_N.48, align 1
  %memload7 = load i64, ptr %RBP_N.40, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 25), i64 %memload7)
  %memload8 = load i64, ptr %RBP_N.48, align 1
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 39), i64 %memload8)
  store i32 0, ptr %RBP_N.52, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %11 = load i32, ptr %RBP_N.52, align 1
  %12 = zext i32 %11 to i64
  %13 = zext i32 6 to i64
  %14 = sub i64 %12, %13
  %15 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %12, i64 %13)
  %CF = extractvalue { i64, i1 } %15, 1
  %ZF = icmp eq i64 %14, 0
  %highbit = and i64 -9223372036854775808, %14
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %12, i64 %13)
  %OF = extractvalue { i64, i1 } %16, 1
  %17 = and i64 %14, 255
  %18 = call i64 @llvm.ctpop.i64(i64 %17)
  %19 = and i64 %18, 1
  %PF = icmp eq i64 %19, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload10 = load i64, ptr %RBP_N.40, align 1
  %memload11 = load i64, ptr %RBP_N.52, align 1
  %20 = trunc i64 %memload11 to i32
  %RCX = sext i32 %20 to i64
  %memref-idxreg = mul i64 4, %RCX
  %memref-basereg = add i64 %memload10, %memref-idxreg
  %21 = inttoptr i64 %memref-basereg to ptr
  %memload12 = load i32, ptr %21, align 1
  %EAX13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 54), i32 %memload12)
  %memload14 = load i32, ptr %RBP_N.52, align 1
  %EAX21 = add i32 %memload14, 1
  %22 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload14, i32 1)
  %CF15 = extractvalue { i32, i1 } %22, 1
  %23 = and i32 %EAX21, 255
  %24 = call i32 @llvm.ctpop.i32(i32 %23)
  %25 = and i32 %24, 1
  %PF16 = icmp eq i32 %25, 0
  %ZF17 = icmp eq i32 %EAX21, 0
  %highbit18 = and i32 -2147483648, %EAX21
  %SF19 = icmp ne i32 %highbit18, 0
  %26 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload14, i32 1)
  %OF20 = extractvalue { i32, i1 } %26, 1
  store i32 %EAX21, ptr %RBP_N.52, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %memload22 = load i64, ptr %RBP_N.40, align 1
  %memref-disp = add i64 %memload22, 8
  %27 = inttoptr i64 %memref-disp to ptr
  %28 = load i32, ptr %27, align 1
  %29 = zext i32 %28 to i64
  %30 = zext i32 1096109121 to i64
  %31 = sub i64 %29, %30
  %32 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %29, i64 %30)
  %CF23 = extractvalue { i64, i1 } %32, 1
  %ZF24 = icmp eq i64 %31, 0
  %highbit25 = and i64 -9223372036854775808, %31
  %SF26 = icmp ne i64 %highbit25, 0
  %33 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %29, i64 %30)
  %OF27 = extractvalue { i64, i1 } %33, 1
  %34 = and i64 %31, 255
  %35 = call i64 @llvm.ctpop.i64(i64 %34)
  %36 = and i64 %35, 1
  %PF28 = icmp eq i64 %36, 0
  %CmpZF_JNE = icmp eq i1 %ZF24, false
  br i1 %CmpZF_JNE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX29 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 58))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 8)}
!3 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 11)}
!5 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 19)}
!6 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 23)}
