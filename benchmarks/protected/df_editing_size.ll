; ModuleID = './protected_bc/df_editing_size.bc'
source_filename = "./bin/df_editing_size"

@rodata_15 = private unnamed_addr constant [114 x i8] c"\01\00\02\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00x\00b: %p\0Ac: %p\0A\00Test Failed: Size manipulation leading to Double Free\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i64 7088982951390373224
@rodata_15_44 = private constant i8 120
@rodata_15_12 = private constant i64 29669665863459939

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

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
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %2 = bitcast i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %3 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %3, align 1
  %4 = bitcast i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %5 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %5, align 1
  %memload3 = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 20), i64 %memload3)
  %memload4 = load i64, i64* %ns_ptr6, align 1
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 36), i64 %memload4)
  %memload6 = load i64, i64* %ns_ptr6, align 1
  %6 = inttoptr i64 %memload6 to i8*
  call void @zeno_free(i8* %6)
  %memload7 = load i64, i64* %ns_ptr6, align 1
  %memload8 = load i8, i8* @rodata_15_44, align 1, !ROData_Content !5
  %memref-disp9 = add i64 %memload7, 15
  %7 = inttoptr i64 %memref-disp9 to i8*
  store i8 %memload8, i8* %7, align 1
  %memload10 = load i64, i64* %ns_ptr6, align 1
  %8 = inttoptr i64 %memload10 to i8*
  call void @zeno_free(i8* %8)
  %9 = zext i32 16 to i64
  %10 = call i8* @zeno_malloc(i64 %9)
  %RAX11 = ptrtoint i8* %10 to i64
  store i64 %RAX11, i64* %ns_ptr9, align 1
  %11 = zext i32 16 to i64
  %12 = call i8* @zeno_malloc(i64 %11)
  %RAX12 = ptrtoint i8* %12 to i64
  store i64 %RAX12, i64* %RSPAdj_N.32, align 1
  %memload13 = load i64, i64* %ns_ptr9, align 1
  %memload14 = load i64, i64* %RSPAdj_N.32, align 1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 46), i64 %memload13, i64 %memload14)
  %memload16 = load i64, i64* %ns_ptr9, align 1
  %13 = load i64, i64* %RSPAdj_N.32, align 1
  %14 = sub i64 %memload16, %13
  %15 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload16, i64 %13)
  %CF = extractvalue { i64, i1 } %15, 1
  %ZF = icmp eq i64 %14, 0
  %highbit = and i64 -9223372036854775808, %14
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload16, i64 %13)
  %OF = extractvalue { i64, i1 } %16, 1
  %17 = and i64 %14, 255
  %18 = call i64 @llvm.ctpop.i64(i64 %17)
  %19 = and i64 %18, 1
  %PF = icmp eq i64 %19, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 59))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload18 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload18
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
!1 = !{i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 44)}
