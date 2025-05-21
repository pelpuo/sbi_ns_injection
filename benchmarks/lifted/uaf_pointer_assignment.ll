; ModuleID = './bin/uaf_pointer_assignment'
source_filename = "./bin/uaf_pointer_assignment"

@rodata_15 = private unnamed_addr constant [128 x i8] c"\01\00\02\00Hello\00Addr of a:%p\0A\00Addr of b:%p\0A\0A\00World\00a: %s\0A\00b: %s\0A\00Test Failed: Incorrect pointer assignment leading to Use After Free\0A\00", align 4, !ROData_SecInfo !0

declare dso_local ptr @malloc(i64)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %4 = zext i32 16 to i64
  %5 = call ptr @malloc(i64 %4)
  %RAX = ptrtoint ptr %5 to i64
  store i64 %RAX, ptr %RBP_N.16, align 1
  %6 = zext i32 16 to i64
  %7 = call ptr @malloc(i64 %6)
  %RAX1 = ptrtoint ptr %7 to i64
  store i64 %RAX1, ptr %RBP_N.24, align 1
  %memload = load i64, ptr %RBP_N.16, align 1
  %memload2 = load i64, ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  %8 = inttoptr i64 %memload to ptr
  store i64 %memload2, ptr %8, align 1
  %memload3 = load i64, ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !2
  %memref-disp = add i64 %memload, 8
  %9 = inttoptr i64 %memref-disp to ptr
  store i64 %memload3, ptr %9, align 1
  %memload4 = load i64, ptr %RBP_N.16, align 1
  store i64 %memload4, ptr %RBP_N.24, align 1
  %memload5 = load i64, ptr %RBP_N.16, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 10), i64 %memload5)
  %memload6 = load i64, ptr %RBP_N.24, align 1
  %EAX7 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 24), i64 %memload6)
  %memload8 = load i64, ptr %RBP_N.16, align 1
  %10 = inttoptr i64 %memload8 to ptr
  call void @free(ptr %10)
  %memload9 = load i64, ptr %RBP_N.24, align 1
  %memload10 = load i64, ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 39), align 1, !ROData_Content !3
  %11 = inttoptr i64 %memload9 to ptr
  store i64 %memload10, ptr %11, align 1
  %memload11 = load i64, ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 47), align 1, !ROData_Content !4
  %memref-disp12 = add i64 %memload9, 8
  %12 = inttoptr i64 %memref-disp12 to ptr
  store i64 %memload11, ptr %12, align 1
  %memload13 = load i64, ptr %RBP_N.16, align 1
  %EAX14 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 45), i64 %memload13)
  %memload15 = load i64, ptr %RBP_N.24, align 1
  %EAX16 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 52), i64 %memload15)
  %memload17 = load i64, ptr %RBP_N.16, align 1
  %13 = inttoptr i64 %memload17 to ptr
  %memload18 = load i32, ptr %13, align 1
  %14 = trunc i32 %memload18 to i8
  %EAX19 = sext i8 %14 to i32
  %15 = sub i32 %EAX19, 72
  %16 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX19, i32 72)
  %CF = extractvalue { i32, i1 } %16, 1
  %ZF = icmp eq i32 %15, 0
  %highbit = and i32 -2147483648, %15
  %SF = icmp ne i32 %highbit, 0
  %17 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX19, i32 72)
  %OF = extractvalue { i32, i1 } %17, 1
  %18 = and i32 %15, 255
  %19 = call i32 @llvm.ctpop.i32(i32 %18)
  %20 = and i32 %19, 1
  %PF = icmp eq i32 %20, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 59))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload21 = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload21
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 12)}
!3 = !{ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 39)}
!4 = !{ptr getelementptr inbounds ([128 x i8], ptr @rodata_15, i32 0, i32 47)}
