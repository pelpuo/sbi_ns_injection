; ModuleID = './bin/oobw_direct_index_string_heap'
source_filename = "./bin/oobw_direct_index_string_heap"

@rodata_15 = private unnamed_addr constant [104 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Direct char array on heap Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

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
  %memload2 = load i64, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %8 = inttoptr i64 %memload to ptr
  store i64 %memload2, ptr %8, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %9 = inttoptr i64 %memref-disp to ptr
  store i64 %memload3, ptr %9, align 1
  %memload4 = load i64, ptr %RBP_N.24, align 1
  %memload5 = load i64, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  %10 = inttoptr i64 %memload4 to ptr
  store i64 %memload5, ptr %10, align 1
  %memload6 = load i64, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 18), align 1, !ROData_Content !4
  %memref-disp7 = add i64 %memload4, 8
  %11 = inttoptr i64 %memref-disp7 to ptr
  store i64 %memload6, ptr %11, align 1
  %memload8 = load i64, ptr %RBP_N.16, align 1
  %memref-disp9 = add i64 %memload8, 32
  %12 = inttoptr i64 %memref-disp9 to ptr
  store i8 120, ptr %12, align 1
  %memload10 = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 16), i64 %memload10)
  %memload11 = load i64, ptr %RBP_N.24, align 1
  %EAX12 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 30), i64 %memload11)
  %memload13 = load i64, ptr %RBP_N.24, align 1
  %13 = inttoptr i64 %memload13 to ptr
  %memload14 = load i32, ptr %13, align 1
  %14 = trunc i32 %memload14 to i8
  %EAX15 = sext i8 %14 to i32
  %15 = sub i32 %EAX15, 120
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX15, i32 120)
  %CF = extractvalue { i32, i1 } %16, 1
  %ZF = icmp eq i32 %15, 0
  %highbit = and i32 -2147483648, %15
  %SF = icmp ne i32 %highbit, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX15, i32 120)
  %OF = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF = icmp eq i32 %20, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX16 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 44))
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
!1 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 18)}
