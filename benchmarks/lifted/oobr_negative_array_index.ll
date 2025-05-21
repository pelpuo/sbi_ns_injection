; ModuleID = './bin/oobr_negative_array_index'
source_filename = "./bin/oobr_negative_array_index"

@rodata_15 = private unnamed_addr constant [136 x i8] c"\01\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\0A\00\00\00Value is: %d\0A\00Test Failed: Out of Bounds Read caused by negative array indices\0A\00", align 16, !ROData_SecInfo !0

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 88, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.68 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %2 = inttoptr i64 %1 to ptr
  %3 = add i64 %tos, 76
  %RBP_N.12 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 80
  %RBP_N.8 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 84
  %RBP_N.4 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i32 10, ptr %RBP_N.12, align 1
  %7 = zext i32 40 to i64
  %8 = call ptr @memcpy(ptr %2, ptr getelementptr inbounds ([136 x i8], ptr @rodata_15, i32 0, i32 16), i64 %7)
  %RAX = ptrtoint ptr %8 to i64
  store i32 -5, ptr %RBP_N.68, align 1
  %memload = load i32, ptr %RBP_N.68, align 1
  %9 = load i32, ptr %RBP_N.12, align 1
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
  %memload1 = load i64, ptr %RBP_N.68, align 1
  %16 = trunc i64 %memload1 to i32
  %RAX2 = sext i32 %16 to i64
  %sc-m = mul i64 4, %RAX2
  %17 = getelementptr i8, ptr %2, i64 %sc-m
  %memload3 = load i32, ptr %17, align 1
  store i32 %memload3, ptr %RBP_N.8, align 1
  %memload4 = load i64, ptr %RBP_N.68, align 1
  %18 = trunc i64 %memload4 to i32
  %RAX5 = sext i32 %18 to i64
  %sc-m6 = mul i64 4, %RAX5
  %19 = getelementptr i8, ptr %2, i64 %sc-m6
  %memload8 = load i32, ptr %19, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([136 x i8], ptr @rodata_15, i32 0, i32 56), i32 %memload8)
  %20 = load i32, ptr %RBP_N.8, align 1
  %21 = zext i32 %20 to i64
  %22 = zext i32 0 to i64
  %23 = sub i64 %21, %22
  %24 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %21, i64 %22)
  %CF9 = extractvalue { i64, i1 } %24, 1
  %ZF10 = icmp eq i64 %23, 0
  %highbit11 = and i64 -9223372036854775808, %23
  %SF12 = icmp ne i64 %highbit11, 0
  %25 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %21, i64 %22)
  %OF13 = extractvalue { i64, i1 } %25, 1
  %26 = and i64 %23, 255
  %27 = call i64 @llvm.ctpop.i64(i64 %26)
  %28 = and i64 %27, 1
  %PF14 = icmp eq i64 %28, 0
  %CmpZF_JE = icmp eq i1 %ZF10, true
  br i1 %CmpZF_JE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX15 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([136 x i8], ptr @rodata_15, i32 0, i32 70))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  br label %bb.5

bb.4:                                             ; preds = %entry
  store i32 -1, ptr %RBP_N.8, align 1
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
