; ModuleID = './bin/df_with_oobw'
source_filename = "./bin/df_with_oobw"

@rodata_15 = private unnamed_addr constant [84 x i8] c"\01\00\02\00b: %p\0A\0A\00x\00c: %p\0Ad: %p\0A\00Test Failed: Metadata corruption leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

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
  %memload = load i64, i64* %RBP_N.24, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload2 = load i64, i64* %RBP_N.24, align 1
  %10 = inttoptr i64 %memload2 to i8*
  call void @free(i8* %10)
  %memload3 = load i64, i64* %RBP_N.16, align 1
  %memload4 = load i8, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 12), align 1, !ROData_Content !1
  %memref-disp = add i64 %memload3, 40
  %11 = inttoptr i64 %memref-disp to i8*
  store i8 %memload4, i8* %11, align 1
  %memload5 = load i64, i64* %RBP_N.24, align 1
  %12 = inttoptr i64 %memload5 to i8*
  call void @free(i8* %12)
  %13 = zext i32 16 to i64
  %14 = call i8* @malloc(i64 %13)
  %RAX6 = ptrtoint i8* %14 to i64
  store i64 %RAX6, i64* %RBP_N.32, align 1
  %15 = zext i32 16 to i64
  %16 = call i8* @malloc(i64 %15)
  %RAX7 = ptrtoint i8* %16 to i64
  store i64 %RAX7, i64* %RBP_N.40, align 1
  %memload8 = load i64, i64* %RBP_N.32, align 1
  %memload9 = load i64, i64* %RBP_N.40, align 1
  %EAX10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 14), i64 %memload8, i64 %memload9)
  %memload11 = load i64, i64* %RBP_N.32, align 1
  %17 = load i64, i64* %RBP_N.40, align 1
  %18 = sub i64 %memload11, %17
  %19 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload11, i64 %17)
  %CF = extractvalue { i64, i1 } %19, 1
  %ZF = icmp eq i64 %18, 0
  %highbit = and i64 -9223372036854775808, %18
  %SF = icmp ne i64 %highbit, 0
  %20 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload11, i64 %17)
  %OF = extractvalue { i64, i1 } %20, 1
  %21 = and i64 %18, 255
  %22 = call i64 @llvm.ctpop.i64(i64 %21)
  %23 = and i64 %22, 1
  %PF = icmp eq i64 %23, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 27))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload13 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload13
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 12)}
