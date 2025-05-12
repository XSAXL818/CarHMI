import QtQuick

Window {
    width: 1440

    // height: 1024
    height: (width / 16) * 10
    visible: true
    title: qsTr("Qt中控屏项目")
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.WindowTitleHint

    MainPage{
        id: mainPage
        anchors.fill: parent
    }




}
