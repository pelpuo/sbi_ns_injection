; ModuleID = './bin/oobr_direct_index_string'
source_filename = "./bin/oobr_direct_index_string"

@rodata_18 = private unnamed_addr constant [174 x i8] c"\01\00\02\00\00\00\00\00abcde\00fghij\00\00\00\00\00Last element of string 1 is: %c\0A\00\00\00\00\00\00\00\00Null terminator for string 1: %d\0A\00Out of bounds read: %c\0A\00\00\00\00\00\00\00Test Failed: Simple String Out of Bounds Read\00", align 8, !ROData_SecInfo !0

declare dso_local i32 @printf(ptr, ...)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %RAX = ptrtoint ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 8) to i64, !ROData_Index !1
  store i64 %RAX, ptr %stktop_8, align 1
  %RAX1 = ptrtoint ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 14) to i64, !ROData_Index !2
  store i64 %RAX1, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %RAX2 = add i64 %memload, 4
  %2 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload, i64 4)
  %CF = extractvalue { i64, i1 } %2, 1
  %3 = and i64 %RAX2, 255
  %4 = call i64 @llvm.ctpop.i64(i64 %3)
  %5 = and i64 %4, 1
  %PF = icmp eq i64 %5, 0
  %ZF = icmp eq i64 %RAX2, 0
  %highbit = and i64 -9223372036854775808, %RAX2
  %SF = icmp ne i64 %highbit, 0
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload, i64 4)
  %OF = extractvalue { i64, i1 } %6, 1
  %7 = inttoptr i64 %RAX2 to ptr
  %memload3 = load i32, ptr %7, align 1
  %8 = trunc i32 %memload3 to i8
  %EAX = zext i8 %8 to i32
  %9 = trunc i32 %EAX to i8
  %EAX4 = sext i8 %9 to i32
  %EAX6 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 24), i32 %EAX4)
  %memload7 = load i64, ptr %stktop_8, align 1
  %RAX14 = add i64 %memload7, 5
  %10 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload7, i64 5)
  %CF8 = extractvalue { i64, i1 } %10, 1
  %11 = and i64 %RAX14, 255
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = and i64 %12, 1
  %PF9 = icmp eq i64 %13, 0
  %ZF10 = icmp eq i64 %RAX14, 0
  %highbit11 = and i64 -9223372036854775808, %RAX14
  %SF12 = icmp ne i64 %highbit11, 0
  %14 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload7, i64 5)
  %OF13 = extractvalue { i64, i1 } %14, 1
  %15 = inttoptr i64 %RAX14 to ptr
  %memload15 = load i32, ptr %15, align 1
  %16 = trunc i32 %memload15 to i8
  %EAX16 = zext i8 %16 to i32
  %17 = trunc i32 %EAX16 to i8
  %EAX17 = sext i8 %17 to i32
  %EAX19 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 64), i32 %EAX17)
  %memload20 = load i64, ptr %stktop_8, align 1
  %RAX27 = add i64 %memload20, 6
  %18 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload20, i64 6)
  %CF21 = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %RAX27, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF22 = icmp eq i64 %21, 0
  %ZF23 = icmp eq i64 %RAX27, 0
  %highbit24 = and i64 -9223372036854775808, %RAX27
  %SF25 = icmp ne i64 %highbit24, 0
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload20, i64 6)
  %OF26 = extractvalue { i64, i1 } %22, 1
  %23 = inttoptr i64 %RAX27 to ptr
  %memload28 = load i32, ptr %23, align 1
  %24 = trunc i32 %memload28 to i8
  %EAX29 = zext i8 %24 to i32
  %25 = trunc i32 %EAX29 to i8
  %EAX30 = sext i8 %25 to i32
  %EAX32 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 98), i32 %EAX30)
  %memload33 = load i64, ptr %stktop_8, align 1
  %RAX40 = add i64 %memload33, 6
  %26 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload33, i64 6)
  %CF34 = extractvalue { i64, i1 } %26, 1
  %27 = and i64 %RAX40, 255
  %28 = call i64 @llvm.ctpop.i64(i64 %27)
  %29 = and i64 %28, 1
  %PF35 = icmp eq i64 %29, 0
  %ZF36 = icmp eq i64 %RAX40, 0
  %highbit37 = and i64 -9223372036854775808, %RAX40
  %SF38 = icmp ne i64 %highbit37, 0
  %30 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload33, i64 6)
  %OF39 = extractvalue { i64, i1 } %30, 1
  %31 = inttoptr i64 %RAX40 to ptr
  %memload41 = load i32, ptr %31, align 1
  %32 = trunc i32 %memload41 to i8
  %EAX42 = zext i8 %32 to i32
  %33 = trunc i32 %EAX42 to i8
  %34 = trunc i32 %EAX42 to i8
  %35 = and i8 %33, %34
  %highbit43 = and i8 -128, %35
  %SF44 = icmp ne i8 %highbit43, 0
  %ZF45 = icmp eq i8 %35, 0
  %36 = call i8 @llvm.ctpop.i8(i8 %35)
  %37 = and i8 %36, 1
  %PF46 = icmp eq i8 %37, 0
  %CmpZF_JE = icmp eq i1 %ZF45, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX48 = call i32 @puts(ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 128))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.ctpop.i8(i8) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
!1 = !{ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 8)}
!2 = !{ptr getelementptr inbounds ([174 x i8], ptr @rodata_18, i32 0, i32 14)}
