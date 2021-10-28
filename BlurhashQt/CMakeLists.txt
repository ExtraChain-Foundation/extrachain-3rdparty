cmake_minimum_required(VERSION 3.11)
project(blurhash-qt VERSION 1.0.0)

include(GNUInstallDirs)
option(ENABLE_EXPORT "Enable exporting of targets" ON)
set(QML_PLUGIN_PATH "${CMAKE_INSTALL_LIBDIR}/qt6/qml" CACHE PATH "The path where QML plugin is installed")

find_package(Qt6 COMPONENTS Core Qml Quick Core5Compat REQUIRED)
set(CMAKE_AUTOMOC ON)

set(QML_URI_PATH "/nl/netsoj/chris/blurhash/")

set(blurhash-qt_SOURCES
	src/blurhash_plugin.cpp
	src/blurhash.cpp)

set(blurhash-qt_HEADERS
	src/blurhash_plugin.h
	src/blurhash.h)

add_library(blurhash-qt ${blurhash-qt_SOURCES} ${blurhash-qt_HEADERS})
target_link_libraries(blurhash-qt PRIVATE Qt6::Core Qt6::Qml Qt6::Quick Qt6::Core5Compat)

install(TARGETS blurhash-qt EXPORT "BlurhashQt" 
	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
	LIBRARY DESTINATION ${QML_PLUGIN_PATH}/${QML_URI_PATH})

add_custom_command(
    TARGET blurhash-qt
    POST_BUILD
    COMMAND
        ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_LIST_DIR}/qmldir $<TARGET_FILE_DIR:blurhash-qt>/qmldir
)
install(FILES $<TARGET_FILE_DIR:blurhash-qt>/qmldir
	DESTINATION ${QML_PLUGIN_PATH}/${QML_URI_PATH})

if(${ENABLE_EXPORT})
	install(EXPORT "BlurhashQt" DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
endif()
