import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    anchors.fill: parent
    color: "#2b2e3b"
    border.color: "transparent"

    property int days: 267
    property int distance: 8500

    property real perWidth: width/10
    // 0充电中，1-4为电量
    property string electrical: "3"
    property int electDistance: 245

    radius: 10

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true  // 透明边缘处理
        color: "#80ffffff"       // 阴影颜色（带透明度）
        radius: 20               // 模糊半径
        samples: 41              // 采样数（建议值为 radius*2+1）
        horizontalOffset: -4      // 水平偏移
        verticalOffset: -4        // 垂直偏移
    }

    // 数据表
    Rectangle{
        id: left
        width: root.perWidth*4
        height: root.height
        color: "transparent"

        Rectangle{
            id: l1
            width: parent.width
            height: parent.height/3
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            color: "transparent"
            Text{
                id: txt1
                anchors.top: parent.top
                anchors.topMargin: 3
                text: "已安全陪伴"
                color: "gray"
                font.pixelSize: 18
            }
            Text{
                id: txt2
                anchors.left: txt1.right
                anchors.leftMargin: 5
                text: root.days
                color: "white"
                font.pixelSize: 25
            }
            Text{
                id: txt3
                anchors.left: txt2.right
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 3
                text: "天"
                color: "gray"
                font.pixelSize: 18
            }
        }
        Rectangle{
            id: l2
            width: parent.width
            height: parent.height/4
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: l3.top
            color: "transparent"

            Image{
                id: distanceIcon
                width: 25
                height: 25
                anchors.verticalCenter: parent.verticalCenter
                source: "pic/distance.png"
            }
            Text{
                id: distanceTxt
                anchors.left: distanceIcon.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 22
                color: "white"
                text: root.distance + " km"
            }
        }
        Rectangle{
            id: l3
            width: parent.width
            height: parent.height/4
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: "transparent"

            Image{
                id: electIcon
                width: 35
                height: 35
                anchors.verticalCenter: parent.verticalCenter
                source: "pic/elect" + root.electrical + ".png"
            }

            Text{
                anchors.left: electIcon.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                text: root.electDistance + " km"
                font.pixelSize: 22
                color: "white"
            }
        }

    }


    // 汽车模型
    Rectangle{
        id: right
        width: root.perWidth*6
        height: root.height
        anchors.left: left.right
        color: "transparent"

        Image {
            anchors.left: parent.left
            width: parent.width+40
            height: parent.height-40
            anchors.bottom: parent.bottom
            source: "pic/su7.png"
            fillMode: Image.PreserveAspectCrop
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                // console.log("汽车背电极")
                mainPage.pageSource = "CarSettingPage.qml"
            }
        }

    }



}
