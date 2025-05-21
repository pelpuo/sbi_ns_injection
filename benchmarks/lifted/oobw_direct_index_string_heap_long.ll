; ModuleID = './bin/oobw_direct_index_string_heap_long'
source_filename = "./bin/oobw_direct_index_string_heap_long"

@rodata_15 = private unnamed_addr constant [116 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Char array on heap using long pointer Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

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
  %4 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %5 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX = ptrtoint ptr %7 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %8 = zext i32 16 to i64
  %9 = call ptr @malloc(i64 %8)
  %RAX1 = ptrtoint ptr %9 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %10 = inttoptr i64 %memload to ptr
  store i64 %memload2, ptr %10, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %11 = inttoptr i64 %memref-disp to ptr
  store i64 %memload3, ptr %11, align 1
  %memload4 = load i64, ptr %RBP_N.24, align 1
  %memload5 = load i64, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 10), align 1, !ROData_Content !3
  %12 = inttoptr i64 %memload4 to ptr
  store i64 %memload5, ptr %12, align 1
  %memload6 = load i64, ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 18), align 1, !ROData_Content !4
  %memref-disp7 = add i64 %memload4, 8
  %13 = inttoptr i64 %memref-disp7 to ptr
  store i64 %memload6, ptr %13, align 1
  %memload8 = load i64, ptr %RBP_N.16, align 1
  %RAX9 = add i64 %memload8, 32
  %14 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload8, i64 32)
  %CF = extractvalue { i64, i1 } %14, 1
  %15 = and i64 %RAX9, 255
  %16 = call i64 @llvm.ctpop.i64(i64 %15)
  %17 = and i64 %16, 1
  %PF = icmp eq i64 %17, 0
  %ZF = icmp eq i64 %RAX9, 0
  %highbit = and i64 -9223372036854775808, %RAX9
  %SF = icmp ne i64 %highbit, 0
  %18 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload8, i64 32)
  %OF = extractvalue { i64, i1 } %18, 1
  store i64 %RAX9, ptr %RBP_N.32, align 1
  %memload10 = load i64, ptr %RBP_N.32, align 1
  %19 = inttoptr i64 %memload10 to ptr
  store i64 4919420920202273057, ptr %19, align 1
  %memload11 = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 16), i64 %memload11)
  %memload12 = load i64, ptr %RBP_N.24, align 1
  %EAX13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 30), i64 %memload12)
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.5
  %20 = load i32, ptr %RBP_N.36, align 1
  %21 = zext i32 %20 to i64
  %22 = zext i32 5 to i64
  %23 = sub i64 %21, %22
  %24 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %21, i64 %22)
  %CF14 = extractvalue { i64, i1 } %24, 1
  %ZF15 = icmp eq i64 %23, 0
  %highbit16 = and i64 -9223372036854775808, %23
  %SF17 = icmp ne i64 %highbit16, 0
  %25 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %21, i64 %22)
  %OF18 = extractvalue { i64, i1 } %25, 1
  %26 = and i64 %23, 255
  %27 = call i64 @llvm.ctpop.i64(i64 %26)
  %28 = and i64 %27, 1
  %PF19 = icmp eq i64 %28, 0
  %CmpSFOF_JGE = icmp eq i1 %SF17, %OF18
  br i1 %CmpSFOF_JGE, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload20 = load i64, ptr %RBP_N.24, align 1
  %memload21 = load i64, ptr %RBP_N.36, align 1
  %29 = trunc i64 %memload21 to i32
  %RCX = sext i32 %29 to i64
  %memref-basereg = add i64 %memload20, %RCX
  %30 = inttoptr i64 %memref-basereg to ptr
  %memload22 = load i32, ptr %30, align 1
  %31 = trunc i32 %memload22 to i8
  %EAX23 = sext i8 %31 to i32
  %32 = sub i32 %EAX23, 72
  %33 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX23, i32 72)
  %CF24 = extractvalue { i32, i1 } %33, 1
  %ZF25 = icmp eq i32 %32, 0
  %highbit26 = and i32 -2147483648, %32
  %SF27 = icmp ne i32 %highbit26, 0
  %34 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX23, i32 72)
  %OF28 = extractvalue { i32, i1 } %34, 1
  %35 = and i32 %32, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %35)
  %37 = and i32 %36, 1
  %PF29 = icmp eq i32 %37, 0
  %CmpZF_JNE = icmp eq i1 %ZF25, false
  br i1 %CmpZF_JNE, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX30 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 44))
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  br label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload31 = load i32, ptr %RBP_N.36, align 1
  %EAX38 = add i32 %memload31, 1
  %38 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload31, i32 1)
  %CF32 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %EAX38, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF33 = icmp eq i32 %41, 0
  %ZF34 = icmp eq i32 %EAX38, 0
  %highbit35 = and i32 -2147483648, %EAX38
  %SF36 = icmp ne i32 %highbit35, 0
  %42 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload31, i32 1)
  %OF37 = extractvalue { i32, i1 } %42, 1
  store i32 %EAX38, ptr %RBP_N.36, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 10)}
!4 = !{ptr getelementptr inbounds ([116 x i8], ptr @rodata_15, i32 0, i32 18)}
