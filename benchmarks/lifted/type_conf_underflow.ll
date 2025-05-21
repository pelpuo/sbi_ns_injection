; ModuleID = './bin/type_conf_underflow'
source_filename = "./bin/type_conf_underflow"

@rodata_15 = private unnamed_addr constant [145 x i8] c"\01\00\02\00AAAAAA\00Public\00Fetching char at index %d\0A\00Fetched char: %c\0A\00Test Failed: OOB access caused by int->short overflow leading to array underread\0A\00", align 4, !ROData_SecInfo !0

define dso_local i32 @get_char(i16 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 32, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.16 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 30
  %RBP_N.2 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %2 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i16 %arg1, ptr %RBP_N.2, align 1
  %3 = ptrtoint ptr getelementptr inbounds ([145 x i8], ptr @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %3, ptr %RBP_N.16, align 1
  %4 = ptrtoint ptr getelementptr inbounds ([145 x i8], ptr @rodata_15, i32 0, i32 11) to i64, !ROData_Index !2
  store i64 %4, ptr %stktop_8, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %memload1 = load i64, ptr %RBP_N.2, align 1
  %5 = trunc i64 %memload1 to i16
  %RCX = sext i16 %5 to i64
  %memref-basereg = add i64 %memload, %RCX
  %6 = inttoptr i64 %memref-basereg to ptr
  %memload2 = load i32, ptr %6, align 1
  %7 = trunc i32 %memload2 to i8
  %EAX = sext i8 %7 to i32
  ret i32 %EAX
}

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 23
  %RBP_N.17 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 28
  %RBP_N.12 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %5 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i32 65536, ptr %RBP_N.8, align 1
  store i32 2, ptr %RBP_N.12, align 1
  %memload = load i32, ptr %RBP_N.12, align 1
  %memload1 = load i32, ptr %RBP_N.8, align 1
  %EAX = sub i32 %memload1, %memload
  %6 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload1, i32 %memload)
  %CF = extractvalue { i32, i1 } %6, 1
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %7 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload1, i32 %memload)
  %OF = extractvalue { i32, i1 } %7, 1
  %8 = and i32 %EAX, 255
  %9 = call i32 @llvm.ctpop.i32(i32 %8)
  %10 = and i32 %9, 1
  %PF = icmp eq i32 %10, 0
  store i32 %EAX, ptr %RBP_N.8, align 1
  store i32 1, ptr %RBP_N.16, align 1
  %memload2 = load i32, ptr %RBP_N.8, align 1
  %EAX3 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([145 x i8], ptr @rodata_15, i32 0, i32 18), i32 %memload2)
  %memload4 = load i32, ptr %RBP_N.8, align 1
  %11 = trunc i32 %memload4 to i16
  %EDI = sext i16 %11 to i32
  %12 = trunc i32 %EDI to i16
  %EAX5 = call i32 @get_char(i16 %12)
  %13 = trunc i32 %EAX5 to i8
  store i8 %13, ptr %RBP_N.17, align 1
  %memload6 = load i32, ptr %RBP_N.17, align 1
  %14 = trunc i32 %memload6 to i8
  %ESI = sext i8 %14 to i32
  %EAX7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([145 x i8], ptr @rodata_15, i32 0, i32 45), i32 %ESI)
  %memload8 = load i32, ptr %RBP_N.17, align 1
  %15 = trunc i32 %memload8 to i8
  %EAX9 = sext i8 %15 to i32
  %16 = sub i32 %EAX9, 65
  %17 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX9, i32 65)
  %CF10 = extractvalue { i32, i1 } %17, 1
  %ZF11 = icmp eq i32 %16, 0
  %highbit12 = and i32 -2147483648, %16
  %SF13 = icmp ne i32 %highbit12, 0
  %18 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX9, i32 65)
  %OF14 = extractvalue { i32, i1 } %18, 1
  %19 = and i32 %16, 255
  %20 = call i32 @llvm.ctpop.i32(i32 %19)
  %21 = and i32 %20, 1
  %PF15 = icmp eq i32 %21, 0
  %CmpZF_JNE = icmp eq i1 %ZF11, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  store i32 0, ptr %RBP_N.16, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %22 = load i32, ptr %RBP_N.16, align 1
  %23 = zext i32 %22 to i64
  %24 = zext i32 0 to i64
  %25 = sub i64 %23, %24
  %26 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %23, i64 %24)
  %CF16 = extractvalue { i64, i1 } %26, 1
  %ZF17 = icmp eq i64 %25, 0
  %highbit18 = and i64 -9223372036854775808, %25
  %SF19 = icmp ne i64 %highbit18, 0
  %27 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %23, i64 %24)
  %OF20 = extractvalue { i64, i1 } %27, 1
  %28 = and i64 %25, 255
  %29 = call i64 @llvm.ctpop.i64(i64 %28)
  %30 = and i64 %29, 1
  %PF21 = icmp eq i64 %30, 0
  %CmpZF_JNE24 = icmp eq i1 %ZF17, false
  br i1 %CmpZF_JNE24, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([145 x i8], ptr @rodata_15, i32 0, i32 63))
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %memload23 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload23
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([145 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([145 x i8], ptr @rodata_15, i32 0, i32 11)}
