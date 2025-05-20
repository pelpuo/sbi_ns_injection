; ModuleID = './bin/df_switch_statements'
source_filename = "./bin/df_switch_statements"

@rodata_18 = private unnamed_addr constant [135 x i8] c"\01\00\02\00\00\00\00\00Char is %s\0A\00DEFAULT\00\0Aa: %p\0A\00b: %p\0A\00c: %p\0A\00\00\00\00\00\00\00Test Failed: Switch fallthrough with metadata overwrite leading to Double Free\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @puts(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %6 = inttoptr i64 %memload to ptr
  store i8 67, ptr %6, align 1
  %memload1 = load i64, ptr %RBP_N.24, align 1
  %7 = inttoptr i64 %memload1 to ptr
  %memload2 = load i32, ptr %7, align 1
  %8 = trunc i32 %memload2 to i8
  %EAX = zext i8 %8 to i32
  %9 = trunc i32 %EAX to i8
  %EAX3 = sext i8 %9 to i32
  %10 = sub i32 %EAX3, 67
  %11 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX3, i32 67)
  %CF = extractvalue { i32, i1 } %11, 1
  %ZF = icmp eq i32 %10, 0
  %highbit = and i32 -2147483648, %10
  %SF = icmp ne i32 %highbit, 0
  %12 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX3, i32 67)
  %OF = extractvalue { i32, i1 } %12, 1
  %13 = and i32 %10, 255
  %14 = call i32 @llvm.ctpop.i32(i32 %13)
  %15 = and i32 %14, 1
  %PF = icmp eq i32 %15, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.7, label %bb.1

bb.1:                                             ; preds = %entry
  %16 = sub i32 %EAX3, 67
  %17 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX3, i32 67)
  %CF4 = extractvalue { i32, i1 } %17, 1
  %ZF5 = icmp eq i32 %16, 0
  %highbit6 = and i32 -2147483648, %16
  %SF7 = icmp ne i32 %highbit6, 0
  %18 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX3, i32 67)
  %OF8 = extractvalue { i32, i1 } %18, 1
  %19 = and i32 %16, 255
  %20 = call i32 @llvm.ctpop.i32(i32 %19)
  %21 = and i32 %20, 1
  %PF9 = icmp eq i32 %21, 0
  %ZFCmp_JG = icmp eq i1 %ZF5, false
  %SFOFCmp_JG = icmp eq i1 %SF7, %OF8
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.8, label %bb.2

bb.2:                                             ; preds = %bb.1
  %22 = sub i32 %EAX3, 65
  %23 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX3, i32 65)
  %CF10 = extractvalue { i32, i1 } %23, 1
  %ZF11 = icmp eq i32 %22, 0
  %highbit12 = and i32 -2147483648, %22
  %SF13 = icmp ne i32 %highbit12, 0
  %24 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX3, i32 65)
  %OF14 = extractvalue { i32, i1 } %24, 1
  %25 = and i32 %22, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %25)
  %27 = and i32 %26, 1
  %PF15 = icmp eq i32 %27, 0
  %CmpZF_JE60 = icmp eq i1 %ZF11, true
  br i1 %CmpZF_JE60, label %bb.5, label %bb.3

bb.3:                                             ; preds = %bb.2
  %28 = sub i32 %EAX3, 66
  %29 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX3, i32 66)
  %CF16 = extractvalue { i32, i1 } %29, 1
  %ZF17 = icmp eq i32 %28, 0
  %highbit18 = and i32 -2147483648, %28
  %SF19 = icmp ne i32 %highbit18, 0
  %30 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX3, i32 66)
  %OF20 = extractvalue { i32, i1 } %30, 1
  %31 = and i32 %28, 255
  %32 = call i32 @llvm.ctpop.i32(i32 %31)
  %33 = and i32 %32, 1
  %PF21 = icmp eq i32 %33, 0
  %CmpZF_JE61 = icmp eq i1 %ZF17, true
  br i1 %CmpZF_JE61, label %bb.6, label %bb.4

bb.4:                                             ; preds = %bb.3
  br label %bb.8

bb.5:                                             ; preds = %bb.2
  %memload22 = load i64, ptr %RBP_N.24, align 1
  %EAX24 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload22)
  %memload25 = load i64, ptr %RBP_N.24, align 1
  %34 = inttoptr i64 %memload25 to ptr
  call void @free(ptr %34)
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.3
  %memload26 = load i64, ptr %RBP_N.24, align 1
  %EAX28 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload26)
  %memload29 = load i64, ptr %RBP_N.24, align 1
  %35 = inttoptr i64 %memload29 to ptr
  call void @free(ptr %35)
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %entry
  %memload30 = load i64, ptr %RBP_N.24, align 1
  %EAX32 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload30)
  %memload33 = load i64, ptr %RBP_N.24, align 1
  %36 = inttoptr i64 %memload33 to ptr
  call void @free(ptr %36)
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.4, %bb.1
  %memload34 = load i64, ptr %RBP_N.24, align 1
  %37 = inttoptr i64 %memload34 to ptr
  %38 = zext i32 16 to i64
  %39 = call ptr @memcpy(ptr %37, ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 20), i64 %38)
  %RAX35 = ptrtoint ptr %39 to i64
  %memload36 = load i64, ptr %RBP_N.24, align 1
  %EAX38 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload36)
  %memload39 = load i64, ptr %RBP_N.24, align 1
  %40 = inttoptr i64 %memload39 to ptr
  call void @free(ptr %40)
  %41 = zext i32 16 to i64
  %42 = call ptr @malloc(i64 %41)
  %RAX40 = ptrtoint ptr %42 to i64
  store i64 %RAX40, ptr %RBP_N.16, align 1
  %43 = zext i32 16 to i64
  %44 = call ptr @malloc(i64 %43)
  %RAX41 = ptrtoint ptr %44 to i64
  store i64 %RAX41, ptr %RBP_N.8, align 1
  %memload42 = load i64, ptr %RBP_N.24, align 1
  %EAX44 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 28), i64 %memload42)
  %memload45 = load i64, ptr %RBP_N.16, align 1
  %EAX47 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 36), i64 %memload45)
  %memload48 = load i64, ptr %RBP_N.8, align 1
  %EAX50 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 43), i64 %memload48)
  %memload51 = load i64, ptr %RBP_N.16, align 1
  %45 = load i64, ptr %RBP_N.8, align 1
  %46 = sub i64 %memload51, %45
  %47 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload51, i64 %45)
  %CF52 = extractvalue { i64, i1 } %47, 1
  %ZF53 = icmp eq i64 %46, 0
  %highbit54 = and i64 -9223372036854775808, %46
  %SF55 = icmp ne i64 %highbit54, 0
  %48 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload51, i64 %45)
  %OF56 = extractvalue { i64, i1 } %48, 1
  %49 = and i64 %46, 255
  %50 = call i64 @llvm.ctpop.i64(i64 %49)
  %51 = and i64 %50, 1
  %PF57 = icmp eq i64 %51, 0
  %CmpZF_JNE = icmp eq i1 %ZF53, false
  br i1 %CmpZF_JNE, label %bb.10, label %bb.9

bb.9:                                             ; preds = %bb.8
  %EAX59 = call i32 @puts(ptr getelementptr inbounds ([135 x i8], ptr @rodata_18, i32 0, i32 56))
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.8
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

!0 = !{i64 8192}
