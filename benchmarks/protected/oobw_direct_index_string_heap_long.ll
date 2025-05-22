; ModuleID = './protected_bc/oobw_direct_index_string_heap_long.bc'
source_filename = "./bin/oobw_direct_index_string_heap_long"

@rodata_15 = private unnamed_addr constant [116 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Char array on heap using long pointer Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i64 7450643069006996065
@rodata_15_18 = private constant i64 2322222573106915698
@rodata_15_10 = private constant i64 8382043788501608294
@rodata_15_12 = private constant i64 7598263421165529448

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

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
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 4)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i32*
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
  %memload = load i64, i64* %ns_ptr6, align 1
  %4 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %5 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %5, align 1
  %6 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %7 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %7, align 1
  %memload4 = load i64, i64* %ns_ptr9, align 1
  %8 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 10) to i64*, !ROData_Index !5
  %memload5 = load i64, i64* @rodata_15_10, align 1, !ROData_Content !6
  %9 = inttoptr i64 %memload4 to i64*
  store i64 %memload5, i64* %9, align 1
  %10 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 18) to i64*, !ROData_Index !7
  %memload6 = load i64, i64* @rodata_15_18, align 1, !ROData_Content !8
  %memref-disp7 = add i64 %memload4, 8
  %11 = inttoptr i64 %memref-disp7 to i64*
  store i64 %memload6, i64* %11, align 1
  %memload8 = load i64, i64* %ns_ptr6, align 1
  %RAX9 = add i64 %memload8, 32
  %12 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload8, i64 32)
  %CF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %RAX9, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %ZF = icmp eq i64 %RAX9, 0
  %highbit = and i64 -9223372036854775808, %RAX9
  %SF = icmp ne i64 %highbit, 0
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload8, i64 32)
  %OF = extractvalue { i64, i1 } %16, 1
  store i64 %RAX9, i64* %ns_ptr12, align 1
  %memload10 = load i64, i64* %ns_ptr12, align 1
  %17 = inttoptr i64 %memload10 to i64*
  store i64 4919420920202273057, i64* %17, align 1
  %memload11 = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 16), i64 %memload11)
  %memload12 = load i64, i64* %ns_ptr9, align 1
  %EAX13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 30), i64 %memload12)
  store i32 0, i32* %ns_ptr15, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.5, %entry
  %18 = load i32, i32* %ns_ptr15, align 1
  %19 = zext i32 %18 to i64
  %20 = zext i32 5 to i64
  %21 = sub i64 %19, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %19, i64 %20)
  %CF14 = extractvalue { i64, i1 } %22, 1
  %ZF15 = icmp eq i64 %21, 0
  %highbit16 = and i64 -9223372036854775808, %21
  %SF17 = icmp ne i64 %highbit16, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %19, i64 %20)
  %OF18 = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF19 = icmp eq i64 %26, 0
  %CmpSFOF_JGE = icmp eq i1 %SF17, %OF18
  br i1 %CmpSFOF_JGE, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload20 = load i64, i64* %ns_ptr9, align 1
  %27 = bitcast i32* %ns_ptr15 to i64*
  %memload21 = load i64, i64* %27, align 1
  %28 = trunc i64 %memload21 to i32
  %RCX = sext i32 %28 to i64
  %memref-basereg = add i64 %memload20, %RCX
  %29 = inttoptr i64 %memref-basereg to i32*
  %memload22 = load i32, i32* %29, align 1
  %30 = trunc i32 %memload22 to i8
  %EAX23 = sext i8 %30 to i32
  %31 = sub i32 %EAX23, 72
  %32 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX23, i32 72)
  %CF24 = extractvalue { i32, i1 } %32, 1
  %ZF25 = icmp eq i32 %31, 0
  %highbit26 = and i32 -2147483648, %31
  %SF27 = icmp ne i32 %highbit26, 0
  %33 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX23, i32 72)
  %OF28 = extractvalue { i32, i1 } %33, 1
  %34 = and i32 %31, 255
  %35 = call i32 @llvm.ctpop.i32(i32 %34)
  %36 = and i32 %35, 1
  %PF29 = icmp eq i32 %36, 0
  %CmpZF_JNE = icmp eq i1 %ZF25, false
  br i1 %CmpZF_JNE, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 44))
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  br label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload31 = load i32, i32* %ns_ptr15, align 1
  %EAX38 = add i32 %memload31, 1
  %37 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload31, i32 1)
  %CF32 = extractvalue { i32, i1 } %37, 1
  %38 = and i32 %EAX38, 255
  %39 = call i32 @llvm.ctpop.i32(i32 %38)
  %40 = and i32 %39, 1
  %PF33 = icmp eq i32 %40, 0
  %ZF34 = icmp eq i32 %EAX38, 0
  %highbit35 = and i32 -2147483648, %EAX38
  %SF36 = icmp ne i32 %highbit35, 0
  %41 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload31, i32 1)
  %OF37 = extractvalue { i32, i1 } %41, 1
  store i32 %EAX38, i32* %ns_ptr15, align 1
  br label %bb.1

bb.6:                                             ; preds = %bb.1
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 10)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 18)}
!8 = !{!7}
