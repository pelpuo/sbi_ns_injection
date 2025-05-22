; ModuleID = './bin/hm_fake_chunk_malloc'
source_filename = "./bin/hm_fake_chunk_malloc"

@rodata_15 = private unnamed_addr constant [133 x i8] c"\01\00\02\00ptr0: %p\0A\00ptr1: %p\0A\00Target: %p\0A\0A\00ptr_x: %p\0A\00ptr_y: %p\0A\00Test Failed: Heap manipulation leading to allocation on specific address\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.48 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.40 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.32 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 48
  %RBP_N.24 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 56
  %RBP_N.16 = bitcast i8* %4 to i64*
  %5 = getelementptr i8, i8* %stktop_8, i64 68
  %RBP_N.4 = bitcast i8* %5 to i32*
  %6 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %6 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %7 = zext i32 16 to i64
  %8 = call i8* @malloc(i64 %7)
  %RAX = ptrtoint i8* %8 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %9 = zext i32 16 to i64
  %10 = call i8* @malloc(i64 %9)
  %RAX1 = ptrtoint i8* %10 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  %11 = zext i32 16 to i64
  %12 = call i8* @malloc(i64 %11)
  %RAX2 = ptrtoint i8* %12 to i64
  store i64 %RAX2, i64* %RBP_N.32, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload3 = load i64, i64* %RBP_N.24, align 1
  %EAX4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 14), i64 %memload3)
  %memload5 = load i64, i64* %RBP_N.32, align 1
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 24), i64 %memload5)
  %memload7 = load i64, i64* %RBP_N.16, align 1
  %13 = inttoptr i64 %memload7 to i8*
  call void @free(i8* %13)
  %memload8 = load i64, i64* %RBP_N.24, align 1
  %14 = inttoptr i64 %memload8 to i8*
  call void @free(i8* %14)
  %memload9 = load i64, i64* %RBP_N.24, align 1
  %15 = inttoptr i64 %memload9 to i64*
  %memload10 = load i64, i64* %15, align 1
  %RCX = add i64 %memload10, 64
  %16 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload10, i64 64)
  %CF = extractvalue { i64, i1 } %16, 1
  %17 = and i64 %RCX, 255
  %18 = call i64 @llvm.ctpop.i64(i64 %17)
  %19 = and i64 %18, 1
  %PF = icmp eq i64 %19, 0
  %ZF = icmp eq i64 %RCX, 0
  %highbit = and i64 -9223372036854775808, %RCX
  %SF = icmp ne i64 %highbit, 0
  %20 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload10, i64 64)
  %OF = extractvalue { i64, i1 } %20, 1
  %memload11 = load i64, i64* %RBP_N.24, align 1
  %21 = inttoptr i64 %memload11 to i64*
  store i64 %RCX, i64* %21, align 1
  %22 = zext i32 16 to i64
  %23 = call i8* @malloc(i64 %22)
  %RAX12 = ptrtoint i8* %23 to i64
  store i64 %RAX12, i64* %RBP_N.40, align 1
  %24 = zext i32 16 to i64
  %25 = call i8* @malloc(i64 %24)
  %RAX13 = ptrtoint i8* %25 to i64
  store i64 %RAX13, i64* %RBP_N.48, align 1
  %memload14 = load i64, i64* %RBP_N.40, align 1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 37), i64 %memload14)
  %memload16 = load i64, i64* %RBP_N.48, align 1
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 48), i64 %memload16)
  %memload18 = load i64, i64* %RBP_N.48, align 1
  %26 = load i64, i64* %RBP_N.32, align 1
  %27 = sub i64 %memload18, %26
  %28 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload18, i64 %26)
  %CF19 = extractvalue { i64, i1 } %28, 1
  %ZF20 = icmp eq i64 %27, 0
  %highbit21 = and i64 -9223372036854775808, %27
  %SF22 = icmp ne i64 %highbit21, 0
  %29 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload18, i64 %26)
  %OF23 = extractvalue { i64, i1 } %29, 1
  %30 = and i64 %27, 255
  %31 = call i64 @llvm.ctpop.i64(i64 %30)
  %32 = and i64 %31, 1
  %PF24 = icmp eq i64 %32, 0
  %CmpZF_JNE = icmp eq i1 %ZF20, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 59))
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
