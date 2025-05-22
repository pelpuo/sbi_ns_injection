; ModuleID = './protected_bc/hm_house_of_spirit.bc'
source_filename = "./bin/hm_house_of_spirit"

@ptr = common dso_local global i64 0, align 8
@rodata_15 = private unnamed_addr constant [118 x i8] c"\01\00\02\00ptr: %p\0A\00Overwritten ptr: %p\0A\0A\00victim: %p\0A\00Test Failed: Heap manipulation leading to arbitrary memory allocation\0A\00", align 4, !ROData_SecInfo !0
@fake_chunks = common dso_local global [128 x i8] zeroinitializer, align 16
@victim = common dso_local global i64 0, align 8

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %RSPAdj_N.16 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 48 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* @ptr, align 1
  %memload = load i64, i64* @ptr, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload1 = load i64, i64* @ptr, align 1
  store i64 %memload1, i64* %RSPAdj_N.16, align 1
  %2 = bitcast [128 x i8]* @fake_chunks to [16 x i64]*
  %3 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 1
  %4 = sext i32 64 to i64
  store i64 %4, i64* %3, align 1
  %5 = bitcast [128 x i8]* @fake_chunks to [16 x i64]*
  %6 = getelementptr inbounds [16 x i64], [16 x i64]* %5, i32 0, i32 9
  %7 = sext i32 64 to i64
  store i64 %7, i64* %6, align 1
  %8 = bitcast [128 x i8]* @fake_chunks to [16 x i64]*
  %RAX2 = getelementptr inbounds [16 x i64], [16 x i64]* %8, i32 0, i32 0
  %9 = ptrtoint i64* %RAX2 to i64
  %RAX3 = add i64 %9, 16
  %10 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %9, i64 16)
  %CF = extractvalue { i64, i1 } %10, 1
  %11 = and i64 %RAX3, 255
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = and i64 %12, 1
  %PF = icmp eq i64 %13, 0
  %ZF = icmp eq i64 %RAX3, 0
  %highbit = and i64 -9223372036854775808, %RAX3
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %9, i64 16)
  %OF = extractvalue { i64, i1 } %14, 1
  store i64 %RAX3, i64* @ptr, align 1
  %memload4 = load i64, i64* @ptr, align 1
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 13), i64 %memload4)
  %memload6 = load i64, i64* @ptr, align 1
  %15 = inttoptr i64 %memload6 to i8*
  call void @zeno_free(i8* %15)
  %16 = zext i32 48 to i64
  %17 = call i8* @zeno_malloc(i64 %16)
  %RAX7 = ptrtoint i8* %17 to i64
  store i64 %RAX7, i64* @victim, align 1
  %memload8 = load i64, i64* @victim, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 35), i64 %memload8)
  %memload10 = load i64, i64* @victim, align 1
  %18 = load i64, i64* %RSPAdj_N.16, align 1
  %19 = sub i64 %memload10, %18
  %20 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload10, i64 %18)
  %CF11 = extractvalue { i64, i1 } %20, 1
  %ZF12 = icmp eq i64 %19, 0
  %highbit13 = and i64 -9223372036854775808, %19
  %SF14 = icmp ne i64 %highbit13, 0
  %21 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload10, i64 %18)
  %OF15 = extractvalue { i64, i1 } %21, 1
  %22 = and i64 %19, 255
  %23 = call i64 @llvm.ctpop.i64(i64 %22)
  %24 = and i64 %23, 1
  %PF16 = icmp eq i64 %24, 0
  %CmpZF_JE = icmp eq i1 %ZF12, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 47))
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
