; ModuleID = './bin/df_editing_size'
source_filename = "./bin/df_editing_size"

@rodata_15 = private unnamed_addr constant [114 x i8] c"\01\00\02\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00x\00b: %p\0Ac: %p\0A\00Test Failed: Size manipulation leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.24 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.16 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.4 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %3 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  %4 = zext i32 16 to i64
  %5 = call i8* @malloc(i64 %4)
  %RAX = ptrtoint i8* %5 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %6 = bitcast i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* %6, align 1, !ROData_Content !2
  %7 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %7, align 1
  %8 = bitcast i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %9 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %9, align 1
  %memload3 = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 20), i64 %memload3)
  %memload4 = load i64, i64* %RBP_N.16, align 1
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 36), i64 %memload4)
  %memload6 = load i64, i64* %RBP_N.16, align 1
  %10 = inttoptr i64 %memload6 to i8*
  call void @free(i8* %10)
  %memload7 = load i64, i64* %RBP_N.16, align 1
  %memload8 = load i8, i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 44), align 1, !ROData_Content !5
  %memref-disp9 = add i64 %memload7, 15
  %11 = inttoptr i64 %memref-disp9 to i8*
  store i8 %memload8, i8* %11, align 1
  %memload10 = load i64, i64* %RBP_N.16, align 1
  %12 = inttoptr i64 %memload10 to i8*
  call void @free(i8* %12)
  %13 = zext i32 16 to i64
  %14 = call i8* @malloc(i64 %13)
  %RAX11 = ptrtoint i8* %14 to i64
  store i64 %RAX11, i64* %RBP_N.24, align 1
  %15 = zext i32 16 to i64
  %16 = call i8* @malloc(i64 %15)
  %RAX12 = ptrtoint i8* %16 to i64
  store i64 %RAX12, i64* %RSPAdj_N.32, align 1
  %memload13 = load i64, i64* %RBP_N.24, align 1
  %memload14 = load i64, i64* %RSPAdj_N.32, align 1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 46), i64 %memload13, i64 %memload14)
  %memload16 = load i64, i64* %RBP_N.24, align 1
  %17 = load i64, i64* %RSPAdj_N.32, align 1
  %18 = sub i64 %memload16, %17
  %19 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload16, i64 %17)
  %CF = extractvalue { i64, i1 } %19, 1
  %ZF = icmp eq i64 %18, 0
  %highbit = and i64 -9223372036854775808, %18
  %SF = icmp ne i64 %highbit, 0
  %20 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload16, i64 %17)
  %OF = extractvalue { i64, i1 } %20, 1
  %21 = and i64 %18, 255
  %22 = call i64 @llvm.ctpop.i64(i64 %21)
  %23 = and i64 %22, 1
  %PF = icmp eq i64 %23, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 59))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload18 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload18
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([114 x i8], [114 x i8]* @rodata_15, i32 0, i32 44)}
