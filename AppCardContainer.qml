import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

// AppCard容器
// 通过指定相关属性，即可创建一个应用的卡片

Rectangle {
    id: root
    width: 220
    height: width*1.3

    property string bgSource: "" // 背景图片
    property string iconSource: "" // 应用icon
    property string app: "app" // 应用名称
    property Component centerComponent: null // 中间组件
    property Component bottomComponent: null // 顶部组件


    layer.enabled: true  // 启用独立渲染层
    layer.effect: OpacityMask {  // 直接附加蒙版
        maskSource: Rectangle {
            width: root.width
            height: root.height
            radius: 10
            topLeftRadius: 40
        }
    }
    Image {
        id: bg
        anchors.fill: parent
        source: root.bgSource
        fillMode: Image.PreserveAspectCrop
    }

    Column{
        spacing: 5
        width: root.width
        height: root.height
        property real myHeight: height/10
        Row{
            id: header
            width: parent.width
            height: parent.myHeight*1.5
            Rectangle{
                width: parent.width
                height: parent.height
                color:"transparent"

                RoundedIcon{
                    id: icon
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    size: parent.height-10
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
                    color: "white"
                    text: root.app
                }
            }
        }

        Loader{
            id: center
            width: parent.width
            height: parent.myHeight*5
            sourceComponent: root.centerComponent
        }

        Loader{
            id: bottom
            width: parent.width
            height: parent.myHeight*3.5
            sourceComponent: root.bottomComponent
        }

    }
}
