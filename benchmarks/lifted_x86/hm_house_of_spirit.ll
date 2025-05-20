; ModuleID = './bin/hm_house_of_spirit'
source_filename = "./bin/hm_house_of_spirit"

@0 = common dso_local global i64 0, align 8
@rodata_18 = private unnamed_addr constant [126 x i8] c"\01\00\02\00\00\00\00\00ptr: %p\0A\00Overwritten ptr: %p\0A\0A\00victim: %p\0A\00\00\00\00\00\00Test Failed: Heap manipulation leading to arbitrary memory allocation\00", align 8, !ROData_SecInfo !0
@fake_chunks = common dso_local global [128 x i8] zeroinitializer, align 32
@victim = common dso_local global i64 0, align 8

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

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
  %2 = zext i32 48 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr @0, align 1
  %RSI = ptrtoint ptr @0 to i64
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_18, i32 0, i32 8), i64 %RSI)
  %4 = ptrtoint ptr @0 to i64
  store i64 %4, ptr %RBP_N.8, align 1
  %5 = bitcast ptr @fake_chunks to ptr
  %6 = getelementptr inbounds [16 x i64], ptr %5, i32 0, i32 1
  %7 = sext i32 64 to i64
  store i64 %7, ptr %6, align 1
  %8 = bitcast ptr @fake_chunks to ptr
  %9 = getelementptr inbounds [16 x i64], ptr %8, i32 0, i32 9
  %10 = sext i32 64 to i64
  store i64 %10, ptr %9, align 1
  %11 = bitcast ptr @fake_chunks to ptr
  %12 = getelementptr inbounds [16 x i64], ptr %11, i32 0, i32 2
  %RAX2 = ptrtoint ptr %12 to i64
  store i64 %RAX2, ptr @0, align 1
  %RSI3 = ptrtoint ptr @0 to i64
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_18, i32 0, i32 17), i64 %RSI3)
  call void @free(ptr @0)
  %13 = zext i32 48 to i64
  %14 = call ptr @malloc(i64 %13)
  %RAX6 = ptrtoint ptr %14 to i64
  store i64 %RAX6, ptr @victim, align 1
  %RSI7 = ptrtoint ptr @victim to i64
  %EAX9 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_18, i32 0, i32 39), i64 %RSI7)
  %15 = load i64, ptr %RBP_N.8, align 1
  %16 = ptrtoint ptr @victim to i64
  %17 = sub i64 %15, %16
  %18 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %15, i64 %16)
  %CF = extractvalue { i64, i1 } %18, 1
  %ZF = icmp eq i64 %17, 0
  %highbit = and i64 -9223372036854775808, %17
  %SF = icmp ne i64 %highbit, 0
  %19 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %15, i64 %16)
  %OF = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %17, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF = icmp eq i64 %22, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX11 = call i32 @puts(ptr getelementptr inbounds ([126 x i8], ptr @rodata_18, i32 0, i32 56))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
