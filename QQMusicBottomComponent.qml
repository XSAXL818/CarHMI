import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes

Rectangle {
    id: root
    anchors.fill: parent
    radius: 10
    color: "#99000000"
    property real perWidth: width/10

    signal clickLeft
    signal clickCenter(bool isPlay)
    signal clickRight
    property bool isPlay: mainPage.isPlay

    // 上一首
    IconButton{
        id: left
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        size: 40
        source: "pic/music_left.png"

        // 设置缩放动画行为
        Behavior on scale {
            NumberAnimation {
                duration: 100
                easing.type: Easing.InOutQuad  // 缓动曲线
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainPage.lastSong()
            }
            onPressed: {
                left.scale=0.7
            }
            onReleased: {
                left.scale=1.0
            }
        }
    }

    // 播放/暂停
    IconButton{
        id: center
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        size: 45
        source: root.isPlay ? "pic/music_play.png" : "pic/music_pause.png"

        // 设置缩放动画行为
        Behavior on scale {
            NumberAnimation {
                duration: 100
                easing.type: Easing.InOutQuad  // 缓动曲线
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.isPlay = !root.isPlay
                mainPage.isPlay = !mainPage.isPlay

            }
            onPressed: {
                center.scale=0.7

            }
            onReleased: {
                center.scale=1.0
            }
        }
    }

    // 下一首
    IconButton{
        id: right
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        size: 40
        source: "pic/music_right.png"

        // 设置缩放动画行为
        Behavior on scale {
            NumberAnimation {
                duration: 100
                easing.type: Easing.InOutQuad  // 缓动曲线
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.clickLeft()
                mainPage.nextSong()
            }
            onPressed: {
                right.scale=0.7

            }
            onReleased: {
                right.scale=1.0
            }
        }
    }
}
