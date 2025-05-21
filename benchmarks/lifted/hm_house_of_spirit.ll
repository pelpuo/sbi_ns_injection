; ModuleID = './bin/hm_house_of_spirit'
source_filename = "./bin/hm_house_of_spirit"

@ptr = common dso_local global i64 0, align 8
@rodata_15 = private unnamed_addr constant [118 x i8] c"\01\00\02\00ptr: %p\0A\00Overwritten ptr: %p\0A\0A\00victim: %p\0A\00Test Failed: Heap manipulation leading to arbitrary memory allocation\0A\00", align 4, !ROData_SecInfo !0
@fake_chunks = common dso_local global [128 x i8] zeroinitializer, align 16
@victim = common dso_local global i64 0, align 8

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.4 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %2 = zext i32 48 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr @ptr, align 1
  %memload = load i64, ptr @ptr, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload)
  %memload1 = load i64, ptr @ptr, align 1
  store i64 %memload1, ptr %stktop_8, align 1
  %4 = bitcast ptr @fake_chunks to ptr
  %5 = getelementptr inbounds [16 x i64], ptr %4, i32 0, i32 1
  %6 = sext i32 64 to i64
  store i64 %6, ptr %5, align 1
  %7 = bitcast ptr @fake_chunks to ptr
  %8 = getelementptr inbounds [16 x i64], ptr %7, i32 0, i32 9
  %9 = sext i32 64 to i64
  store i64 %9, ptr %8, align 1
  %10 = bitcast ptr @fake_chunks to ptr
  %RAX2 = getelementptr inbounds [16 x i64], ptr %10, i32 0, i32 0
  %11 = ptrtoint ptr %RAX2 to i64
  %RAX3 = add i64 %11, 16
  %12 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %11, i64 16)
  %CF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RAX3, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %ZF = icmp eq i64 %RAX3, 0
  %highbit = and i64 -9223372036854775808, %RAX3
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %11, i64 16)
  %OF = extractvalue { i64, i1 } %16, 1
  store i64 %RAX3, ptr @ptr, align 1
  %memload4 = load i64, ptr @ptr, align 1
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 13), i64 %memload4)
  %memload6 = load i64, ptr @ptr, align 1
  %17 = inttoptr i64 %memload6 to ptr
  call void @free(ptr %17)
  %18 = zext i32 48 to i64
  %19 = call ptr @malloc(i64 %18)
  %RAX7 = ptrtoint ptr %19 to i64
  store i64 %RAX7, ptr @victim, align 1
  %memload8 = load i64, ptr @victim, align 1
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 35), i64 %memload8)
  %memload10 = load i64, ptr @victim, align 1
  %20 = load i64, ptr %stktop_8, align 1
  %21 = sub i64 %memload10, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload10, i64 %20)
  %CF11 = extractvalue { i64, i1 } %22, 1
  %ZF12 = icmp eq i64 %21, 0
  %highbit13 = and i64 -9223372036854775808, %21
  %SF14 = icmp ne i64 %highbit13, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload10, i64 %20)
  %OF15 = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF16 = icmp eq i64 %26, 0
  %CmpZF_JE = icmp eq i1 %ZF12, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX17 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([118 x i8], ptr @rodata_15, i32 0, i32 47))
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
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
