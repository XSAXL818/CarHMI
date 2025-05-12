import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root

    color: "transparent"
    property string appIcon: ""
    property double iconSize: 50
    property string appName: "AppName"
    signal clicked(string appName)


    MouseArea{
        anchors.fill: parent
        onClicked: {
            root.clicked(root.appName)
        }
    }


    Rectangle{
        id: rect
        width: root.iconSize
        height: root.iconSize
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color:"transparent"
        layer.enabled: true  // 启用独立渲染层
        layer.effect: OpacityMask {  // 直接附加蒙版
            maskSource: Rectangle {
                width: root.iconSize
                height: root.iconSize
                radius: 20
            }
        }

        Image {
            id: icon
            source: root.appIcon
            anchors.fill: parent


        }
    }



    Text {
        id: txt
        text: root.appName
        font.pixelSize: 20
        color:"white"
        anchors.top: rect.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: root.horizontalCenter
    }

}
