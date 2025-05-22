; ModuleID = './bin/oobr_negative_array_index'
source_filename = "./bin/oobr_negative_array_index"

@rodata_15 = private unnamed_addr constant [136 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\0A\00\00\00Value is: %d\0A\00Test Failed: Out of Bounds Read caused by negative array indices\0A\00", align 16, !ROData_SecInfo !0

declare dso_local i8* @memcpy(i8*, i8*, i64)

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %RSPAdj_N.80 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 20
  %RBP_N.68 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.64 = bitcast i8* %1 to i64*
  %2 = getelementptr i8, i8* %stktop_8, i64 76
  %RBP_N.12 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 80
  %RBP_N.8 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 84
  %RBP_N.4 = bitcast i8* %4 to i32*
  %5 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %5 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 10, i32* %RBP_N.12, align 1
  %6 = bitcast i64* %RBP_N.64 to i8*
  %7 = zext i32 40 to i64
  %8 = call i8* @memcpy(i8* %6, i8* getelementptr inbounds ([136 x i8], [136 x i8]* @rodata_15, i32 0, i32 16), i64 %7)
  %RAX = ptrtoint i8* %8 to i64
  store i32 -5, i32* %RBP_N.68, align 1
  %memload = load i32, i32* %RBP_N.68, align 1
  %9 = load i32, i32* %RBP_N.12, align 1
  %10 = sub i32 %memload, %9
  %11 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload, i32 %9)
  %CF = extractvalue { i32, i1 } %11, 1
  %ZF = icmp eq i32 %10, 0
  %highbit = and i32 -2147483648, %10
  %SF = icmp ne i32 %highbit, 0
  %12 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload, i32 %9)
  %OF = extractvalue { i32, i1 } %12, 1
  %13 = and i32 %10, 255
  %14 = call i32 @llvm.ctpop.i32(i32 %13)
  %15 = and i32 %14, 1
  %PF = icmp eq i32 %15, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.4, label %bb.1

bb.1:                                             ; preds = %entry
  %16 = bitcast i32* %RBP_N.68 to i64*
  %memload1 = load i64, i64* %16, align 1
  %17 = trunc i64 %memload1 to i32
  %RAX2 = sext i32 %17 to i64
  %sc-m = mul i64 4, %RAX2
  %18 = bitcast i64* %RBP_N.64 to i8*
  %19 = getelementptr i8, i8* %18, i64 %sc-m
  %20 = bitcast i8* %19 to i64*
  %21 = bitcast i64* %20 to i32*
  %memload3 = load i32, i32* %21, align 1
  store i32 %memload3, i32* %RBP_N.8, align 1
  %22 = bitcast i32* %RBP_N.68 to i64*
  %memload4 = load i64, i64* %22, align 1
  %23 = trunc i64 %memload4 to i32
  %RAX5 = sext i32 %23 to i64
  %sc-m6 = mul i64 4, %RAX5
  %24 = bitcast i64* %RBP_N.64 to i8*
  %25 = getelementptr i8, i8* %24, i64 %sc-m6
  %26 = bitcast i8* %25 to i64*
  %27 = bitcast i64* %26 to i32*
  %memload8 = load i32, i32* %27, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([136 x i8], [136 x i8]* @rodata_15, i32 0, i32 56), i32 %memload8)
  %28 = load i32, i32* %RBP_N.8, align 1
  %29 = zext i32 %28 to i64
  %30 = zext i32 0 to i64
  %31 = sub i64 %29, %30
  %32 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %29, i64 %30)
  %CF9 = extractvalue { i64, i1 } %32, 1
  %ZF10 = icmp eq i64 %31, 0
  %highbit11 = and i64 -9223372036854775808, %31
  %SF12 = icmp ne i64 %highbit11, 0
  %33 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %29, i64 %30)
  %OF13 = extractvalue { i64, i1 } %33, 1
  %34 = and i64 %31, 255
  %35 = call i64 @llvm.ctpop.i64(i64 %34)
  %36 = and i64 %35, 1
  %PF14 = icmp eq i64 %36, 0
  %CmpZF_JE = icmp eq i1 %ZF10, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([136 x i8], [136 x i8]* @rodata_15, i32 0, i32 70))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.5

bb.4:                                             ; preds = %entry
  store i32 -1, i32* %RBP_N.8, align 1
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
