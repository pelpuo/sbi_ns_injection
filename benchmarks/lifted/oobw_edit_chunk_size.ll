; ModuleID = './bin/oobw_edit_chunk_size'
source_filename = "./bin/oobw_edit_chunk_size"

@rodata_15 = private unnamed_addr constant [84 x i8] c"\01\00\02\00c: %p\0A\00d: %p\0A\0A\00g: %p\0A\00h: %p\0A\00Test Failed: Out of Bounds write to heap metadata\0A\00", align 4, !ROData_SecInfo !0

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
  %10 = zext i32 16 to i64
  %11 = call i8* @malloc(i64 %10)
  %RAX2 = ptrtoint i8* %11 to i64
  store i64 %RAX2, i64* %RBP_N.32, align 1
  %memload = load i64, i64* %RBP_N.16, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 4), i64 %memload)
  %memload3 = load i64, i64* %RBP_N.24, align 1
  %EAX4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 11), i64 %memload3)
  %memload5 = load i64, i64* %RBP_N.16, align 1
  %memref-disp = add i64 %memload5, 24
  %12 = inttoptr i64 %memref-disp to i8*
  store i8 49, i8* %12, align 1
  %memload6 = load i64, i64* %RBP_N.24, align 1
  %13 = inttoptr i64 %memload6 to i8*
  call void @free(i8* %13)
  %14 = zext i32 32 to i64
  %15 = call i8* @malloc(i64 %14)
  %RAX7 = ptrtoint i8* %15 to i64
  store i64 %RAX7, i64* %RBP_N.40, align 1
  %16 = zext i32 16 to i64
  %17 = call i8* @malloc(i64 %16)
  %RAX8 = ptrtoint i8* %17 to i64
  store i64 %RAX8, i64* %RSPAdj_N.48, align 1
  %memload9 = load i64, i64* %RBP_N.40, align 1
  %EAX10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 19), i64 %memload9)
  %memload11 = load i64, i64* %RSPAdj_N.48, align 1
  %EAX12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 26), i64 %memload11)
  %memload13 = load i64, i64* %RBP_N.40, align 1
  %18 = load i64, i64* %RBP_N.24, align 1
  %19 = sub i64 %memload13, %18
  %20 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload13, i64 %18)
  %CF = extractvalue { i64, i1 } %20, 1
  %ZF = icmp eq i64 %19, 0
  %highbit = and i64 -9223372036854775808, %19
  %SF = icmp ne i64 %highbit, 0
  %21 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload13, i64 %18)
  %OF = extractvalue { i64, i1 } %21, 1
  %22 = and i64 %19, 255
  %23 = call i64 @llvm.ctpop.i64(i64 %22)
  %24 = and i64 %23, 1
  %PF = icmp eq i64 %24, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([84 x i8], [84 x i8]* @rodata_15, i32 0, i32 33))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload15 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload15
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
