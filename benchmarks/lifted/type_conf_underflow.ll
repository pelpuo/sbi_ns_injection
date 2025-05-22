; ModuleID = './bin/type_conf_underflow'
source_filename = "./bin/type_conf_underflow"

@rodata_15 = private unnamed_addr constant [145 x i8] c"\01\00\02\00AAAAAA\00Public\00Fetching char at index %d\0A\00Fetched char: %c\0A\00Test Failed: OOB access caused by int->short overflow leading to array underread\0A\00", align 4, !ROData_SecInfo !0

define dso_local i32 @get_char(i16 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 32, align 1
  %RBP_N.24 = bitcast i8* %stktop_8 to i64*
  %0 = getelementptr i8, i8* %stktop_8, i64 16
  %RBP_N.16 = bitcast i8* %0 to i64*
  %1 = getelementptr i8, i8* %stktop_8, i64 30
  %RBP_N.2 = bitcast i8* %1 to i16*
  %2 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %2 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i16 %arg1, i16* %RBP_N.2, align 1
  %3 = ptrtoint i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 4) to i64, !ROData_Index !1
  store i64 %3, i64* %RBP_N.16, align 1
  %4 = ptrtoint i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 11) to i64, !ROData_Index !2
  store i64 %4, i64* %RBP_N.24, align 1
  %memload = load i64, i64* %RBP_N.24, align 1
  %5 = bitcast i16* %RBP_N.2 to i64*
  %memload1 = load i64, i64* %5, align 1
  %6 = trunc i64 %memload1 to i16
  %RCX = sext i16 %6 to i64
  %memref-basereg = add i64 %memload, %RCX
  %7 = inttoptr i64 %memref-basereg to i32*
  %memload2 = load i32, i32* %7, align 1
  %8 = trunc i32 %memload2 to i8
  %EAX = sext i8 %8 to i32
  ret i32 %EAX
}

declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main() {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %RSPAdj_N.32 = bitcast i8* %stktop_8 to i64*
  %RBP_N.17 = getelementptr i8, i8* %stktop_8, i64 23
  %0 = getelementptr i8, i8* %stktop_8, i64 24
  %RBP_N.16 = bitcast i8* %0 to i32*
  %1 = getelementptr i8, i8* %stktop_8, i64 28
  %RBP_N.12 = bitcast i8* %1 to i32*
  %2 = getelementptr i8, i8* %stktop_8, i64 32
  %RBP_N.8 = bitcast i8* %2 to i32*
  %3 = getelementptr i8, i8* %stktop_8, i64 36
  %RBP_N.4 = bitcast i8* %3 to i32*
  %4 = getelementptr i8, i8* %stktop_8, i64 0
  %RSP_P.0 = bitcast i8* %4 to i64*
  store i64 3735928559, i64* %RSP_P.0, align 8
  %RBP = ptrtoint i64* %RSP_P.0 to i64
  store i32 0, i32* %RBP_N.4, align 1
  store i32 65536, i32* %RBP_N.8, align 1
  store i32 2, i32* %RBP_N.12, align 1
  %memload = load i32, i32* %RBP_N.12, align 1
  %memload1 = load i32, i32* %RBP_N.8, align 1
  %EAX = sub i32 %memload1, %memload
  %5 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload1, i32 %memload)
  %CF = extractvalue { i32, i1 } %5, 1
  %ZF = icmp eq i32 %EAX, 0
  %highbit = and i32 -2147483648, %EAX
  %SF = icmp ne i32 %highbit, 0
  %6 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload1, i32 %memload)
  %OF = extractvalue { i32, i1 } %6, 1
  %7 = and i32 %EAX, 255
  %8 = call i32 @llvm.ctpop.i32(i32 %7)
  %9 = and i32 %8, 1
  %PF = icmp eq i32 %9, 0
  store i32 %EAX, i32* %RBP_N.8, align 1
  store i32 1, i32* %RBP_N.16, align 1
  %memload2 = load i32, i32* %RBP_N.8, align 1
  %EAX3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 18), i32 %memload2)
  %memload4 = load i32, i32* %RBP_N.8, align 1
  %10 = trunc i32 %memload4 to i16
  %EDI = sext i16 %10 to i32
  %11 = trunc i32 %EDI to i16
  %EAX5 = call i32 @get_char(i16 %11)
  %12 = trunc i32 %EAX5 to i8
  store i8 %12, i8* %RBP_N.17, align 1
  %13 = bitcast i8* %RBP_N.17 to i32*
  %memload6 = load i32, i32* %13, align 1
  %14 = trunc i32 %memload6 to i8
  %ESI = sext i8 %14 to i32
  %EAX7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 45), i32 %ESI)
  %15 = bitcast i8* %RBP_N.17 to i32*
  %memload8 = load i32, i32* %15, align 1
  %16 = trunc i32 %memload8 to i8
  %EAX9 = sext i8 %16 to i32
  %17 = sub i32 %EAX9, 65
  %18 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EAX9, i32 65)
  %CF10 = extractvalue { i32, i1 } %18, 1
  %ZF11 = icmp eq i32 %17, 0
  %highbit12 = and i32 -2147483648, %17
  %SF13 = icmp ne i32 %highbit12, 0
  %19 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EAX9, i32 65)
  %OF14 = extractvalue { i32, i1 } %19, 1
  %20 = and i32 %17, 255
  %21 = call i32 @llvm.ctpop.i32(i32 %20)
  %22 = and i32 %21, 1
  %PF15 = icmp eq i32 %22, 0
  %CmpZF_JNE = icmp eq i1 %ZF11, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  store i32 0, i32* %RBP_N.16, align 1
  br label %bb.2

bb.2:                                             ; preds = %bb.1, %entry
  %23 = load i32, i32* %RBP_N.16, align 1
  %24 = zext i32 %23 to i64
  %25 = zext i32 0 to i64
  %26 = sub i64 %24, %25
  %27 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %24, i64 %25)
  %CF16 = extractvalue { i64, i1 } %27, 1
  %ZF17 = icmp eq i64 %26, 0
  %highbit18 = and i64 -9223372036854775808, %26
  %SF19 = icmp ne i64 %highbit18, 0
  %28 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 %25)
  %OF20 = extractvalue { i64, i1 } %28, 1
  %29 = and i64 %26, 255
  %30 = call i64 @llvm.ctpop.i64(i64 %29)
  %31 = and i64 %30, 1
  %PF21 = icmp eq i64 %31, 0
  %CmpZF_JNE24 = icmp eq i1 %ZF17, false
  br i1 %CmpZF_JNE24, label %bb.4, label %bb.3

bb.3:                                             ; preds = %bb.2
  %EAX22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 63))
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %memload23 = load i32, i32* %RBP_N.4, align 1
  ret i32 %memload23
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

!0 = !{i64 4202496}
!1 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 4)}
!2 = !{i8* getelementptr inbounds ([145 x i8], [145 x i8]* @rodata_15, i32 0, i32 11)}
