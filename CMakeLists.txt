cmake_minimum_required(VERSION 3.11)

project(ThreeBox VERSION 0.1 LANGUAGES C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(FetchContent)

FetchContent_Declare(
    quickjs
    PREFIX third_party/quickjs
    SOURCE_DIR ../third_party/quickjs
    OVERRIDE_FIND_PACKAGE
)

FetchContent_MakeAvailable(quickjs)

add_subdirectory(third_party/quickjs-ffi)

add_custom_target(
    copy-compile-commands ALL
    ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_BINARY_DIR}/compile_commands.json
        ${CMAKE_CURRENT_LIST_DIR}
)
