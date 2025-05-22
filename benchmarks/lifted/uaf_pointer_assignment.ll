; ModuleID = './bin/uaf_pointer_assignment'
source_filename = "./bin/uaf_pointer_assignment"

@rodata_15 = private unnamed_addr constant [128 x i8] c"\01\00\02\00Hello\00Addr of a:%p\0A\00Addr of b:%p\0A\0A\00World\00a: %s\0A\00b: %s\0A\00Test Failed: Incorrect pointer assignment leading to Use After Free\0A\00", align 4, !ROData_SecInfo !0

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
  %6 = zext i32 16 to i64
  %7 = call i8* @malloc(i64 %6)
  %RAX1 = ptrtoint i8* %7 to i64
  store i64 %RAX1, i64* %RBP_N.24, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %8 = bitcast i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* %8, align 1, !ROData_Content !2
  %9 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %9, align 1
  %10 = bitcast i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* %10, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %11 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %11, align 1
  %memload4 = load i64, i64* %RBP_N.16, align 1
  store i64 %memload4, i64* %RBP_N.24, align 1
  %memload5 = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 10), i64 %memload5)
  %memload6 = load i64, i64* %RBP_N.24, align 1
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 24), i64 %memload6)
  %memload8 = load i64, i64* %RBP_N.16, align 1
  %12 = inttoptr i64 %memload8 to i8*
  call void @free(i8* %12)
  %memload9 = load i64, i64* %RBP_N.24, align 1
  %13 = bitcast i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 39) to i64*, !ROData_Index !5
  %memload10 = load i64, i64* %13, align 1, !ROData_Content !6
  %14 = inttoptr i64 %memload9 to i64*
  store i64 %memload10, i64* %14, align 1
  %15 = bitcast i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 47) to i64*, !ROData_Index !7
  %memload11 = load i64, i64* %15, align 1, !ROData_Content !8
  %memref-disp12 = add i64 %memload9, 8
  %16 = inttoptr i64 %memref-disp12 to i64*
  store i64 %memload11, i64* %16, align 1
  %memload13 = load i64, i64* %RBP_N.16, align 1
  %EAX14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 45), i64 %memload13)
  %memload15 = load i64, i64* %RBP_N.24, align 1
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 52), i64 %memload15)
  %memload17 = load i64, i64* %RBP_N.16, align 1
  %17 = inttoptr i64 %memload17 to i32*
  %memload18 = load i32, i32* %17, align 1
  %18 = trunc i32 %memload18 to i8
  %EAX19 = sext i8 %18 to i32
  %19 = sub i32 %EAX19, 72
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX19, i32 72)
  %CF = extractvalue { i32, i1 } %20, 1
  %ZF = icmp eq i32 %19, 0
  %highbit = and i32 -2147483648, %19
  %SF = icmp ne i32 %highbit, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX19, i32 72)
  %OF = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF = icmp eq i32 %24, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 59))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload21 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload21
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
!5 = !{i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 39)}
!6 = !{!5}
!7 = !{i8* getelementptr inbounds ([128 x i8], [128 x i8]* @rodata_15, i32 0, i32 47)}
!8 = !{!7}
