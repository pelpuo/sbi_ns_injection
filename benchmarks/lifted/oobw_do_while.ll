; ModuleID = './bin/oobw_do_while'
source_filename = "./bin/oobw_do_while"

@rodata_15 = private unnamed_addr constant [98 x i8] c"\01\00\02\00i: %d \09val: %d\0A\00Test Failed: Incorrect usage of do-while loop leading to Out of Bounds Write\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local i32 @printf(ptr, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.40 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.36 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %3 = inttoptr i64 %2 to ptr
  %4 = add i64 %tos, 44
  %RBP_N.12 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 48
  %RBP_N.8 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 52
  %RBP_N.4 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %7 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  store i32 5, ptr %RBP_N.8, align 1
  %8 = zext i32 20 to i64
  %9 = call ptr @memset(ptr %3, i32 0, i64 %8)
  %RAX = ptrtoint ptr %9 to i64
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.1
  %memload = load i32, ptr %RBP_N.36, align 1
  %EAX = add i32 %memload, 1
  %10 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload, i32 1)
  %CF = extractvalue { i32, i1 } %10, 1
  %11 = and i32 %EAX, 255
  %12 = call i32 @llvm.ctpop.i32(i32 %11)
  %13 = and i32 %12, 1
  %PF = icmp eq i32 %13, 0
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %14 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload, i32 1)
  %OF = extractvalue { i32, i1 } %14, 1
  store i32 %EAX, ptr %RBP_N.36, align 1
  %memload1 = load i32, ptr %RBP_N.36, align 1
  %ECX = shl i32 %memload1, 1
  %ZF2 = icmp eq i32 %ECX, 0
  %highbit3 = and i32 -2147483648, %ECX
  %SF4 = icmp ne i32 %highbit3, 0
  %memload5 = load i64, ptr %RBP_N.36, align 1
  %15 = trunc i64 %memload5 to i32
  %RAX6 = sext i32 %15 to i64
  %sc-m = mul i64 4, %RAX6
  %16 = getelementptr i8, ptr %3, i64 %sc-m
  store i32 %ECX, ptr %16, align 1
  %memload7 = load i32, ptr %RBP_N.36, align 1
  %17 = load i32, ptr %RBP_N.8, align 1
  %18 = sub i32 %memload7, %17
  %19 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload7, i32 %17)
  %CF8 = extractvalue { i32, i1 } %19, 1
  %ZF9 = icmp eq i32 %18, 0
  %highbit10 = and i32 -2147483648, %18
  %SF11 = icmp ne i32 %highbit10, 0
  %20 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload7, i32 %17)
  %OF12 = extractvalue { i32, i1 } %20, 1
  %21 = and i32 %18, 255
  %22 = call i32 @llvm.ctpop.i32(i32 %21)
  %23 = and i32 %22, 1
  %PF13 = icmp eq i32 %23, 0
  %SFAndOF_JL = icmp ne i1 %SF11, %OF12
  br i1 %SFAndOF_JL, label %bb.1, label %bb.2

bb.2:                                             ; preds = %bb.1
  store i32 0, ptr %RBP_N.40, align 1
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.4
  %memload14 = load i32, ptr %RBP_N.40, align 1
  %24 = load i32, ptr %RBP_N.8, align 1
  %25 = sub i32 %memload14, %24
  %26 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload14, i32 %24)
  %CF15 = extractvalue { i32, i1 } %26, 1
  %ZF16 = icmp eq i32 %25, 0
  %highbit17 = and i32 -2147483648, %25
  %SF18 = icmp ne i32 %highbit17, 0
  %27 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload14, i32 %24)
  %OF19 = extractvalue { i32, i1 } %27, 1
  %28 = and i32 %25, 255
  %29 = call i32 @llvm.ctpop.i32(i32 %28)
  %30 = and i32 %29, 1
  %PF20 = icmp eq i32 %30, 0
  %ZFCmp_JG = icmp eq i1 %ZF16, false
  %SFOFCmp_JG = icmp eq i1 %SF18, %OF19
  %ZFAndSFOF_JG = and i1 %ZFCmp_JG, %SFOFCmp_JG
  br i1 %ZFAndSFOF_JG, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %memload21 = load i32, ptr %RBP_N.40, align 1
  %memload22 = load i64, ptr %RBP_N.40, align 1
  %31 = trunc i64 %memload22 to i32
  %RAX23 = sext i32 %31 to i64
  %sc-m24 = mul i64 4, %RAX23
  %32 = getelementptr i8, ptr %3, i64 %sc-m24
  %memload26 = load i32, ptr %32, align 1
  %EAX27 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([98 x i8], ptr @rodata_15, i32 0, i32 4), i32 %memload21, i32 %memload26, i32 %ECX)
  %memload28 = load i32, ptr %RBP_N.40, align 1
  %EAX35 = add i32 %memload28, 1
  %33 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload28, i32 1)
  %CF29 = extractvalue { i32, i1 } %33, 1
  %34 = and i32 %EAX35, 255
  %35 = call i32 @llvm.ctpop.i32(i32 %34)
  %36 = and i32 %35, 1
  %PF30 = icmp eq i32 %36, 0
  %ZF31 = icmp eq i32 %EAX35, 0
  %highbit32 = and i32 -2147483648, %EAX35
  %SF33 = icmp ne i32 %highbit32, 0
  %37 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload28, i32 1)
  %OF34 = extractvalue { i32, i1 } %37, 1
  store i32 %EAX35, ptr %RBP_N.40, align 1
  br label %bb.3

bb.5:                                             ; preds = %bb.3
  %38 = load i32, ptr %RBP_N.12, align 1
  %39 = zext i32 %38 to i64
  %40 = zext i32 10 to i64
  %41 = sub i64 %39, %40
  %42 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %39, i64 %40)
  %CF36 = extractvalue { i64, i1 } %42, 1
  %ZF37 = icmp eq i64 %41, 0
  %highbit38 = and i64 -9223372036854775808, %41
  %SF39 = icmp ne i64 %highbit38, 0
  %43 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %39, i64 %40)
  %OF40 = extractvalue { i64, i1 } %43, 1
  %44 = and i64 %41, 255
  %45 = call i64 @llvm.ctpop.i64(i64 %44)
  %46 = and i64 %45, 1
  %PF41 = icmp eq i64 %46, 0
  %CmpZF_JNE = icmp eq i1 %ZF37, false
  br i1 %CmpZF_JNE, label %bb.7, label %bb.6

bb.6:                                             ; preds = %bb.5
  %EAX42 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([98 x i8], ptr @rodata_15, i32 0, i32 20))
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  %memload43 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload43
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

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
