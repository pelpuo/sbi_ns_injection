; ModuleID = './bin/uaf_memcpy'
source_filename = "./bin/uaf_memcpy"

@rodata_15 = private unnamed_addr constant [115 x i8] c"\01\00\02\00hello!\00a contains: %s\0A\0A\00a: %p\0A\00b: %p\0A\0A\00RANDOMSTRING\00b contains: %s\0A\0A\00Test Failed: Use After Free using memcpy\0A\00", align 4, !ROData_SecInfo !0

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
  %6 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload1 = load i64, i64* %6, align 1, !ROData_Content !2
  %7 = inttoptr i64 %memload to i64*
  store i64 %memload1, i64* %7, align 1
  %8 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %9 = inttoptr i64 %memref-disp to i64*
  store i64 %memload2, i64* %9, align 1
  %memload3 = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload4 = load i64, i64* %RBP_N.16, align 1
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 28), i64 %memload4)
  %memload6 = load i64, i64* %RBP_N.16, align 1
  %10 = inttoptr i64 %memload6 to i8*
  call void @free(i8* %10)
  %11 = zext i32 10 to i64
  %12 = call i8* @malloc(i64 %11)
  %RAX7 = ptrtoint i8* %12 to i64
  store i64 %RAX7, i64* %RBP_N.24, align 1
  %memload8 = load i64, i64* %RBP_N.24, align 1
  %EAX9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 35), i64 %memload8)
  %memload10 = load i64, i64* %RBP_N.16, align 1
  %13 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 43) to i64*, !ROData_Index !5
  %memload11 = load i64, i64* %13, align 1, !ROData_Content !6
  %14 = inttoptr i64 %memload10 to i64*
  store i64 %memload11, i64* %14, align 1
  %15 = bitcast i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 51) to i64*, !ROData_Index !7
  %memload12 = load i64, i64* %15, align 1, !ROData_Content !8
  %memref-disp13 = add i64 %memload10, 8
  %16 = inttoptr i64 %memref-disp13 to i64*
  store i64 %memload12, i64* %16, align 1
  %memload14 = load i64, i64* %RBP_N.16, align 1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 11), i64 %memload14)
  %memload16 = load i64, i64* %RBP_N.24, align 1
  %EAX17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 56), i64 %memload16)
  %memload18 = load i64, i64* %RBP_N.16, align 1
  %17 = inttoptr i64 %memload18 to i32*
  %memload19 = load i32, i32* %17, align 1
  %18 = trunc i32 %memload19 to i8
  %EAX20 = sext i8 %18 to i32
  %19 = sub i32 %EAX20, 82
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX20, i32 82)
  %CF = extractvalue { i32, i1 } %20, 1
  %ZF = icmp eq i32 %19, 0
  %highbit = and i32 -2147483648, %19
  %SF = icmp ne i32 %highbit, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX20, i32 82)
  %OF = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF = icmp eq i32 %24, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([115 x i8], [115 x i8]* @rodata_15, i32 0, i32 73))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload22 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload22
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

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
