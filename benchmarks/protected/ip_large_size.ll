; ModuleID = './protected_bc/ip_large_size.bc'
source_filename = "./bin/ip_large_size"

@rodata_15 = private unnamed_addr constant [119 x i8] c"\01\00\02\00Address of x: %p\0A\00Value of x: %d\0A\00Test Failed: Illegal pointer access caused by incorrect sized memory allocation\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 36
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  store i64 4398046511104, i64* %ns_ptr6, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %0 = call i8* @zeno_malloc(i64 %memload)
  %RAX = ptrtoint i8* %0 to i64
  store i64 %RAX, i64* %ns_ptr9, align 1
  %memload1 = load i64, i64* %ns_ptr9, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([119 x i8], [119 x i8]* @rodata_15, i32 0, i32 4), i64 %memload1)
  %memload2 = load i64, i64* %ns_ptr9, align 1
  %1 = inttoptr i64 %memload2 to i32*
  %memload3 = load i32, i32* %1, align 1
  %EAX4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([119 x i8], [119 x i8]* @rodata_15, i32 0, i32 22), i32 %memload3)
  %memload5 = load i64, i64* %ns_ptr9, align 1
  %2 = inttoptr i64 %memload5 to i32*
  %3 = load i32, i32* %2, align 1
  %4 = zext i32 %3 to i64
  %5 = zext i32 0 to i64
  %6 = sub i64 %4, %5
  %7 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %4, i64 %5)
  %CF = extractvalue { i64, i1 } %7, 1
  %ZF = icmp eq i64 %6, 0
  %highbit = and i64 -9223372036854775808, %6
  %SF = icmp ne i64 %highbit, 0
  %8 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %4, i64 %5)
  %OF = extractvalue { i64, i1 } %8, 1
  %9 = and i64 %6, 255
  %10 = call i64 @llvm.ctpop.i64(i64 %9)
  %11 = and i64 %10, 1
  %PF = icmp eq i64 %11, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([119 x i8], [119 x i8]* @rodata_15, i32 0, i32 38))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload7 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload7
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
