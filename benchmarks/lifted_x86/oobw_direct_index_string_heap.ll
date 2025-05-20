; ModuleID = './bin/oobw_direct_index_string_heap'
source_filename = "./bin/oobw_direct_index_string_heap"

@rodata_18 = private unnamed_addr constant [107 x i8] c"\01\00\02\00\00\00\00\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Direct char array on heap Out of Bounds Write\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %2 = zext i32 16 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr %stktop_8, align 1
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX1 = ptrtoint ptr %5 to i64
  store i64 %RAX1, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %6 = inttoptr i64 %memload to ptr
  %7 = zext i32 16 to i64
  %8 = call ptr @memcpy(ptr %6, ptr getelementptr inbounds ([107 x i8], ptr @rodata_18, i32 0, i32 8), i64 %7)
  %RAX2 = ptrtoint ptr %8 to i64
  %memload3 = load i64, ptr %RBP_N.8, align 1
  %9 = inttoptr i64 %memload3 to ptr
  %10 = zext i32 16 to i64
  %11 = call ptr @memcpy(ptr %9, ptr getelementptr inbounds ([107 x i8], ptr @rodata_18, i32 0, i32 14), i64 %10)
  %RAX5 = ptrtoint ptr %11 to i64
  %memload6 = load i64, ptr %stktop_8, align 1
  %RAX7 = add i64 %memload6, 32
  %12 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload6, i64 32)
  %CF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RAX7, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %ZF = icmp eq i64 %RAX7, 0
  %highbit = and i64 -9223372036854775808, %RAX7
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload6, i64 32)
  %OF = extractvalue { i64, i1 } %16, 1
  %17 = inttoptr i64 %RAX7 to ptr
  store i8 120, ptr %17, align 1
  %memload8 = load i64, ptr %stktop_8, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([107 x i8], ptr @rodata_18, i32 0, i32 20), i64 %memload8)
  %memload10 = load i64, ptr %RBP_N.8, align 1
  %EAX12 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([107 x i8], ptr @rodata_18, i32 0, i32 34), i64 %memload10)
  %memload13 = load i64, ptr %RBP_N.8, align 1
  %18 = inttoptr i64 %memload13 to ptr
  %memload14 = load i32, ptr %18, align 1
  %19 = trunc i32 %memload14 to i8
  %EAX15 = zext i8 %19 to i32
  %20 = sub i32 %EAX15, 120
  %21 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX15, i32 120)
  %CF16 = extractvalue { i32, i1 } %21, 1
  %ZF17 = icmp eq i32 %20, 0
  %highbit18 = and i32 -2147483648, %20
  %SF19 = icmp ne i32 %highbit18, 0
  %22 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX15, i32 120)
  %OF20 = extractvalue { i32, i1 } %22, 1
  %23 = and i32 %20, 255
  %24 = call i32 @llvm.ctpop.i32(i32 %23)
  %25 = and i32 %24, 1
  %PF21 = icmp eq i32 %25, 0
  %CmpZF_JNE = icmp eq i1 %ZF17, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX23 = call i32 @puts(ptr getelementptr inbounds ([107 x i8], ptr @rodata_18, i32 0, i32 48))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
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

!0 = !{i64 8192}
