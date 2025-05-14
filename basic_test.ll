; ModuleID = 'basic_test.c'
source_filename = "basic_test.c"
target datalayout = "e-m:e-p:128:128-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown-elf"

@.str = private unnamed_addr constant [39 x i8] c"Fibonacci number at position %d is %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @fib(i32 signext %n) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !5
  %0 = load i32, i32* %n.addr, align 4, !tbaa !5
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !tbaa !5
  store i32 %1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !tbaa !5
  %sub = sub nsw i32 %2, 1
  %call = call signext i32 @fib(i32 signext %sub)
  %3 = load i32, i32* %n.addr, align 4, !tbaa !5
  %sub1 = sub nsw i32 %3, 2
  %call2 = call signext i32 @fib(i32 signext %sub1)
  %add = add nsw i32 %call, %call2
  store i32 %add, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 10, i32* %n, align 4, !tbaa !5
  %0 = load i32, i32* %n, align 4, !tbaa !5
  %1 = load i32, i32* %n, align 4, !tbaa !5
  %call = call signext i32 @fib(i32 signext %1)
  %call1 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str, i128 0, i128 0), i32 signext %0, i32 signext %call)
  ret i32 0
}

declare dso_local signext i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+experimental-zzeno,+m,+relax,-save-restore" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+experimental-zzeno,+m,+relax,-save-restore" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 1, !"SmallDataLimit", i32 8}
!4 = !{!"clang version 13.0.0 (https://github.com/stamcenter/llvm-zeno/ 98f7e444dda642334a1ef3d86120923f496aa7f2)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
