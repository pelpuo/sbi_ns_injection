# cmake_minimum_required(VERSION 3.15)
# project(SplitRodataPass)

# find_package(LLVM REQUIRED CONFIG)
# list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
# include(LLVMConfig)

# add_library(SplitRodataPass MODULE SplitRodataPass.cpp)

# # Make sure the plugin suffix is correct (on Linux: .so)
# set_target_properties(SplitRodataPass PROPERTIES
#   PREFIX ""
#   OUTPUT_NAME "SplitRodataPass"
# )

# target_link_libraries(SplitRodataPass PRIVATE LLVMCore LLVMSupport)

cmake_minimum_required(VERSION 3.15)
project(HeapPass LANGUAGES CXX)

# 1) Locate your LLVM-15 build:
find_package(LLVM REQUIRED CONFIG
  PATHS /home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/lib/cmake/llvm
)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION} in ${LLVM_DIR}")

# 2) Bring in LLVM headers & compile flags
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# 3) Build _only_ the MODULE; do NOT link any LLVM libraries here!
#    The plugin will pick up LLVM symbols from the hosting 'opt' binary.
add_library(HeapPass MODULE
HeapPass.cpp
)

# 4) Ensure PIC/non-lib prefix
set_target_properties(HeapPass PROPERTIES
  PREFIX ""                    # no "lib" prefix
  POSITION_INDEPENDENT_CODE ON # PIC
)
