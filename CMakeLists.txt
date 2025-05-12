cmake_minimum_required(VERSION 3.16)

project(CarHMI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS QuickControls2)

find_package(Qt6 REQUIRED COMPONENTS WebEngineQuick)



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
        QML_FILES ProfilePicture.qml
        QML_FILES GlassRect.qml
        QML_FILES IconButton.qml
        QML_FILES ControlsBelow.qml
        QML_FILES TemperatureControl.qml
        QML_FILES PageAirConditioner.qml
        QML_FILES RoundedIcon.qml
        QML_FILES AppCard.qml
        QML_FILES AmapBottomComponent.qml
        QML_FILES QQMusicBottomComponent.qml
        QML_FILES QQMusicCenterComponent.qml
        QML_FILES CarConditionCard.qml
        QML_FILES Ximalaya.qml
        QML_FILES PageAirTopComponent.qml
        QML_FILES MainPage.qml
        QML_FILES MainPageLeftPart.qml
        QML_FILES MainPageRightPart.qml
        QML_FILES TopDrawerLeftCont.qml
        QML_FILES TopDrawerRightCont.qml
        QML_FILES RightDrawerButton.qml
        QML_FILES RoundedSlider.qml
        QML_FILES AppPage.qml
        QML_FILES AppBtn.qml
        QML_FILES LeftDrawerMessage.qml
        QML_FILES CarSettingPage.qml
        QML_FILES SliderBtn.qml
        QML_FILES MyTitle.qml
        QML_FILES MySwitch.qml
        QML_FILES
        QML_FILES PageNav.qml
        QML_FILES PageMusic.qml
        RESOURCES music/DontStop.mp3 music/TooBad.mp3
        RESOURCES pic/aiIcon.png pic/air.png pic/Amap.png pic/AppMarket.png pic/back.png pic/backHome.png pic/bg_air.png pic/bg1.png pic/bg2.png pic/bg3.png pic/bilu.png pic/bluetooth_black.png pic/bluetooth_white.png pic/book.png pic/brightness.png pic/brower.png pic/browser.png pic/Caltulator.png pic/car.png pic/chargeStation.png pic/chatAss.png pic/ChuShuang.png pic/clockwise.png pic/close.png pic/cloudStore.png pic/defog.png pic/distance.png pic/dubi.png pic/elect0.png pic/elect1.png pic/elect2.png pic/elect3.png pic/elect4.png pic/ESP.png pic/facebook-messenger.png pic/fan.png pic/filemanager.png pic/gallery.png pic/geo.jpg pic/geo.png pic/google_maps.png pic/Home.png pic/HUD.png pic/lastSong256.png pic/list.png pic/Loong1.png pic/Loong128.png pic/love.png pic/lyrics.png pic/Menu.png pic/message.png pic/more.png pic/music.png pic/music_center.png pic/music_left.png pic/music_pause.png pic/music_play.png pic/music_right.png pic/musicBackground.png pic/mute.png pic/nav.png pic/navigation.png pic/navigation_black.png pic/navigation_white.png pic/nextSong256.png pic/notification.png pic/particle.png pic/paused256.png pic/phone.png pic/pl.png pic/play256.png pic/power.jpg pic/power.png pic/QianLiYan_white.png pic/QQMusic.png pic/QQMusicBG.png pic/recommed1.png pic/recommed2.png pic/recommed3.png pic/rotate_black.png pic/rotate_white.png pic/search.png pic/seqPlay.png pic/Settings.png pic/shopee.png pic/song1.jpg pic/song2.jpg pic/song3.jpg pic/song4.jpg pic/song5.jpg pic/spotify.png pic/su7.png pic/sunny.png pic/swift.png pic/theme_white.png pic/themes.png pic/TianChuang.png pic/tiktok.png pic/toCompany.png pic/TongFeng.png pic/videos.png pic/volQual.png pic/volume.png pic/volumeHigh.png pic/volumeLow.png pic/volumeMiddle.png pic/weater.png pic/whatasapp.png pic/wifi_black.png pic/wifi_white.png pic/ximalaya.png pic/XuanJia.png pic/zj1.png pic/zj2.png pic/zj3.png pic/zj4.png pic/zj5.png
        RESOURCES pic/songIcon1.png pic/songIcon2.png pic/songIcon3.png
        RESOURCES music/Time.mp3
        RESOURCES pic/game.png
        SOURCES ProcessLauncher.h
        QML_FILES LineParticles.qml

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

target_link_libraries(appCarHMI
    PRIVATE Qt6::WebEngineQuick
)

include(GNUInstallDirs)
install(TARGETS appCarHMI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)


