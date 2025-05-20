; ModuleID = './bin/uaf_if_statement'
source_filename = "./bin/uaf_if_statement"

@rodata_18 = private unnamed_addr constant [90 x i8] c"\01\00\02\00\00\00\00\00%c\0A\00FREED!\00\00\00\00\00\00Test Failed: Use After Free - condition check on a freed pointer!\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

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
  %2 = zext i32 1 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %RBP_N.8, align 1
  %4 = inttoptr i64 %memload to ptr
  store i8 65, ptr %4, align 1
  %memload1 = load i64, ptr %RBP_N.8, align 1
  %5 = inttoptr i64 %memload1 to ptr
  %memload2 = load i32, ptr %5, align 1
  %6 = trunc i32 %memload2 to i8
  %EAX = zext i8 %6 to i32
  %7 = sub i32 %EAX, 88
  %8 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX, i32 88)
  %CF = extractvalue { i32, i1 } %8, 1
  %ZF = icmp eq i32 %7, 0
  %highbit = and i32 -2147483648, %7
  %SF = icmp ne i32 %highbit, 0
  %9 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX, i32 88)
  %OF = extractvalue { i32, i1 } %9, 1
  %10 = and i32 %7, 255
  %11 = call i32 @llvm.ctpop.i32(i32 %10)
  %12 = and i32 %11, 1
  %PF = icmp eq i32 %12, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, ptr %RBP_N.8, align 1
  %13 = inttoptr i64 %memload3 to ptr
  %memload4 = load i32, ptr %13, align 1
  %14 = trunc i32 %memload4 to i8
  %EAX5 = zext i8 %14 to i32
  %15 = trunc i32 %EAX5 to i8
  %EAX6 = sext i8 %15 to i32
  %EAX8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 8), i32 %EAX6)
  %memload9 = load i64, ptr %RBP_N.8, align 1
  %16 = inttoptr i64 %memload9 to ptr
  store i8 65, ptr %16, align 1
  %memload10 = load i64, ptr %RBP_N.8, align 1
  %17 = inttoptr i64 %memload10 to ptr
  call void @free(ptr %17)
  %EAX12 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 12))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload13 = load i64, ptr %RBP_N.8, align 1
  %18 = inttoptr i64 %memload13 to ptr
  %memload14 = load i32, ptr %18, align 1
  %19 = trunc i32 %memload14 to i8
  %EAX15 = zext i8 %19 to i32
  %20 = trunc i32 %EAX15 to i8
  %21 = trunc i32 %EAX15 to i8
  %22 = and i8 %20, %21
  %highbit16 = and i8 -128, %22
  %SF17 = icmp ne i8 %highbit16, 0
  %ZF18 = icmp eq i8 %22, 0
  %23 = call i8 @llvm.ctpop.i8(i8 %22)
  %24 = and i8 %23, 1
  %PF19 = icmp eq i8 %24, 0
  %CmpZF_JE30 = icmp eq i1 %ZF18, true
  br i1 %CmpZF_JE30, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX21 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 24))
  %memload22 = load i64, ptr %RBP_N.8, align 1
  %25 = inttoptr i64 %memload22 to ptr
  %memload23 = load i32, ptr %25, align 1
  %26 = trunc i32 %memload23 to i8
  %EAX24 = zext i8 %26 to i32
  %27 = trunc i32 %EAX24 to i8
  %EAX25 = sext i8 %27 to i32
  %EAX27 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 8), i32 %EAX25)
  br label %bb.5

bb.4:                                             ; preds = %bb.2
  %EAX29 = call i32 @puts(ptr getelementptr inbounds ([90 x i8], ptr @rodata_18, i32 0, i32 24))
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
declare i8 @llvm.ctpop.i8(i8) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
