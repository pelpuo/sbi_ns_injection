; ModuleID = './protected_bc/df_overwriting_free.bc'
source_filename = "./bin/df_overwriting_free"

@rodata_15 = private unnamed_addr constant [118 x i8] c"\01\00\02\00hello!\00a contains: %s\0A\0A\00a: %p\0A\0A\00RANDOMSTRING\00b: %p\0Ac: %p\0A\00Test Failed: Metadata overwrite leading to Double Free\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i64 6989623384123139432
@rodata_15_44 = private constant i64 2322276311198746962
@rodata_15_36 = private constant i64 6076285325096665426
@rodata_15_12 = private constant i64 7955997369423586080

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
  %0 = zext i32 10 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %2 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %3 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %3, align 1
  %4 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %5 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %5, align 1
  %memload3 = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload4 = load i64, i64* %ns_ptr6, align 1
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 28), i64 %memload4)
  %memload6 = load i64, i64* %ns_ptr6, align 1
  %6 = inttoptr i64 %memload6 to i8*
  call void @zeno_free(i8* %6)
  %memload7 = load i64, i64* %ns_ptr6, align 1
  %7 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 36) to i64*, !ROData_Index !5
  %memload8 = load i64, i64* @rodata_15_36, align 1, !ROData_Content !6
  %8 = inttoptr i64 %memload7 to i64*
  store i64 %memload8, i64* %8, align 1
  %9 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 44) to i64*, !ROData_Index !7
  %memload9 = load i64, i64* @rodata_15_44, align 1, !ROData_Content !8
  %memref-disp10 = add i64 %memload7, 8
  %10 = inttoptr i64 %memref-disp10 to i64*
  store i64 %memload9, i64* %10, align 1
  %memload11 = load i64, i64* %ns_ptr6, align 1
  %EAX12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 11), i64 %memload11)
  %memload13 = load i64, i64* %ns_ptr6, align 1
  %11 = inttoptr i64 %memload13 to i8*
  call void @zeno_free(i8* %11)
  %12 = zext i32 10 to i64
  %13 = call i8* @zeno_malloc(i64 %12)
  %RAX14 = ptrtoint i8* %13 to i64
  store i64 %RAX14, i64* %ns_ptr9, align 1
  %14 = zext i32 10 to i64
  %15 = call i8* @zeno_malloc(i64 %14)
  %RAX15 = ptrtoint i8* %15 to i64
  store i64 %RAX15, i64* %RSPAdj_N.32, align 1
  %memload16 = load i64, i64* %ns_ptr9, align 1
  %memload17 = load i64, i64* %RSPAdj_N.32, align 1
  %EAX18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 49), i64 %memload16, i64 %memload17)
  %memload19 = load i64, i64* %ns_ptr9, align 1
  %16 = load i64, i64* %RSPAdj_N.32, align 1
  %17 = sub i64 %memload19, %16
  %18 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload19, i64 %16)
  %CF = extractvalue { i64, i1 } %18, 1
  %ZF = icmp eq i64 %17, 0
  %highbit = and i64 -9223372036854775808, %17
  %SF = icmp ne i64 %highbit, 0
  %19 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload19, i64 %16)
  %OF = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %17, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF = icmp eq i64 %22, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 62))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload21 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload21
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
!1 = !{i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 36)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 44)}
!8 = !{!7}
