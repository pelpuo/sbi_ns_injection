; ModuleID = './protected_bc/uaf_if_statement.bc'
source_filename = "./bin/uaf_if_statement"

@rodata_15 = private unnamed_addr constant [83 x i8] c"\01\00\02\00%c\0A\00FREED!\0A\00Test Failed: Use After Free - condition check on a freed pointer!\0A\00", align 4, !ROData_SecInfo !0

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 20
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %RSPAdj_N.16 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 1 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %RSPAdj_N.16, align 1
  %memload = load i64, i64* %RSPAdj_N.16, align 1
  %2 = inttoptr i64 %memload to i8*
  store i8 65, i8* %2, align 1
  %memload1 = load i64, i64* %RSPAdj_N.16, align 1
  %3 = inttoptr i64 %memload1 to i32*
  %memload2 = load i32, i32* %3, align 1
  %4 = trunc i32 %memload2 to i8
  %EAX = sext i8 %4 to i32
  %5 = sub i32 %EAX, 88
  %6 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX, i32 88)
  %CF = extractvalue { i32, i1 } %6, 1
  %ZF = icmp eq i32 %5, 0
  %highbit = and i32 -2147483648, %5
  %SF = icmp ne i32 %highbit, 0
  %7 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX, i32 88)
  %OF = extractvalue { i32, i1 } %7, 1
  %8 = and i32 %5, 255
  %9 = call i32 @llvm.ctpop.i32(i32 %8)
  %10 = and i32 %9, 1
  %PF = icmp eq i32 %10, 0
  %CmpZF_JE = icmp eq i1 %ZF, true
  br i1 %CmpZF_JE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %memload3 = load i64, i64* %RSPAdj_N.16, align 1
  %11 = inttoptr i64 %memload3 to i32*
  %memload4 = load i32, i32* %11, align 1
  %12 = trunc i32 %memload4 to i8
  %ESI = sext i8 %12 to i32
  %EAX5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([83 x i8], [83 x i8]* @rodata_15, i32 0, i32 4), i32 %ESI)
  %memload6 = load i64, i64* %RSPAdj_N.16, align 1
  %13 = inttoptr i64 %memload6 to i8*
  store i8 65, i8* %13, align 1
  %memload7 = load i64, i64* %RSPAdj_N.16, align 1
  %14 = inttoptr i64 %memload7 to i8*
  call void @zeno_free(i8* %14)
  %EAX8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([83 x i8], [83 x i8]* @rodata_15, i32 0, i32 8))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload9 = load i64, i64* %RSPAdj_N.16, align 1
  %15 = inttoptr i64 %memload9 to i32*
  %memload10 = load i32, i32* %15, align 1
  %16 = trunc i32 %memload10 to i8
  %EAX11 = sext i8 %16 to i32
  %17 = sub i32 %EAX11, 0
  %18 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX11, i32 0)
  %CF12 = extractvalue { i32, i1 } %18, 1
  %ZF13 = icmp eq i32 %17, 0
  %highbit14 = and i32 -2147483648, %17
  %SF15 = icmp ne i32 %highbit14, 0
  %19 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX11, i32 0)
  %OF16 = extractvalue { i32, i1 } %19, 1
  %20 = and i32 %17, 255
  %21 = call i32 @llvm.ctpop.i32(i32 %20)
  %22 = and i32 %21, 1
  %PF17 = icmp eq i32 %22, 0
  %CmpZF_JE25 = icmp eq i1 %ZF13, true
  br i1 %CmpZF_JE25, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([83 x i8], [83 x i8]* @rodata_15, i32 0, i32 16))
  %memload19 = load i64, i64* %RSPAdj_N.16, align 1
  %23 = inttoptr i64 %memload19 to i32*
  %memload20 = load i32, i32* %23, align 1
  %24 = trunc i32 %memload20 to i8
  %ESI21 = sext i8 %24 to i32
  %EAX22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([83 x i8], [83 x i8]* @rodata_15, i32 0, i32 4), i32 %ESI21)
  br label %bb.5

bb.4:                                             ; preds = %bb.2
  %EAX23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([83 x i8], [83 x i8]* @rodata_15, i32 0, i32 16))
  br label %bb.5

bb.5:                                             ; preds = %bb.4, %bb.3
  %memload24 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload24
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
