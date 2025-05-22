; ModuleID = './protected_bc/uaf_memcpy.bc'
source_filename = "./bin/uaf_memcpy"

@rodata_15 = private unnamed_addr constant [115 x i8] c"\01\00\02\00hello!\00a contains: %s\0A\0A\00a: %p\0A\00b: %p\0A\0A\00RANDOMSTRING\00b contains: %s\0A\0A\00Test Failed: Use After Free using memcpy\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i64 6989623384123139432
@rodata_15_51 = private constant i64 7142816762345441618
@rodata_15_43 = private constant i64 6076285325096665426
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
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %2 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %3 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %3, align 1
  %4 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %5 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %5, align 1
  %memload3 = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload4 = load i64, i64* %ns_ptr6, align 1
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 28), i64 %memload4)
  %memload6 = load i64, i64* %ns_ptr6, align 1
  %6 = inttoptr i64 %memload6 to i8*
  call void @zeno_free(i8* %6)
  %7 = zext i32 10 to i64
  %8 = call i8* @zeno_malloc(i64 %7)
  %RAX7 = ptrtoint i8* %8 to i64
  store i64 %RAX7, i64* %ns_ptr9, align 1
  %memload8 = load i64, i64* %ns_ptr9, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 35), i64 %memload8)
  %memload10 = load i64, i64* %ns_ptr6, align 1
  %9 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 43) to i64*, !ROData_Index !5
  %memload11 = load i64, i64* @rodata_15_43, align 1, !ROData_Content !6
  %10 = inttoptr i64 %memload10 to i64*
  store i64 %memload11, i64* %10, align 1
  %11 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 51) to i64*, !ROData_Index !7
  %memload12 = load i64, i64* @rodata_15_51, align 1, !ROData_Content !8
  %memref-disp13 = add i64 %memload10, 8
  %12 = inttoptr i64 %memref-disp13 to i64*
  store i64 %memload12, i64* %12, align 1
  %memload14 = load i64, i64* %ns_ptr6, align 1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 11), i64 %memload14)
  %memload16 = load i64, i64* %ns_ptr9, align 1
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 56), i64 %memload16)
  %memload18 = load i64, i64* %ns_ptr6, align 1
  %13 = inttoptr i64 %memload18 to i32*
  %memload19 = load i32, i32* %13, align 1
  %14 = trunc i32 %memload19 to i8
  %EAX20 = sext i8 %14 to i32
  %15 = sub i32 %EAX20, 82
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX20, i32 82)
  %CF = extractvalue { i32, i1 } %16, 1
  %ZF = icmp eq i32 %15, 0
  %highbit = and i32 -2147483648, %15
  %SF = icmp ne i32 %highbit, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX20, i32 82)
  %OF = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF = icmp eq i32 %20, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 73))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload22 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload22
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 43)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 51)}
!8 = !{!7}
