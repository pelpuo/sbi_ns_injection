; ModuleID = './bin/oobw_direct_index_string'
source_filename = "./bin/oobw_direct_index_string"

@rodata_15 = private unnamed_addr constant [105 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Direct char array on stack Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 18
  %RBP_N.6 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.4 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %2 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i32, ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %3 = ptrtoint ptr %stktop_8 to i64
  %4 = add i64 %3, 6
  %5 = inttoptr i64 %4 to ptr
  store i32 %memload, ptr %5, align 1
  %memload1 = load i16, ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 8), align 1, !ROData_Content !2
  store i16 %memload1, ptr %RBP_N.6, align 1
  %memload2 = load i32, ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  store i32 %memload2, ptr %stktop_8, align 1
  %memload3 = load i16, ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 14), align 1, !ROData_Content !4
  %6 = ptrtoint ptr %stktop_8 to i64
  %7 = add i64 %6, 4
  %8 = inttoptr i64 %7 to ptr
  store i16 %memload3, ptr %8, align 1
  store i8 120, ptr %RBP_N.4, align 1
  %9 = ptrtoint ptr %stktop_8 to i64
  %RSI = add i64 %9, 6
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 16), i64 %RSI)
  %RSI4 = ptrtoint ptr %stktop_8 to i64
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 30), i64 %RSI4)
  %memload6 = load i32, ptr %stktop_8, align 1
  %10 = trunc i32 %memload6 to i8
  %EAX7 = sext i8 %10 to i32
  %11 = sub i32 %EAX7, 120
  %12 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX7, i32 120)
  %CF = extractvalue { i32, i1 } %12, 1
  %ZF = icmp eq i32 %11, 0
  %highbit = and i32 -2147483648, %11
  %SF = icmp ne i32 %highbit, 0
  %13 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX7, i32 120)
  %OF = extractvalue { i32, i1 } %13, 1
  %14 = and i32 %11, 255
  %15 = call i32 @llvm.ctpop.i32(i32 %14)
  %16 = and i32 %15, 1
  %PF = icmp eq i32 %16, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 44))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 8)}
!3 = !{ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([105 x i8], ptr @rodata_15, i32 0, i32 14)}
