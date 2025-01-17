cmake_minimum_required(VERSION 3.16)

project(Infotainment VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
set(CMAKE_OSX_SYSROOT /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appInfotainment
    main.cpp
)

qt_add_qml_module(appInfotainment
    URI Infotainment
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES ui/BottomBar/BottomBar.qml
        QML_FILES ui/RightScreen/RightScreen.qml
        QML_FILES ui/LeftScreen/LeftScreen.qml
        RESOURCES qrc.qrc
        SOURCES Controllers/system.h Controllers/system.cpp
        QML_FILES ui/RightScreen/NavigationSearchBox.qml
        SOURCES Controllers/hyachandler.h Controllers/hyachandler.cpp
        QML_FILES ui/BottomBar/HVACComponent.qml
        SOURCES Controllers/audiocontroller.h Controllers/audiocontroller.cpp
        QML_FILES ui/BottomBar/VolumeControlComponent.qml
)

# 리소스 파일 추가
qt_add_resources(appInfotainment "resources"
    PREFIX "/"
    FILES qrc.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appInfotainment PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appInfotainment
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appInfotainment
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appInfotainment
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
