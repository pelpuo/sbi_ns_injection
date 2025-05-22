; ModuleID = './bin/oobw_direct_index_string_heap_long'
source_filename = "./bin/oobw_direct_index_string_heap_long"

@rodata_15 = private unnamed_addr constant [116 x i8] c"\01\00\02\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Char array on heap using long pointer Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.36 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.32 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.24 = bitcast i8* %2 to i64*
  %3 = getelementptr i8, i8* %stktop_8, i64 40
  %RBP_N.16 = bitcast i8* %3 to i64*
  %4 = getelementptr i8, i8* %stktop_8, i64 52
  %RBP_N.4 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %5 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %6 = zext i32 16 to i64
  %7 = call i8* @malloc(i64 %6)
  %RAX = ptrtoint i8* %7 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %8 = zext i32 16 to i64
  %9 = call i8* @malloc(i64 %8)
  %RAX1 = ptrtoint i8* %9 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %10 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* %10, align 1, !ROData_Content !2
  %11 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %11, align 1
  %12 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* %12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %13 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %13, align 1
  %memload4 = load i64, i64* %RBP_N.24, align 1
  %14 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 10) to i64*, !ROData_Index !5
  %memload5 = load i64, i64* %14, align 1, !ROData_Content !6
  %15 = inttoptr i64 %memload4 to i64*
  store i64 %memload5, i64* %15, align 1
  %16 = bitcast i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 18) to i64*, !ROData_Index !7
  %memload6 = load i64, i64* %16, align 1, !ROData_Content !8
  %memref-disp7 = add i64 %memload4, 8
  %17 = inttoptr i64 %memref-disp7 to i64*
  store i64 %memload6, i64* %17, align 1
  %memload8 = load i64, i64* %RBP_N.16, align 1
  %RAX9 = add i64 %memload8, 32
  %18 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload8, i64 32)
  %CF = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %RAX9, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF = icmp eq i64 %21, 0
  %ZF = icmp eq i64 %RAX9, 0
  %highbit = and i64 -9223372036854775808, %RAX9
  %SF = icmp ne i64 %highbit, 0
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload8, i64 32)
  %OF = extractvalue { i64, i1 } %22, 1
  store i64 %RAX9, i64* %RBP_N.32, align 1
  %memload10 = load i64, i64* %RBP_N.32, align 1
  %23 = inttoptr i64 %memload10 to i64*
  store i64 4919420920202273057, i64* %23, align 1
  %memload11 = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 16), i64 %memload11)
  %memload12 = load i64, i64* %RBP_N.24, align 1
  %EAX13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 30), i64 %memload12)
  store i32 0, i32* %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.5
  %24 = load i32, i32* %RBP_N.36, align 1
  %25 = zext i32 %24 to i64
  %26 = zext i32 5 to i64
  %27 = sub i64 %25, %26
  %28 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %25, i64 %26)
  %CF14 = extractvalue { i64, i1 } %28, 1
  %ZF15 = icmp eq i64 %27, 0
  %highbit16 = and i64 -9223372036854775808, %27
  %SF17 = icmp ne i64 %highbit16, 0
  %29 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %25, i64 %26)
  %OF18 = extractvalue { i64, i1 } %29, 1
  %30 = and i64 %27, 255
  %31 = call i64 @llvm.ctpop.i64(i64 %30)
  %32 = and i64 %31, 1
  %PF19 = icmp eq i64 %32, 0
  %CmpSFOF_JGE = icmp eq i1 %SF17, %OF18
  br i1 %CmpSFOF_JGE, label %bb.6, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload20 = load i64, i64* %RBP_N.24, align 1
  %33 = bitcast i32* %RBP_N.36 to i64*
  %memload21 = load i64, i64* %33, align 1
  %34 = trunc i64 %memload21 to i32
  %RCX = sext i32 %34 to i64
  %memref-basereg = add i64 %memload20, %RCX
  %35 = inttoptr i64 %memref-basereg to i32*
  %memload22 = load i32, i32* %35, align 1
  %36 = trunc i32 %memload22 to i8
  %EAX23 = sext i8 %36 to i32
  %37 = sub i32 %EAX23, 72
  %38 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX23, i32 72)
  %CF24 = extractvalue { i32, i1 } %38, 1
  %ZF25 = icmp eq i32 %37, 0
  %highbit26 = and i32 -2147483648, %37
  %SF27 = icmp ne i32 %highbit26, 0
  %39 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX23, i32 72)
  %OF28 = extractvalue { i32, i1 } %39, 1
  %40 = and i32 %37, 255
  %41 = call i32 @llvm.ctpop.i32(i32 %40)
  %42 = and i32 %41, 1
  %PF29 = icmp eq i32 %42, 0
  %CmpZF_JNE = icmp eq i1 %ZF25, false
  br i1 %CmpZF_JNE, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @rodata_15, i32 0, i32 44))
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  br label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload31 = load i32, i32* %RBP_N.36, align 1
  %EAX38 = add i32 %memload31, 1
  %43 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload31, i32 1)
  %CF32 = extractvalue { i32, i1 } %43, 1
  %44 = and i32 %EAX38, 255
  %45 = call i32 @llvm.ctpop.i32(i32 %44)
  %46 = and i32 %45, 1
  %PF33 = icmp eq i32 %46, 0
  %ZF34 = icmp eq i32 %EAX38, 0
  %highbit35 = and i32 -2147483648, %EAX38
  %SF36 = icmp ne i32 %highbit35, 0
  %47 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload31, i32 1)
  %OF37 = extractvalue { i32, i1 } %47, 1
  store i32 %EAX38, i32* %RBP_N.36, align 1
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
