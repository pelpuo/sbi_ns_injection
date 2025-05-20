; ModuleID = './bin/hbo_char_array'
source_filename = "./bin/hbo_char_array"

@rodata_18 = private unnamed_addr constant [122 x i8] c"\01\00\02\00\00\00\00\00Original content of b: %s\0A\00\00\00\00\00\00Content of b after overflow: %s\0A\00\00\00\00\00\00\00\00Test Failed: Heap buffer overflow occured\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local i32 @putchar(i32)

declare dso_local i32 @puts(ptr)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 19
  %RBP_N.37 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.36 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.32 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.24 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 40
  %RBP_N.16 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 48
  %RBP_N.8 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  %7 = zext i32 32 to i64
  %8 = call ptr @malloc(i64 %7)
  %RAX = ptrtoint ptr %8 to i64
  store i64 %RAX, ptr %RBP_N.32, align 1
  %9 = zext i32 32 to i64
  %10 = call ptr @malloc(i64 %9)
  %RAX1 = ptrtoint ptr %10 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.24, align 1
  %11 = inttoptr i64 %memload to ptr
  %memload2 = load i32, ptr %11, align 1
  %12 = trunc i32 %memload2 to i8
  %EAX = zext i8 %12 to i32
  %13 = trunc i32 %EAX to i8
  store i8 %13, ptr %RBP_N.37, align 1
  %memload3 = load i64, ptr %RBP_N.24, align 1
  %14 = inttoptr i64 %memload3 to ptr
  store i64 4050765991979987505, ptr %14, align 1
  %memref-disp = add i64 %memload3, 8
  %15 = inttoptr i64 %memref-disp to ptr
  store i64 3906085646303834169, ptr %15, align 1
  %memref-disp4 = add i64 %memload3, 16
  %16 = inttoptr i64 %memref-disp4 to ptr
  store i8 0, ptr %16, align 1
  %memload5 = load i64, ptr %RBP_N.24, align 1
  %EAX7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([122 x i8], ptr @rodata_18, i32 0, i32 8), i64 %memload5)
  %memload8 = load i64, ptr %RBP_N.24, align 1
  %17 = load i64, ptr %RBP_N.32, align 1
  %RAX9 = sub i64 %memload8, %17
  %18 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload8, i64 %17)
  %CF = extractvalue { i64, i1 } %18, 1
  %ZF = icmp eq i64 %RAX9, 0
  %highbit = and i64 -9223372036854775808, %RAX9
  %SF = icmp ne i64 %highbit, 0
  %19 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload8, i64 %17)
  %OF = extractvalue { i64, i1 } %19, 1
  %20 = and i64 %RAX9, 255
  %21 = call i64 @llvm.ctpop.i64(i64 %20)
  %22 = and i64 %21, 1
  %PF = icmp eq i64 %22, 0
  %RAX16 = sub i64 %RAX9, 16
  %23 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX9, i64 16)
  %CF10 = extractvalue { i64, i1 } %23, 1
  %24 = and i64 %RAX16, 255
  %25 = call i64 @llvm.ctpop.i64(i64 %24)
  %26 = and i64 %25, 1
  %PF11 = icmp eq i64 %26, 0
  %ZF12 = icmp eq i64 %RAX16, 0
  %highbit13 = and i64 -9223372036854775808, %RAX16
  %SF14 = icmp ne i64 %highbit13, 0
  %27 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX9, i64 16)
  %OF15 = extractvalue { i64, i1 } %27, 1
  store i64 %RAX16, ptr %RBP_N.16, align 1
  %memload17 = load i64, ptr %RBP_N.16, align 1
  %RAX24 = add i64 %memload17, 18
  %28 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload17, i64 18)
  %CF18 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %RAX24, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF19 = icmp eq i64 %31, 0
  %ZF20 = icmp eq i64 %RAX24, 0
  %highbit21 = and i64 -9223372036854775808, %RAX24
  %SF22 = icmp ne i64 %highbit21, 0
  %32 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload17, i64 18)
  %OF23 = extractvalue { i64, i1 } %32, 1
  %33 = call ptr @malloc(i64 %RAX24)
  %RAX25 = ptrtoint ptr %33 to i64
  store i64 %RAX25, ptr %RBP_N.8, align 1
  %memload26 = load i64, ptr %RBP_N.16, align 1
  %memload27 = load i64, ptr %RBP_N.8, align 1
  %34 = inttoptr i64 %memload27 to ptr
  %35 = call ptr @memset(ptr %34, i32 65, i64 %memload26)
  %RAX28 = ptrtoint ptr %35 to i64
  %memload29 = load i64, ptr %RBP_N.32, align 1
  %memload30 = load i64, ptr %RBP_N.16, align 1
  %memref-basereg = add i64 %memload29, %memload30
  %memload31 = load i64, ptr %RBP_N.8, align 1
  %memload32 = load i64, ptr %RBP_N.16, align 1
  %RAX36 = add nsw i64 %memload32, %memload31
  %highbit33 = and i64 -9223372036854775808, %RAX36
  %SF34 = icmp ne i64 %highbit33, 0
  %ZF35 = icmp eq i64 %RAX36, 0
  %36 = inttoptr i64 %RAX36 to ptr
  %37 = inttoptr i64 %memref-basereg to ptr
  %38 = zext i32 18 to i64
  %39 = call ptr @memcpy(ptr %36, ptr %37, i64 %38)
  %RAX37 = ptrtoint ptr %39 to i64
  %memload38 = load i64, ptr %RBP_N.16, align 1
  %memref-disp39 = add i64 %memload38, 16
  %memload40 = load i64, ptr %RBP_N.8, align 1
  %RAX44 = add nsw i64 %memload40, %memref-disp39
  %highbit41 = and i64 -9223372036854775808, %RAX44
  %SF42 = icmp ne i64 %highbit41, 0
  %ZF43 = icmp eq i64 %RAX44, 0
  %40 = inttoptr i64 %RAX44 to ptr
  %41 = zext i32 2 to i64
  %42 = call ptr @memset(ptr %40, i32 66, i64 %41)
  %RAX45 = ptrtoint ptr %42 to i64
  %memload46 = load i64, ptr %RBP_N.16, align 1
  %memref-disp47 = add i64 %memload46, 18
  %memload48 = load i64, ptr %RBP_N.8, align 1
  %memload49 = load i64, ptr %RBP_N.32, align 1
  %43 = inttoptr i64 %memload49 to ptr
  %44 = inttoptr i64 %memload48 to ptr
  %45 = call ptr @memcpy(ptr %43, ptr %44, i64 %memref-disp47)
  %RAX50 = ptrtoint ptr %45 to i64
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload51 = load i32, ptr %RBP_N.36, align 1
  %RAX52 = sext i32 %memload51 to i64
  %memload53 = load i64, ptr %RBP_N.16, align 1
  %RDX = add i64 %memload53, 18
  %46 = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %memload53, i64 18)
  %CF54 = extractvalue { i64, i1 } %46, 1
  %47 = and i64 %RDX, 255
  %48 = call i64 @llvm.ctpop.i64(i64 %47)
  %49 = and i64 %48, 1
  %PF55 = icmp eq i64 %49, 0
  %ZF56 = icmp eq i64 %RDX, 0
  %highbit57 = and i64 -9223372036854775808, %RDX
  %SF58 = icmp ne i64 %highbit57, 0
  %50 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %memload53, i64 18)
  %OF59 = extractvalue { i64, i1 } %50, 1
  %51 = sub i64 %RAX52, %RDX
  %52 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX52, i64 %RDX)
  %CF60 = extractvalue { i64, i1 } %52, 1
  %ZF61 = icmp eq i64 %51, 0
  %highbit62 = and i64 -9223372036854775808, %51
  %SF63 = icmp ne i64 %highbit62, 0
  %53 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX52, i64 %RDX)
  %OF64 = extractvalue { i64, i1 } %53, 1
  %54 = and i64 %51, 255
  %55 = call i64 @llvm.ctpop.i64(i64 %54)
  %56 = and i64 %55, 1
  %PF65 = icmp eq i64 %56, 0
  %CmpCF_JB = icmp eq i1 %CF60, true
  br i1 %CmpCF_JB, label %bb.1, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX66 = call i32 @putchar(i32 10)
  %memload67 = load i64, ptr %RBP_N.24, align 1
  %EAX69 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([122 x i8], ptr @rodata_18, i32 0, i32 40), i64 %memload67)
  %memload70 = load i64, ptr %RBP_N.24, align 1
  %57 = inttoptr i64 %memload70 to ptr
  %memload71 = load i32, ptr %57, align 1
  %58 = trunc i32 %memload71 to i8
  %EAX72 = zext i8 %58 to i32
  %59 = load i8, ptr %RBP_N.37, align 1
  %60 = zext i8 %59 to i64
  %61 = zext i32 %EAX72 to i64
  %62 = sub i64 %60, %61
  %63 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %60, i64 %61)
  %CF73 = extractvalue { i64, i1 } %63, 1
  %ZF74 = icmp eq i64 %62, 0
  %highbit75 = and i64 -9223372036854775808, %62
  %SF76 = icmp ne i64 %highbit75, 0
  %64 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %60, i64 %61)
  %OF77 = extractvalue { i64, i1 } %64, 1
  %65 = and i64 %62, 255
  %66 = call i64 @llvm.ctpop.i64(i64 %65)
  %67 = and i64 %66, 1
  %PF78 = icmp eq i64 %67, 0
  %CmpZF_JE = icmp eq i1 %ZF74, true
  br i1 %CmpZF_JE, label %bb.5, label %bb.4

bb.4:                                             ; preds = %bb.3
  %EAX80 = call i32 @puts(ptr getelementptr inbounds ([122 x i8], ptr @rodata_18, i32 0, i32 80))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload81 = load i64, ptr %RBP_N.32, align 1
  %68 = inttoptr i64 %memload81 to ptr
  call void @free(ptr %68)
  %memload82 = load i64, ptr %RBP_N.24, align 1
  %69 = inttoptr i64 %memload82 to ptr
  call void @free(ptr %69)
  %memload83 = load i64, ptr %RBP_N.8, align 1
  %70 = inttoptr i64 %memload83 to ptr
  call void @free(ptr %70)
  ret i32 0

bb.1:                                             ; preds = %bb.2
  %memload84 = load i32, ptr %RBP_N.36, align 1
  %RDX85 = sext i32 %memload84 to i64
  %memload86 = load i64, ptr %RBP_N.32, align 1
  %RAX90 = add nsw i64 %memload86, %RDX85
  %highbit87 = and i64 -9223372036854775808, %RAX90
  %SF88 = icmp ne i64 %highbit87, 0
  %ZF89 = icmp eq i64 %RAX90, 0
  %71 = inttoptr i64 %RAX90 to ptr
  %memload91 = load i32, ptr %71, align 1
  %72 = trunc i32 %memload91 to i8
  %EAX92 = zext i8 %72 to i32
  %73 = trunc i32 %EAX92 to i8
  %EAX93 = sext i8 %73 to i32
  %EAX94 = call i32 @putchar(i32 %EAX93)
  %74 = zext i8 1 to i32
  %75 = load i32, ptr %RBP_N.36, align 1
  %76 = add i32 %75, %74
  %77 = and i32 %76, 255
  %78 = call i32 @llvm.ctpop.i32(i32 %77)
  %79 = and i32 %78, 1
  %PF95 = icmp eq i32 %79, 0
  store i32 %76, ptr %RBP_N.36, align 1
  br label %bb.2
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
