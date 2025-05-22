; ModuleID = './protected_bc/hm_fake_chunk_malloc.bc'
source_filename = "./bin/hm_fake_chunk_malloc"

@rodata_15 = private unnamed_addr constant [133 x i8] c"\01\00\02\00ptr0: %p\0A\00ptr1: %p\0A\00Target: %p\0A\0A\00ptr_x: %p\0A\00ptr_y: %p\0A\00Test Failed: Heap manipulation leading to allocation on specific address\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 72, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 68
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 56
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 48
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %ns_base16 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot17 = call i8* @zeno_protect(i8* %ns_base16, i64 8)
  %ns_ptr18 = bitcast i8* %ns_prot17 to i64*
  %RSPAdj_N.64 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %2 = zext i32 16 to i64
  %3 = call i8* @zeno_malloc(i64 %2)
  %RAX1 = ptrtoint i8* %3 to i64
  store i64 %RAX1, i64* %ns_ptr9, align 1
  %4 = zext i32 16 to i64
  %5 = call i8* @zeno_malloc(i64 %4)
  %RAX2 = ptrtoint i8* %5 to i64
  store i64 %RAX2, i64* %ns_ptr12, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload3 = load i64, i64* %ns_ptr9, align 1
  %EAX4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 14), i64 %memload3)
  %memload5 = load i64, i64* %ns_ptr12, align 1
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 24), i64 %memload5)
  %memload7 = load i64, i64* %ns_ptr6, align 1
  %6 = inttoptr i64 %memload7 to i8*
  call void @zeno_free(i8* %6)
  %memload8 = load i64, i64* %ns_ptr9, align 1
  %7 = inttoptr i64 %memload8 to i8*
  call void @zeno_free(i8* %7)
  %memload9 = load i64, i64* %ns_ptr9, align 1
  %8 = inttoptr i64 %memload9 to i64*
  %memload10 = load i64, i64* %8, align 1
  %RCX = add i64 %memload10, 64
  %9 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload10, i64 64)
  %CF = extractvalue { i64, i1 } %9, 1
  %10 = and i64 %RCX, 255
  %11 = call i64 @llvm.ctpop.i64(i64 %10)
  %12 = and i64 %11, 1
  %PF = icmp eq i64 %12, 0
  %ZF = icmp eq i64 %RCX, 0
  %highbit = and i64 -9223372036854775808, %RCX
  %SF = icmp ne i64 %highbit, 0
  %13 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload10, i64 64)
  %OF = extractvalue { i64, i1 } %13, 1
  %memload11 = load i64, i64* %ns_ptr9, align 1
  %14 = inttoptr i64 %memload11 to i64*
  store i64 %RCX, i64* %14, align 1
  %15 = zext i32 16 to i64
  %16 = call i8* @zeno_malloc(i64 %15)
  %RAX12 = ptrtoint i8* %16 to i64
  store i64 %RAX12, i64* %ns_ptr15, align 1
  %17 = zext i32 16 to i64
  %18 = call i8* @zeno_malloc(i64 %17)
  %RAX13 = ptrtoint i8* %18 to i64
  store i64 %RAX13, i64* %ns_ptr18, align 1
  %memload14 = load i64, i64* %ns_ptr15, align 1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 37), i64 %memload14)
  %memload16 = load i64, i64* %ns_ptr18, align 1
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @rodata_15, i32 0, i32 48), i64 %memload16)
  %memload18 = load i64, i64* %ns_ptr18, align 1
  %19 = load i64, i64* %ns_ptr12, align 1
  %20 = sub i64 %memload18, %19
  %21 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload18, i64 %19)
  %CF19 = extractvalue { i64, i1 } %21, 1
  %ZF20 = icmp eq i64 %20, 0
  %highbit21 = and i64 -9223372036854775808, %20
  %SF22 = icmp ne i64 %highbit21, 0
  %22 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload18, i64 %19)
  %OF23 = extractvalue { i64, i1 } %22, 1
  %23 = and i64 %20, 255
  %24 = call i64 @llvm.ctpop.i64(i64 %23)
  %25 = and i64 %24, 1
  %PF24 = icmp eq i64 %25, 0
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

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
