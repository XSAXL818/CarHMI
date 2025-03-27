import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    anchors.fill: parent

    color: "#222834"
    // 启用图层渲染
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true  // 透明边缘处理
        color: "#80ffffff"       // 阴影颜色（带透明度）
        radius: 20               // 模糊半径
        samples: 41              // 采样数（建议值为 radius*2+1）
        horizontalOffset: -4      // 水平偏移
        verticalOffset: -4        // 垂直偏移
    }


    Rectangle{
        id: left
        height: parent.height
        width: (parent.width/10)*5
        color: "transparent"

        Rectangle{
            id: l1
            width: parent.width
            height: parent.height/4
            color: "transparent"
            RoundedIcon{
                id: icon
                size: 40
                iconSource: "pic/ximalaya.png"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                // anchors.topMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }

            Text{
                anchors.left: icon.right
                anchors.right: parent.right
                anchors.top: icon.top
                anchors.leftMargin: 10
                height: parent.height
                text: "喜马拉雅"
                color: "gray"
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
            }

        }

        Text{
            id: l2
            height: parent.height/4
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: l3.top
            anchors.leftMargin: 10
            text: "喜马拉雅"
            font.pixelSize: 20
            color: "white"

        }

        Text{
            id: l3
            height: parent.height/4
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            text: "每一秒陪伴都有爱"
            font.pixelSize: 15
            color: "gray"
        }

    }

    Rectangle{
        id: right
        height: parent.height
        width: (parent.width/10)*5
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "transparent"

        RoundedIcon{
            anchors.centerIn: parent
            size: parent.width-50
            iconSource: "pic/bilu.png"
            iconRadius: 20
        }
    }


}
