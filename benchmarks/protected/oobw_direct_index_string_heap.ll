; ModuleID = './protected_bc/oobw_direct_index_string_heap.bc'
source_filename = "./bin/oobw_direct_index_string_heap"

@rodata_15 = private unnamed_addr constant [104 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Direct char array on heap Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i64 7450643069006996065
@rodata_15_18 = private constant i64 2322222573106915698
@rodata_15_10 = private constant i64 8382043788501608294
@rodata_15_12 = private constant i64 7598263421165529448

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
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %2 = zext i32 16 to i64
  %3 = call i8* @zeno_malloc(i64 %2)
  %RAX1 = ptrtoint i8* %3 to i64
  store i64 %RAX1, i64* %ns_ptr9, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %4 = bitcast i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %5 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %5, align 1
  %6 = bitcast i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %7 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %7, align 1
  %memload4 = load i64, i64* %ns_ptr9, align 1
  %8 = bitcast i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 10) to i64*, !ROData_Index !5
  %memload5 = load i64, i64* @rodata_15_10, align 1, !ROData_Content !6
  %9 = inttoptr i64 %memload4 to i64*
  store i64 %memload5, i64* %9, align 1
  %10 = bitcast i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 18) to i64*, !ROData_Index !7
  %memload6 = load i64, i64* @rodata_15_18, align 1, !ROData_Content !8
  %memref-disp7 = add i64 %memload4, 8
  %11 = inttoptr i64 %memref-disp7 to i64*
  store i64 %memload6, i64* %11, align 1
  %memload8 = load i64, i64* %ns_ptr6, align 1
  %memref-disp9 = add i64 %memload8, 32
  %12 = inttoptr i64 %memref-disp9 to i8*
  store i8 120, i8* %12, align 1
  %memload10 = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 16), i64 %memload10)
  %memload11 = load i64, i64* %ns_ptr9, align 1
  %EAX12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 30), i64 %memload11)
  %memload13 = load i64, i64* %ns_ptr9, align 1
  %13 = inttoptr i64 %memload13 to i32*
  %memload14 = load i32, i32* %13, align 1
  %14 = trunc i32 %memload14 to i8
  %EAX15 = sext i8 %14 to i32
  %15 = sub i32 %EAX15, 120
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX15, i32 120)
  %CF = extractvalue { i32, i1 } %16, 1
  %ZF = icmp eq i32 %15, 0
  %highbit = and i32 -2147483648, %15
  %SF = icmp ne i32 %highbit, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX15, i32 120)
  %OF = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF = icmp eq i32 %20, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 44))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([104 x i8], [104 x i8]* @rodata_15, i32 0, i32 18)}
!8 = !{!7}
