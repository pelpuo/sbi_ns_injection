; ModuleID = './bin/oobw_direct_index_string_heap_long'
source_filename = "./bin/oobw_direct_index_string_heap_long"

@rodata_18 = private unnamed_addr constant [119 x i8] c"\01\00\02\00\00\00\00\00abcde\00fghij\00String 1: %s\0A\00String 2: %s\0A\00Test Failed: Char array on heap using long pointer Out of Bounds Write\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @printf(ptr, ...)

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
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX1 = ptrtoint ptr %7 to i64
  store i64 %RAX1, ptr %RBP_N.16, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %8 = inttoptr i64 %memload to ptr
  %9 = zext i32 16 to i64
  %10 = call ptr @memcpy(ptr %8, ptr getelementptr inbounds ([119 x i8], ptr @rodata_18, i32 0, i32 8), i64 %9)
  %RAX2 = ptrtoint ptr %10 to i64
  %memload3 = load i64, ptr %RBP_N.16, align 1
  %11 = inttoptr i64 %memload3 to ptr
  %12 = zext i32 16 to i64
  %13 = call ptr @memcpy(ptr %11, ptr getelementptr inbounds ([119 x i8], ptr @rodata_18, i32 0, i32 14), i64 %12)
  %RAX5 = ptrtoint ptr %13 to i64
  %memload6 = load i64, ptr %RBP_N.24, align 1
  %RAX7 = add i64 %memload6, 32
  %14 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload6, i64 32)
  %CF = extractvalue { i64, i1 } %14, 1
  %15 = and i64 %RAX7, 255
  %16 = call i64 @llvm.ctpop.i64(i64 %15)
  %17 = and i64 %16, 1
  %PF = icmp eq i64 %17, 0
  %ZF = icmp eq i64 %RAX7, 0
  %highbit = and i64 -9223372036854775808, %RAX7
  %SF = icmp ne i64 %highbit, 0
  %18 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload6, i64 32)
  %OF = extractvalue { i64, i1 } %18, 1
  store i64 %RAX7, ptr %RBP_N.8, align 1
  %memload8 = load i64, ptr %RBP_N.8, align 1
  %19 = inttoptr i64 %memload8 to ptr
  store i64 4919420920202273057, ptr %19, align 1
  %memload9 = load i64, ptr %RBP_N.24, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([119 x i8], ptr @rodata_18, i32 0, i32 20), i64 %memload9, i64 4919420920202273057)
  %memload11 = load i64, ptr %RBP_N.16, align 1
  %EAX13 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([119 x i8], ptr @rodata_18, i32 0, i32 34), i64 %memload11)
  %20 = ptrtoint ptr %stktop_8 to i64
  %21 = add i64 %20, 4
  %22 = inttoptr i64 %21 to ptr
  store i32 0, ptr %22, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %entry
  %23 = ptrtoint ptr %stktop_8 to i64
  %24 = add i64 %23, 4
  %25 = inttoptr i64 %24 to ptr
  %26 = load i32, ptr %25, align 1
  %27 = zext i32 %26 to i64
  %28 = zext i32 4 to i64
  %29 = sub i64 %27, %28
  %30 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %27, i64 %28)
  %CF14 = extractvalue { i64, i1 } %30, 1
  %ZF15 = icmp eq i64 %29, 0
  %highbit16 = and i64 -9223372036854775808, %29
  %SF17 = icmp ne i64 %highbit16, 0
  %31 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %27, i64 %28)
  %OF18 = extractvalue { i64, i1 } %31, 1
  %32 = and i64 %29, 255
  %33 = call i64 @llvm.ctpop.i64(i64 %32)
  %34 = and i64 %33, 1
  %PF19 = icmp eq i64 %34, 0
  %CmpZF_JLE = icmp eq i1 %ZF15, true
  %CmpOF_JLE = icmp ne i1 %SF17, %OF18
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.1, label %bb.5

bb.5:                                             ; preds = %bb.4
  ret i32 0

bb.1:                                             ; preds = %bb.4
  %35 = ptrtoint ptr %stktop_8 to i64
  %36 = add i64 %35, 4
  %37 = inttoptr i64 %36 to ptr
  %memload20 = load i32, ptr %37, align 1
  %RDX = sext i32 %memload20 to i64
  %memload21 = load i64, ptr %RBP_N.16, align 1
  %RAX25 = add nsw i64 %memload21, %RDX
  %highbit22 = and i64 -9223372036854775808, %RAX25
  %SF23 = icmp ne i64 %highbit22, 0
  %ZF24 = icmp eq i64 %RAX25, 0
  %38 = inttoptr i64 %RAX25 to ptr
  %memload26 = load i32, ptr %38, align 1
  %39 = trunc i32 %memload26 to i8
  %EAX27 = zext i8 %39 to i32
  %40 = sub i32 %EAX27, 72
  %41 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX27, i32 72)
  %CF28 = extractvalue { i32, i1 } %41, 1
  %ZF29 = icmp eq i32 %40, 0
  %highbit30 = and i32 -2147483648, %40
  %SF31 = icmp ne i32 %highbit30, 0
  %42 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX27, i32 72)
  %OF32 = extractvalue { i32, i1 } %42, 1
  %43 = and i32 %40, 255
  %44 = call i32 @llvm.ctpop.i32(i32 %43)
  %45 = and i32 %44, 1
  %PF33 = icmp eq i32 %45, 0
  %CmpZF_JNE = icmp eq i1 %ZF29, false
  br i1 %CmpZF_JNE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %EAX35 = call i32 @puts(ptr getelementptr inbounds ([119 x i8], ptr @rodata_18, i32 0, i32 48))
  br label %bb.3

bb.3:                                             ; preds = %bb.2, %bb.1
  %46 = ptrtoint ptr %stktop_8 to i64
  %47 = add i64 %46, 4
  %48 = inttoptr i64 %47 to ptr
  %49 = zext i8 1 to i32
  %50 = load i32, ptr %48, align 1
  %51 = add i32 %50, %49
  %52 = and i32 %51, 255
  %53 = call i32 @llvm.ctpop.i32(i32 %52)
  %54 = and i32 %53, 1
  %PF36 = icmp eq i32 %54, 0
  store i32 %51, ptr %48, align 1
  br label %bb.4
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
