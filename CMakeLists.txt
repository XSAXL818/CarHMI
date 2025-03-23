cmake_minimum_required(VERSION 3.16)

project(CarHMI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appCarHMI
    main.cpp
)

qt_add_qml_module(appCarHMI
    URI CarHMI
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Home.qml
        QML_FILES Page1.qml
        RESOURCES pic/favicon.ico pic/Loong1.png pic/Loong128.png pic/power.jpg
        QML_FILES
        QML_FILES ProfilePicture.qml
        QML_FILES GlassRect.qml
        QML_FILES LeftButton.qml
        RESOURCES pic/back.png
        RESOURCES pic/Home.png
        RESOURCES pic/back.png pic/clockwise.png pic/close.png pic/favicon.ico pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/power.jpg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCarHMI PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCarHMI
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCarHMI
    PRIVATE Qt6::Quick
)

target_link_libraries(appCarHMI
    PRIVATE Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appCarHMI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
