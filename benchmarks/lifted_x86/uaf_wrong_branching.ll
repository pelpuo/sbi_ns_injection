; ModuleID = './bin/uaf_wrong_branching'
source_filename = "./bin/uaf_wrong_branching"

@rodata_18 = private unnamed_addr constant [164 x i8] c"\01\00\02\00\00\00\00\00VALUABLE VALUE\00HELLO\00NOT HELLO\00pointer changed to %s\0A\00WORLD\00NOT WORLD\00\00NOT EMPTY\00\00\00\00\00\00\00\00Test Failed: Repeated free operations caused by incorrect branching\00", align 8, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

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
  %2 = zext i32 16 to i64
  %3 = call ptr @malloc(i64 %2)
  %RAX = ptrtoint ptr %3 to i64
  store i64 %RAX, ptr %RBP_N.8, align 1
  %memload = load i64, ptr %RBP_N.8, align 1
  %4 = inttoptr i64 %memload to ptr
  %5 = zext i32 16 to i64
  %6 = call ptr @memcpy(ptr %4, ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 8), i64 %5)
  %RAX1 = ptrtoint ptr %6 to i64
  %7 = ptrtoint ptr %stktop_8 to i64
  %8 = add i64 %7, 4
  %9 = inttoptr i64 %8 to ptr
  store i32 0, ptr %9, align 1
  %RAX2 = ptrtoint ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 23) to i64, !ROData_Index !1
  %10 = load i64, ptr %RBP_N.8, align 1
  %11 = sub i64 %10, %RAX2
  %12 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %10, i64 %RAX2)
  %CF = extractvalue { i64, i1 } %12, 1
  %ZF = icmp eq i64 %11, 0
  %highbit = and i64 -9223372036854775808, %11
  %SF = icmp ne i64 %highbit, 0
  %13 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %10, i64 %RAX2)
  %OF = extractvalue { i64, i1 } %13, 1
  %14 = and i64 %11, 255
  %15 = call i64 @llvm.ctpop.i64(i64 %14)
  %16 = and i64 %15, 1
  %PF = icmp eq i64 %16, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, ptr %RBP_N.8, align 1
  %17 = inttoptr i64 %memload3 to ptr
  %18 = zext i32 16 to i64
  %19 = call ptr @memcpy(ptr %17, ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 29), i64 %18)
  %RAX5 = ptrtoint ptr %19 to i64
  %memload6 = load i64, ptr %RBP_N.8, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 39), i64 %memload6)
  %memload8 = load i64, ptr %RBP_N.8, align 1
  %20 = inttoptr i64 %memload8 to ptr
  call void @free(ptr %20)
  %21 = ptrtoint ptr %stktop_8 to i64
  %22 = add i64 %21, 4
  %23 = inttoptr i64 %22 to ptr
  %24 = zext i8 1 to i32
  %25 = load i32, ptr %23, align 1
  %26 = add i32 %25, %24
  %27 = and i32 %26, 255
  %28 = call i32 @llvm.ctpop.i32(i32 %27)
  %29 = and i32 %28, 1
  %PF9 = icmp eq i32 %29, 0
  store i32 %26, ptr %23, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %RAX10 = ptrtoint ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 62) to i64, !ROData_Index !2
  %30 = load i64, ptr %RBP_N.8, align 1
  %31 = sub i64 %30, %RAX10
  %32 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %30, i64 %RAX10)
  %CF11 = extractvalue { i64, i1 } %32, 1
  %ZF12 = icmp eq i64 %31, 0
  %highbit13 = and i64 -9223372036854775808, %31
  %SF14 = icmp ne i64 %highbit13, 0
  %33 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %30, i64 %RAX10)
  %OF15 = extractvalue { i64, i1 } %33, 1
  %34 = and i64 %31, 255
  %35 = call i64 @llvm.ctpop.i64(i64 %34)
  %36 = and i64 %35, 1
  %PF16 = icmp eq i64 %36, 0
  %CmpZF_JE48 = icmp eq i1 %ZF12, true
  br i1 %CmpZF_JE48, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %memload17 = load i64, ptr %RBP_N.8, align 1
  %37 = inttoptr i64 %memload17 to ptr
  %38 = zext i32 16 to i64
  %39 = call ptr @memcpy(ptr %37, ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 68), i64 %38)
  %RAX19 = ptrtoint ptr %39 to i64
  %memload20 = load i64, ptr %RBP_N.8, align 1
  %EAX22 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 39), i64 %memload20)
  %memload23 = load i64, ptr %RBP_N.8, align 1
  %40 = inttoptr i64 %memload23 to ptr
  call void @free(ptr %40)
  %41 = ptrtoint ptr %stktop_8 to i64
  %42 = add i64 %41, 4
  %43 = inttoptr i64 %42 to ptr
  %44 = zext i8 1 to i32
  %45 = load i32, ptr %43, align 1
  %46 = add i32 %45, %44
  %47 = and i32 %46, 255
  %48 = call i32 @llvm.ctpop.i32(i32 %47)
  %49 = and i32 %48, 1
  %PF24 = icmp eq i32 %49, 0
  store i32 %46, ptr %43, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %RAX25 = ptrtoint ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 78) to i64, !ROData_Index !3
  %50 = load i64, ptr %RBP_N.8, align 1
  %51 = sub i64 %50, %RAX25
  %52 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %50, i64 %RAX25)
  %CF26 = extractvalue { i64, i1 } %52, 1
  %ZF27 = icmp eq i64 %51, 0
  %highbit28 = and i64 -9223372036854775808, %51
  %SF29 = icmp ne i64 %highbit28, 0
  %53 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %50, i64 %RAX25)
  %OF30 = extractvalue { i64, i1 } %53, 1
  %54 = and i64 %51, 255
  %55 = call i64 @llvm.ctpop.i64(i64 %54)
  %56 = and i64 %55, 1
  %PF31 = icmp eq i64 %56, 0
  %CmpZF_JE49 = icmp eq i1 %ZF27, true
  br i1 %CmpZF_JE49, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload32 = load i64, ptr %RBP_N.8, align 1
  %57 = inttoptr i64 %memload32 to ptr
  %58 = zext i32 16 to i64
  %59 = call ptr @memcpy(ptr %57, ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 79), i64 %58)
  %RAX34 = ptrtoint ptr %59 to i64
  %memload35 = load i64, ptr %RBP_N.8, align 1
  %EAX37 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 39), i64 %memload35)
  %memload38 = load i64, ptr %RBP_N.8, align 1
  %60 = inttoptr i64 %memload38 to ptr
  call void @free(ptr %60)
  %61 = ptrtoint ptr %stktop_8 to i64
  %62 = add i64 %61, 4
  %63 = inttoptr i64 %62 to ptr
  %64 = zext i8 1 to i32
  %65 = load i32, ptr %63, align 1
  %66 = add i32 %65, %64
  %67 = and i32 %66, 255
  %68 = call i32 @llvm.ctpop.i32(i32 %67)
  %69 = and i32 %68, 1
  %PF39 = icmp eq i32 %69, 0
  store i32 %66, ptr %63, align 1
  br label %bb.6

bb.6:                                             ; preds = %bb.5, %bb.4
  %70 = ptrtoint ptr %stktop_8 to i64
  %71 = add i64 %70, 4
  %72 = inttoptr i64 %71 to ptr
  %73 = load i32, ptr %72, align 1
  %74 = zext i32 %73 to i64
  %75 = zext i32 1 to i64
  %76 = sub i64 %74, %75
  %77 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %74, i64 %75)
  %CF40 = extractvalue { i64, i1 } %77, 1
  %ZF41 = icmp eq i64 %76, 0
  %highbit42 = and i64 -9223372036854775808, %76
  %SF43 = icmp ne i64 %highbit42, 0
  %78 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %74, i64 %75)
  %OF44 = extractvalue { i64, i1 } %78, 1
  %79 = and i64 %76, 255
  %80 = call i64 @llvm.ctpop.i64(i64 %79)
  %81 = and i64 %80, 1
  %PF45 = icmp eq i64 %81, 0
  %CmpZF_JLE = icmp eq i1 %ZF41, true
  %CmpOF_JLE = icmp ne i1 %SF43, %OF44
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.8, label %bb.7

bb.7:                                             ; preds = %bb.6
  %EAX47 = call i32 @puts(ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 96))
  br label %bb.8

bb.8:                                             ; preds = %bb.7, %bb.6
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
!1 = !{ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 23)}
!2 = !{ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 62)}
!3 = !{ptr getelementptr inbounds ([164 x i8], ptr @rodata_18, i32 0, i32 78)}
