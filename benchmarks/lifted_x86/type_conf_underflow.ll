; ModuleID = './bin/type_conf_underflow'
source_filename = "./bin/type_conf_underflow"

@rodata_18 = private unnamed_addr constant [153 x i8] c"\01\00\02\00\00\00\00\00AAAAAA\00Public\00Fetching char at index %d\0A\00Fetched char: %c\0A\00\00\00\00\00\00Test Failed: OOB access caused by int->short overflow leading to array underread\00", align 8, !ROData_SecInfo !0

define dso_local i32 @get_char(i32 %arg1) {
entry:
  %stktop_2 = alloca i8, i32 28, align 1
  %tos = ptrtoint ptr %stktop_2 to i64
  %0 = add i64 %tos, 12
  %RBP_N.16 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.8 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %2 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %3 = trunc i32 %arg1 to i16
  store i16 %3, ptr %stktop_2, align 1
  %RAX = ptrtoint ptr getelementptr inbounds ([153 x i8], ptr @rodata_18, i32 0, i32 8) to i64, !ROData_Index !1
  store i64 %RAX, ptr %RBP_N.16, align 1
  %RAX1 = ptrtoint ptr getelementptr inbounds ([153 x i8], ptr @rodata_18, i32 0, i32 15) to i64, !ROData_Index !2
  store i64 %RAX1, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %stktop_2, align 1
  %4 = trunc i64 %memload to i16
  %RDX = sext i16 %4 to i64
  %memload2 = load i64, ptr %RBP_N.8, align 1
  %RAX3 = add nsw i64 %memload2, %RDX
  %highbit = and i64 -9223372036854775808, %RAX3
  %SF = icmp ne i64 %highbit, 0
  %ZF = icmp eq i64 %RAX3, 0
  %5 = inttoptr i64 %RAX3 to ptr
  %memload4 = load i32, ptr %5, align 1
  %6 = trunc i32 %memload4 to i8
  %EAX = zext i8 %6 to i32
  ret i32 %EAX
}

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.4 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %2 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 65536, ptr %RBP_N.8, align 1
  store i32 2, ptr %RBP_N.4, align 1
  %memload = load i32, ptr %RBP_N.4, align 1
  %3 = load i32, ptr %RBP_N.8, align 1
  %4 = zext i32 %3 to i64
  %5 = zext i32 %memload to i64
  %6 = sub i64 %4, %5
  %7 = trunc i64 %6 to i32
  store i32 %7, ptr %RBP_N.8, align 4
  %8 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %4, i64 %5)
  %CF = extractvalue { i64, i1 } %8, 1
  %ZF = icmp eq i32 %7, 0
  %highbit = and i32 -2147483648, %7
  %SF = icmp ne i32 %highbit, 0
  %9 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %4, i64 %5)
  %OF = extractvalue { i64, i1 } %9, 1
  %10 = and i32 %7, 255
  %11 = call i32 @llvm.ctpop.i32(i32 %10)
  %12 = and i32 %11, 1
  %PF = icmp eq i32 %12, 0
  %13 = ptrtoint ptr %stktop_8 to i64
  %14 = add i64 %13, 4
  %15 = inttoptr i64 %14 to ptr
  store i32 1, ptr %15, align 1
  %memload1 = load i32, ptr %RBP_N.8, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([153 x i8], ptr @rodata_18, i32 0, i32 22), i32 %memload1)
  %memload2 = load i32, ptr %RBP_N.8, align 1
  %16 = trunc i32 %memload2 to i16
  %EAX3 = sext i16 %16 to i32
  %EAX4 = call i32 @get_char(i32 %EAX3)
  %17 = ptrtoint ptr %stktop_8 to i64
  %18 = add i64 %17, 3
  %19 = trunc i32 %EAX4 to i8
  %20 = inttoptr i64 %18 to ptr
  store i8 %19, ptr %20, align 1
  %21 = ptrtoint ptr %stktop_8 to i64
  %22 = add i64 %21, 3
  %23 = inttoptr i64 %22 to ptr
  %memload5 = load i32, ptr %23, align 1
  %24 = trunc i32 %memload5 to i8
  %EAX6 = sext i8 %24 to i32
  %EAX8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([153 x i8], ptr @rodata_18, i32 0, i32 49), i32 %EAX6)
  %25 = ptrtoint ptr %stktop_8 to i64
  %26 = add i64 %25, 3
  %27 = inttoptr i64 %26 to ptr
  %28 = load i8, ptr %27, align 1
  %29 = zext i8 %28 to i64
  %30 = zext i8 65 to i64
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
  %CmpZF_JNE = icmp eq i1 %ZF10, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %37 = ptrtoint ptr %stktop_8 to i64
  %38 = add i64 %37, 4
  %39 = inttoptr i64 %38 to ptr
  store i32 0, ptr %39, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %40 = ptrtoint ptr %stktop_8 to i64
  %41 = add i64 %40, 4
  %42 = inttoptr i64 %41 to ptr
  %43 = load i32, ptr %42, align 1
  %44 = zext i32 %43 to i64
  %45 = zext i32 0 to i64
  %46 = sub i64 %44, %45
  %47 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %44, i64 %45)
  %CF15 = extractvalue { i64, i1 } %47, 1
  %ZF16 = icmp eq i64 %46, 0
  %highbit17 = and i64 -9223372036854775808, %46
  %SF18 = icmp ne i64 %highbit17, 0
  %48 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %44, i64 %45)
  %OF19 = extractvalue { i64, i1 } %48, 1
  %49 = and i64 %46, 255
  %50 = call i64 @llvm.ctpop.i64(i64 %49)
  %51 = and i64 %50, 1
  %PF20 = icmp eq i64 %51, 0
  %CmpZF_JNE23 = icmp eq i1 %ZF16, false
  br i1 %CmpZF_JNE23, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX22 = call i32 @puts(ptr getelementptr inbounds ([153 x i8], ptr @rodata_18, i32 0, i32 72))
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
!1 = !{ptr getelementptr inbounds ([153 x i8], ptr @rodata_18, i32 0, i32 8)}
!2 = !{ptr getelementptr inbounds ([153 x i8], ptr @rodata_18, i32 0, i32 15)}
