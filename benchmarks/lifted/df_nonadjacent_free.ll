; ModuleID = './bin/df_nonadjacent_free'
source_filename = "./bin/df_nonadjacent_free"

@rodata_15 = private unnamed_addr constant [121 x i8] c"\01\00\02\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00b: %p\0Ac: %p\0A\00Test Failed: Non-adjacent free sequence leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.40 = bitcast i8* %0 to i64*
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
  %10 = bitcast i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* %10, align 1, !ROData_Content !2
  %11 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %11, align 1
  %12 = bitcast i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* %12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %13 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %13, align 1
  %memload4 = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 20), i64 %memload4)
  %memload5 = load i64, i64* %RBP_N.16, align 1
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 36), i64 %memload5)
  %memload7 = load i64, i64* %RBP_N.16, align 1
  %14 = inttoptr i64 %memload7 to i8*
  call void @free(i8* %14)
  %memload8 = load i64, i64* %RBP_N.24, align 1
  %15 = inttoptr i64 %memload8 to i8*
  call void @free(i8* %15)
  %memload9 = load i64, i64* %RBP_N.16, align 1
  %16 = inttoptr i64 %memload9 to i8*
  call void @free(i8* %16)
  %17 = zext i32 10 to i64
  %18 = call i8* @malloc(i64 %17)
  %RAX10 = ptrtoint i8* %18 to i64
  store i64 %RAX10, i64* %RBP_N.32, align 1
  %19 = zext i32 10 to i64
  %20 = call i8* @malloc(i64 %19)
  %RAX11 = ptrtoint i8* %20 to i64
  store i64 %RAX11, i64* %RBP_N.40, align 1
  %memload12 = load i64, i64* %RBP_N.32, align 1
  %memload13 = load i64, i64* %RBP_N.40, align 1
  %EAX14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 44), i64 %memload12, i64 %memload13)
  %memload15 = load i64, i64* %RBP_N.32, align 1
  %21 = load i64, i64* %RBP_N.40, align 1
  %22 = sub i64 %memload15, %21
  %23 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload15, i64 %21)
  %CF = extractvalue { i64, i1 } %23, 1
  %ZF = icmp eq i64 %22, 0
  %highbit = and i64 -9223372036854775808, %22
  %SF = icmp ne i64 %highbit, 0
  %24 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload15, i64 %21)
  %OF = extractvalue { i64, i1 } %24, 1
  %25 = and i64 %22, 255
  %26 = call i64 @llvm.ctpop.i64(i64 %25)
  %27 = and i64 %26, 1
  %PF = icmp eq i64 %27, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 57))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload17 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload17
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
