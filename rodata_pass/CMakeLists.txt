cmake_minimum_required(VERSION 3.15)
project(SplitRodataPass)

find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(LLVMConfig)

add_library(SplitRodataPass MODULE SplitRodataPass.cpp)

# Make sure the plugin suffix is correct (on Linux: .so)
set_target_properties(SplitRodataPass PROPERTIES
  PREFIX ""
  OUTPUT_NAME "SplitRodataPass"
)

target_link_libraries(SplitRodataPass PRIVATE LLVMCore LLVMSupport)
