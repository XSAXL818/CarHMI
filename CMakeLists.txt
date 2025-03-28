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
        QML_FILES
        RESOURCES  pic/Loong1.png pic/Loong128.png pic/power.jpg
        QML_FILES ProfilePicture.qml
        QML_FILES GlassRect.qml
        QML_FILES IconButton.qml
        RESOURCES pic/back.png
        RESOURCES pic/Home.png
        RESOURCES pic/back.png pic/clockwise.png pic/close.png  pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/power.jpg
        QML_FILES ControlsBelow.qml
        QML_FILES TemperatureControl.qml
        RESOURCES pic/air.png pic/back.png pic/book.png pic/car.png pic/clockwise.png pic/close.png pic/defog.png pic/fan.png  pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/music.png pic/navigation.png pic/power.jpg
        QML_FILES PageAirConditioner.qml
        RESOURCES pic/air.png pic/back.png pic/bg1.png pic/book.png pic/car.png pic/clockwise.png pic/close.png pic/defog.png pic/fan.png  pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/music.png pic/navigation.png pic/power.jpg
        QML_FILES RoundedIcon.qml
        QML_FILES AppCard.qml
        QML_FILES AmapBottomComponent.qml
        RESOURCES pic/air.png pic/back.png pic/backHome.png pic/bg1.png pic/bg2.png pic/bg3.png pic/book.png pic/car.png pic/chargeStation.png pic/clockwise.png pic/close.png pic/defog.png pic/fan.png  pic/geo.jpg pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/music.png pic/navigation.png pic/power.jpg pic/toCompany.png
        RESOURCES pic/Amap.png
        RESOURCES pic/QQMusic.png
        RESOURCES pic/QQMusicBG.png
        QML_FILES QQMusicBottomComponent.qml
        RESOURCES pic/air.png pic/Amap.png pic/back.png pic/backHome.png pic/bg1.png pic/bg2.png pic/bg3.png pic/book.png pic/car.png pic/chargeStation.png pic/clockwise.png pic/close.png pic/defog.png pic/fan.png  pic/geo.jpg pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/music.png pic/music_center.png pic/music_left.png pic/music_right.png pic/navigation.png pic/power.jpg pic/QQMusic.png pic/QQMusicBG.png pic/toCompany.png
        RESOURCES pic/air.png pic/Amap.png pic/back.png pic/backHome.png pic/bg1.png pic/bg2.png pic/bg3.png pic/book.png pic/car.png pic/chargeStation.png pic/clockwise.png pic/close.png pic/defog.png pic/fan.png  pic/geo.jpg pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/music.png pic/music_center.png pic/music_left.png pic/music_pause.png pic/music_play.png pic/music_right.png pic/navigation.png pic/power.jpg pic/QQMusic.png pic/QQMusicBG.png pic/toCompany.png
        QML_FILES QQMusicCenterComponent.qml
        RESOURCES pic/aiIcon.png
        RESOURCES pic/sunny.png
        QML_FILES CarConditionCard.qml
        RESOURCES pic/aiIcon.png pic/air.png pic/Amap.png pic/back.png pic/backHome.png pic/bg1.png pic/bg2.png pic/bg3.png pic/book.png pic/car.png pic/chargeStation.png pic/clockwise.png pic/close.png pic/defog.png pic/distance.png pic/elect0.png pic/elect1.png pic/elect2.png pic/elect3.png pic/elect4.png pic/fan.png pic/geo.jpg pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/music.png pic/music_center.png pic/music_left.png pic/music_pause.png pic/music_play.png pic/music_right.png pic/navigation.png pic/power.jpg pic/QQMusic.png pic/QQMusicBG.png pic/su7.png pic/sunny.png pic/toCompany.png
        RESOURCES pic/ximalaya.png
        QML_FILES Ximalaya.qml
        RESOURCES pic/aiIcon.png pic/air.png pic/Amap.png pic/back.png pic/backHome.png pic/bg1.png pic/bg2.png pic/bg3.png pic/book.png pic/car.png pic/chargeStation.png pic/clockwise.png pic/close.png pic/defog.png pic/distance.png pic/elect0.png pic/elect1.png pic/elect2.png pic/elect3.png pic/elect4.png pic/fan.png pic/geo.jpg pic/Home.png pic/Loong1.png pic/Loong128.png pic/Menu.png pic/music.png pic/music_center.png pic/music_left.png pic/music_pause.png pic/music_play.png pic/music_right.png pic/navigation.png pic/power.jpg pic/QQMusic.png pic/QQMusicBG.png pic/su7.png pic/sunny.png pic/toCompany.png pic/ximalaya.png
        RESOURCES pic/bilu.png
        RESOURCES pic/chatAss.png pic/message.png pic/nav.png pic/phone.png
        RESOURCES pic/brower.png
        QML_FILES
        QML_FILES PageAirTopComponent.qml
        RESOURCES pic/bg_air.png
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
