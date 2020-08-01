cmake_minimum_required(VERSION 3.1)


# prevent error "You must build your code with position independent code if Qt was built with..
if (Qt5_POSITION_INDEPENDENT_CODE)
  SET(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

set(STATUSBAR_COMMON_SOURCES 
    ${CMAKE_CURRENT_LIST_DIR}/statusbar.h
    ${CMAKE_CURRENT_LIST_DIR}/statusbar.cpp
)

if (ANDROID)
set(STATUSBAR_PLATFORM_SOURCES ${CMAKE_CURRENT_LIST_DIR}/statusbar_android.cpp)
elseif (CMAKE_SYSTEM_NAME STREQUAL iOS)
set(STATUSBAR_PLATFORM_SOURCES ${CMAKE_CURRENT_LIST_DIR}/statusbar_ios.mm)
set(STATUSBAR_PLATFORM_LIBS "-framework UIKit")
else()
set(STATUSBAR_PLATFORM_SOURCES ${CMAKE_CURRENT_LIST_DIR}/statusbar_dummy.cpp)
endif()
find_package(Qt5 COMPONENTS Core REQUIRED)

add_library(StatusBar OBJECT
    ${STATUSBAR_COMMON_SOURCES}
    ${STATUSBAR_PLATFORM_SOURCES}
    )

target_link_libraries(StatusBar PRIVATE Qt5::Core Qt5::Gui ${STATUSBAR_PLATFORM_LIBS})
target_include_directories(StatusBar PUBLIC ${CMAKE_CURRENT_LIST_DIR})
set_property(TARGET StatusBar PROPERTY POSITION_INDEPENDENT_CODE 1)
message(${CMAKE_CURRENT_LIST_DIR})
