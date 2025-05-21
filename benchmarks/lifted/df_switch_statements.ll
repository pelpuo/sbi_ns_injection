; ModuleID = './bin/df_switch_statements'
source_filename = "./bin/df_switch_statements"

@rodata_15 = private unnamed_addr constant [126 x i8] c"\01\00\02\00Char is %s\0A\00DEFAULT\00\0Aa: %p\0A\00b: %p\0A\00c: %p\0A\00Test Failed: Switch fallthrough with metadata overwrite leading to Double Free\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.36 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.32 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.24 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 40
  %RBP_N.16 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %5 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX = ptrtoint ptr %7 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %8 = inttoptr i64 %memload to ptr
  store i8 67, ptr %8, align 1
  %memload1 = load i64, ptr %RBP_N.16, align 1
  %9 = inttoptr i64 %memload1 to ptr
  %memload2 = load i32, ptr %9, align 1
  %10 = trunc i32 %memload2 to i8
  %EAX = sext i8 %10 to i32
  store i32 %EAX, ptr %RBP_N.36, align 1
  %EAX3 = sub i32 %EAX, 65
  %11 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX, i32 65)
  %CF = extractvalue { i32, i1 } %11, 1
  %12 = and i32 %EAX3, 255
  %13 = call i32 @llvm.ctpop.i32(i32 %12)
  %14 = and i32 %13, 1
  %PF = icmp eq i32 %14, 0
  %ZF = icmp eq i32 %EAX3, 0
  %highbit = and i32 -2147483648, %EAX3
  %SF = icmp ne i32 %highbit, 0
  %15 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX, i32 65)
  %OF = extractvalue { i32, i1 } %15, 1
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.6, label %bb.1

bb.1:                                             ; preds = %entry
  br label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload4 = load i32, ptr %RBP_N.36, align 1
  %EAX11 = sub i32 %memload4, 66
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload4, i32 66)
  %CF5 = extractvalue { i32, i1 } %16, 1
  %17 = and i32 %EAX11, 255
  %18 = call i32 @llvm.ctpop.i32(i32 %17)
  %19 = and i32 %18, 1
  %PF6 = icmp eq i32 %19, 0
  %ZF7 = icmp eq i32 %EAX11, 0
  %highbit8 = and i32 -2147483648, %EAX11
  %SF9 = icmp ne i32 %highbit8, 0
  %20 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload4, i32 66)
  %OF10 = extractvalue { i32, i1 } %20, 1
  %CmpZF_JE52 = icmp eq i1 %ZF7, true
  br i1 %CmpZF_JE52, label %bb.7, label %bb.3

bb.3:                                             ; preds = %bb.2
  br label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload12 = load i32, ptr %RBP_N.36, align 1
  %EAX19 = sub i32 %memload12, 67
  %21 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload12, i32 67)
  %CF13 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %EAX19, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF14 = icmp eq i32 %24, 0
  %ZF15 = icmp eq i32 %EAX19, 0
  %highbit16 = and i32 -2147483648, %EAX19
  %SF17 = icmp ne i32 %highbit16, 0
  %25 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload12, i32 67)
  %OF18 = extractvalue { i32, i1 } %25, 1
  %CmpZF_JE53 = icmp eq i1 %ZF15, true
  br i1 %CmpZF_JE53, label %bb.8, label %bb.5

bb.5:                                             ; preds = %bb.4
  br label %bb.9

bb.6:                                             ; preds = %entry
  %memload20 = load i64, ptr %RBP_N.16, align 1
  %EAX21 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload20)
  %memload22 = load i64, ptr %RBP_N.16, align 1
  %26 = inttoptr i64 %memload22 to ptr
  call void @free(ptr %26)
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.2
  %memload23 = load i64, ptr %RBP_N.16, align 1
  %EAX24 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload23)
  %memload25 = load i64, ptr %RBP_N.16, align 1
  %27 = inttoptr i64 %memload25 to ptr
  call void @free(ptr %27)
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.4
  %memload26 = load i64, ptr %RBP_N.16, align 1
  %EAX27 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload26)
  %memload28 = load i64, ptr %RBP_N.16, align 1
  %28 = inttoptr i64 %memload28 to ptr
  call void @free(ptr %28)
  br label %bb.9

bb.9:                                             ; preds = %bb.8, %bb.5
  %memload29 = load i64, ptr %RBP_N.16, align 1
  %memload30 = load i64, ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 16), align 1, !ROData_Content !1
  %29 = inttoptr i64 %memload29 to ptr
  store i64 %memload30, ptr %29, align 1
  %memload31 = load i64, ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 24), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload29, 8
  %30 = inttoptr i64 %memref-disp to ptr
  store i64 %memload31, ptr %30, align 1
  %memload32 = load i64, ptr %RBP_N.16, align 1
  %EAX33 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 4), i64 %memload32)
  %memload34 = load i64, ptr %RBP_N.16, align 1
  %31 = inttoptr i64 %memload34 to ptr
  call void @free(ptr %31)
  %32 = zext i32 16 to i64
  %33 = call ptr @malloc(i64 %32)
  %RAX35 = ptrtoint ptr %33 to i64
  store i64 %RAX35, ptr %RBP_N.24, align 1
  %34 = zext i32 16 to i64
  %35 = call ptr @malloc(i64 %34)
  %RAX36 = ptrtoint ptr %35 to i64
  store i64 %RAX36, ptr %RBP_N.32, align 1
  %memload37 = load i64, ptr %RBP_N.16, align 1
  %EAX38 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 24), i64 %memload37)
  %memload39 = load i64, ptr %RBP_N.24, align 1
  %EAX40 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 32), i64 %memload39)
  %memload41 = load i64, ptr %RBP_N.32, align 1
  %EAX42 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 39), i64 %memload41)
  %memload43 = load i64, ptr %RBP_N.24, align 1
  %36 = load i64, ptr %RBP_N.32, align 1
  %37 = sub i64 %memload43, %36
  %38 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload43, i64 %36)
  %CF44 = extractvalue { i64, i1 } %38, 1
  %ZF45 = icmp eq i64 %37, 0
  %highbit46 = and i64 -9223372036854775808, %37
  %SF47 = icmp ne i64 %highbit46, 0
  %39 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload43, i64 %36)
  %OF48 = extractvalue { i64, i1 } %39, 1
  %40 = and i64 %37, 255
  %41 = call i64 @llvm.ctpop.i64(i64 %40)
  %42 = and i64 %41, 1
  %PF49 = icmp eq i64 %42, 0
  %CmpZF_JNE = icmp eq i1 %ZF45, false
  br i1 %CmpZF_JNE, label %bb.11, label %bb.10

bb.10:                                            ; preds = %bb.9
  %EAX50 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 46))
  br label %bb.11

bb.11:                                            ; preds = %bb.10, %bb.9
  %memload51 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload51
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 16)}
!2 = !{ptr getelementptr inbounds ([126 x i8], ptr @rodata_15, i32 0, i32 24)}
