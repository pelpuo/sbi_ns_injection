; ModuleID = './bin/df_overwriting_free'
source_filename = "./bin/df_overwriting_free"

@rodata_15 = private unnamed_addr constant [118 x i8] c"\01\00\02\00hello!\00a contains: %s\0A\0A\00a: %p\0A\0A\00RANDOMSTRING\00b: %p\0Ac: %p\0A\00Test Failed: Metadata overwrite leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

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
  %4 = zext i32 10 to i64
  %5 = call i8* @malloc(i64 %4)
  %RAX = ptrtoint i8* %5 to i64
  store i64 %RAX, i64* %RBP_N.16, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %6 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* %6, align 1, !ROData_Content !2
  %7 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %7, align 1
  %8 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %9 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %9, align 1
  %memload3 = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload4 = load i64, i64* %RBP_N.16, align 1
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 28), i64 %memload4)
  %memload6 = load i64, i64* %RBP_N.16, align 1
  %10 = inttoptr i64 %memload6 to i8*
  call void @free(i8* %10)
  %memload7 = load i64, i64* %RBP_N.16, align 1
  %11 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 36) to i64*, !ROData_Index !5
  %memload8 = load i64, i64* %11, align 1, !ROData_Content !6
  %12 = inttoptr i64 %memload7 to i64*
  store i64 %memload8, i64* %12, align 1
  %13 = bitcast i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 44) to i64*, !ROData_Index !7
  %memload9 = load i64, i64* %13, align 1, !ROData_Content !8
  %memref-disp10 = add i64 %memload7, 8
  %14 = inttoptr i64 %memref-disp10 to i64*
  store i64 %memload9, i64* %14, align 1
  %memload11 = load i64, i64* %RBP_N.16, align 1
  %EAX12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 11), i64 %memload11)
  %memload13 = load i64, i64* %RBP_N.16, align 1
  %15 = inttoptr i64 %memload13 to i8*
  call void @free(i8* %15)
  %16 = zext i32 10 to i64
  %17 = call i8* @malloc(i64 %16)
  %RAX14 = ptrtoint i8* %17 to i64
  store i64 %RAX14, i64* %RBP_N.24, align 1
  %18 = zext i32 10 to i64
  %19 = call i8* @malloc(i64 %18)
  %RAX15 = ptrtoint i8* %19 to i64
  store i64 %RAX15, i64* %RSPAdj_N.32, align 1
  %memload16 = load i64, i64* %RBP_N.24, align 1
  %memload17 = load i64, i64* %RSPAdj_N.32, align 1
  %EAX18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 49), i64 %memload16, i64 %memload17)
  %memload19 = load i64, i64* %RBP_N.24, align 1
  %20 = load i64, i64* %RSPAdj_N.32, align 1
  %21 = sub i64 %memload19, %20
  %22 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload19, i64 %20)
  %CF = extractvalue { i64, i1 } %22, 1
  %ZF = icmp eq i64 %21, 0
  %highbit = and i64 -9223372036854775808, %21
  %SF = icmp ne i64 %highbit, 0
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload19, i64 %20)
  %OF = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %21, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF = icmp eq i64 %26, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([118 x i8], [118 x i8]* @rodata_15, i32 0, i32 62))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload21 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload21
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

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
