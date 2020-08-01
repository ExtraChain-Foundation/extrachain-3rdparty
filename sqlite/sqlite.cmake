cmake_minimum_required(VERSION 3.14)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

set(SQLITE_SOURCES
    ${CMAKE_CURRENT_LIST_DIR}/sqlite3.c
    ${CMAKE_CURRENT_LIST_DIR}/sqlite3.h
)

if (EXTRACHAIN_STATIC_BUILD)
    add_library(sqlite OBJECT
        ${SQLITE_SOURCES}
    )
else()
    add_library(sqlite SHARED
        ${SQLITE_SOURCES}
    )
endif()

target_include_directories(sqlite PUBLIC ../)
target_link_libraries(sqlite dl pthread)
set_property(TARGET sqlite PROPERTY POSITION_INDEPENDENT_CODE 1)
message("--- SQLite ---")
message(${CMAKE_CURRENT_LIST_DIR})
