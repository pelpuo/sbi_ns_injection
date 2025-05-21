; ModuleID = './bin/uaf_if_statement'
source_filename = "./bin/uaf_if_statement"

@rodata_15 = private unnamed_addr constant [83 x i8] c"\01\00\02\00%c\0A\00FREED!\0A\00Test Failed: Use After Free - condition check on a freed pointer!\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.4 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %2 = zext i32 1 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr %stktop_8, align 1
  %memload = load i64, ptr %stktop_8, align 1
  %4 = inttoptr i64 %memload to ptr
  store i8 65, ptr %4, align 1
  %memload1 = load i64, ptr %stktop_8, align 1
  %5 = inttoptr i64 %memload1 to ptr
  %memload2 = load i32, ptr %5, align 1
  %6 = trunc i32 %memload2 to i8
  %EAX = sext i8 %6 to i32
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
  %memload3 = load i64, ptr %stktop_8, align 1
  %13 = inttoptr i64 %memload3 to ptr
  %memload4 = load i32, ptr %13, align 1
  %14 = trunc i32 %memload4 to i8
  %ESI = sext i8 %14 to i32
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([83 x i8], ptr @rodata_15, i32 0, i32 4), i32 %ESI)
  %memload6 = load i64, ptr %stktop_8, align 1
  %15 = inttoptr i64 %memload6 to ptr
  store i8 65, ptr %15, align 1
  %memload7 = load i64, ptr %stktop_8, align 1
  %16 = inttoptr i64 %memload7 to ptr
  call void @free(ptr %16)
  %EAX8 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([83 x i8], ptr @rodata_15, i32 0, i32 8))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload9 = load i64, ptr %stktop_8, align 1
  %17 = inttoptr i64 %memload9 to ptr
  %memload10 = load i32, ptr %17, align 1
  %18 = trunc i32 %memload10 to i8
  %EAX11 = sext i8 %18 to i32
  %19 = sub i32 %EAX11, 0
  %20 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX11, i32 0)
  %CF12 = extractvalue { i32, i1 } %20, 1
  %ZF13 = icmp eq i32 %19, 0
  %highbit14 = and i32 -2147483648, %19
  %SF15 = icmp ne i32 %highbit14, 0
  %21 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX11, i32 0)
  %OF16 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF17 = icmp eq i32 %24, 0
  %CmpZF_JE25 = icmp eq i1 %ZF13, true
  br i1 %CmpZF_JE25, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX18 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([83 x i8], ptr @rodata_15, i32 0, i32 16))
  %memload19 = load i64, ptr %stktop_8, align 1
  %25 = inttoptr i64 %memload19 to ptr
  %memload20 = load i32, ptr %25, align 1
  %26 = trunc i32 %memload20 to i8
  %ESI21 = sext i8 %26 to i32
  %EAX22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([83 x i8], ptr @rodata_15, i32 0, i32 4), i32 %ESI21)
  br label %bb.5

bb.4:                                             ; preds = %bb.2
  %EAX23 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([83 x i8], ptr @rodata_15, i32 0, i32 16))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload24 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload24
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
