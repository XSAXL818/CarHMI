import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    anchors.fill: parent
    color: "transparent"
    property real perHeight: height/10
    Rectangle{
        id: img
        anchors.top: root.top
        anchors.left: root.left
        anchors.right: root.right
        height: root.perHeight*6
        color: "transparent"
        // 启用图层渲染
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true  // 透明边缘处理
            color: "#80ffffff"       // 阴影颜色（带透明度）
            radius: 20               // 模糊半径
            samples: 41              // 采样数（建议值为 radius*2+1）
            // horizontalOffset: 4      // 水平偏移
            // verticalOffset: 4        // 垂直偏移
        }
        RoundedIcon{
            anchors.centerIn: parent
            iconSource: mainPage.songIconList[mainPage.curPlayIndex]
            size: root.perHeight*5
        }

    }
    Text{
        id: song
        width: parent.width
        height: root.perHeight*2
        anchors.top: img.bottom
        anchors.topMargin: 10
        text: mainPage.songNameList[mainPage.curPlayIndex]
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize:20
        color: "white"
    }

    Text{
        id: lyric
        width: parent.width
        height: root.perHeight*1.5
        anchors.top: song.bottom
        text: mainPage.songSingerList[mainPage.curPlayIndex]
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        color: "lightgray"
    }
}
