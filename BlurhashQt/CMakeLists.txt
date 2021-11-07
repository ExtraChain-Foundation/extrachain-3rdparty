cmake_minimum_required(VERSION 3.11)
project(blurhash-qt VERSION 1.0.0)

find_package(Qt6 COMPONENTS Core Qml Quick Core5Compat REQUIRED)
set(CMAKE_AUTOMOC ON)

set(blurhash-qt_SOURCES
	src/blurhash_plugin.cpp
	src/blurhash.cpp)

set(blurhash-qt_HEADERS
	src/blurhash_plugin.h
	src/blurhash.h)

add_library(blurhash-qt ${blurhash-qt_SOURCES} ${blurhash-qt_HEADERS})
target_link_libraries(blurhash-qt PRIVATE Qt6::Core Qt6::Qml Qt6::Quick Qt6::Core5Compat)
