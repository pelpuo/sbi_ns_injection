; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MyStruct = type { i32, [50 x i8], float }

@.str = private unnamed_addr constant [15 x i8] c"Global String\0A\00", align 1
@global_str = dso_local global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"Global Const String\0A\00", align 1
@global_const_str = dso_local constant ptr @.str.1, align 8
@global_arr = dso_local global [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@.str.2 = private unnamed_addr constant [14 x i8] c"Local String\0A\00", align 1
@__const.main.local_arr = private unnamed_addr constant [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 10], align 16
@__const.main.my_struct = private unnamed_addr constant %struct.MyStruct { i32 1, [50 x i8] c"Example Name\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", float 0x40091EB860000000 }, align 4
@.str.3 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@0 = private unnamed_addr constant [50 x i8] c"Executing ZENO_PROTECT on Array %p with size: %d\0A\00", align 1
@1 = private unnamed_addr constant [51 x i8] c"Executing ZENO_PROTECT on Struct %p with size: %d\0A\00", align 1

define dso_local i32 @main() {
entry:
  %prot.i8 = call ptr @zeno_protect(ptr @global_str, i64 8)
  %prot.i81 = call ptr @zeno_protect(ptr @global_arr, i64 20)
  %retval = alloca i32, align 4
  %local_str = alloca ptr, align 8
  %UNPROTECTED_PTR = alloca [5 x i32], align 4
  %local_arr = call ptr @zeno_protect(ptr %UNPROTECTED_PTR, i64 20)
  %UNPROTECTED_PTR2 = alloca [5 x i32], align 4
  %empty_arr = call ptr @zeno_protect(ptr %UNPROTECTED_PTR2, i64 20)
  %UNPROTECTED_PTR3 = alloca [10 x i8], align 1
  %empty_str = call ptr @zeno_protect(ptr %UNPROTECTED_PTR3, i64 10)
  %UNPROTECTED_STRUCT = alloca %struct.MyStruct, align 8
  %my_struct = call ptr @zeno_protect(ptr %UNPROTECTED_STRUCT, i64 60)
  store i32 0, ptr %retval, align 4
  store ptr @.str.2, ptr %local_str, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %local_arr, ptr align 16 @__const.main.local_arr, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %my_struct, ptr align 4 @__const.main.my_struct, i64 60, i1 false)
  %0 = load ptr, ptr %prot.i8, align 8
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %0)
  %1 = load ptr, ptr %local_str, align 8
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %1)
  %2 = load i32, ptr %prot.i81, align 16
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %2)
  %arrayidx = getelementptr inbounds [5 x i32], ptr %local_arr, i64 0, i64 0
  %3 = load i32, ptr %arrayidx, align 16
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %3)
  ret i32 42
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

declare dso_local i32 @printf(ptr noundef, ...) #1

declare ptr @zeno_protect(ptr, i64)

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
