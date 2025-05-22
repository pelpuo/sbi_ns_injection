; ModuleID = './protected_bc/df_with_oobw.bc'
source_filename = "./bin/df_with_oobw"

@rodata_15 = private unnamed_addr constant [84 x i8] c"\01\00\02\00b: %p\0A\0A\00x\00c: %p\0Ad: %p\0A\00Test Failed: Metadata corruption leading to Double Free\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_12 = private constant i8 120

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
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
  %memload = load i64, i64* %ns_ptr9, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload2 = load i64, i64* %ns_ptr9, align 1
  %4 = inttoptr i64 %memload2 to i8*
  call void @zeno_free(i8* %4)
  %memload3 = load i64, i64* %ns_ptr6, align 1
  %memload4 = load i8, i8* @rodata_15_12, align 1, !ROData_Content !1
  %memref-disp = add i64 %memload3, 40
  %5 = inttoptr i64 %memref-disp to i8*
  store i8 %memload4, i8* %5, align 1
  %memload5 = load i64, i64* %ns_ptr9, align 1
  %6 = inttoptr i64 %memload5 to i8*
  call void @zeno_free(i8* %6)
  %7 = zext i32 16 to i64
  %8 = call i8* @zeno_malloc(i64 %7)
  %RAX6 = ptrtoint i8* %8 to i64
  store i64 %RAX6, i64* %ns_ptr12, align 1
  %9 = zext i32 16 to i64
  %10 = call i8* @zeno_malloc(i64 %9)
  %RAX7 = ptrtoint i8* %10 to i64
  store i64 %RAX7, i64* %ns_ptr15, align 1
  %memload8 = load i64, i64* %ns_ptr12, align 1
  %memload9 = load i64, i64* %ns_ptr15, align 1
  %EAX10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 14), i64 %memload8, i64 %memload9)
  %memload11 = load i64, i64* %ns_ptr12, align 1
  %11 = load i64, i64* %ns_ptr15, align 1
  %12 = sub i64 %memload11, %11
  %13 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload11, i64 %11)
  %CF = extractvalue { i64, i1 } %13, 1
  %ZF = icmp eq i64 %12, 0
  %highbit = and i64 -9223372036854775808, %12
  %SF = icmp ne i64 %highbit, 0
  %14 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload11, i64 %11)
  %OF = extractvalue { i64, i1 } %14, 1
  %15 = and i64 %12, 255
  %16 = call i64 @llvm.ctpop.i64(i64 %15)
  %17 = and i64 %16, 1
  %PF = icmp eq i64 %17, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 27))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload13 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload13
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 12)}
