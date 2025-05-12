import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    width: 220
    height: width*1.5

    property string bgSource: ""
    property string iconSource: ""
    property string app: "app"
    property color appColor: "white"
    property Component centerComponent: null
    property Component bottomComponent: null


    layer.enabled: true  // 启用独立渲染层
    layer.effect: OpacityMask {  // 直接附加蒙版
        maskSource: Rectangle {
            width: root.width
            height: root.height
            radius: 10
            topLeftRadius: 40
        }
    }
    // 背景图片
    Image {
        id: bg
        anchors.fill: parent
        source: root.bgSource
        fillMode: Image.PreserveAspectCrop
    }
    // 播放控制
    Rectangle{
        id: cont
        width: root.width
        height: root.height-10
        anchors.topMargin: 10
        anchors.top: parent.top
        anchors.left: parent.left
        property real myHeight: height/10
        color: "transparent"
        Column{
            spacing: 5
            anchors.fill: parent
            // 应用标题
            Rectangle{
                id: header
                width: parent.width
                height: cont.myHeight*1.3
                color:"transparent"

                RoundedIcon{
                    id: icon
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    size: parent.height-15
                    iconSource: root.iconSource
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text{
                    id: appName
                    anchors.left: icon.right
                    anchors.leftMargin: 10
                    width: parent.width-icon.width
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    color: root.appColor
                    text: root.app
                }
            }
            // 应用中间
            Rectangle{
                id: rectCenter
                width: cont.width
                height: cont.myHeight*5.5
                color: "transparent"

                Loader{
                    id: center
                    width: parent.width-30
                    height: parent.height
                    anchors.centerIn: parent
                    sourceComponent: root.centerComponent
                }
            }
            // 应用下方
            Rectangle{
                width: cont.width
                height: cont.myHeight*2.3
                color: "transparent"

                Loader{
                    id: bottom
                    width: parent.width-30
                    height: parent.height
                    anchors.centerIn: parent
                    sourceComponent: root.bottomComponent
                }
            }
        }
    }


}
