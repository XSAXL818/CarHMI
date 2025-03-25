import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    width: 220
    height: width*1.3

    property string bgSource: ""
    property string iconSource: ""
    property string app: "app"
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


        Rectangle{
            width: parent.width-30
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            height: parent.myHeight*3.5
            color: "transparent"
            // color: "orange"

            Loader{
                id: bottom
                anchors.fill: parent
                sourceComponent: root.bottomComponent
            }
        }



    }
}
