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
                root.clickLeft()
            }
            onPressed: {
                left.scale=0.7

            }
            onReleased: {
                left.scale=1.0
            }
        }
    }

    IconButton{
        id: center
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        size: 40
        property bool isPlay: false

        source: isPlay ?  "pic/music_pause.png" : "pic/music_play.png"

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
                root.clickCenter(center.isPlay)
                center.isPlay = !center.isPlay
            }
            onPressed: {
                center.scale=0.7

            }
            onReleased: {
                center.scale=1.0
            }
        }
    }

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
