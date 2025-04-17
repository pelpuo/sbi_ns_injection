; ModuleID = './testbin'
source_filename = "./testbin"

@.rodata12 = private unnamed_addr constant [39 x i8] c"All tasks completed in priority order!\00", align 8

define dso_local i32 @main() {
  %1 = call i32 @puts(ptr @.rodata12)
  ret i32 420
}

declare dso_local i32 @puts(ptr)
