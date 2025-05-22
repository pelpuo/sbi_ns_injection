; ModuleID = './protected_bc/df_nonadjacent_free.bc'
source_filename = "./bin/df_nonadjacent_free"

@rodata_15 = private unnamed_addr constant [121 x i8] c"\01\00\02\00hello abcdefghi\00a contains: %s\0A\00a: %p\0A\0A\00b: %p\0Ac: %p\0A\00Test Failed: Non-adjacent free sequence leading to Double Free\0A\00", align 4, !ROData_SecInfo !0
@rodata_15_4 = private constant i64 7088982951390373224
@rodata_15_12 = private constant i64 29669665863459939

declare dso_local i8* @malloc(i64)

declare dso_local i32 @printf(i8*, ...)

declare dso_local void @free(i8*)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 56, align 1
  %ns_base = getelementptr i8, i8* %stktop_8, i64 0
  %ns_prot = call i8* @zeno_protect(i8* %ns_base, i64 8)
  %ns_ptr = bitcast i8* %ns_prot to i64*
  %ns_base1 = getelementptr i8, i8* %stktop_8, i64 52
  %ns_prot2 = call i8* @zeno_protect(i8* %ns_base1, i64 4)
  %ns_ptr3 = bitcast i8* %ns_prot2 to i32*
  %ns_base4 = getelementptr i8, i8* %stktop_8, i64 40
  %ns_prot5 = call i8* @zeno_protect(i8* %ns_base4, i64 8)
  %ns_ptr6 = bitcast i8* %ns_prot5 to i64*
  %ns_base7 = getelementptr i8, i8* %stktop_8, i64 32
  %ns_prot8 = call i8* @zeno_protect(i8* %ns_base7, i64 8)
  %ns_ptr9 = bitcast i8* %ns_prot8 to i64*
  %ns_base10 = getelementptr i8, i8* %stktop_8, i64 24
  %ns_prot11 = call i8* @zeno_protect(i8* %ns_base10, i64 8)
  %ns_ptr12 = bitcast i8* %ns_prot11 to i64*
  %ns_base13 = getelementptr i8, i8* %stktop_8, i64 16
  %ns_prot14 = call i8* @zeno_protect(i8* %ns_base13, i64 8)
  %ns_ptr15 = bitcast i8* %ns_prot14 to i64*
  %RSPAdj_N.48 = bitcast i8* %stktop_8 to i64*
  store i64 3735928559, i64* %ns_ptr, align 8
  %RBP = ptrtoint i64* %ns_ptr to i64
  store i32 0, i32* %ns_ptr3, align 1
  %0 = zext i32 16 to i64
  %1 = call i8* @zeno_malloc(i64 %0)
  %RAX = ptrtoint i8* %1 to i64
  store i64 %RAX, i64* %ns_ptr6, align 1
  %2 = zext i32 16 to i64
  %3 = call i8* @zeno_malloc(i64 %2)
  %RAX1 = ptrtoint i8* %3 to i64
  store i64 %RAX1, i64* %ns_ptr9, align 1
  %memload = load i64, i64* %ns_ptr6, align 1
  %4 = bitcast i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 4) to i64*, !ROData_Index !1
  %memload2 = load i64, i64* @rodata_15_4, align 1, !ROData_Content !2
  %5 = inttoptr i64 %memload to i64*
  store i64 %memload2, i64* %5, align 1
  %6 = bitcast i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 12) to i64*, !ROData_Index !3
  %memload3 = load i64, i64* @rodata_15_12, align 1, !ROData_Content !4
  %memref-disp = add i64 %memload, 8
  %7 = inttoptr i64 %memref-disp to i64*
  store i64 %memload3, i64* %7, align 1
  %memload4 = load i64, i64* %ns_ptr6, align 1
  %EAX = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 20), i64 %memload4)
  %memload5 = load i64, i64* %ns_ptr6, align 1
  %EAX6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 36), i64 %memload5)
  %memload7 = load i64, i64* %ns_ptr6, align 1
  %8 = inttoptr i64 %memload7 to i8*
  call void @zeno_free(i8* %8)
  %memload8 = load i64, i64* %ns_ptr9, align 1
  %9 = inttoptr i64 %memload8 to i8*
  call void @zeno_free(i8* %9)
  %memload9 = load i64, i64* %ns_ptr6, align 1
  %10 = inttoptr i64 %memload9 to i8*
  call void @zeno_free(i8* %10)
  %11 = zext i32 10 to i64
  %12 = call i8* @zeno_malloc(i64 %11)
  %RAX10 = ptrtoint i8* %12 to i64
  store i64 %RAX10, i64* %ns_ptr12, align 1
  %13 = zext i32 10 to i64
  %14 = call i8* @zeno_malloc(i64 %13)
  %RAX11 = ptrtoint i8* %14 to i64
  store i64 %RAX11, i64* %ns_ptr15, align 1
  %memload12 = load i64, i64* %ns_ptr12, align 1
  %memload13 = load i64, i64* %ns_ptr15, align 1
  %EAX14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 44), i64 %memload12, i64 %memload13)
  %memload15 = load i64, i64* %ns_ptr12, align 1
  %15 = load i64, i64* %ns_ptr15, align 1
  %16 = sub i64 %memload15, %15
  %17 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %memload15, i64 %15)
  %CF = extractvalue { i64, i1 } %17, 1
  %ZF = icmp eq i64 %16, 0
  %highbit = and i64 -9223372036854775808, %16
  %SF = icmp ne i64 %highbit, 0
  %18 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %memload15, i64 %15)
  %OF = extractvalue { i64, i1 } %18, 1
  %19 = and i64 %16, 255
  %20 = call i64 @llvm.ctpop.i64(i64 %19)
  %21 = and i64 %20, 1
  %PF = icmp eq i64 %21, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 57))
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %memload17 = load i32, i32* %ns_ptr3, align 1
  ret i32 %memload17
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

declare i8* @zeno_protect(i8*, i64)

declare i8* @zeno_malloc(i64)

declare void @zeno_free(i8*)

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{!1}
!3 = !{i8* getelementptr inbounds ([121 x i8], [121 x i8]* @rodata_15, i32 0, i32 12)}
!4 = !{!3}
